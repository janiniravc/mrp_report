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
    <title>Equipment Card</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b>‫‫ ‪Equipment Card</b></h2>
		<br/>
		<br/>
		<% asset = get_asset_obj(data['form']['equipment_id'][0]) %>
		<table width="100%" cellpadding="4">
			<tr height="30px">
				<td colspan="2" width="26%" align="left" id="tableheading"><b>${_("EQUIPMENT CARD : ")}</b></td>
				<td colspan="4" width="47%" align="left" id="tableheading">${asset.card_type or ''} ${" "} ${asset.name or ''}</td>
				<td align="left" width="9%" id="tableheading"><b>${_("Model No: ")}</b></td>
				<td colspan="2" width="18%" align="left" id="tableheading">${asset.model or ''}</td>
			</tr>
			<tr height="30px">
				<td width="13%" align="left" id="tableheading"><b>${_("EQUIP. NAME:")}</b></td>
				<td width="13%" align="left" id="tableheading">${asset.name or ''}</td>
				<td width="14%" align="left" id="tableheading"><b>${_("EQUP. CODE")}</b></td>
				<td colspan="2" align="left" id="tableheading">${asset.serial or ''}</td>
				<td colspan="4" align="left" id="tableheading"><b>${_("DEPARTMENT: Maintenance")}</b></td>
			</tr>
			<tr height="30px">
				<td width="13%" align="left" id="tableheading"><b>${_("Type ")}</b></td>
				<td width="13%" align="left" id="tableheading">${asset.card_type or ''}</td>
				<td width="14%" align="left" id="tableheading"><b>${_("Date Installed")}</b></td>
				<td width="10%" align="left" id="tableheading">${formatLang(asset.card_date_installed or '',date=True)}</td>
				<td width="13%" align="left" id="tableheading"><b>${_("HP/KW ")}</b></td>
				<td colspan="4" align="left" id="tableheading">${asset.card_horse_power or 0}</td>
			</tr>
			<tr height="30px">
				<td width="13%" align="left" id="tableheading"><b>${_("Model")}</b></td>
				<td width="13%" align="left" id="tableheading">${asset.model or ''}</td>
				<td width="14%" align="left" id="tableheading"><b>${_("Equipment weight")}</b></td>
				<td width="10%" align="left" id="tableheading">${asset.card_weight or 0.00}</td>
				<td width="13%" align="left" id="tableheading"><b>${_("Control Volt.")}</b></td>
				<td colspan="4" align="left" id="tableheading">${asset.card_control_volt or 0}</td>
			</tr>
			<tr height="30px">
				<td width="13%" align="left" id="tableheading"><b>${_("Maker")}</b></td>
				<td width="13%" align="left" id="tableheading">${asset.manufacturer_id and asset.manufacturer_id.name or ''}</td>
				<td width="14%" align="left" id="tableheading"><b>${_("Cylinder rotation speed")}</b></td>
				<td width="10%" align="left" id="tableheading">${asset.card_cylinder_rotation or 0.00}</td>
				<td width="13%" align="left" id="tableheading"><b>${_("Total amperes")}</b></td>
				<td colspan="4" align="left" id="tableheading">${asset.card_total_amperes or 0.00}</td>
			</tr>
			<tr height="30px">
				<td width="13%" align="left" id="tableheading"><b>${_("Supplier")}</b></td>
				<td width="13%" align="left" id="tableheading">${asset.vendor_id and asset.vendor_id.name or ''}</td>
				<td width="14%" align="left" id="tableheading"><b>${_("Axle base between Front and Rear cylinder")}</b></td>
				<td width="10%" align="left" id="tableheading">${asset.card_axle_base or 0.00}</td>
				<td width="13%" align="left" id="tableheading"><b>${_("Fuses")}</b></td>
				<td colspan="4" align="left" id="tableheading">${get_fuses(asset.card_fuses_ids)}</td>
			</tr>
			<tr height="30px">
				<td width="13%" align="left" id="tableheading"><b>${_("MFG. Order No.")}</b></td>
				<td width="13%" align="left" id="tableheading">${asset.card_mfg or 0}</td>
				<td width="14%" align="left" id="tableheading"><b>${_("Cylinder Diameter")}</b></td>
				<td width="10%" align="left" id="tableheading">${asset.card_cylinder_diameter or 0.00}</td>
				<td width="13%" align="left" id="tableheading">${_(" ")}</td>
				<td width="10%" align="left" id="tableheading"><b>${_("REG.")}</b></td>
				<td width="9%" align="left" id="tableheading"><b>${_("PRESSURE")}</b></td>
				<td width="9%" align="left" id="tableheading"><b>${_("RATE")}</b></td>
				<td width="9%" align="left" id="tableheading"><b>${_("TEMP.C°")}</b></td>
			</tr>
			<tr height="30px">
				<td width="13%" align="left" id="tableheading"><b>${_("Purch. Order No.")}</b></td>
				<td width="13%" align="left" id="tableheading">${asset.card_po_id and asset.card_po_id.name or ''}</td>
				<td width="14%" align="left" id="tableheading"><b>${_("Others")}</b></td>
				<td width="10%" align="left" id="tableheading">${_(" ")}</td>
				<td width="13%" align="left" id="tableheading">${_(" ")}</td>
				<td width="10%" align="left" id="tableheading"><b>${_("WATER")}</b></td>
				<td width="9%" align="left" id="tableheading">${str(asset.card_pressure or 0.00) + "  bar.(e)"}</td>
				<td width="9%" align="left" id="tableheading">${_(" ")}</td>
				<td width="9%" align="left" id="tableheading">${asset.card_temp and asset.card_temp or 0.00  }</td>
			</tr>
			<tr height="30px">
				<td width="13%" align="left" id="tableheading"><b>${_("SR. No.")}</b></td>
				<td width="13%" align="left" id="tableheading">${asset.asset_number or ''}</td>
				<td width="14%" align="left" id="tableheading"><b>${_("Max. Shaft Bearing Load")}</b></td>
				<td width="10%" align="left" id="tableheading">${asset.card_max_shaft or 0.00}</td>
				<td width="13%" align="left" id="tableheading">${_(" ")}</td>
				<td width="10%" align="left" id="tableheading"><b>${_("Cooling")}</b></td>
				<td width="9%" align="left" id="tableheading">${_(" ")}</td>
				<td width="9%" align="left" id="tableheading">${_(" ")}</td>
				<td width="9%" align="left" id="tableheading">${_(" ")}</td>
			</tr>
			<tr height="30px">
				<td width="13%" align="left" id="tableheading"><b>${_("DRG. No.")}</b></td>
				<td width="13%" align="left" id="tableheading">${asset.card_drg_no or ''}</td>
				<td width="14%" align="left" id="tableheading"><b>${_("Breaking force range")}</b></td>
				<td width="10%" align="left" id="tableheading">${asset.card_breaking_force or 0.00}</td>
				<td width="13%" align="left" id="tableheading">${_(" ")}</td>
				<td width="10%" align="left" id="tableheading"><b>${_("Steam")}</b></td>
				<td width="9%" align="left" id="tableheading">${_(" ")}</td>
				<td width="9%" align="left" id="tableheading">${_(" ")}</td>
				<td width="9%" align="left" id="tableheading">${_(" ")}</td>
			</tr>
			<tr height="30px">
				<td width="13%" align="left" id="tableheading"><b>${_("Displayed value error")}</b></td>
				<td width="13%" align="left" id="tableheading">${asset.card_value_error or ''}</td>
				<td width="14%" align="left" id="tableheading">${_(" ")} </td>
				<td width="10%" align="left" id="tableheading">${_(" ")}</td>
				<td width="13%" align="left" id="tableheading">${_(" ")}</td>
				<td width="10%" align="left" id="tableheading">${_(" ")}</td>
				<td width="9%" align="left" id="tableheading">${_(" ")}</td>
				<td width="9%" align="left" id="tableheading">${_(" ")}</td>
				<td width="9%" align="left" id="tableheading">${_(" ")}</td>
			</tr>
		</table>
		
		<table width="100%" cellpadding="4">
			<tr height="30px">
				<td colspan="11" align="left" id="tableheading"><b>${_("Electric Motors: "+ str(len(asset.electric_motors_ids))+"  motors")}</b></td>
			</tr>
			<tr height="30px">
				<td width="2%" align="left" id="tableheading"><b>${_("No.")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Description")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Phase: Q")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Amps.")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("RPM.")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Frequency")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("COSQ")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("KW/HP")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Voltage V")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Isolation Class")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Fuses Amp.")}</b></td>
			</tr>
			% for motor in asset.electric_motors_ids:
				<tr height="30px">
					<td width="2%" align="right" id="tableheading">${motor.number or 0}</td>
					<td width="10%" align="left" id="tableheading">${motor.name or ''}</td>
					<td width="10%" align="left" id="tableheading">${motor.phase or 0}</td>
					<td width="10%" align="left" id="tableheading">${motor.amp or 0 }</td>
					<td width="10%" align="left" id="tableheading">${motor.rpm or 0 }</td>
					<td width="10%" align="left" id="tableheading">${motor.frequency or 0}</td>
					<td width="8%" align="left" id="tableheading">${motor.cosq or 0.00}</td>
					<td width="10%" align="left" id="tableheading">${motor.hp or 0.00}</td>
					<td width="10%" align="left" id="tableheading">${motor.voltage or 0 }</td>
					<td width="10%" align="left" id="tableheading">${" - "}</td>
					<td width="10%" align="left" id="tableheading">${" - "}</td>
				</tr>
			%endfor
		</table>

	</body>
</html>
