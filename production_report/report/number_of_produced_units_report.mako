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
    <title>The report of the number of produced units</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>The report of the number of produced units</u></b></h2>
		<br/>
		<br/>
		%for mrp in get_basic_detail(data['form']):
			<table width="100%" cellspacing="0" cellpadding="4" class="noBorder">
				<tr height="30px" class="noborder">
					<td width="20%" align="left" id="tableheading"><b>${_("Product Name :")}</b></td>
					<td width="30%" align="left" id="tableheading">${'['+mrp.product_id.code+'] '+mrp.product_id.name}</td>
					
					<td width="20%" align="left" id="tableheading"><b>${_("Job Order No :")}</b></td>
					<td width="30%" align="left" id="tableheading">${mrp.daily_job_order_id.daily_job_order_no}</td>
				</tr>
				<tr height="30px" class="noborder">
	                <td align="left" id="tableheading"><b>${_("Station/Line :")}</b></td>
	                <td align="left" id="tableheading">-</td>
	                
	                <td align="left" id="tableheading"><b>${_("Planned Production :")}</b></td>
	                <td align="left" id="tableheading">${formatLang(mrp.product_qty)+' '+ mrp.product_uom.name}</td>
	            </tr>
	            <tr height="30px" class="noborder">
	                <td align="left" id="tableheading"></td>
	                <td align="left" id="tableheading"></td>
	                
	                <td align="left" id="tableheading"><b>${_("No.of producing units:")}</b></td>
	                <td align="left" id="tableheading">${formatLang(float(len(mrp.daily_job_order_id.vin_list_ids))) + ' '+ mrp.product_uom.name}</td>
	            </tr>
			</table>
			<br/>
			<div align="center"><b>${_("The Details of the production")}</b></div>
			<table width="100%" cellspacing="0" cellpadding="4">
				<tr height="30px">
				    <td width="4%" align="right" id="tableheading"><b>${_("S/N")}</b></td>
					<td width="8%" align="left" id="tableheading"><b>${_("Vin / No")}</b></td>
					<td width="8%" align="left" id="tableheading"><b>${_("Engine No")}</b></td>
					<td width="22%" align="left" id="tableheading"><b>${_("Color")}</b></td>
					<td width="8%" align="left" id="tableheading"><b>${_("The status (Complete/incomplete)")}</b></td>
				</tr>
				
				<% cnt = 0 %>
				%for vin in mrp.daily_job_order_id.vin_list_ids:
					<% cnt = cnt+1 %>
	                <tr height="20px">
	                    <td align="right" id="tableheading">${cnt}</td>
	                    <td align="left" id="tableheading">${vin.vin_number}</td>
	                    <td align="left" id="tableheading">${'?'}</td>
	                    <td align="left" id="tableheading">${vin.color_id and vin.color_id.name or ''}</td>
	                    <td align="left" id="tableheading">${vin.finished_goods and 'Complete' or 'Incomplete'}</td>
	                </tr>
	            %endfor
			<table>
			<p style="page-break-before:always"></p>
		%endfor
	</body>
</html>
