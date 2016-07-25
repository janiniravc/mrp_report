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


class details_implementation_workorder_report(report_sxw.rml_parse):

    def __init__(self, cr, uid, name, context):
        super(details_implementation_workorder_report, self).__init__(cr, uid, name, context=context)
        self.localcontext.update({
            'time': time,
            'get_department':self._get_department,
            'get_production_date':self._get_production_date,
            'get_job_order_brw':self._get_job_order_brw,
        })
        
    def _get_job_order_brw(self, job_order_ids):
        job_order_obj = self.pool.get('sc.mrp.daily.job.order')
        job_order_brw = job_order_obj.browse(cr, uid, job_order_ids, context=context)
        return job_order_brw
    
    
    def _get_department(self, factory_brw_ids):
        departments_lst = []
        factory_lst = []
        data = {}
        for factory in factory_brw_ids:
            if factory.department_id and factory.department_id.name not in departments_lst:
                departments_lst.append(factory.department_id.name)
            factory_lst.append(factory.name)
        data['department'] = departments_lst and ', '.join(departments_lst) or ''
        data['factory'] = factory_lst and ', '.join(factory_lst) or ''
        return data
    
    def _get_production_date(self, job_order_brw):
        mrp_obj = self.pool.get('mrp.production')
        mrp_ids = mrp_obj.search(self.cr, self.uid, [('daily_job_order_id','=',job_order_brw.daily_job_order_no)])
        if mrp_ids:
            mrp_brw = mrp_obj.browse(self.cr, self.uid, mrp_ids[0])
            return mrp_brw.date_planned
        return ''
        
report_sxw.report_sxw('report.details_implementation_workorder_report','details.implementation.workorder.report.wiz','production_report/report/details_implementation_workorder_report.mako',parser=details_implementation_workorder_report, header=False)


2