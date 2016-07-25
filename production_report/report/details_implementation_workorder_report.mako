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
    <title>Details Implementation Work Order Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>Details of Implementation of Work Order</u></b></h2>
		<br/>
		<br/>
		%for job_order in get_job_order_brw(data['form']['job_orders']): 
			<% deptartment_factory = get_department_factory(job_order.general_job_order_id.factory_id)%>
			<table width="100%" cellspacing="0" cellpadding="4">
				<tr height="30px">
					<td width="20%" align="right" id="tableheading"><b>${_("Date : ")}</b></td>
					<td width="30%" align="left" id="tableheading"><b>${formatLang(job_order.date,date_time=True}</b></td>
					<td width="20%" align="right" id="tableheading"><b>${_("Department: ")}</b></td>
					<td width="30%" align="left" id="tableheading"><b>${deptartment_factory['department']}</b></td>
				</tr>
				<tr>
					<td align="right" id="tableheading"><b>${_("job Order No:")}</b></td>
					<td align="left" id="tableheading"><b>${job_order.daily_job_order_no}</b></td>
					<td align="right" id="tableheading"><b>${_("Product Name: ")}</b></td>
					<td align="left" id="tableheading"><b>${'['+job_order.general_job_order_id.product_id.default_code+'] '+job_order.general_job_order_id.product_id.name}</b></td>
				</tr>
				<tr>
					<td align="right" id="tableheading"><b>${_("Factory:")}</b></td>
					<td align="left" id="tableheading"><b>${deptartment_factory['factory']}</b></td>
					<td align="right" id="tableheading"><b>${_(" ")}</b></td>
					<td align="left" id="tableheading"><b>${_("")}</b></td>
				</tr>
			</table>
			<br/>
			<table width="100%" cellspacing="0" cellpadding="4">
				<tr height="30px">
					<td rowspan="2" width="3%" align="left" id="tableheading"><b>${_("S/N")}</b></td>
					<td rowspan="2" width="7%" align="left" id="tableheading"><b>${_("VIN No")}</b></td>
					<td rowspan="2" width="10%" align="left" id="tableheading"><b>${_("Engine Number")}</b></td>
					<td rowspan="2" width="10%" align="left" id="tableheading"><b>${_("Color")}</b></td>
					<td rowspan="2" width="10%" align="center" id="tableheading"><b>${_("Date of Production")}</b></td>
					<td rowspan="2" width="15%" align="center" id="tableheading"><b>${_("History Of Quality Permit")}</b></td>
					<td rowspan="2" width="15%" align="center" id="tableheading"><b>${_("Date of Entry of Full Product Warehouse (Switching to Next Factory)")}</b></td>
					<td colspan="2" align="center" id="tableheading"><b>${_("Existence of Notes")}</b></td>
				</tr>
				<tr height="30px">
					<td width="15%" align="left" id="tableheading"><b>${_("Shortfalls")}</b></td>
					<td width="15%" align="left" id="tableheading"><b>${_("Note Quality")}</b></td>
				</tr>
				<% cnt = 0 %>
				%for rec in job_order.vin_list_ids:
					<% cnt = cnt + 1 %>
					<% production_date = get_production_date(job_order) %>
	                <tr height="20px">
	                    <td align="right" id="tableheading">${cnt}</td>
	                    <td align="left" id="tableheading">${rec.vin_number}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="left" id="tablehead55cc5ing">${rec.color_id and rec.color_id.name}</td>
	                    <td align="left" id="tableheading">${production_date and formatLang(production_date[10:],date=True)}</td>
	                    <td align="left" id="tableheading">${rec.workcenter_id and rec.workcenter_id.name or ''}</td>
	                    <td align="left" id="tableheading">${formatLang(job_order.general_job_order_id.end_date,date=True)}</td>
	                    <td align="left" id="tableheading">${?}</td>
	                    <td align="left" id="tableheading">${?}</td>
	                </tr>
	            %endfor
			<table>
			<br/>
			<br/>
			<table width="100%" cellspacing="0" cellpadding="4">
				<tr height="30px">
					<td>
	            		Date of entry into the store for factory assembly only to the other factories  being the date of entry to the store is the date of transfer to the next factory
	            	</td>
	            </tr>
	        </table>
	    %endfor
	</body>
</html>
