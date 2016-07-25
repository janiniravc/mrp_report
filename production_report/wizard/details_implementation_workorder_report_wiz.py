# -*- coding: utf-8 -*-
##############################################################################
#
#    OpenERP, Open Source Management Solution
#    Copyright (C) 2004-2010 Tiny SPRL (<http://tiny.be>).
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your option) any later version.
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
from openerp.osv import osv, fields
from openerp.tools.translate import _
from datetime import datetime

class details_implementation_workorder_report_wiz(osv.osv_memory):
    _name = 'details.implementation.workorder.report.wiz'
    
    _columns = {
        'start_date': fields.date('Date From'),
        'end_date': fields.date('Date To'),
        'product_ids': fields.many2many('product.product','prod_implement_workorder_wiz_rel','product_id','wiz_is','Products')
    }
    
    _defaults = {
            'start_date': lambda *a: time.strftime('%Y-%m-01'),
            'end_date': lambda *a: time.strftime('%Y-%m-%d'),
    }

    

    def print_report(self, cr, uid, ids, context=None):
        if context is None:
           context = {}
        data = self.read(cr, uid, ids, context=context)[0]
        start_date = datetime.strptime(data['start_date'], "%Y-%m-%d").strftime("%Y-%m-%d %H:%M:%S")
        end_date = datetime.strptime(data['end_date'], "%Y-%m-%d").strftime("%Y-%m-%d 23:59:59")
        job_order_obj = self.pool.get('sc.mrp.daily.job.order')
        domain  = [('date','>=',start_date),('date','<=',end_date)]
        if data['product_ids']:
            domain.append(('general_job_order_id.product_id','in',data['product_ids']))
        job_order_ids = job_order_obj.search(cr, uid, domain, context=context)
        if not job_order_ids:
            raise osv.except_osv(_('Warning!'), _("No Record Found With Selected Filters."))
#         job_order_brw = job_order_obj.browse(cr, uid, job_order_ids, context=context)
        data['job_orders'] = job_order_ids
        datas = {
             'ids': context.get('active_ids',[]),
             'model': 'details.implementation.workorder.report.wiz',
             'form': data,
        }
        return {
            'type': 'ir.actions.report.xml',
            'report_name': 'details_implementation_workorder_report',
            'name': "Details of Implementation Work Order",
            'datas': datas,
        }
