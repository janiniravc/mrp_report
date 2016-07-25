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
    <title>Auxiliary Materials in Warehouse Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>Report of Auxiliary Materials in Warehouse until</u></b></h2>
		<br/>
		<br/>
		%for auxiliary in get_details(data['form']['product_ids']):
			<table width="100%" cellspacing="0" cellpadding="4">
				<tr height="30px">
					<td width="10" align="left" id="tableheading"><b>${_("Product")}</b></td>
					<td width="90%" align="left" id="tableheading"><b>${'['+auxiliary.product_id.default_code+'] '+auxiliary.product_id.name}</b></td>
				</tr>
			</table>
			<br/>
			<table width="100%" cellspacing="0" cellpadding="4">
				<tr height="30px">
					<td width="5%" align="left" id="tableheading"><b>${_("S/N")}</b></td>
					<td width="25%" align="left" id="tableheading"><b>${_("Material Name")}</b></td>
					<td width="10%" align="left" id="tableheading"><b>${_("Unit")}</b></td>
					<td width="15%" align="left" id="tableheading"><b>${_("Currently In Warehouse")}</b></td>
					<td width="10%" align="left" id="tableheading"><b>${_("Unit would be Enough for")}</b></td>
					<td width="10%" align="left" id="tableheading"><b>${_("Consumption per product")}</b></td>
					<td width="10%" align="left" id="tableheading"><b>${_("Number of Cars Covered by Stock")}</b></td>
					<td width="15%" align="left" id="tableheading"><b>${_("status of Material")}</b></td>
				</tr>
				<% cnt = 0 %>
				%for material in auxiliary.auxiliary_material_line_ids:
					<% cnt = cnt+1 %>
	                <tr height="20px">
	                    <td align="right" id="tableheading">${cnt}</td>
	                    <td align="left" id="tableheading">${'['+material.product_id.default_code+ '] '+material.product_id.name}</td>
	                    <td align="left" id="tableheading">${material.product_uom.name}</td>
	                    <td align="left" id="tableheading">${material.product_id.property_stock_inventory and material.product_id.property_stock_inventory.name or ''}</td>
	                    <td align="left" id="tableheading">${'?'}</td>
	                    <td align="right" id="tableheading">${formatLang(material.product_qty)}</td>
	                    <td align="right" id="tableheading">${formatLang(material.product_id.qty_available != 0 and (float(material.product_id.qty_available) / float(material.product_qty)) or 0.00)}</td>
	                    <td align="left" id="tableheading">${material.product_id.state2.capitalize()}</td>
	                </tr>
	            %endfor
			<table>
			<p style="page-break-before:always"></p>
		%endfor
            
	</body>
</html>
