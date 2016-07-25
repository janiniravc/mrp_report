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
    <title>The list of Engineer Service</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b>‫‫ ‪This list of Engineer Service</b></h2>
		<br/>
		<br/>
		<table width="100%" border="1" cellspacing="0" cellpadding="4" style="border: 1px solid #e6e6e6;">
            <tr>
                <td align="center" id="tableheading"><b>${_("Sr No.")}</b></td>
                <td align="center" id="tableheading"><b>${_("Group name")}</b></td>
                <td align="center" id="tableheading"><b>${_("The origin name")}</b></td>
                <td align="center" id="tableheading"><b>${_("Code")}</b></td>
                <td align="center" id="tableheading"><b>${_("Place")}</b></td>
                <td align="center" id="tableheading"><b>${_("Operation Date")}</b></td>
                <td align="center" id="tableheading"><b>${_("Type of preventive maintenance")}</b></td>
                <td align="center" id="tableheading"><b>${_("The Functions of Preventive Maintenance For each type")}</b></td>
            </tr>
            %for mro_data in get_line(data['form']):
                <tr height="30px">
                    <td align="center" id="tableheading">${mro_data['sr_no']}</td>
                    <td align="center" id="tableheading">${mro_data['group_name']}</td>
                    <td align="center" id="tableheading">${mro_data['origin_name']}</td>
                    <td align="center" id="tableheading">${mro_data['code']}</td>
                    <td align="center" id="tableheading">${mro_data['place']}</td>
                    <td align="center" id="tableheading">${formatLang(mro_data['operation_date'], date=True)}</td>
                    <td align="center" id="tableheading">${mro_data['maintenance_type']}</td>
                    <td align="center" id="tableheading">${mro_data['maintenace_each_type']}</td>
                </tr>
            %endfor
        </table>

	</body>
</html>
