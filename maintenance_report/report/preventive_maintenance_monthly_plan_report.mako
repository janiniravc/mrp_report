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
        tr.noBorder td {border: 0; }
        table.noBorder {border: none;}
        ${css}
    </style>
    <title>Preventive Maintenance Monthly Plan report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b>Preventive Maintenance Monthly Plan Report </b></h2>
		<% details = get_details() %>
		<% month = get_month() %>
		<% colors = get_colors() %>
		<% report_date = get_dates() %>
		<table width="100%" cellpadding="4" class="noBorder">
			<tr height="30px">
				<td align="center" id="tableheading"><b>${_("From : ")} ${formatLang(report_date['start_date'],date=True)} ${_("  To :  ")} ${formatLang(report_date['end_date'],date=True)}</b></td>
			<tr>
		</table >
		<br/>
		<br/>
		<table width="100%" cellpadding="4">
			<tr>
			    <td bgcolor="#00cccc" align="center" id="tableheading" rowspan="2"><b>${_("Machine Name")}</b></td>
				<td bgcolor="#008080" align="center" id="tableheading" rowspan="2"><b>${_("Position")}</b></td>
				<td bgcolor="#ffff00" align="center" id="tableheading" rowspan="2"><b>${_("Machine No")}</b></td>
				% for month_no in sorted(details.keys()):
					<td bgcolor=${colors[month_no-1]} align="center" colspan=${len(details[month_no]['date'])} id="tableheading"><b>${month[month_no]}</b></td>
				%endfor
			</tr>
			<tr height="30px" >
				% for month_no in sorted(details.keys()):
					%for day_date in details[month_no]['date']:
			    		<td><b>${day_date[0][:2]}</b></td>
			    	%endfor
			    %endfor
			</tr>
			%for machine in get_machine():
				<tr height="30px" >
					<td  align="left" id="tableheading">${machine.name}</td>
					<td  align="left" id="tableheading">${machine.station_id and machine.station_id.name or ''}</td>
					<td  align="left" id="tableheading">${machine.asset_number or ''}</td>
					% for month_no in sorted(details.keys()):
						%for day_date in details[month_no]['date']:
				    		<td>${get_is_maintanace_week(machine.id,day_date)}</td>
				    	%endfor
				    %endfor
				</tr>
			%endfor
        </table>
        <br/>
        <br/>
		<table width="100%" class="noBorder">
		  <tr class="noBorder">
            <td id="tableheading"><b>${_("Production Manager")}</b></td>
            <td id="tableheading" width="90px">&nbsp; </td>
            <td id="tableheading"><b>${_("Maintenance Manager")}</b></td>
          </tr>
        </table>
	</body>
</html>
