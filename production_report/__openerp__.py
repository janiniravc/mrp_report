# -*- coding: utf-8 -*-
##############################################################################
#
#    OpenERP, Open Source Management Solution
#    Copyright (C) 2013 CodUP (<http://codup.com>).
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your option) any later version.
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

{
    'name': 'Production Reports',
    'version': '1.0',
    'summary': 'Production Reports',
    'description': """
To Generate Production report in OpenERP
=====================================


    """,
    'author': 'ShadowErp',
    'website': 'http://www.shadowerp.co.in',
    'category': 'Hiddan',
    'sequence': 0,
    'images': [],
    'depends': ['base','sc_mrp_routing','sc_mrp_calendar'],
    'demo': [],
    'data': ['menu.xml',
             'webkit_default_header.xml',
             'report/report.xml',
             'wizard/products_common_performance_report_wiz_view.xml',
             'wizard/weekly_production_report_wiz.xml',
             'wizard/planning_production_capacity_report_wiz.xml',
             'wizard/bom_product_per_station_report_wiz.xml',
             'wizard/auxiliary_materials_product_report_wiz.xml',
             'wizard/ecn_report_wiz.xml',
             'wizard/rejected_materials_report_wiz.xml',
             'wizard/rejected_materials_compensation_report_wiz.xml',
             'wizard/status_produced_unit_report_wiz.xml',
             'wizard/produced_units_level_report_wiz.xml',
             'wizard/inspection_quantities_quality_report_wiz.xml',
             'wizard/inspection_kd_materials_report_wiz.xml',
             'wizard/auxiliary_materials_warehouse_report_wiz.xml',
             'wizard/number_of_produced_units_report_wiz.xml',
             'wizard/time_of_produced_units_report_wiz.xml',
             'wizard/the_operations_of_product_report_wiz.xml',
             'wizard/production_status_input_sales_report_wiz.xml',
             'wizard/details_implementation_workorder_report_wiz.xml',
             'wizard/implementation_orders_factory_work_report_wiz.xml',
             'wizard/unpacking_and_quality_report_wiz.xml',
             'wizard/production_efficiency_report_wiz.xml',
             'wizard/cost_of_business_audits_report_wiz.xml',
        
    ],
    'application': True,
}
# vim:expandtab:smartindent:tabstop=4:softtabstop=4:shiftwidth=4: