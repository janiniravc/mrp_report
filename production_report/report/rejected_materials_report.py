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


class rejected_materials_report(report_sxw.rml_parse):

    def __init__(self, cr, uid, name, context):
        super(rejected_materials_report, self).__init__(cr, uid, name, context=context)
        self.localcontext.update({
            'time': time,
            'get_line': self._get_line,
        })
        
    def _get_line(self, form):
        cr = self.cr
        uid = self.uid
        context = {}
        mrp_production_obj = pooler.get_pool(self.cr.dbname).get('mrp.production')
        sc_mrp_requirement_obj = pooler.get_pool(self.cr.dbname).get('sc.mrp.material.requirement')
        date_from = datetime.strptime(form['start_date'], '%Y-%m-%d').strftime("%Y-%m-%d 00:00:00")
        date_to = datetime.strptime(form['end_date'], '%Y-%m-%d').strftime("%Y-%m-%d 23:59:59")
        mrp_production_lst = []
        mrp_production_ids = mrp_production_obj.search(cr, uid, [('date_planned','>=', date_from),('date_planned','<=', date_to)])
        
        for mrp_production_brw in mrp_production_obj.browse(cr, uid, mrp_production_ids):
            product_name = ''
            if mrp_production_brw.product_id.code:
                product_name += ' [' + mrp_production_brw.product_id.code + ' ] '
            product_name += mrp_production_brw.product_id.name
            vals = {
                'mrp_date': mrp_production_brw.date_planned,
                'lot_no': '?',
                'product_name': product_name,
            }
            line_lst = []
            sc_mrp_requirement_ids = sc_mrp_requirement_obj.search(cr, uid, [('mrp_ref','=', mrp_production_brw.name),('product_name','=', mrp_production_brw.product_id.name)])
            for sc_mrp_requirement_brw in sc_mrp_requirement_obj.browse(cr, uid, sc_mrp_requirement_ids):
                for request_brw in sc_mrp_requirement_brw.material_request_ids:
                    part_name = ''
                    if request_brw.material_id:
                        if request_brw.material_id.product_id:
                            part_name += '[' + request_brw.material_id.product_id.default_code + '] '
                        part_name += request_brw.material_id.name
                    val = {
                        'form_no': sc_mrp_requirement_brw.name,
                        'vin_no': sc_mrp_requirement_brw.vin_number or '',
                        'part_no': request_brw.part_no,
                        'part_name_ar': request_brw.part_name_ar,
                        'part_name': part_name,
                        'part_qty': request_brw.product_qty or 0,
                        'part_lot_no': '?',
                        'reason': sc_mrp_requirement_brw.desc or '',
                        'station': sc_mrp_requirement_brw.work_station or '',
                        'place_compensation': '?',
                        'kd_material': '?',
                    }
                    line_lst.append(val)
            vals.update({'line_vals': line_lst})
            mrp_production_lst.append(vals)
        return mrp_production_lst
    
    
report_sxw.report_sxw('report.rejected_materials_report','rejected.materials.report.wiz','production_report/report/rejected_materials_report.mako',parser=rejected_materials_report, header=False)


