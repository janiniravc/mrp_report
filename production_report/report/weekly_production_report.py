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


class weekly_production_report(report_sxw.rml_parse):

    def __init__(self, cr, uid, name, context):
        super(weekly_production_report, self).__init__(cr, uid, name, context=context)
        self.localcontext.update({
            'time': time,
            'get_factory':self._get_factory,
        })
    
    def _get_factory(self):
        
        factory_obj = self.pool.get("sc.mrp.factory")
        fectory_ids = factory_obj.search(self.cr, self.uid, [])
        fectory_brw_ids = factory_obj.browse(self.cr, self.uid, fectory_ids)
        return fectory_brw_ids
    
report_sxw.report_sxw('report.weekly_production_report','weekly.production.report.wiz','production_report/report/weekly_production_report.mako',parser=weekly_production_report, header=False)


