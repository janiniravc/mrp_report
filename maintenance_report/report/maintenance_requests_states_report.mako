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
    <title>Maintenance Requests States</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>Maintenance Requests States Report</u></b></h2>
		<br/>
		<table width="100%">
			<tr  height="30px">
				<th width="15%" align="right" id="tableheading"><b>${_("To:")}</b></th>
				<th width="35%" align="left" id="tableheading">${formatLang(data['form']['start_date'],date=True)}</th>
				<th width="15%" align="right" id="tableheading"><b>${_("From:")}</b></th>
				<th width="35%" align="left" id="tableheading">${formatLang(data['form']['end_date'],date=True)}</th>
			</tr>
			<tr  height="30px">
				<th width="15%" align="right" id="tableheading"><b>${_("Factory Name:")}</b></th>
				<th width="35%" align="left" id="tableheading">${data['form'].get('factory_id',False) and data['form'].get('factory_id',False)[1]}</th>
				<th width="15%" align="right" id="tableheading"><b>${_("Line:")}</b></th>
				<th width="35%" align="left" id="tableheading">${data['form'].get('line_id',False) and data['form'].get('line_id',False)[1]}</th>
			</tr>
			
		</table>
		<br/>
		<table width="100%">
			<tr>
				<td width="7%" align="center" id="tableheading"><b>${_("Number of requests")}</b></td>
				<td width="7%" align="center" id="tableheading"><b>${_("Executed")}</b></td>
				<td width="7%" align="center" id="tableheading"><b>${_("Execution time")}</b></td>
				<td width="7%" align="center" id="tableheading"><b>${_("Not executed")}</b></td>
			</tr>
			<% no_of_request = get_request_detail(data['form']['mrp_request_ids']) %>
			<tr height="40px">
				<td width="7%" align="center" id="tableheading"><b>${len(data['form']['mrp_request_ids'])}</b></td>
				<td width="7%" align="center" id="tableheading"><b>${no_of_request['executed_request']}</b></td>
				<td width="7%" align="center" id="tableheading"><b>${no_of_request['run_request']}</b></td>
				<td width="7%" align="center" id="tableheading"><b>${no_of_request['non_executed_request']}</b></td>
			</tr>
			</table>
			<br>
			<table width="100%">
			<tr border="0" style="border:1px solid white">
				<td width="25%" colspan="4" align="left" id="tableheading"><b><u>${_("Maintenance requests details:")}</u></b></td>
			</tr>
			</table>
			</br>
			<table width="100%">
				<tr height="20px">
					<td width="20%" align="left" id="tableheading"><b>${_("Date")}</b></td>
					<td width="20%" align="left" id="tableheading"><b>${_("Executed requests")}</b></td>
					<td width="20%" align="left" id="tableheading"><b>${_("Not executed requests")}</b></td>
					<td width="40%" align="left" id="tableheading"><b>${_("Reason")}</b></td>
				</tr>
				%for request in get_request_obj(data['form']['mrp_request_ids']):
					<tr height="20px">
						<td align="left" id="tableheading">${formatLang(request.requested_date[:10],date=True)}</td>
							<td align="left" id="tableheading">
								
								%if request.state in ('run','done'): 
									${request.name}
								%endif
								%if request.state not in ('run','done'):
									${_(" - ")}
								%endif
							</td>
							<td align="left" id="tableheading">
								
								%if request.state not in ('run','done'):
									${request.name}
								%endif
								%if request.state in ('run','done'): 
									${_(" - ")}
								%endif
							</td>
						
						<td align="left" id="tableheading">${request.description or ''}</td>
					</tr>
				%endfor
			</table>
			
	</body>
</html>
