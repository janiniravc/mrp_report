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
    <title>Inspection KD Materials Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>Status Report of Inspection of KD Materials</u></b></h2>
		
		%for mrp in get_details(data['form']['mrp_ids']):
			<br/>
			<br/>
			<table width="100%" cellspacing="0" cellpadding="4">
				<tr height="30px">
					<td width="20%" align="right" id="tableheading"><b>${_("Date : ")}</b></td>
					<td width="30%" align="left" id="tableheading">${formatLang(mrp.date_planned[:10],date=True)}</td>
					<td width="20%" align="right" id="tableheading"><b>${_("message number (invoice): ")}</b></td>
					<td width="30%" align="left" id="tableheading"><b>${_("-")}</b></td>
				</tr>
				<tr>
					<td align="right" id="tableheading"><b>${_("Product Name:")}</b></td>
					<td align="left" id="tableheading">${'['+mrp.product_id.code+'] '+mrp.product_id.name}</td>
					<td align="right" id="tableheading"><b>${_("Warehouse: ")}</b></td>
					<td align="left" id="tableheading">${mrp.location_dest_id.name}</td>
				</tr>
			</table>
			<br/>
			<table width="100%" cellspacing="0" cellpadding="4">
				<tr height="30px">
					<td width="15%" align="left" id="tableheading"><b>${_("S/N")}</b></td>
					<td width="30%" align="left" id="tableheading"><b>${_("LOT No")}</b></td>
					<td width="20%" align="left" id="tableheading"><b>${_("Checking quantities")}</b></td>
					<td width="20%" align="left" id="tableheading"><b>${_("Quality checks")}</b></td>
					<td width="15%" align="left" id="tableheading"><b>${_("Receipt")}</b></td>
				</tr>
				<% cnt = 0 %>
				%for move in mrp.move_created_ids2:
					<% cnt = cnt+1 %>
	                <tr height="20px">
	                    <td align="right" id="tableheading">${cnt}</td>
	                    <td align="left" id="tableheading">${move.prodlot_id and move.prodlot_id.name}</td>
	                    <td align="left" id="tableheading">${move.product_qty+' '+move.product_uom}</td>
	                    <td align="left" id="tableheading">${'?'}</td>
	                    <td align="left" id="tableheading">${move.name}</td>
	                </tr>
	            %endfor
			<table>
			<p style="page-break-before:always"></p>
        %endfor
            
	</body>
</html>
