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
        .noborder td
        {
            border:none;
        }
        ${css}
    </style>
    <title>ECN Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>ECN Report</u></b></h2>
		<br/>
		<br/>
		%for bom_change in get_line(data['form']):
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
				<td width="5%" align="right" id="tableheading"><b>${_("Date:")}</b></td>
				<td width="15%" align="left" id="tableheading"><b>${formatLang(bom_change.date, date=True)}</b></td>
				<td width="20%" align="left" id="tableheading"><b>${_("Message number/Lot:")}</b></td>
				<td width="20%" align="left" id="tableheading"><b>${bom_change.name}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Product name:")}</b></td>
				<td width="30%" align="left" id="tableheading"><b>${bom_change.product_id.name}</b></td>
			</tr>
		</table>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
				<td align="right" id="tableheading"></td>
				<td colspan="3" align="center" id="tableheading"><b>${_("Before the Amendment")}</b></td>
				<td colspan="3" align="center" id="tableheading"><b>${_("After the Amendment")}</b></td>
				<td align="center" id="tableheading"><b>${_(" ")}</b></td>
			</tr>
			<tr height="30px">
				<td width="4%" align="right" id="tableheading"><b>${_("S/N")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("Part No.")}</b></td>
				<td width="22%" align="left" id="tableheading"><b>${_("Part Name(Arabic, English)")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("Quantity/Unit")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("Part No.")}</b></td>
				<td width="22%" align="left" id="tableheading"><b>${_("Part Name(Arabic, English)")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("Quantity/Unit")}</b></td>
				<td width="20%" align="left" id="tableheading"><b>${_("The Reason for the Amendment")}</b></td>
			</tr>
			<% cnt = 0 %>
			%for line in bom_change.bom_change_line_ids:
				<% cnt += 1 %>
                <tr height="20px">
                    <td align="right" id="tableheading">${cnt}</td>
                    <td align="left" id="tableheading">${line.part_no}</td>
                    <td align="left" id="tableheading">${line.part_name_ar} ${line.bom_id.name}</td>
                    <td align="left" id="tableheading">${line.product_qty}</td>
                    <td align="left" id="tableheading">${line.new_part_no}</td>
                    <td align="left" id="tableheading">${line.new_part_name_ar} ${line.new_part_name_en}</td>
                    <td align="left" id="tableheading">${line.new_product_qty}</td>
                    <td align="left" id="tableheading"><b>${_("?")}</b></td>
                </tr>
            %endfor
		<table>
		<br>
		%endfor
        
        <h4 align="right">${_("* With the possibility of comparing the amendments between different LOTs per product")}</h4>
	</body>
</html>
