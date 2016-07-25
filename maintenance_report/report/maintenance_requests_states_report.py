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


class maintenance_requests_states_report(report_sxw.rml_parse):

    def __init__(self, cr, uid, name, context):
        super(maintenance_requests_states_report, self).__init__(cr, uid, name, context=context)
        self.localcontext.update({
            'time': time,
            'get_request_detail':self._get_request_detail,
            'get_request_obj':self._get_request_obj,
        })
    
    def _get_request_obj(self, request_ids):
        request_obj = self.pool.get('mro.request')
        request_ids = request_obj.browse(self.cr, self.uid, request_ids)
        return request_ids
        
    def _get_request_detail(self, request_ids):
        request_obj = self.pool.get('mro.request') 
        executed_request_ids = request_obj.search(self.cr, self.uid, [('id','in',request_ids),
                                                                      ('state','=','done')])
        non_executed_request_ids = request_obj.search(self.cr, self.uid, [('id','in',request_ids),
                                                                      ('state','not in',('run','done'))])
        run_request_ids = request_obj.search(self.cr, self.uid, [('id','in',request_ids),
                                                                      ('state','=','run')])
        res = {'executed_request':len(executed_request_ids),
               'non_executed_request':len(non_executed_request_ids),
               'run_request':len(run_request_ids)}
        return res
    
    
report_sxw.report_sxw('report.maintenance_requests_states_report','maintenance.requests.states.report.wiz','maintenance_report/report/maintenance_requests_states_report.mako',parser=maintenance_requests_states_report, header=False)


