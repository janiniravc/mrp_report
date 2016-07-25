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
            'get_values':self._get_values,
            
        })
    
    def _get_factory(self):
        
        factory_obj = self.pool.get("sc.mrp.factory")
        fectory_ids = factory_obj.search(self.cr, self.uid, [])
        fectory_brw_ids = factory_obj.browse(self.cr, self.uid, fectory_ids)
        return fectory_brw_ids
    
    def _get_values(self, factory_brw, start_date, end_date):
        mrp_obj = self.pool.get('mrp.production')
        start_date = datetime.strptime(start_date, "%Y-%m-%d").strftime("%Y-%m-%d %H:%M:%S")
        end_date = datetime.strptime(end_date, "%Y-%m-%d").strftime("%Y-%m-%d 23:59:59")
        mrp_ids = mrp_obj.search(self.cr, self.uid, [('date_planned','>=',start_date),('date_planned','<=',end_date),
                                                     ('routing_id.factory_id','=',factory_brw.id)])
        data_dict = {}
        for mrp in mrp_obj.browse(self.cr, self.uid, mrp_ids):
            if not data_dict.get(mrp.product_id.id, False):
                data_dict.update(
                  {mrp.product_id.id:
                         {'code':mrp.product_id.default_code or False,'planned':0.0 , 'done':0.0, 'warehouse':0.0, 
                          'production':0.0, 'quality':'?', 'audits':'?','pdi':'?','conformity':'?', 'total':0.0
                        }
                   })
            
            data_dict[mrp.product_id.id].update({'planned': data_dict[mrp.product_id.id]['planned'] + mrp.product_qty })
            if mrp.state == 'done':
                data_dict[mrp.product_id.id].update({'done': data_dict[mrp.product_id.id]['done'] + mrp.product_qty })
            if mrp.state in ('confirmed','ready'):
                data_dict[mrp.product_id.id].update({'warehouse': data_dict[mrp.product_id.id]['warehouse'] + mrp.product_qty })
                data_dict[mrp.product_id.id].update({'total': data_dict[mrp.product_id.id]['total'] + mrp.product_qty })
            if mrp.state == 'in_production':
                data_dict[mrp.product_id.id].update({'production': data_dict[mrp.product_id.id]['production'] + mrp.product_qty })
                data_dict[mrp.product_id.id].update({'total': data_dict[mrp.product_id.id]['total'] + mrp.product_qty })
                
        return data_dict   
                
report_sxw.report_sxw('report.weekly_production_report','weekly.production.report.wiz','production_report/report/weekly_production_report.mako',parser=weekly_production_report, header=False)


