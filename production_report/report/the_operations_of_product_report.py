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


class the_operations_of_product_report(report_sxw.rml_parse):

    def __init__(self, cr, uid, name, context):
        super(the_operations_of_product_report, self).__init__(cr, uid, name, context=context)
        self.localcontext.update({
            'time': time,
            'get_products': self._get_products,
            'get_operation_details': self._get_operation_details,
        })
        
    def _get_products(self, form):
        cr = self.cr
        uid = self.uid
        context = {}
        product_data = []
        product_obj = pooler.get_pool(self.cr.dbname).get('product.product')
        workcenter_obj = pooler.get_pool(self.cr.dbname).get('mrp.workcenter')
        sc_mrp_task_line_obj = pooler.get_pool(self.cr.dbname).get('sc.mrp.task.line')

        product_ids = form['product_ids']
        if not product_ids:
            product_ids = product_obj.search(cr, uid, [])
            
        workcenter_ids = form['workcenter_ids']
        if not workcenter_ids:
            workcenter_ids = product_obj.search(cr, uid, [])

        for product in product_obj.browse(cr, uid, product_ids, context=context):
            for workcenter in workcenter_obj.browse(cr, uid, workcenter_ids, context=context):
                task_ids = sc_mrp_task_line_obj.search(cr, uid, [('workcenter_id', '=', workcenter.id),('task_id.product_id', '=', product.id)])
                if task_ids:
                    vals = {
                        'product_name': product.name,
                        'product_id': product.id,
                        'workcenter_id': workcenter.id,
                        'workcenter_name': workcenter.name,
                    }
                    product_data.append(vals)
        return product_data
    
    def _get_operation_details(self, product, workcenter):
        cr = self.cr
        uid = self.uid
        context = {}
        product_data = []
        sc_mrp_task_line_obj = pooler.get_pool(self.cr.dbname).get('sc.mrp.task.line')

        
        task_ids = sc_mrp_task_line_obj.search(cr, uid, [('workcenter_id', '=', workcenter),('task_id.product_id', '=', product)])
        for task in sc_mrp_task_line_obj.browse(cr, uid, task_ids, context=context):
            vals = {
                'task_time': task.task_time,
                'operation_code': task.code,
                'operation_name': task.name,
            }
            product_data.append(vals)
        return product_data
    
    
report_sxw.report_sxw('report.operations_of_product_report','operations.of.product.report.wiz','production_report/report/the_operations_of_product_report.mako',parser=the_operations_of_product_report, header=False)


