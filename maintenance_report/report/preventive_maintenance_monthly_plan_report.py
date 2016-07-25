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
from datetime import timedelta
from matplotlib._cntr import Cntr

Week_Days = {'Monday':1,'Tuesday':2,'Wednesday':3,'Thursday':4 ,'Friday':5,'Saturday':6,'Sunday':7}
class preventive_maintenance_monthly_plan_report(report_sxw.rml_parse):

    def __init__(self, cr, uid, name, context):
        super(preventive_maintenance_monthly_plan_report, self).__init__(cr, uid, name, context=context)
        self.localcontext.update({
            'time': time,
            'get_details':self._get_details,
            'get_month':self._get_month,
            'get_colors':self._get_colors,
            'get_machine':self._get_machine,
            'get_is_maintanace_week':self._get_is_maintanace_week,
            'get_dates':self._get_dates,
        })
        
    def _get_dates(self):
        res = {}
        res['start_date'] = time.strftime('%Y-01-01')
        res['end_date'] = time.strftime('%Y-12-31')
        return res
    
    def _get_is_maintanace_week(self, machine_id,day_date):
        flag = False
        from_date = time.strftime('%Y-'+ day_date[0][3:]+'-'+day_date[0][:2]+' 00:00:00')
        to_date = time.strftime('%Y-'+ day_date[1][3:]+'-'+day_date[1][:2]+' 00:00:00')
        order_obj = self.pool.get('mro.order')
        order_ids = order_obj.search(self.cr, self.uid, [('asset_id','=',machine_id),
                                                         ('date_planned','>=',from_date),
                                                         ('date_planned','<',to_date)], context={})
        
        if order_ids:
            flag = 1
        return flag or ''
        
    def _get_machine(self):
        asset_obj = self.pool.get('asset.asset')
        asset_ids = asset_obj.search(self.cr, self.uid, [])
        asset_brw = asset_obj.browse(self.cr, self.uid, asset_ids)
        return asset_brw
        
    def _get_colors(self):
        return ['#ffff00','#33cccc','#3366ff','#ff0000','#ffff00','#33cccc','#3366ff','#ff0000','#ffff00','#33cccc','#3366ff','#ff0000']

    
    def _get_month(self):
        return {1:'January',
                      2:'February',
                      3:'March',
                      4:'April',
                      5:'May',
                      6:'June',
                      7:'July',
                      8:'August',
                      9:'September',
                      10:'October',
                      11:'November',
                      12:'December'}
        
        
    def _get_details(self):
        my_dict = {}
        start_date = time.strftime('%Y-01-01')
        end_date = time.strftime('%Y-12-31')
        cal_start_date = datetime.strptime(start_date, '%Y-%m-%d')
        cal_end_date = datetime.strptime(end_date, '%Y-%m-%d')
        
        for i in range(12):
            i += 1
            my_dict.update({i:{'date':[]} })
        a =  cal_start_date.strftime("%d-%m")
        if Week_Days[cal_start_date.strftime("%A")] != 1:
            day = (7 - Week_Days[cal_start_date.strftime("%A")]) + 1 
            test_date = cal_start_date + timedelta(days=day)
            b = test_date.strftime("%d-%m")
        else:
            day = 7
            test_date = cal_start_date + timedelta(days=day)
            b = test_date.strftime("%d-%m")
        date_lst = [(a,b)]
        my_dict[int(a[3:])]['date'].append((a,b))
        
        day = 7
        while(test_date <= cal_end_date):
            a = b
            test_date = test_date + timedelta(days=day)
            b = test_date.strftime("%d-%m")
            my_dict[int(a[3:])]['date'].append((a,b))
        return my_dict
report_sxw.report_sxw('report.preventive.maintenance.monthly.plan.report','preventive.maintenance.monthly.plan.report.wiz','maintenance_report/report/preventive_maintenance_monthly_plan_report.mako',parser=preventive_maintenance_monthly_plan_report, header =False)


