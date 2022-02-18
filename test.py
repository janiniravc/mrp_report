# -*- coding: utf-8 -*-

from odoo import api, fields, models, tools, _
from odoo.modules.module import get_resource_path
import base64


class ResCompany(models.Model):
    _inherit = "res.company"

    refund_html_content = fields.Html(string='Refund Policy123')
    privacy_html_content = fields.Html(string='Privacy Policy')
    terms_html_content = fields.Html(string='Terms of Service')
    shipping_html_content = fields.Html(string='Shipping Policy')
    privacy_contact_phone = fields.Char(string='Privacy Contact Phone')
    privacy_contact_email = fields.Char(string='Privacy Contact Email')
    business_type = fields.Selection([
        ('public_limited_company', 'Public Limited Company'),
        ('sole_trader', 'Sole Trader'),
        ('partnership', 'Partnership'),
        ('private_limited_company', 'Private Limited Company'), ], string='Business Type')
    geographies_type = fields.Selection([
        ('europe', 'Europe (GDPR)'),
        ('uk', 'UK'),
        ('usa', 'USA'),
        ('usa_califonia', 'USA California (CCPA)'),
        ('other', 'Other'), ], string='Geographies Type')
    business_address = fields.Boolean('Is a Business Address')
    add_address = fields.Selection([('yes', 'Yes'), ('no', 'No')])
    address_type = fields.Many2one('res.partner', string='Legal Address')
    law_country_id = fields.Many2one('res.country')
    step1 = fields.Boolean('Step1')
    step2 = fields.Boolean('Step2')
    step3 = fields.Boolean('Step3')

    def write(self, vals):
        print("\n::write:::", vals)
        return super(ResCompany, self).write(vals)
