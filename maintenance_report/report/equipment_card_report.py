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


class equipment_card_report(report_sxw.rml_parse):

    def __init__(self, cr, uid, name, context):
        super(equipment_card_report, self).__init__(cr, uid, name, context=context)
        self.localcontext.update({
            'time': time,
            'get_asset_obj': self._get_asset_obj,
            'get_fuses': self._get_fuses,
        })
        
    def _get_asset_obj(self, asset_id):
        asset_obj = self.pool.get('asset.asset')
        asset_brw_id = asset_obj.browse(self.cr, self.uid, asset_id)
        return asset_brw_id
    
    def _get_fuses(self, fuses_ids):
        fuses_ref = []
        fuses_ref += [fuses.name for fuses in fuses_ids]
        result = ', '.join(set(fuses_ref))
        return result
    
report_sxw.report_sxw('report.equipment_card_report','equipment.card.report.wiz','maintenance_report/report/equipment_card_report.mako',parser=equipment_card_report, header =False)


