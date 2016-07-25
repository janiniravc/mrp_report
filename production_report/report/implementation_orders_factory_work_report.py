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
from dateutil.relativedelta import relativedelta


class implementation_orders_factory_work_report(report_sxw.rml_parse):

    def __init__(self, cr, uid, name, context):
        super(implementation_orders_factory_work_report, self).__init__(cr, uid, name, context=context)
        self.localcontext.update({
            'time': time,
            'get_line': self._get_line,
            'get_dates': self._get_dates,
            'get_last_year_order': self._get_last_year_order,
        })
        
    def _get_last_year_order(self, start_date, end_date, product_id, factory_id):
        mrp_production_lst = []
        if product_id and factory_id:
            cr = self.cr
            uid = self.uid
            context = {}
            mrp_production_obj = pooler.get_pool(self.cr.dbname).get('mrp.production')
            date_from = datetime.strptime(start_date, '%Y-%m-%d').strftime("%Y-%m-%d 00:00:00")
            date_to = datetime.strptime(end_date, '%Y-%m-%d').strftime("%Y-%m-%d 23:59:59")
            mrp_production_ids = mrp_production_obj.search(cr, uid, [
                                                             ('date_planned','>=', date_from),
                                                             ('date_planned','<=', date_to),
                                                             ('product_id','=', product_id),
                                                             ('routing_id.factory_id','=', factory_id),
                                                             ])
            for mrp_production_brw in mrp_production_obj.browse(cr, uid, mrp_production_ids):
                done_qty = 0
                if mrp_production_brw.state == 'done':
                    done_qty = mrp_production_brw.product_qty
                vals = {
                    'job_order_no': mrp_production_brw.daily_job_order_id and mrp_production_brw.daily_job_order_id.general_job_order_id and mrp_production_brw.daily_job_order_id.general_job_order_id.name or '',
                    'plan_qty': mrp_production_brw.product_qty,
                    'done_qty': done_qty,
                    'deviation': mrp_production_brw.product_qty - done_qty,
                    'deviation_per': (done_qty / mrp_production_brw.product_qty) * 100,
                }
                mrp_production_lst.append(vals)
        return mrp_production_lst

    def _get_dates(self, form):
        new_date = datetime.strptime(form['start_date'], '%Y-%m-%d') + relativedelta(years=-1)
        return new_date.strftime("%Y-01-01"),new_date.strftime("%Y-12-31")

    def _get_line(self, form):
        cr = self.cr
        uid = self.uid
        context = {}
        mrp_production_obj = pooler.get_pool(self.cr.dbname).get('mrp.production')
        date_from = datetime.strptime(form['start_date'], '%Y-%m-%d').strftime("%Y-%m-%d 00:00:00")
        date_to = datetime.strptime(form['end_date'], '%Y-%m-%d').strftime("%Y-%m-%d 23:59:59")
        mrp_production_lst = []
        mrp_production_ids = mrp_production_obj.search(cr, uid, [('date_planned','>=', date_from),('date_planned','<=', date_to)])
        
        for mrp_production_brw in mrp_production_obj.browse(cr, uid, mrp_production_ids):
            mrp_production_lst.append(mrp_production_brw)
        return mrp_production_lst

    
report_sxw.report_sxw('report.implementation_orders_factory_work_report','time.produced.units.report.wiz','production_report/report/time_of_produced_units_report.mako',parser=implementation_orders_factory_work_report, header=False)