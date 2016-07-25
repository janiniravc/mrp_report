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


class planning_production_capacity_report(report_sxw.rml_parse):

    def __init__(self, cr, uid, name, context):
        super(planning_production_capacity_report, self).__init__(cr, uid, name, context=context)
        self.localcontext.update({
            'time': time,
            'get_data':self._get_data
        })
    
    
    def _get_data(self, plan_ids):
        plan_obj = self.pool.get('mrp.production.planning')
        result = []
        for planning in plan_obj.browse(self.cr, self.uid, plan_ids):
            for plan_line in planning.planning_ids:
                res = {'code':plan_line.product_id.default_code or '',
                       'product':plan_line.product_id.name or '',
                       'annual':plan_line.total or 0.00,
                       'first':(plan_line.jan + plan_line.jan_out) + (plan_line.feb + plan_line.feb_out) + (plan_line.march + plan_line.march_out),
                       'second':(plan_line.april + plan_line.april_out) + (plan_line.may + plan_line.may_out) + (plan_line.june + plan_line.june_out),
                       'third': (plan_line.july + plan_line.july_out) + (plan_line.aug + plan_line.aug_out) + (plan_line.sep + plan_line.sep_out),
                       'fourth':(plan_line.oct + plan_line.oct_out) + (plan_line.nov + plan_line.nov_out) + (plan_line.dec + plan_line.dec_out),}
                result.append(res)
        return result
    
report_sxw.report_sxw('report.planning_production_capacity_report','planning.production.capacity.report.wiz','production_report/report/planning_production_capacity_report.mako',parser=planning_production_capacity_report, header=False)


