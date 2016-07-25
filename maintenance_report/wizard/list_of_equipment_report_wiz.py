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

class list_of_equipment_report_wiz(osv.osv_memory):
    _name = 'list.of.equipment.report.wiz'

    _columns = {
        'factory_id': fields.many2one('sc.mrp.factory', 'Factory'),
    }
    
    def print_report(self, cr, uid, ids, context=None):
        if context is None:
            context = {}
        data = self.read(cr, uid, ids, context=context)[0]
        asset_obj = self.pool.get('asset.asset')
        
        domain = []
        if data.get('factory_id',False):
            domain.append(('factory_id','=',data.get('factory_id')[0]))
         
        asset_ids = asset_obj.search(cr, uid, domain, context=context)
        data['asset_ids'] = asset_ids
        if not asset_ids:
            raise osv.except_osv(_('Warning!'), _("No Record Found With Selected Filters."))
        datas = {
             'ids': context.get('active_ids',[]),
             'model': 'list.of.equipment.report.wiz',
             'form': data
        }
        return {
            'type': 'ir.actions.report.xml',
            'report_name': 'list.of.equipment.report',
            'name': "The List of equipment",
            'datas': datas,
        }