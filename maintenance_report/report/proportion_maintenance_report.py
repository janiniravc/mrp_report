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


class proportion_maintenance_report(report_sxw.rml_parse):

    def __init__(self, cr, uid, name, context):
        super(proportion_maintenance_report, self).__init__(cr, uid, name, context=context)
        self.localcontext.update({
            'time': time,
            'get_machine_line': self._get_machine_line,
            'get_factory_line': self._get_factory_line,
        })
        
    def _get_machine_line(self, form):
        asset_obj = self.pool.get('asset.asset')
        mro_request_obj = self.pool.get('mro.request')
        mro_obj = self.pool.get('mro.order')
        cr = self.cr
        uid = self.uid
        date_from = datetime.strptime(form['start_date'], '%Y-%m-%d').strftime("%Y-%m-%d 00:00:00")
        date_to = datetime.strptime(form['end_date'], '%Y-%m-%d').strftime("%Y-%m-%d 23:59:59")
        mro_details = []
        asset_ids = asset_obj.search(cr, uid, [])
        for asset_brw in asset_obj.browse(cr, uid, asset_ids):
            no_of_treatment_maintenace = mro_request_obj.search_count(cr, uid, [('requested_date', '>=', date_from),('requested_date', '<=', date_to),('asset_id', '=', asset_brw.id)])
            total_maintenace = mro_obj.search_count(cr, uid, [('date_planned', '>=', date_from),('date_planned', '<=', date_to),('asset_id', '=', asset_brw.id)])
            percentage_maintenance = 0
            no_of_treatment_maintenace = float(no_of_treatment_maintenace)
            total_maintenace = float(total_maintenace)
            if no_of_treatment_maintenace > 0 and total_maintenace > 0:
                percentage_maintenance = round((no_of_treatment_maintenace / total_maintenace) * 100,2)
            vals = {
                'machine_name': asset_brw.name,
                'no_of_treatment_maintenace': no_of_treatment_maintenace,
                'total_maintenace': total_maintenace,
                'percentage_maintenance': percentage_maintenance
            }
            mro_details.append(vals)
        return mro_details
    
    def _get_factory_line(self, form):
        factory_obj = self.pool.get('sc.mrp.factory')
        mro_request_obj = self.pool.get('mro.request')
        mro_obj = self.pool.get('mro.order')
        cr = self.cr
        uid = self.uid
        date_from = datetime.strptime(form['start_date'], '%Y-%m-%d').strftime("%Y-%m-%d 00:00:00")
        date_to = datetime.strptime(form['end_date'], '%Y-%m-%d').strftime("%Y-%m-%d 23:59:59")
        mro_details = []
        factory_ids = factory_obj.search(cr, uid, [])
        for factory_brw in factory_obj.browse(cr, uid, factory_ids):
            no_of_treatment_maintenace = mro_request_obj.search_count(cr, uid, [('requested_date', '>=', date_from),('requested_date', '<=', date_to),('factory_id', '=', factory_brw.id)])
            total_maintenace = mro_obj.search_count(cr, uid, [('date_planned', '>=', date_from),('date_planned', '<=', date_to),('factory_id', '=', factory_brw.id)])
            percentage_maintenance = 0
            no_of_treatment_maintenace = float(no_of_treatment_maintenace)
            total_maintenace = float(total_maintenace)
            if no_of_treatment_maintenace > 0 and total_maintenace > 0:
                percentage_maintenance = round((no_of_treatment_maintenace / total_maintenace) * 100,2)
            vals = {
                'factory_name': factory_brw.name,
                'no_of_treatment_maintenace': no_of_treatment_maintenace,
                'total_maintenace': total_maintenace,
                'percentage_maintenance': percentage_maintenance
            }
            mro_details.append(vals)
        return mro_details

report_sxw.report_sxw('report.proportion_maintenance_report','proportion.maintenance.report.wiz','maintenance_report/report/proportion_maintenance_report.mako',parser=proportion_maintenance_report, header =False)