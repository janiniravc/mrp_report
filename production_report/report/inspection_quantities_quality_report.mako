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
    <title>Inspection of Quantities/quality Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>Report on Inspection of Quantities and Quality of Inputs</u></b></h2>
		<br/>
		<br/>
		%for product_data in get_products(data['form']):
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
				<td width="20%" align="right" id="tableheading"><b>${_("Date : ")}</b></td>
				<td width="30%" align="left" id="tableheading"><b>${_("?")}</b></td>
				<td width="20%" align="right" id="tableheading"><b>${_("LOT No : ")}</b></td>
				<td width="30%" align="left" id="tableheading"><b>${_("?")}</b></td>
			</tr>
			<tr>
				<td align="right" id="tableheading"><b>${_("Product Name:")}</b></td>
				<td align="left" id="tableheading"><b>
				    %if product_data.code:
				        ${'[' + product_data.code + ']'}
				    %endif
				    ${product_data.name}
				 </b></td>
				<td align="right" id="tableheading"><b>${_("Warehouse: ")}</b></td>
				<td align="left" id="tableheading"><b>${_("?")}</b></td>
			</tr>
		</table>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
				<td rowspan="2" width="5%" align="right" id="tableheading"><b>${_("S/N")}</b></td>
				<td colspan="4" align="center" id="tableheading"><b>${_("Rejected Materials")}</b></td>
				<td rowspan="2" width="25%" align="center" id="tableheading"><b>${_("Reason")}</b></td>
			</tr>
			<tr height="30px">
				<td width="15%" align="left" id="tableheading"><b>${_("Part No.")}</b></td>
				<td width="30%" align="left" id="tableheading"><b>${_("Part Name(Arabic, English)")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Quantity")}</b></td>
				<td width="15%" align="left" id="tableheading"><b>${_("LOT No")}</b></td>
			</tr>
			<% cnt = 0 %>
			%for rejected_material in get_rejected_material(product_data):
				<% cnt += 1 %>
                <tr height="20px">
                    <td align="right" id="tableheading">${cnt}</td>
                    <td align="left" id="tableheading">${rejected_material.get('part_no','')}</td>
                    <td align="left" id="tableheading"><div>${rejected_material.get('part_ar_name','')}</div>${rejected_material.get('part_name','')} </td>
                    <td align="left" id="tableheading">${rejected_material.get('qty',0)}</td>
                    <td align="left" id="tableheading">${rejected_material.get('lot_no','')}</td>
                    <td align="left" id="tableheading">${rejected_material.get('reason','')}</td>
                </tr>
            %endfor
		<table>
		<br/>
        %endfor
	</body>
</html>
