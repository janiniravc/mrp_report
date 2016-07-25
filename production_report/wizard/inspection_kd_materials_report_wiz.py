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

class inspection_kd_materials_report_wiz(osv.osv_memory):
    _name = 'inspection.kd.materials.report.wiz'
    
    _columns = {
        'product_id': fields.many2one('product.product','Product'),
        'start_date': fields.date('From Date'),
        'end_date':fields.date('To Date')
    }
    
    _defaults = {
            'start_date': lambda *a: time.strftime('%Y-%m-01'),
            'end_date': lambda *a: time.strftime('%Y-%m-%d'),
    }

    

    def print_report(self, cr, uid, ids, context=None):
        if context is None:
           context = {}
        data = self.read(cr, uid, ids, context=context)[0]
        mrp_obj = self.pool.get('mrp.production')
        start_date = datetime.strptime(data['start_date'], "%Y-%m-%d").strftime("%Y-%m-%d %H:%M:%S")
        end_date = datetime.strptime(data['end_date'], "%Y-%m-%d").strftime("%Y-%m-%d 23:59:59")
        mrp_ids = mrp_obj.search(cr, uid, [('date_planned','>=',start_date),
                                           ('date_planned','<=',end_date),
                                           ('product_id','=',data['product_id'][0])],context=context)
        if not mrp_ids:
            raise osv.except_osv(_('Warning!'), _("No Record Found With Selected Filters."))
        
        data['mrp_ids'] = mrp_ids
        datas = {
             'ids': context.get('active_ids',[]),
             'model': 'inspection.kd.materials.report.wiz',
             'form': data,
        }
        return {
            'type': 'ir.actions.report.xml',
            'report_name': 'inspection_kd_materials_report',
            'name': "Inspection of KD Materials Report",
            'datas': datas,
        }
