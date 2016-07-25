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


class weekly_treatment_maintenance_report(report_sxw.rml_parse):

    def __init__(self, cr, uid, name, context):
        super(weekly_treatment_maintenance_report, self).__init__(cr, uid, name, context=context)
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
        domain = []
        domain += [('date_planned', '>=', date_from)]
        domain += [('date_planned', '<=', date_to)]
        if form['factory_id']:
            domain += [('factory_id', '<=', form['factory_id'][0])]

        mro_ids = mro_order_obj.search(cr, uid, domain)
        sr_no = 1
        for mro in mro_order_obj.browse(cr, uid, mro_ids, context=context):
#             mro_id = mro_order_obj.search(cr, uid, [('origin', '=', mro.name)])
#             mro_brw = mro_order_obj.browse(cr, uid, mro_id)
            vals = {
                'sr_no': sr_no,
                'production_line': mro.mainline_id and mro.mainline_id.name or '',
                'machine_name': mro.asset_id and mro.asset_id.name or '',
                'demage_date': mro.failure_date or '',
                'request_date_time': mro.date_planned or '',
                'response_date_time': mro.confirm_date or '',
                'repair_date_time': mro.date_scheduled or '',
                'stopping_time': mro.done_date or '',
                'repairer_name': mro.eng_name_id and mro.eng_name_id.name or '',
                'cost_of_maintenance_time': '',
                'cost_of_spare_parts_depreciations': '',
                'total_cost_of_maintenance': '',
                'notes': mro.problem_description or '',
            }
#             if mro_brw:
#                 mro_brw = mro_brw[0]
#                 vals.update({
#                     'maintenance_type': maintenance_type_list.get(mro_brw.maintenance_type),
#                     'maintenace_each_type': '-',
#                 })
            sr_no += 1
            service_line.append(vals)
        return service_line
    
report_sxw.report_sxw('report.weekly_treatment_maintenance_report','weekly.treatment.maintenance.report.wiz','maintenance_report/report/weekly_treatment_maintenance_report.mako',parser=weekly_treatment_maintenance_report, header=False)


