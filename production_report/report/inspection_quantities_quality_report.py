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


class inspection_quantities_quality_report(report_sxw.rml_parse):

    def __init__(self, cr, uid, name, context):
        super(inspection_quantities_quality_report, self).__init__(cr, uid, name, context=context)
        self.localcontext.update({
            'time': time,
            'get_products': self._get_products,
            'get_rejected_material': self._get_rejected_material,
        })

    def _get_rejected_material(self, product):
        rejected_lst = []
        cr = self.cr
        uid = self.uid
        sc_mrp_requirement_obj = pooler.get_pool(self.cr.dbname).get('sc.mrp.material.product')
        mrp_requirement_ids = sc_mrp_requirement_obj.search(cr, uid, [('material_list_id.product_name','=', product.name)])
        for mrp_requirement_brw in sc_mrp_requirement_obj.browse(cr, uid, mrp_requirement_ids):
            vals = {
                'part_no': mrp_requirement_brw.part_no or '',
                'part_ar_name': mrp_requirement_brw.part_name_ar or '',
                'part_name': str(' [' + mrp_requirement_brw.material_id.product_id.default_code + '] ' + mrp_requirement_brw.material_id.name),
                'qty': mrp_requirement_brw.product_qty,
                'lot_no': '?',
                'reason': '',
            }
            rejected_lst.append(vals)
        return rejected_lst

    def _get_products(self, form):
        cr = self.cr
        uid = self.uid
        context = {}
        product_product_obj = pooler.get_pool(self.cr.dbname).get('product.product')
        production_lst = []
        production_ids = product_product_obj.search(cr, uid, [('id','in', form.get('product_ids',[]))])
        
        for production_brw in product_product_obj.browse(cr, uid, production_ids):
            production_lst.append(production_brw)
        return production_lst
    
report_sxw.report_sxw('report.inspection_quantities_quality_report','inspection.quantities.quality.report.wiz','production_report/report/inspection_quantities_quality_report.mako',parser=inspection_quantities_quality_report, header=False)


