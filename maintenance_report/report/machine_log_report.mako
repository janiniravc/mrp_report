<html>
<head>
    <style type="text/css">
       table {
            border-collapse: collapse;
        }
        
        table, th {
            border:2px solid #e6e6e6;
        }
        table, td{
            border:1px solid #e6e6e6;
        }
        ${css}
    </style>
    <title>Machine Log Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b>‫‫ ‪<u>Machine Log</u></b></h2>
		<br/>
		<% machine = get_machine_obj(data['form']['machine_id'][0]) %>
		<table width="100%" cellpadding="4">
			<tr height="30px">
				<td width="20%" align="left" id="tableheading"><b>${_("Machine : ")}</b></td>
				<td width="30%" align="left" id="tableheading">${machine.name or ''}</td>
				<td align="left" width="20%" id="tableheading"><b>${_("Machine No: ")}</b></td>
				<td width="30%" align="left" id="tableheading">${machine.asset_number or machine.machine_code or ''}</td>
			</tr>
			<tr height="30px">
				<td width="20%" align="left" id="tableheading"><b>${_("Origin")}</b></td>
				<td width="30%" align="left" id="tableheading">${machine.card_po_id and machine.card_po_id.name or ''}</td>
				<td width="20%" align="left" id="tableheading"><b>${_("Machine Brand")}</b></td>
				<td width="30%" align="left" id="tableheading">${ ' - '}</td>
			</tr>
			<tr height="30px">
				<td width="20%" align="left" id="tableheading"><b>${_("Startup Date")}</b></td>
				<td width="30%" align="left" id="tableheading">${formatLang(machine.start_date or '',date=True)}</td>
				<td width="20%" align="left" id="tableheading"><b>${_("Model of Machine")}</b></td>
				<td width="30%" align="left" id="tableheading">${machine.model or ''}</td>
			</tr>
			<tr height="30px">
				<td width="20%" align="left" id="tableheading"><b>${_("supplier Name")}</b></td>
				<td width="30%" align="left" id="tableheading">${machine.vendor_id and machine.vendor_id.name or ''}</td>
				<td width="20%" align="left" id="tableheading"><b>${_("Manufacturer Name")}</b></td>
				<td width="30%" align="left" id="tableheading">${machine.manufacturer_id and machine.manufacturer_id.name or ''}</td>
			</tr>
			<tr height="30px">
				<td width="20%" align="left" id="tableheading"><b>${_("place of machine")}</b></td>
				<td width="30%" align="left" id="tableheading">${machine.property_stock_asset and machine.property_stock_asset.name or ''}</td>
				<td width="20%" align="left" id="tableheading"><b>${_("The year of manufacture")}</b></td>
				<td width="30%" align="left" id="tableheading">${" - "}</td>
			</tr>
			<tr height="30px">
				<td colspan="2" align="left" id="tableheading"><b>${_("The status of Machine/Equipment after last maintenance")}</b></td>
				<td colspan="2" align="left" id="tableheading">${get_last_maintenance_status(machine.id)}</td>
			</tr>
		</table>
		<table width="100%" cellpadding="4">
			<tr height="30px">
				<td width="10%" align="left" id="tableheading"><b>${_("Date")}</b></td>
				<td width="15%" align="left" id="tableheading"><b>${_('Malfunction Description')}</b></td>
				<td width="15%" align="left" id="tableheading"><b>${_("Malfunction classification influential irrelevan")}</b></td>
				<td width="15%" align="left" id="tableheading"><b>${_("status of machine / Equipment")}</b></td>
				<td width="15%" align="left" id="tableheading"><b>${_("Spare parts replaced describing")}</b></td>
				<td width="15%" align="left" id="tableheading"><b>${_("Stop time Maintenance")}</b></td>
				<td width="15%" align="left" id="tableheading"><b>${_("name of the repairer")}</b></td>
			</tr>
			%for log in machine.planned_maintenance_ids:
				%if log.state == 'done':
					<tr height="30px">
						<td width="10%" align="left" id="tableheading"> ${formatLang(log.done_date and log.done_date[:10] or '',date=True)}</td>
						<td width="15%" align="left" id="tableheading">${log.description or ''}</td>
						<td width="15%" align="left" id="tableheading">${(log.failure_class == 'affective' and 'affective') or (log.failure_class == 'not_affective' and 'Not affective') or ''}</td>
						<td width="15%" align="left" id="tableheading">${(log.asset_status and log.asset_status.title()) or ''}</td>
						<td width="15%" align="left" id="tableheading">${get_parts_names(log.parts_names)}</td>
						<td width="15%" align="left" id="tableheading">${log.done_date and log.done_date[10:] or ''}</td>
						<td width="15%" align="left" id="tableheading">${log.eng_name_id and log.eng_name_id.name or ''}</td>
					</tr>
				%endif
			%endfor
		</table>

	</body>
</html>
