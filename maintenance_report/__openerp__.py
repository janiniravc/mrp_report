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
    'name': 'Maintenance Reports',
    'version': '1.0',
    'summary': 'Maintenance Reports',
    'description': """
To Generate Maintenance report in OpenERP
=====================================


    """,
    'author': 'ShadowErp',
    'website': 'http://codup.com',
    'category': 'Hiddan',
    'sequence': 0,
    'images': [],
    'depends': ['base','sc_mrp_routing'],
    'demo': [],
    'data': ['menu.xml',
             'webkit_default_header.xml',
             'report/report.xml',
             'wizard/factory_periodical_maintenance_report_wiz_view.xml',
             'wizard/maintenance_daily_weekly_report_wiz_view.xml',
             'wizard/preventive_maintenance_monthly_plan_report_wiz_view.xml',
             'wizard/list_of_equipment_report_wiz_view.xml',
             'wizard/list_of_engineer_service_report_wiz_view.xml',
             'wizard/maintenance_material_list_report_wiz.xml',
             'wizard/monthly_maintenance_report_wiz.xml',
             'wizard/weekly_treatment_maintenance_report_wiz.xml',
             'wizard/maintenance_requests_states_report_wiz.xml',
             'wizard/equipment_card_report_wiz.xml',
             'wizard/machine_log_report_wiz.xml',
             'wizard/work_of_contractor_report_wiz.xml',
             'wizard/proportion_maintenance_report_wiz_view.xml',
        
    ],
    'application': True,
}
# vim:expandtab:smartindent:tabstop=4:softtabstop=4:shiftwidth=4: