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

class operations_of_product_report_wiz(osv.osv_memory):
    _name = 'operations.of.product.report.wiz'
    
    _columns = {
        'product_ids': fields.many2many('product.product', 'product_operation_report_wizard_rel', 'wiz_id' , 'product_id', 'Product'),
        'workcenter_ids': fields.many2many('mrp.workcenter', 'workcenter_operation_report_wizard_rel', 'wiz_id' , 'workcenter_id', 'Work station'),
    }

    def print_report(self, cr, uid, ids, context=None):
        if context is None:
           context = {}
        data = self.read(cr, uid, ids, context=context)[0]
        datas = {
             'ids': context.get('active_ids',[]),
             'model': 'operations.of.product.report.wiz',
             'form': data,
        }
        return {
            'type': 'ir.actions.report.xml',
            'report_name': 'operations_of_product_report',
            'name': "Operations of the product",
            'datas': datas,
        }