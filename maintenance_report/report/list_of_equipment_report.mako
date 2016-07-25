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
    <title>The list of equipment</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b>‫‫ ‪This list of equipment</b></h2>
		<br/>
		<br/>
		<table width="100%" cellpadding="4">
			<tr>
				<td align="right" colspan="8" id="tableheading"><b>${_("Factory :")}</b></td>
				<td align="left" colspan="6" id="tableheading">${data['form'].get('factory_id',False) and data['form'].get('factory_id',False)[1] or ' - '}</td>
			</tr>
			<tr>
				<td align="center" colspan="2" rowspan="3" id="tableheading"><b>${_("General Line (G.L.)")}</b></td>
				<td align="center" colspan="3" id="tableheading"><b>${_("Master Equipment list")}</b></td>
				<td align="center" colspan="4" id="tableheading"><b>${_("Section Maintenance")}</b></td>
				<td align="center" colspan="4" id="tableheading"><b>${_("M/D")}</b></td>
				<td align="center" rowspan="3" id="tableheading"><b>${_("Status")}</b></td>
			</tr>
			<tr>
                <td align="center" colspan="3" id="tableheading"><b></b></td>
                <td align="center" colspan="4" id="tableheading"><b>${_("Group")}</b></td>
                <td align="center" colspan="4" id="tableheading"><b>${_("L/G")}</b></td>
            </tr>
            <tr>
                <td align="center" id="tableheading"><b></b></td>
                <td align="center" colspan="2" id="tableheading"><b></b></td>
                <td align="center" colspan="4" id="tableheading"><b>${_("Catalogs")}</b></td>
                <td align="center" colspan="3" id="tableheading"><b>${_("Graphics / Circles")}</b></td>
                <td align="center" id="tableheading"><b>${_("Main. task / Machine Category")}</b></td>

            </tr>
            <tr>
                <td align="center" id="tableheading"><b>${_("Sr No.")}</b></td>
                <td align="center" id="tableheading"><b>${_("Equipment Name")}</b></td>
                <td align="center" id="tableheading"><b>${_("Equipment code")}</b></td>
                <td align="center" id="tableheading"><b>${_("MFG")}</b></td>
                <td align="center" id="tableheading"><b>${_("MODEL")}</b></td>
                <td align="center" id="tableheading"><b>${_("Installation")}</b></td>
                <td align="center" id="tableheading"><b>${_("Operating")}</b></td>
                <td align="center" id="tableheading"><b>${_("For Maintenance")}</b></td>
                <td align="center" id="tableheading"><b>${_("Spare Parts")}</b></td>
                <td align="center" id="tableheading"><b>${_("Electricity")}</b></td>
                <td align="center" id="tableheading"><b>${_("Hydraulics")}</b></td>
                <td align="center" id="tableheading"><b>${_("Air")}</b></td>
                <td align="center" id="tableheading"><b></b></td>
                <td align="center" id="tableheading"><b></b></td>
            </tr>
            <% cnt = 0 %>
            %for asset in get_asset_obj(data['form']['asset_ids']):
            	<% cnt = cnt + 1 %>
	            <tr>
	                <td align="right" id="tableheading">${cnt}</td>
	                <td align="left" id="tableheading">${asset.name}</td>
	                <td align="left" id="tableheading">${asset.serial or ''}</td>
	                <td align="left" id="tableheading">${asset.manufacturer_id and asset.manufacturer_id.name or ''}</td>
	                <td align="left" id="tableheading">${asset.model or ''}</td>
	                <td align="left" id="tableheading">${formatLang(asset.card_date_installed or '',date=True)}</td>
	                <td align="left" id="tableheading">${formatLang(asset.start_date or '',date=True)}</td>
	                <td align="center" id="tableheading">${_(" - ")}</td>
	                <td align="center" id="tableheading">${_(" - ")}</td>
	                <td align="right" id="tableheading">${asset.card_horse_power or 0}</td>
	                <td align="right" id="tableheading">${asset.card_control_volt or 0}</td>
	                <td align="right" id="tableheading">${asset.card_pressure or 0.00}</td>
	                <td align="left" id="tableheading">${asset.category_id and asset.category_id.tools_category or ''}</td>
	                <td align="left" id="tableheading">${asset.maintenance_state_id and asset.maintenance_state_id.name or ''}</td>
	            </tr>
	        %endfor
            
        </table>

	</body>
</html>
