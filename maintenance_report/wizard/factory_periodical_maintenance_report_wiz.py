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

class factory_periodical_maintenance_report_wiz(osv.osv_memory):
    _name = 'factory.periodical.maintenance.report.wiz'
    
    def _get_factories(self, cr, uid, context=None):
        return self.pool.get('sc.mrp.factory').search(cr, uid, [])
    
    
    _columns = {
        'start_date': fields.date('Start Date'),
        'end_date': fields.date('End Date'),
        'report_type': fields.selection([('monthly','Monthly'),('quarterly','Quarterly')],'Monthly/Quarterly'),
        'factory_ids': fields.many2many('sc.mrp.factory', 'mrp_factory_wizard_rel', 'wiz_id' , 'factory_id', 'Factory'),
    }
    
    _defaults = {
            'report_type': 'monthly',
            'start_date': lambda *a: time.strftime('%Y-01-01'),
            'end_date': lambda *a: time.strftime('%Y-%m-%d'),
            'factory_ids': _get_factories,
            
    }

    def print_report(self, cr, uid, ids, context=None):
        if context is None:
            context = {}
        data = self.read(cr, uid, ids, context=context)[0]
        datas = {
             'ids': context.get('active_ids',[]),
             'model': 'factory.periodical.maintenance.report.wiz',
             'form': data
        }
        return {
            'type': 'ir.actions.report.xml',
            'report_name': 'factory.periodical.maintenance.report',
            'name': "Factory Periodical Maintenance Report",
            'datas': datas,
            'nodestroy': True
        }
