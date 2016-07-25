# -*- encoding: utf-8 -*-
##############################################################################
#
#    OpenERP, Open Source Management Solution
#    Copyright (C) 2004-2009 Tiny SPRL (<http://tiny.be>). All Rights Reserved
#    $Id$
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
##############################################################################

import time
from openerp import pooler, tools
from openerp.report import report_sxw
from openerp.report.interface import report_rml
from openerp.tools import to_xml
from datetime import datetime


class cost_of_business_audits_report(report_sxw.rml_parse):

    def __init__(self, cr, uid, name, context):
        super(cost_of_business_audits_report, self).__init__(cr, uid, name, context=context)
        self.localcontext.update({
            'time': time,
            'get_work_order': self._get_work_order,
            'get_line': self._get_line,
        })

    def _get_work_order(self, form):
        cr = self.cr
        uid = self.uid
        context = {}
        mrp_production_obj = pooler.get_pool(self.cr.dbname).get('mrp.production')
        date_from = datetime.strptime(form['start_date'], '%Y-%m-%d').strftime("%Y-%m-%d 00:00:00")
        date_to = datetime.strptime(form['end_date'], '%Y-%m-%d').strftime("%Y-%m-%d 23:59:59")
        mrp_production_lst = []
        bom_change_ids = mrp_production_obj.search(cr, uid, [('date_planned','>=', date_from),('date_planned','<=', date_to)])
        
        for sc_mrp_bom_change in mrp_production_obj.browse(cr, uid, bom_change_ids):
            mrp_production_lst.append(sc_mrp_bom_change)
        return mrp_production_lst
    
    def _get_line(self, work_order):
        cr = self.cr
        uid = self.uid
        context = {}
        lines_lst = []
        sc_mrp_material_requirement_obj = pooler.get_pool(self.cr.dbname).get('sc.mrp.material.requirement')
        workcenter_line_len = material_reject_line = 0
        if work_order.routing_id:
            for work_line in work_order.routing_id.workcenter_lines:
                per_hour_cost = work_line.workcenter_id and work_line.workcenter_id.costs_hour or 1
                vals = {
                    'workers_name': work_line.user_id and work_line.user_id.name or '',
                    'workers_hour': work_line.hour_nbr,
                    'workers_station': work_line.workcenter_id and work_line.workcenter_id.name or '',
                    'workers_per_hour_cost': per_hour_cost,
                    'workers_hour_cost': per_hour_cost * work_line.hour_nbr,
                }
                lines_lst.append(vals)
        
        material_reject_ids = sc_mrp_material_requirement_obj.search(cr, uid, [('mrp_ref', '=', work_order.name)])
        count = 0
        for material_reject_brw in sc_mrp_material_requirement_obj.browse(cr, uid, material_reject_ids):
            for line in material_reject_brw.material_request_ids:
                vals = {
                        'part_name': line.material_id.name + line.part_no,
                        'part_qty': line.product_qty,
                        'part_price': line.material_id.product_id.standard_price,
                        'part_cost_of_material': 0,
                    }
                if count < len(lines_lst):
                    lines_lst[count].update(vals)
                else:
                    lines_lst.append(vals)
                count += 1
        return lines_lst

report_sxw.report_sxw('report.cost_of_business_audits_report','cost.of.business.audits.report.wiz','production_report/report/cost_of_business_audits_report.mako',parser=cost_of_business_audits_report, header=False)