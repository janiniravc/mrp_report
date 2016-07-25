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
    
    <title>Maintenance materials list</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>Maintenance materials list (Main/Assistant)</u></b></h2>
		<br/>
		%for order in get_mro_order(data['form']['mro_order_ids']):
			<br/>
			<table width="100%" cellspacing="0" cellpadding="2">
				<tr  height="30px">
					<td width="20%" align="left" id="tableheading"><b>${_("Machine Name")}</b></td>
					<td width="30%" align="left" id="tableheading">${order.asset_id.name}</td>
					<td width="20%" align="left" id="tableheading"><b>${_("Date")}</b></td>
					<td width="30%" align="left" id="tableheading">${formatLang(order.done_date[:10],date=True)}</td>
				</tr>
				<tr  height="30px">
					<td width="20%" align="left" id="tableheading"><b>${_("Production Line")}</b></td>
					<td width="30%" align="left" id="tableheading">${order.mainline_id and order.mainline_id.name}</td>
					<td width="20%" align="left" id="tableheading"><b>${_("Factory Name")}</b></td>
					<td width="30%" align="left" id="tableheading">${order.factory_id and order.factory_id.name or ''}</td>
				</tr>
				
			</table>
			<br/>
			<table width="100%" cellspacing="0" cellpadding="4">
				<tr>
					<td width="15%" align="center" id="tableheading"><b>${_("Task code/task description")}</b></td>
					<td width="10%" align="right" id="tableheading"><b>${_("Qty/unit")}</b></td>
					<td width="15%" align="left" id="tableheading"><b>${_("Store  Code No.")}</b></td>
					<td width="15%" align="left" id="tableheading"><b>${_("Spare Part No")}</b></td>
					<td width="35%" align="left" id="tableheading"><b>${_("Description")}</b></td>
					<td width="10%" align="right" id="tableheading"><b>${_("NO")}</b></td>
				</tr>
				<% cnt = 0 %>
				<% pre_task_id = False %>
				%for task in order.task_ids:
					%for parts in task.name.parts_lines:
						<% cnt = cnt+1 %>
						<tr>
							
							<td width="15%" align="left" id="tableheading">
								% if pre_task_id != task.id: 
									${task.name.name}
								%endif
							</td>
							<td width="10%" align="right" id="tableheading">${formatLang(parts.parts_qty)}</td>
							<td width="5%" align="left" id="tableheading">${order.parts_location_id.code or ''}</td>
							<td width="25%" align="left" id="tableheading">${parts.parts_id.default_code or ''}</td>
							<td width="35%" align="left" id="tableheading">${parts.name or ''}</td>
							<td width="10%" align="right" id="tableheading"><b>${cnt}</b></td>
						</tr>
						<% pre_task_id = task.id %>
					%endfor
				%endfor
				</table>
				
				<br/>
				<table width="100%">
				<tr>
					<td width="25%" align="center" id="tableheading"><b>${_("Numbers Maintenance Engineer / Supervisor or maintenance:")}</b></td>
					<td width="25%" align="left" valign="bottom" id="tableheading"><b>${_("Signature")}: ..........................</b></td>
					<td width="25%" align="center" id="tableheading"><b>${_("Adopting the head of the maintenance department:")}</b></td>
					<td width="25%" align="left" valign="bottom" id="tableheading"><b>${_("Signature")}: ..........................</b></td>
				</tr>
			</table>
			<p style="page-break-before:always"></p>
		  %endfor
	</body>
</html>
