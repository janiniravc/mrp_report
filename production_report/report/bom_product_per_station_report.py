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


class bom_product_per_station_report(report_sxw.rml_parse):

    def __init__(self, cr, uid, name, context):
        super(bom_product_per_station_report, self).__init__(cr, uid, name, context=context)
        self.localcontext.update({
            'time': time,
            'get_line': self._get_line,
        })
    
    def _get_line(self, form):
        cr = self.cr
        uid = self.uid
        context = {}
        mrp_production_obj = pooler.get_pool(self.cr.dbname).get('mrp.production')
        date_from = datetime.strptime(form['start_date'], '%Y-%m-%d').strftime("%Y-%m-%d 00:00:00")
        date_to = datetime.strptime(form['end_date'], '%Y-%m-%d').strftime("%Y-%m-%d 23:59:59")
        mrp_production_lst = []
        bom_change_ids = mrp_production_obj.search(cr, uid, [('date_planned','>=', date_from),('date_planned','<=', date_to)])
        
        for sc_mrp_bom_change in mrp_production_obj.browse(cr, uid, bom_change_ids):
            mrp_production_lst.append(sc_mrp_bom_change)
        return mrp_production_lst

report_sxw.report_sxw('report.bom_product_per_station_report','bom.product.per.station.report.wiz','production_report/report/bom_product_per_station_report.mako',parser=bom_product_per_station_report, header=False)


