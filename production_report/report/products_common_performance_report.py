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
from datetime import date
from openerp import pooler, tools
from openerp.report import report_sxw
from openerp.report.interface import report_rml
from openerp.tools import to_xml
from dateutil.relativedelta import relativedelta
import calendar
from collections import defaultdict


class products_common_performance_report(report_sxw.rml_parse):

    def __init__(self, cr, uid, name, context):
        super(products_common_performance_report, self).__init__(cr, uid, name, context=context)
        self.localcontext.update({
            'time': time,
            'get_products_line': self._get_products_line,
        })
        
    
    def _get_products_line(self, form):
        cr = self.cr
        uid = self.uid
        context = {}
        product_data = []
        product_obj = pooler.get_pool(self.cr.dbname).get('product.product')
        mrp_production_obj = pooler.get_pool(self.cr.dbname).get('mrp.production')

        product_ids = form['product_ids']
        if not product_ids:
            product_ids = product_obj.search(cr, uid, [])

        for product in product_obj.browse(cr, uid, product_ids, context=context):
            vals = {
                'product_name': product.name,
                'month_plan': 0,
                'month_done': 0,
                'month_percentage': 0,
                'month_progress': 0,
                
                'period_plan': 0,
                'period_done': 0,
                'period_percentage': 0,
                'period_progress': 0,
                
                'current_year_plan': 0,
                'current_year_done': 0,
                'current_year_percentage': 0,
                'current_year_progress': 0,
                
                'five_year_plan': 0,
                'five_year_done': 0,
                'five_year_progress': 0,
            }
            #Current Month
            current_start_date = time.strftime('%Y-%m-01')
            current_end_date = time.strftime('%Y-%m-%d')
            month_plan = mrp_production_obj.search_count(cr, uid, [
                          ('date_planned', '>=', current_start_date),
                          ('date_planned', '<=', current_end_date),
                          ('product_id', '=', product.id),
                          ('state', 'not in', ('cancel','done')),
                         ])
            month_done = mrp_production_obj.search_count(cr, uid, [
                          ('date_planned', '>=', current_start_date),
                          ('date_planned', '<=', current_end_date),
                          ('product_id', '=', product.id),
                          ('state', '=', 'done'),
                         ])
            vals.update({
                'month_plan': month_plan or 0,
                'month_done': month_done or 0,
                'month_progress': month_plan-month_done,
            })
            if month_done > 0 and month_plan > 0:
                vals.update({
                'month_percentage': ((float(month_done) * 100) / float(month_plan)),
                })
            
            #Period
            period_start_date = (date.today() + relativedelta(months=-4)).strftime('%Y-%m-01')
            period_end_date = (date.today() + relativedelta(days=-date.today().day)).strftime('%Y-%m-%d')
            period_plan = mrp_production_obj.search_count(cr, uid, [
                          ('date_planned', '>=', period_start_date),
                          ('date_planned', '<=', period_end_date),
                          ('product_id', '=', product.id),
                          ('state', 'not in', ('cancel','done')),
                         ])
            period_done = mrp_production_obj.search_count(cr, uid, [
                          ('date_planned', '>=', period_start_date),
                          ('date_planned', '<=', period_end_date),
                          ('product_id', '=', product.id),
                          ('state', '=', 'done'),
                         ])
            vals.update({
                'period_plan': period_plan or 0,
                'period_done': period_done or 0,
                'period_progress': period_plan-period_done,
            })
            if period_done > 0 and period_plan > 0:
                vals.update({
                'period_percentage': ((float(period_done) * 100) / float(period_plan)),
                })
                
                
            #Current Year
            year_start_date = time.strftime('%Y-01-01')
            year_end_date = time.strftime('%Y-%m-01')
            current_year_plan = mrp_production_obj.search_count(cr, uid, [
                          ('date_planned', '>=', year_start_date),
                          ('date_planned', '<=', year_end_date),
                          ('product_id', '=', product.id),
                          ('state', 'not in', ('cancel','done')),
                         ])
            current_year_done = mrp_production_obj.search_count(cr, uid, [
                          ('date_planned', '>=', year_start_date),
                          ('date_planned', '<=', year_end_date),
                          ('product_id', '=', product.id),
                          ('state', '=', 'done'),
                         ])
            vals.update({
                'current_year_plan': current_year_plan or 0,
                'current_year_done': current_year_done or 0,
                'current_year_progress': current_year_plan-current_year_done,
            })
            if current_year_done > 0 and current_year_plan > 0:
                vals.update({
                'current_year_percentage': ((float(current_year_done) * 100) / float(current_year_plan)),
                })
                
                
            #Five Year
            five_start_date = (date.today() + relativedelta(years=-1)).strftime('%Y-12-31')
            five_end_date = (date.today() + relativedelta(years=-5)).strftime('%Y-01-01')
            five_year_plan = mrp_production_obj.search_count(cr, uid, [
                          ('date_planned', '>=', five_start_date),
                          ('date_planned', '<=', five_end_date),
                          ('product_id', '=', product.id),
                          ('state', 'not in', ('cancel','done')),
                         ])
            five_year_done = mrp_production_obj.search_count(cr, uid, [
                          ('date_planned', '>=', five_start_date),
                          ('date_planned', '<=', five_end_date),
                          ('product_id', '=', product.id),
                          ('state', '=', 'done'),
                         ])
            vals.update({
                'five_year_plan': five_year_plan or 0,
                'five_year_done': five_year_done or 0,
                'five_year_progress': five_year_plan-five_year_done,
            })
            if five_year_done > 0 and five_year_plan > 0:
                vals.update({
                'five_year_percentage': ((float(five_year_done) * 100) / float(five_year_plan)),
                })
            
            product_data.append(vals)
        return product_data

report_sxw.report_sxw('report.products.common.performance.report','products.common.performance.report.wiz','production_report/report/products_common_performance_report.mako',parser=products_common_performance_report, header =False)