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
    <title>Maintenance daily/weekly report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b>‫‫ ‪Maintenance daily/weekly report‪</b></h2>
		<br/>
		
		
		<table width="100%" cellspacing="0" cellpadding="2">
			<tr  height="30px">
				<td width="20%" align="left" id="tableheading">
					% if data['form']['daily_weekly_selection'] != 'daily': 
						<b>${_("Date From")}</b>
					%endif
					% if data['form']['daily_weekly_selection'] == 'daily':
						<b>${_("Date ")}</b>
					%endif
				</td>
				<td width="30%" align="left" id="tableheading">${formatLang(data['form']['start_date'],date=True)}</td>
				<td width="20%" align="left" id="tableheading"><b>${_("Factory Name")}</b></td>
				<td width="30%" align="left" id="tableheading">${data['form']['factory_id'][1]}</td>
			</tr>
			<tr  height="30px">
				<td width="20%" align="left" id="tableheading">
					% if data['form']['daily_weekly_selection'] != 'daily': 
						<b>${_("Date To")}</b>
					%endif
				</td>
				<td width="30%" align="left" id="tableheading">
					% if data['form']['daily_weekly_selection'] != 'daily': 
						${formatLang(data['form']['end_date'],date=True)}
					%endif
				</td>
				<td width="20%" align="left" id="tableheading"><b>${_("Line Name")}</b></td>
				<td width="30%" align="left" id="tableheading">${data['form']['line_id'][1]}</td>
			</tr>
				
			</table>
			
		<br/>
		<br/>
		<table width="100%" cellpadding="4">
			<tr>
				<td align="center" id="tableheading"><b>${_("Machine name")}</b></td>
				<td align="center" id="tableheading"><b>${_("Machine / Equipment number")}</b></td>
				<td align="center" id="tableheading"><b>${_("Material / spare parts")}</b></td>
				<td align="center" id="tableheading"><b>${_("Quantity")}</b></td>
				<td align="center" id="tableheading"><b>${_("Price")}</b></td>
				<td align="center" id="tableheading"><b>${_("Material Cost")}</b></td>
				<td align="center" id="tableheading"><b>${_("Completed / not completed tasks")}</b></td>
				<td align="center" id="tableheading"><b>${_("Maintenance date")}</b></td>
				<td align="center" id="tableheading"><b>${_("Maintenance completion time")}</b></td>
				<td align="center" id="tableheading"><b>${_("Maintenance stopping time")}</b></td>
				<td align="center" id="tableheading"><b>${_("Name of executers")}</b></td>
				<td align="center" id="tableheading"><b>${_("Cost of maintenance hours")}</b></td>
				<td align="center" id="tableheading"><b>${_("Total cost of maintenance")}</b></td>
				
			</tr>
			%for order in get_mro_order(data['form']['mro_order_ids']):
			    <% material_obj = order.parts_moved_lines %>
			    <% material_rowspan = len(order.parts_moved_lines) %>
			    <% cnt = 0 %>
			    <% cost_per_hour = 0 %>
			    %if order.subline_id and order.subline_id.workcenter_ids:
			         <% cost_per_hour = order.subline_id.workcenter_ids[0].costs_hour or 0 %>
			    %endif
			    %for material in order.parts_moved_lines:
			    	% if cnt == 0: 
						<tr height="30px">
			                <td align="left" id="tabledata" width="15%" rowspan="${material_rowspan}">${order.asset_id.name}</td>
			                <td align="right" id="tabledata" width="15%" rowspan="${material_rowspan}">${order.asset_id.machine_code or ''}</td>
			                <td align="right" id="tabledata" width="15%">${material.product_id.default_code}</td>
			                <td align="right" id="tabledata" width="15%">${formatLang(material.product_qty, dp='Account')}</td>
			                <td align="left" id="tabledata" width="15%">${formatLang(material.product_id.standard_price, dp='Account')}</td>
			                <td align="left" id="tabledata" width="15%">${formatLang(material.product_qty * material.product_id.standard_price, dp='Account')}</td>
			                <td align="left" id="tabledata" width="15% rowspan="${material_rowspan}">${get_task_status(order)}</td>
			                <td align="right" id="tabledata" width="15%" rowspan="${material_rowspan}">${formatLang(order.date_scheduled, date_time=True)}</td>
			                <td align="right" id="tabledata" width="15%" rowspan="${material_rowspan}">${formatLang(order.maintenance_time)}</td>
			                <td align="left" id="tabledata" width="15%" rowspan="${material_rowspan}">${formatLang(order.done_date or '', date_time=True)}</td>
			                <td align="right" id="tabledata" width="15%" rowspan="${material_rowspan}">${order.eng_name_id and order.eng_name_id.name or ''}</td>
			                <td align="left" id="tabledata" width="15%" rowspan="${material_rowspan}">${cost_per_hour*order.maintenance_time}</td>
			                <td align="left" id="tabledata" width="15%" rowspan="${material_rowspan}">${formatLang(material.product_qty * material.product_id.standard_price, dp='Account')}</td>
			            </tr>
	            	%endif
	            	% if cnt != 0: 
	            		<tr height="30px">
			                <td align="right" id="tabledata" width="15%">${material.product_id.default_code}</td>
			                <td align="right" id="tabledata" width="15%">${formatLang(material.product_qty, dp='Account')}</td>
			                <td align="left" id="tabledata" width="15%">${formatLang(material.product_id.standard_price, dp='Account')}</td>
			                <td align="left" id="tabledata" width="15%">${formatLang(material.product_qty * material.product_id.standard_price, dp='Account')}</td>
			            </tr>
			        %endif
			        <% cnt += 1 %>
	            %endfor
	          %endfor
	        </table>
	        
        <br/>
        <br/>
		<table width="100%" cellpadding="4">
		  <tr height="30px">
            <td id="tableheading">..........................</td>
            <td id="tableheading"><b>${_("Maintenance engineer credence")}</b></td>
            <td id="tableheading" width="90px">&nbsp; </td>
            <td id="tableheading">..........................</td>
            <td id="tableheading"><b>${_("By Maintenance supervisor")}</b></td>
          </tr>
        </table>
	      
	</body>
</html>
