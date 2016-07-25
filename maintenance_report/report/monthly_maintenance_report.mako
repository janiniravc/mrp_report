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
            border:0.5px solid #e6e6e6;
        }
        ${css}
    </style>
    <title>Monthly Maintenance Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>Monthly Maintenance Report</u></b></h2>
		<br/>
		<table width="100%" cellpadding="2" cellspacing="1">
			<tr  height="30px">
				<th width="10%" align="center" id="tableheading"><b>${_("From:")}</b></th>
				<th width="15%" align="center" id="tableheading">${formatLang(data['form']['start_date'],date=True)}</th>
				<th width="20%" align="center" id="tableheading"><b>${_("Factory Name:")}</b></th>
				<th width="30%" align="center" id="tableheading">${data['form'].get('factory_id',False) and data['form'].get('factory_id')[1] or ' - '}</th>
			</tr>
			<tr  height="30px">
				<th width="10%" align="center" id="tableheading"><b>${_("To:")}</b></th>
				<th width="15%" align="center" id="tableheading">${formatLang(data['form']['end_date'],date=True)}</th>
				<th width="10%" align="center" id="tableheading"><b></b></th>
				<th width="15%" align="center" id="tableheading"><b></b></th>
			</tr>
			
		</table>
		<br/>
		<table width="100%" cellpadding="5">
			<tr>
				<td width="7%" align="center" rowspan="2" id="tableheading"><b>${_("Production line")}</b></td>
				<td width="7%" align="center" rowspan="2" id="tableheading"><b>${_("Preventive maintenance execution percentage")}</b></td>
				<td width="7%" align="center" rowspan="2" id="tableheading"><b>${_("Total hours of preventive maintenance")}</b></td>
				<td width="7%" align="center" rowspan="2" id="tableheading"><b>${_("Total hours of treatment maintenance")}</b></td>
				<td width="20%" align="center" id="tableheading" colspan="2"><b>${_("maintenance hours cost")}</b></td>
				<td width="45%" align="center" id="tableheading" colspan="5"><b>${_("Cost of spare parts and depreciations")}</b></td>
				<td width="7%" align="center" rowspan="2" id="tableheading"><b>${_("Maintenance Total cost")}</b></td>
			</tr>
			<tr>
				<td width="10%" align="center" id="tableheading"><b>${_("Preventive")}</b></td>
				<td width="10%" align="center" id="tableheading"><b>${_("Treatment")}</b></td>
				<td width="9%" align="center" id="tableheading"><b>${_("Statement")}</b></td>
				<td width="9%" align="center" id="tableheading"><b>${_("Unit")}</b></td>
				<td width="9%" align="center" id="tableheading"><b>${_("Quantity")}</b></td>
				<td width="9%" align="center" id="tableheading"><b>${_("Price")}</b></td>
				<td width="9%" align="center" id="tableheading"><b>${_("Amount (SDG)")}</b></td>
			</tr>
			<% total_main_time = 0.00 %>
			<% total_parts_amt = 0.00 %>
			%for order in get_mro_order(data['form']['mro_order_ids']):
				<% main_time = get_maintenance_time(order.ready_date, order.done_date) %>
				<% total_main_time += main_time%>
				<% material_rowspan = len(order.parts_moved_lines) %>
				<% cnt = 0 %>
			    %for material in order.parts_moved_lines:
			    	<% total_parts_amt += (material.product_qty * material.product_id.standard_price) %>
			    	% if cnt == 0: 
						<tr height="20px">
							<td width="7%" align="center" id="tableheading" rowspan="${material_rowspan}">${order.mainline_id and order.mainline_id.name or ''}</td>
							<td width="7%" align="center" id="tableheading" rowspan="${material_rowspan}">${formatLang(get_planned_executed_percentage(order.mainline_id and order.mainline_id.id or False,data['form']['start_date'],data['form']['end_date']), dp='Account')}</td>
							<td width="7%" align="center" id="tableheading" rowspan="${material_rowspan}">${formatLang(main_time)}</td>
							<td width="7%" align="center" id="tableheading" rowspan="${material_rowspan}">${formatLang(main_time)}</td>
							<td width="10%" align="center" id="tableheading" rowspan="${material_rowspan}">${_(" - ")}</td>
							<td width="10%" align="center" id="tableheading" rowspan="${material_rowspan}">${_(" - ")}</td>
							<td width="9%" align="center" id="tableheading">${material.product_id.default_code}</td>
							<td width="9%" align="center" id="tableheading">${material.product_uom.name}</td>
							<td width="9%" align="center" id="tableheading">${formatLang(material.product_qty, dp='Account')}</td>
							<td width="9%" align="center" id="tableheading">${formatLang(material.product_id.standard_price, dp='Account')}</td>
							<td width="9%" align="center" id="tableheading">${formatLang(material.product_qty * material.product_id.standard_price, dp='Account')}</td>
							<td width="7%" align="center" id="tableheading" rowspan="${material_rowspan}">${formatLang(material.product_qty * material.product_id.standard_price, dp='Account')}</td>
						</tr>
					%endif
					% if cnt != 0: 
						<tr height="20px">
							<td width="9%" align="center" id="tableheading">${material.product_id.default_code}</td>
							<td width="9%" align="center" id="tableheading">${material.product_uom.name}</td>
							<td width="9%" align="center" id="tableheading">${formatLang(material.product_qty, dp='Account')}</td>
							<td width="9%" align="center" id="tableheading">${formatLang(material.product_id.standard_price, dp='Account')}</td>
							<td width="9%" align="center" id="tableheading">${formatLang(material.product_qty * material.product_id.standard_price, dp='Account')}</td>
						</tr>
					%endif
					<% cnt += 1 %>
				%endfor
				%if not order.parts_moved_lines:
					<tr height="20px">
						<td width="7%" align="center" id="tableheading">${order.mainline_id and order.mainline_id.name or ''}</td>
						<td width="7%" align="center" id="tableheading">${formatLang(get_planned_executed_percentage(order.mainline_id and order.mainline_id.id or False,data['form']['start_date'],data['form']['end_date']), dp='Account')}</td>
						<td width="7%" align="center" id="tableheading">${formatLang(main_time)}</td>
						<td width="7%" align="center" id="tableheading">${formatLang(main_time)}</td>
						<td width="10%" align="center" id="tableheading">${_(" - ")}</td>
						<td width="10%" align="center" id="tableheading">${_(" - ")}</td>
						<td width="9%" align="center" id="tableheading">${_(" - ")}</td>
						<td width="9%" align="center" id="tableheading">${_(" - ")}</td>
						<td width="9%" align="center" id="tableheading">${formatLang(0.00, dp='Account')}</td>
						<td width="9%" align="center" id="tableheading">${formatLang(0.00, dp='Account')}</td>
						<td width="9%" align="center" id="tableheading">${formatLang(0.00, dp='Account')}</td>
						<td width="7%" align="center" id="tableheading">${formatLang(0.00, dp='Account')}</td>
					</tr>
				%endif
			%endfor
			<tr>
				<td width="7%" align="center" id="tableheading"><b>${_("TOTAL")}</b></td>
				<td width="7%" align="center" id="tableheading"><b>${_(" ")}</b></td>
				<td width="7%" align="center" id="tableheading"><b>${formatLang(total_main_time)}</b></td>
				<td width="7%" align="center" id="tableheading"><b>${formatLang(total_main_time)}</b></td>
				<td width="10%" align="center" id="tableheading"><b>${_(" - ")}</b></td>
				<td width="10%" align="center" id="tableheading"><b>${_(" - ")}</b></td>
				<td width="9%" align="center" id="tableheading"><b>${_(" ")}</b></td>
				<td width="9%" align="center" id="tableheading"><b>${_(" ")}</b></td>
				<td width="9%" align="center" id="tableheading"><b>${_(" ")}</b></td>
				<td width="9%" align="center" id="tableheading"><b>${_(" ")}</b></td>
				<td width="9%" align="center" id="tableheading"><b>${formatLang(total_parts_amt, dp='Account')}</b></td>
				<td width="7%" align="center" id="tableheading"><b>${_(" ")}</b></td>
			</tr>
			</table>
			
			<br/>
			<table width="100%">
			<tr>
				<td width="25%" align="center" id="tableheading"><b>${_("By maintenance engineer:")}</b></td>
				<td width="25%" align="left" valign="bottom" id="tableheading"><b>${_("Signature")}: ..........................</b></td>
				<td width="25%" align="center" id="tableheading"><b>${_("Maintenance unit manager credence:")}</b></td>
				<td width="25%" align="left" valign="bottom" id="tableheading"><b>${_("Signature")}: ..........................</b></td>
			</tr>
			</table>
			<br/>
			<table width="100%">
			  <tr height="30px" border="0" style="border:1px solid white">
				<td width="25%" align="left" id="tableheading"><b>${_("Picture / Director of Production")}</b></td>
				<td width="25%" align="left" colspan="3" id="tableheading"><b>${_("Copy to production manager")}</b></td>
			</tr>
		</table>
	</body>
</html>
