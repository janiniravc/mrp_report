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

class maintenance_material_list_report_wiz(osv.osv_memory):
    _name = 'maintenance.material.list.report.wiz'
    
    def default_get(self, cr, uid, fields, context=None):
        if context is None:
            context = {}
        res = super(maintenance_material_list_report_wiz, self).default_get(cr, uid, fields, context=context)
        factory_ids = self.pool.get('sc.mrp.factory').search(cr, uid, [], context=context)
        res.update({'factory_ids': factory_ids})
        return res
    
    _columns = {
        'machine_ids': fields.many2many('asset.asset', 'asset_asset_wizard_rel', 'wiz_id' , 'asset_id', 'Assets'),
        'factory_ids': fields.many2many('sc.mrp.factory', 'mrp_maintenance_factory_wizard_rel', 'wiz_id' , 'factory_id', 'Factory'),
        'start_date': fields.date('Start Date'),
        'end_date': fields.date('End Date'),
        #To Do
        #'product_line': fields.many2many('asset.asset', 'asset_asset_wizard_rel', 'wiz_id' , 'asset_id', 'Assets'),
    }
    
    _defaults = {
                 'start_date':lambda *a: time.strftime('%Y-%m-%d'),
                 'end_date': lambda *a: time.strftime('%Y-%m-%d'),
                 }
    
    
    def onchange_factory_ids(self, cr, uid, ids, factory_ids, context=None):
        res = {'domain':{'machine_ids':[('is_machinary','=',True)]}}
        print "fectory...",factory_ids
        if factory_ids and factory_ids[0][2]:
            
            res['domain']['machine_ids'].append(('factory_id','in',factory_ids[0][2]))
        return res
    
    
    def print_report(self, cr, uid, ids, context=None):
        if context is None:
           context = {}
           
        mro_order_obj = self.pool.get('mro.order')   
        data = self.read(cr, uid, ids, context=context)[0]
        domain = [('asset_id.is_machinary','=',True)]
        if data.get('factory_ids',[]):
            domain.append(('factory_id','in',data.get('factory_ids')))
        if data.get('machine_ids',[]):
            domain.append(('asset_id','in',data.get('machine_ids')))
        start_date = datetime.strptime(data.get('start_date'), '%Y-%m-%d').strftime("%Y-%m-%d 00:00:00")
        end_date = datetime.strptime(data.get('end_date'), '%Y-%m-%d').strftime("%Y-%m-%d 23:59:59")
         
        domain.extend( [('done_date','>=', start_date), ('done_date','<=', end_date)]  )
            
        mrp_order_ids = mro_order_obj.search(cr, uid, domain, context=context)
        data['mro_order_ids'] = mrp_order_ids
        
        if not mrp_order_ids:
            raise osv.except_osv(_('Warning!'), _("No Record Found With Selected Filters."))
        
        datas = {
             'ids': context.get('active_ids',[]),
             'model': 'maintenance.material.list.report.wiz',
             'form': data
        }
        return {
            'type': 'ir.actions.report.xml',
            'report_name': 'maintenance_material_list_report',
            'name': "Maintenance Material List",
            'datas': datas,
        }
