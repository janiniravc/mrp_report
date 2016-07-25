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
import datetime
from openerp import pooler, tools
from openerp.report import report_sxw
from openerp.report.interface import report_rml
from openerp.tools import to_xml


class monthly_maintenance_report(report_sxw.rml_parse):

    def __init__(self, cr, uid, name, context):
        super(monthly_maintenance_report, self).__init__(cr, uid, name, context=context)
        self.localcontext.update({
            'time': time,
            'get_mro_order':self._get_mro_order,
            'get_maintenance_time':self._get_maintenance_time,
            'get_planned_executed_percentage':self._get_planned_executed_percentage,
            
        })
        
    def _get_planned_executed_percentage(self, mainline_id, start_date, end_date):
        mro_order_obj = self.pool.get('mro.order')
        per = 0.00
        planned_mro_ids = mro_order_obj.search(self.cr, self.uid, [('date_planned','>=',start_date),('date_planned','<=',end_date),
                                                               ('mainline_id','=',mainline_id)])
        excecuted_mro_ids = mro_order_obj.search(self.cr, self.uid, [('done_date','>=',start_date),('done_date','<=',end_date),
                                                               ('mainline_id','=',mainline_id)])
        if len(excecuted_mro_ids) == 0:
            return per
        per =  (float(len(excecuted_mro_ids)) / float(len(planned_mro_ids)))*100
        return per
        
    
    def _get_mro_order(self, mro_order_ids):
        mro_order_obj = self.pool.get('mro.order')  
        mro_order_ids = mro_order_obj.browse(self.cr, self.uid, mro_order_ids)
        return mro_order_ids
    
    def _get_maintenance_time(self, ready_date, done_date):
        main_time = 0.00
        if ready_date and done_date:
            ready_date = datetime.datetime.strptime(ready_date, '%Y-%m-%d %H:%M:%S')
            done_date = datetime.datetime.strptime(done_date, '%Y-%m-%d %H:%M:%S')
            diff = done_date - ready_date
            main_time = round((float(diff.total_seconds()) / 3600.0), 2)
        return main_time
    
report_sxw.report_sxw('report.monthly_maintenance_report','monthly.maintenance.report.wiz','maintenance_report/report/monthly_maintenance_report.mako',parser=monthly_maintenance_report, header=False)


