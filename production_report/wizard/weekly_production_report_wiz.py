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

class weekly_production_report_wiz(osv.osv_memory):
    _name = 'weekly.production.report.wiz'
    
    _columns = {
        'start_date': fields.date('Start Date'),
        'end_date': fields.date('End Date'),
        'report_is': fields.selection([('yearly','Yearly'),('weekly','Weekly'),('daily','Daily')],'Report'),
    }
    
    _defaults = {
            'start_date': lambda *a: time.strftime('%Y-%m-01'),
            'end_date': lambda *a: time.strftime('%Y-%m-%d'),
            'report_is': 'weekly'
    }

    def onchange_report(self, cr, uid, ids, report_is, context=None):
        res = {'value':{}}
        if report_is == 'daily':
            start_date = time.strftime('%Y-%m-%d')
            end_date = time.strftime('%Y-%m-%d')
        elif report_is == 'yearly':
            start_date = time.strftime('%Y-01-01')
            end_date = time.strftime('%Y-12-31')
        else:
            start_date = time.strftime('%Y-%m-01')
            end_date = time.strftime('%Y-%m-%d')
        res['value'].update({'start_date':start_date, 'end_date':end_date})
        return res
            
            
    def print_report(self, cr, uid, ids, context=None):
        if context is None:
           context = {}
        data = self.read(cr, uid, ids, context=context)[0]
        datas = {
             'ids': context.get('active_ids',[]),
             'model': 'weekly.production.report.wiz',
             'form': data,
        }
        return {
            'type': 'ir.actions.report.xml',
            'report_name': 'weekly_production_report',
            'name': "Production Report",
            'datas': datas,
        }
