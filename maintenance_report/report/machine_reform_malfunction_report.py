#-*- coding:utf-8 -*-
##############################################################################
#
#    OpenERP, Open Source Management Solution
#    Copyright (C) 2004-2009 Tiny SPRL (<http://tiny.be>). All Rights Reserved
#    d$
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

from openerp import pooler
import time
from openerp.report import report_sxw
from datetime import datetime
from dateutil.relativedelta import relativedelta
from datetime import datetime, timedelta, date

class machine_reform_malfunction_report(report_sxw.rml_parse):
    def __init__(self, cr, uid, name, context):
        super(machine_reform_malfunction_report, self).__init__(cr, uid, name, context=context)
        self.localcontext.update({
            'time': time,
#             'get_move_data': self._get_move_data,
#             'get_tot_debit' : self._get_tot_debit,
#             'get_tot_credit' : self._get_tot_credit,
        })

#     def _get_move_data(self, move_data):
# 
#         account_lines = []
# 
# 
#         return account_lines
# 
#     def _get_tot_credit(self, o):
#         tot_credit = 0.000
#         for line in o.line_id:
#             tot_credit += line.credit
#         return tot_credit
# 
#     def _get_tot_debit(self, o):
#         tot_debit = 0.000
#         for line in o.line_id:
#             tot_debit += line.debit
#         return tot_debit

report_sxw.report_sxw('report.machie.reform.malfuction.webkit', 'mro.order', 'addons/maintenance_report/report/machine_reform_malfunction_report.mako', parser=machine_reform_malfunction_report, header='internal')

# vim:expandtab:smartindent:tabstop=4:softtabstop=4:shiftwidth=4:
