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

class production_management_report_wiz(osv.osv_memory):
    _name = 'production.management.report.wiz'
    
    _columns = {
        'start_date': fields.date('Date From'),
        'end_date': fields.date('Date To'),
        'factory_id':fields.many2one('sc.mrp.factory', 'Factory'),
        'product_id':fields.many2one('product.product','Product'),
        'report_selection': fields.selection([('Productivity of laborers','Productivity of laborers'),
                                              ('Productivity of Tools','Productivity of Tools'),
                                              ('Productivity Of Raw Materials','Productivity Of Raw Materials'),
                                              ('Productivity Of Capacity','Productivity Of Capacity'),
                                              ('Overall Productivity','Overall Productivity'),
                                              ('Efficiency of Capacity Productivity','Efficiency of Capacity Productivity'),
                                              ('Cost of the Production Unit','Cost of the Production Unit')],'Report'),
    }
    
    _defaults = { 
                 'start_date': lambda *a: time.strftime('%Y-%m-01'),
                 'end_date': lambda *a: time.strftime('%Y-%m-%d'),
                 'report_selection':'Productivity of laborers'
                }

    def print_report(self, cr, uid, ids, context=None):
        if context is None:
           context = {}
        data = self.read(cr, uid, ids, context=context)[0]
#         planning_obj = self.pool.get('mrp.production.planning')
#         planning_ids = planning_obj.search(cr, uid, [('current_year','=',data['year_id'][0])],context=context)
#         if not planning_ids:
#             raise osv.except_osv(_('Warning!'), _("No Record Found With Selected Filters."))
#         data['planning_ids'] = planning_ids
        
        datas = {
             'ids': context.get('active_ids',[]),
             'model': 'production.management.report.wiz',
             'form': data,
        }
        return {
            'type': 'ir.actions.report.xml',
            'report_name': 'production_management_report',
            'name': "Management of Production Report",
            'datas': datas,
        }
