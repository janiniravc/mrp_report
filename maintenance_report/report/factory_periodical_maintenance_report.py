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
import calendar
from collections import defaultdict


class factory_periodical_maintenance_report(report_sxw.rml_parse):

    def __init__(self, cr, uid, name, context):
        super(factory_periodical_maintenance_report, self).__init__(cr, uid, name, context=context)
        self.localcontext.update({
            'time': time,
            'get_factory_code': self._get_factory_code,
            'get_factory_line': self._get_factory_line,
            'get_spare_part_line': self._get_spare_part_line,
            #'get_arabic_text': self._get_arabic_text
        })
        
    
    def _get_factory_code(self, form):
        cr = self.cr
        uid = self.uid
        context = {}
        factory_obj = pooler.get_pool(self.cr.dbname).get('sc.mrp.factory')

#         date_from = form['date_from']
#         date_to = form['date_to'] or time.strftime('%Y-%m-%d 24:00:00')

        factory_ids = form['factory_ids']
        factory_details = []


        for factory in factory_obj.browse(cr, uid, factory_ids, context=context):
# #             line_vals = {
# #                          'factory_name' : factory.name or '',
# #                          'factory_id': factory.id,
# #             }

            
            factory_details.append(factory)
        return factory_details

    def _get_spare_part_line(self, factory, form):
        cr = self.cr
        uid = self.uid
        context = {}
        total_dict = defaultdict(float)
        name_list = ['Preventive maintenance hours','Treatment maintenance hours']
        date_from = datetime.strptime(form['start_date'], '%Y-%m-%d')
        date_to = datetime.strptime(form['end_date'], '%Y-%m-%d')
        mro_details = []
        total_factories = total_factories_sdg = 0
        add_month = 1
        if form['report_type'] == 'quarterly':
            add_month = 3
        
        while date_from <= date_to:
            amt_factories = total_amt_factories = 0.00
            line_vals = {
            'name': 'Cost of spare parts and depreciations',
            'month_name': date_from.strftime("%B"),
            }
            month_start_date = datetime(date_from.year, date_from.month, 01)
            month_end_date = datetime(date_from.year,date_from.month,1)+relativedelta(months=add_month,days=-1)
            date_from = (datetime(date_from.year, date_from.month, date_from.day) + relativedelta(months=add_month))
            
            for factory_brw in factory:
                for main_line in factory_brw.mainline_ids:
                    for sub_line in main_line.subline_ids:
                        for workcenter in sub_line.workcenter_ids:
                                total_amt_factories += workcenter.costs_hour
                        if total_amt_factories > 0: total_amt_factories / len(main_line.subline_ids)
                    cr.execute("""
                                select COALESCE(sum(part_line.parts_qty*t.list_price),0.00) as main_hours
                                from mro_task_parts_line part_line
                                inner join product_product p on p.id=part_line.parts_id
                                inner join product_template t on t.id=p.product_tmpl_id
                                inner join mro_task on mro_task.id=part_line.task_id
                                inner join mro_order_task_line on mro_order_task_line.name=mro_task.id
                                inner join mro_order mo on mo.id=mro_order_task_line.mro_order_id
                                where mo.factory_id = %s and mo.mainline_id = %s and mo.done_date::date >= '%s' and mo.done_date::date <= '%s'"""%(factory_brw.id, main_line.id, month_start_date , month_end_date))
                    data = cr.fetchone()
                    amt_factories += data[0]
                    line_vals.update({main_line.name: data[0]})
                    total_dict[main_line.name] += data[0]
            line_vals.update({
                'total_time_factories': amt_factories,
                'total_amt_factories': (total_amt_factories * amt_factories),
                'note': '-',
            })
            
            if amt_factories > 0:
                total_factories += amt_factories
                total_factories_sdg += (total_amt_factories * amt_factories)
                mro_details.append(line_vals)
        if total_dict:
            vals = {
                'name': 'Total factory',
                'month_name': '',
            }
            for main_line in total_dict:
                vals.update({main_line: total_dict[main_line]})
            vals.update({
                'total_time_factories': total_factories,
                'total_amt_factories': total_factories_sdg,
                'note': '-',
            })
            mro_details.append(vals)
        return mro_details

    def _get_factory_line(self, factory, form):
        cr = self.cr
        uid = self.uid
        context = {}
        total_dict = defaultdict(float)
        name_list = ['Preventive maintenance hours','Treatment maintenance hours']
        date_from = datetime.strptime(form['start_date'], '%Y-%m-%d')
        date_to = datetime.strptime(form['end_date'], '%Y-%m-%d')
        mro_details = []
        total_factories = total_factories_sdg = 0
        add_month = 1
        if form['report_type'] == 'quarterly':
            add_month = 3
        for name in name_list:
            date_from = datetime.strptime(form['start_date'], '%Y-%m-%d')
            while date_from <= date_to:
                amt_factories = total_amt_factories = 0.00
                line_vals = {
                'name': name,
                'month_name': date_from.strftime("%B"),
                }
                month_start_date = datetime(date_from.year, date_from.month, 01)
                month_end_date = datetime(date_from.year,date_from.month,1)+relativedelta(months=add_month,days=-1)
                
                date_from = (datetime(date_from.year, date_from.month, date_from.day) + relativedelta(months=add_month))
                
                for factory_brw in factory:
                    for main_line in factory_brw.mainline_ids:
                        for sub_line in main_line.subline_ids:
                            for workcenter in sub_line.workcenter_ids:
                                total_amt_factories += workcenter.costs_hour
                        if total_amt_factories > 0: total_amt_factories / len(main_line.subline_ids)
                        if name == 'Preventive maintenance hours':
                            cr.execute("""select COALESCE(sum(maintenance_time),0.00) as main_hours 
                                        from mro_order
                                        where maintenance_type='bm' and factory_id = %s and mainline_id = %s and done_date::date >= '%s' and done_date::date <= '%s'"""%(factory_brw.id, main_line.id, month_start_date , month_end_date))
                        else:
                            cr.execute("""select COALESCE(sum(m.maintenance_time),0.00) as main_hours 
                                        from mro_order m
                                        inner join asset_asset a on a.id=m.asset_id
                                        where m.factory_id = %s and a.mainline_id = %s and done_date::date >= '%s' and done_date::date <= '%s' """%(factory_brw.id, main_line.id, month_start_date , month_end_date))
                        data = cr.fetchone()
                        amt_factories += data[0]
                        line_vals.update({main_line.name: data[0]})
                        total_dict[main_line.name] += data[0]
                line_vals.update({
                    'total_time_factories': amt_factories,
                    'total_amt_factories': (total_amt_factories * amt_factories),
                    'note': '-',
                })
                
                if amt_factories > 0:
                    total_factories += amt_factories
                    total_factories_sdg += (total_amt_factories * amt_factories)
                    mro_details.append(line_vals)
        if total_dict:
            vals = {
                'name': 'Total factory',
                'month_name': '',
            }
            for main_line in total_dict:
                vals.update({main_line: total_dict[main_line]})
            vals.update({
                'total_time_factories': total_factories,
                'total_amt_factories': total_factories_sdg,
                'note': '-',
            })
            mro_details.append(vals)
        return mro_details
            
#         mro_details = []
#         line_vals = {
#             'name' : 'preventive maintenance hours',
#             'month_name' : 'January',
#             'main_line_1': 10,
#             'main_line_2': 20,
#             'main_line_3': 30,
#             'main_line_4': 40,
#             'main_line_5': 50,
#             'total_time_factories': 40,
#             'total_amt_factories': 120,
#             'note': 'This note 1'
#         }
#         mro_details.append(line_vals)
#         line_vals = {
#             'name' : 'Treatment maintenance hours',
#             'month_name' : 'January',
#             'main_line_1': 11,
#             'main_line_2': 21,
#             'main_line_3': 31,
#             'main_line_4': 41,
#             'main_line_5': 51,
#             'total_time_factories': 60,
#             'total_amt_factories': 190,
#             'note': 'This note 2'
#         }
#         mro_details.append(line_vals)
#         return mro_details
#         
#         
#         
#         cr = self.cr
#         uid = self.uid
#         context = {}
#         mro_order_obj = pooler.get_pool(self.cr.dbname).get('mro.order')
# 
#         date_from = form['start_date']
#         date_to = form['end_date'] #or time.strftime('%Y-%m-%d 24:00:00')
# 
#         factory_ids = form['factory_ids']
#         mro_details = []
# 
#         mro_order_ids = mro_order_obj.search(cr, uid, [
#                                                        ('factory_id', '=', factory_id),
#                                                        ('date_planned', '>=', date_from),
#                                                        ('date_planned', '<=', date_to),
#                                                        ])
# 
#         for order in mro_order_obj.browse(cr, uid, mro_order_ids, context=context):
#             line_vals = {
#                          'main_line' : order.mainline_id and order.mainline_id.name or '',
#                          'sub_line' : order.subline_id and order.subline_id.name or '',
#             }
# 
#             
#             mro_details.append(line_vals)
#         print "::mro_details:::",mro_details
#         return mro_details
        
        
        
#     def _get_arabic_text(self):
#         ret_dict = {}
#         ret_dict.update({
#             'notes': u'الملاحظات',
#             'total_amount_of_factories_sdg': u'المبلغ الكلي لل مصانع (‫بالجنيه‬ )',
#             'total_amount_of_factories_hour': u'المبلغ الكلي لل مصانع (ساعة )',
#             'months_year_quarters': u'أشهر / أرباع العام',
#             'statement': u'بيان',
#             'factory_name': u'اسم المصنع',
#             'body_build_factory': u'مصنع بناء الجسم',
#             'paint_build_factory': u'مصنع الطلاء بناء',
#             'aggregation_build_factory': u'مصنع تجميع بناء',
#             'cost_for_factory': u'تكلفة مصنع',
#             'saloon_line': u'خط الصالون',
#             'nissan_line': u'خط نيسان',
#         })
#         return ret_dict
    
    
    
report_sxw.report_sxw('report.factory.periodical.maintenance.report','factory.periodical.maintenance.report.wiz','maintenance_report/report/factory_periodical_maintenance_report.mako',parser=factory_periodical_maintenance_report, header =False)


