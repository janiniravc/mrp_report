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
        table.noBorder {border: none;}
        ${css}
    </style>
    <title>The Report of the operations of the product</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>The Report of the operations of the product</u></b></h2>
		<br/>
		<br/>
		%for product_data in get_products(data['form']):
		<table width="100%" cellspacing="0" cellpadding="4" class="noBorder">
			<tr height="30px" class="noborder">
				<td width="15%" align="right" id="tableheading"><b>${_("Product Name")}</b></td>
				<td align="left" id="tableheading">${product_data['product_name']}</td>
			</tr>
			<tr height="30px" class="noborder">
                <td align="right" id="tableheading"><b>${_("Station / The line")}</b></td>
                <td align="left" id="tableheading">${product_data['workcenter_name']}</td>
            </tr>
		</table>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
			    <td width="4%" align="right" id="tableheading"><b>${_("S/N")}</b></td>
				<td width="22%" align="left" id="tableheading"><b>${_("standard Time")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("Operation code")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("Operation Name")}</b></td>
			</tr>
			<% cnt = 0 %>
			%for operation_data in get_operation_details(product_data['product_id'],product_data['workcenter_id']):
				<% cnt += 1 %>
                <tr height="20px">
                    <td align="right" id="tableheading">${cnt}</td>
                    <td align="left" id="tableheading">${formatLang(operation_data['task_time'],digits=2)}</td>
                    <td align="left" id="tableheading">${operation_data['operation_code']}</td>
                    <td align="left" id="tableheading">${operation_data['operation_name']}</td>
                </tr>
            %endfor
		<table>
		<br/>
		%endfor
	</body>
</html>
