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


class maintenance_daily_weekly_report_wiz(osv.osv_memory):
    _name = 'maintenance.daily.weekly.report.wiz'
    
    _columns = {
        'daily_weekly_selection': fields.selection([('daily','Daily'),('weekly','Weekly')], string="Daily/Weekly"),
        'start_date': fields.date('Start Date'),
        'end_date': fields.date('End Date'),
        'factory_id': fields.many2one('sc.mrp.factory', 'Factory'),
        'line_id': fields.many2one('sc.mrp.mainline', 'Main Line'),
    }
    
    _defaults = {
            'daily_weekly_selection':'daily',
            'start_date': lambda *a: time.strftime('%Y-%m-01'),
            'end_date': lambda *a: time.strftime('%Y-%m-%d'),
    }
    
    def onchange_start_date(self, cr, uid, ids, start_date, context=None):
        res = {'value':{}}
        if start_date:
            res['value'].update({'end_date':start_date})
        
        return res

    def onchange_factory_id(self, cr, uid, ids, factory_id, context=None):
        res = {'value':{}, 'domain':{}}
        if factory_id:
            res['domain'].update({'line_id':[('factory_id','=',factory_id)]})
        return res

    def print_report(self, cr, uid, ids, context=None):
        if context is None:
           context = {}
           
        mro_order_obj = self.pool.get('mro.order')   
        data = self.read(cr, uid, ids, context=context)[0]
        domain = []
        if data.get('factory_id',False):
            domain.append(('factory_id','=',data.get('factory_id')[0]))
        if data.get('line_id',False):
            domain.append(('mainline_id','=',data.get('line_id')[0]))
        start_date = datetime.strptime(data.get('start_date'), '%Y-%m-%d').strftime("%Y-%m-%d 00:00:00")
        end_date = datetime.strptime(data.get('end_date'), '%Y-%m-%d').strftime("%Y-%m-%d 23:59:59")
         
        domain.extend( [('done_date','>=', start_date), ('done_date','<=', end_date)]  )
        mrp_order_ids = mro_order_obj.search(cr, uid, domain, context=context)
        data['mro_order_ids'] = mrp_order_ids
        
        if not mrp_order_ids:
            raise osv.except_osv(_('Warning!'), _("No Record Found With Selected Filters."))

            
            
        datas = {
             'ids': context.get('active_ids',[]),
             'model': 'maintenance.daily.weekly.report.wiz',
             'form': data
        }
        return {
            'type': 'ir.actions.report.xml',
            'report_name': 'maintenance.daily.weekly.report',
            'name': "Maintenance Daily/Weekly Report",
            'datas': datas,
        }