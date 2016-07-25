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


class auxiliary_materials_product_report(report_sxw.rml_parse):

    def __init__(self, cr, uid, name, context):
        super(auxiliary_materials_product_report, self).__init__(cr, uid, name, context=context)
        self.localcontext.update({
            'time': time,
            'get_data':self._get_data,
        })
    
    def _get_data(self, product_id, station_ids, start_date, end_date):
        mrp_obj = self.pool.get('mrp.production')
        start_date = datetime.strptime(start_date, "%Y-%m-%d").strftime("%Y-%m-%d %H:%M:%S")
        end_date = datetime.strptime(end_date, "%Y-%m-%d").strftime("%Y-%m-%d 23:59:59")
        mrp_ids = mrp_obj.search(self.cr, self.uid, [('date_planned','>=',start_date),('date_planned','<=',end_date),
                                                     ('product_id','=',product_id)])
        data_lst =[]
        
        for mrp in mrp_obj.browse(self.cr, self.uid, mrp_ids):
            for station in mrp.workcenter_lines:
                if station.workcenter_id.auxiliary_material_line_ids:
                    data_lst.append({'date':mrp.date_planned, 'product': '[' +mrp.product_id.default_code+'] '+ mrp.product_id.name,
                                     'station': station.name, 
                                     'material_obj_lst': station.workcenter_id.auxiliary_material_line_ids
                                     })
                        
        return data_lst
        
        
        
report_sxw.report_sxw('report.auxiliary_materials_product_report','auxiliary.materials.product.report.wiz','production_report/report/auxiliary_materials_product_report.mako',parser=auxiliary_materials_product_report, header=False)


