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


class list_of_engineer_service_report(report_sxw.rml_parse):

    def __init__(self, cr, uid, name, context):
        super(list_of_engineer_service_report, self).__init__(cr, uid, name, context=context)
        self.localcontext.update({
            'time': time,
            'get_line': self._get_line,
        })
        
    def _get_line(self, form):
        cr = self.cr
        uid = self.uid
        context = {}
        mro_request_obj = pooler.get_pool(self.cr.dbname).get('mro.request')
        mro_order_obj = pooler.get_pool(self.cr.dbname).get('mro.order')
        maintenance_type_list = dict(self.pool.get('mro.order')._columns.get('maintenance_type').selection)
        service_line = []
        date_from = datetime.strptime(form['start_date'], '%Y-%m-%d').strftime("%Y-%m-%d 00:00:00")
        date_to = datetime.strptime(form['end_date'], '%Y-%m-%d').strftime("%Y-%m-%d 23:59:59")


        mro_ids = mro_request_obj.search(cr, uid, [('requested_date', '>=', date_from),('requested_date', '<=', date_to)])
        sr_no = 1
        for mro in mro_request_obj.browse(cr, uid, mro_ids, context=context):
            mro_id = mro_order_obj.search(cr, uid, [('origin', '=', mro.name)])
            mro_brw = mro_order_obj.browse(cr, uid, mro_id)
            vals = {
                'sr_no': sr_no,
                'group_name': mro.asset_id and mro.asset_id.category_id and mro.asset_id.category_id.tools_category or '',
                'origin_name': mro.name,
                'code': mro.asset_code or '',
                'place': mro.asset_location and mro.asset_location.name or '',
                'operation_date': mro.requested_date,
                'maintenance_type': '',
                'maintenace_each_type': '-',
            }
            if mro_brw:
                mro_brw = mro_brw[0]
                vals.update({
                    'maintenance_type': maintenance_type_list.get(mro_brw.maintenance_type),
                    'maintenace_each_type': '-',
                })
            sr_no += 1
            service_line.append(vals)
        return service_line
    
report_sxw.report_sxw('report.list.of.engineer.service.report','list.of.engineer.service.report.wiz','maintenance_report/report/list_of_engineer_service_report.mako',parser=list_of_engineer_service_report, header =False)


