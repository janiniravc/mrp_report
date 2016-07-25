<html>
<head>
    <style type="text/css">
       table {
            border-collapse: collapse;
        }
        
        table, th {
            border:1px solid #e6e6e6;
        }
        table, td{
            border:1px solid #e6e6e6;
        }
        ${css}
    </style>
    <title>Weekly Treatment Maintenance</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>Weekly Treatment Maintenance Report</u></b></h2>
		<br/>
		<table width="100%">
			
			<tr height="30px">
                <td align="center" id="tableheading"><b>${_("From Date :")}</b></td>
                <td>${formatLang(data['form']['start_date'], date=True)}</td>
                <td align="center" id="tableheading"><b>${_("To date :")}</b></td>
                <td>${formatLang(data['form']['end_date'], date=True)}</td>
            </tr>
            <tr height="30px">
                <td align="center" id="tableheading"><b>${_("Factory Name :")}</b></td>
                <td colspan="3">${data['form']['factory_id'] and data['form']['factory_id'][1] or ''}</td>
            </tr>
		</table>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr>
				<td width="7%" align="center" id="tableheading"><b>${_("Production line")}</b></td>
				<td width="7%" align="center" id="tableheading"><b>${_("Machine name")}</b></td>
				<td width="7%" align="center" id="tableheading"><b>${_("Damage date")}</b></td>
				<td width="7%" align="center" id="tableheading"><b>${_("Request date and time")}</b></td>
				<td width="10%" align="center" id="tableheading"><b>${_("Response date and time")}</b></td>
				<td width="10%" align="center" id="tableheading"><b>${_("Repair date end time")}</b></td>
				<td width="9%" align="center" id="tableheading"><b>${_("Stopping time")}</b></td>
				<td width="9%" align="center" id="tableheading"><b>${_("Repairer name")}</b></td>
				<td width="9%" align="center" id="tableheading"><b>${_("Cost of maintenance time")}</b></td>
				<td width="9%" align="center" id="tableheading"><b>${_("Cost of spare parts and depreciations")}</b></td>
				<td width="9%" align="center" id="tableheading"><b>${_("Total cost of maintenance")}</b></td>
				<td width="7%" align="center" id="tableheading"><b>${_("Notes")}</b></td>
			</tr>
			%for mro_data in get_line(data['form']):
                <tr height="30px">
                    <td align="center" id="tableheading">${mro_data['production_line']}</td>
                    <td align="center" id="tableheading">${mro_data['machine_name']}</td>
                    <td align="center" id="tableheading">${mro_data['demage_date'] and formatLang(mro_data['demage_date'], date=True)}</td>
                    <td align="center" id="tableheading">${mro_data['request_date_time'] and formatLang(mro_data['request_date_time'], date=True)}</td>
                    <td align="center" id="tableheading">${mro_data['response_date_time'] and formatLang(mro_data['response_date_time'], date=True)}</td>
                    <td align="center" id="tableheading">${mro_data['repair_date_time'] and formatLang(mro_data['repair_date_time'], date=True)}</td>
                    <td align="center" id="tableheading">${mro_data['stopping_time'] and formatLang(mro_data['stopping_time'], date=True)}</td>
                    <td align="center" id="tableheading">${mro_data['repairer_name']}</td>
                    <td align="center" id="tableheading">${mro_data['cost_of_maintenance_time'] and formatLang(mro_data['cost_of_maintenance_time'], date=True)}</td>
                    <td align="center" id="tableheading">${mro_data['cost_of_spare_parts_depreciations']}</td>
                    <td align="center" id="tableheading">${mro_data['total_cost_of_maintenance']}</td>
                    <td align="center" id="tableheading">${mro_data['notes']}</td>
                </tr>
            %endfor
			
			</table>
			
			<br/>
			<table width="100%">
			<tr height="40px">
				<td width="25%" align="center" id="tableheading"><b>${_("By maintenance supervisor:")}</b></td>
				<td width="25%" align="left" valign="bottom" id="tableheading"><b>${_("Signature")}: ..........................</b></td>
				<td width="25%" align="center" id="tableheading"><b>${_("Maintenance manager credence:")}</b></td>
				<td width="25%" align="left" valign="bottom" id="tableheading"><b>${_("Signature")}: ..........................</b></td>
			</tr>
			</table>
	</body>
</html>
