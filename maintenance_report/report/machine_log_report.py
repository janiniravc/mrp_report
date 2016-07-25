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


class machine_log_report(report_sxw.rml_parse):

    def __init__(self, cr, uid, name, context):
        super(machine_log_report, self).__init__(cr, uid, name, context=context)
        self.localcontext.update({
            'time': time,
            'get_machine_obj': self._get_machine_obj,
            'get_parts_names': self._get_parts_names,
            'get_last_maintenance_status':self._get_last_maintenance_status,
        })
        
    def _get_last_maintenance_status(self, asset_id):
        status = ''
        mro_obj = self.pool.get('mro.order')
        mro_ids = mro_obj.search(self.cr, self.uid, [('asset_id','=',asset_id),
                                                    ('state','=','done')],limit=1,order="done_date desc")
        if mro_ids:
            status = mro_obj.browse(self.cr, self.uid, mro_ids[0]).asset_status
        return (status and status.title()) or ''
    
    def _get_parts_names(self, parts_ids):
        parts_ref = []
        parts_ref += [parts.parts_id.default_code for parts in parts_ids if parts]
        result = ', '.join(set(parts_ref))
        return result
        
    def _get_machine_obj(self, machine_id):
        machine_obj = self.pool.get('asset.asset')
        machine_brw_id = machine_obj.browse(self.cr, self.uid, machine_id)
        return machine_brw_id
    
    
report_sxw.report_sxw('report.machine_log_report','machine.log.report.wiz','maintenance_report/report/machine_log_report.mako',parser=machine_log_report, header =False)


