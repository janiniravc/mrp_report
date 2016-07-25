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
    <title>Assets Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<br/>
		<h2 align="center"><br>Periodical maintenance report From <u> ${formatLang(data['form']['start_date'], date=True)} </u> to <u> ${formatLang(data['form']['end_date'], date=True)} </u></b></h2>
		<br/>
		<% factory_data = get_factory_code(data['form']) %>
		<table width="100%">
			<tr>
				<td align="center" id="tableheading"><b>${_("From Date :")}</b></td>
				<td>${formatLang(data['form']['start_date'], date=True)}</td>
				<td align="center" id="tableheading"><b>${_("To date :")}</b></td>
				<td colspan="${len(factory_data)-2}">${formatLang(data['form']['end_date'], date=True)}</td>
				
			</tr>
			<tr>
			    <td align="center" id="tableheading"><b>${_("Factory :")}</b></td>
                %for factory in factory_data:
                    <td>${factory.name}</td>
                %endfor
			</tr>
		</table>
		<br/>
		<br/>
		<table width="100%" border="1" cellspacing="0" cellpadding="4" style="border: 1px solid #e6e6e6;">
		    <% factory_colspan = 0 %>
			%for factory in factory_data:
                    <% factory_colspan += len(factory.mainline_ids) %>
            %endfor
			<tr>
				
				<td align="center" rowspan="3" id="tableheading"><b>${_("Statement")}</b></td>
				<td align="center" rowspan="3" id="tableheading"><b>${_("Months/year's quarters")}</b></td>
				<td style="border-bottom:2px solid #e6e6e6;" colspan="${factory_colspan}" align="center" id="tableheading"><b>${_("Factory name")}</b></td>
				<td align="center" rowspan="3" id="tableheading"><b>${_("Total Amount of factories (Hour)")}</b></td>
				<td align="center" rowspan="3" id="tableheading"><b>${_("Total Amount of factories (SDG)")}</b></td>
				<td align="center" rowspan="3" id="tableheading"><b>${_("Notes")}</b></td>
			</tr>
			<tr>
                %for factory in factory_data:
                    <% order = len(factory.mainline_ids) %>
                    %if order > 0:
                        <td colspan="${order}" ><b>${factory.name}</b></td>
                    %endif
                    %endfor
            </tr>
			<tr>
                %for factory in factory_data:
                    %for main_line in factory.mainline_ids:
                        <td align="center" width="120px" id="tabledata"><b>${main_line.name}</b></td>
                    %endfor
                %endfor
            </tr>
			
			%for mro_data in get_factory_line(factory_data,data['form']):
                <tr height="30px">
                <td align="left" id="tabledata" width="15%">${mro_data['name']}</td>
                <td align="left" id="tabledata" width="15%">${mro_data['month_name']}</td>

                %for factory in factory_data:
                    %for main_line in factory.mainline_ids:
                        <td  align="right" width="120px" id="tabledata">${formatLang(mro_data[main_line.name], dp='Account')}</td>
                    %endfor
                %endfor
                <td align="right" id="tabledata" width="15%">${mro_data['total_time_factories']}</td>
                <td align="right" id="tabledata" width="15%">${mro_data['total_amt_factories']}</td>
                <td align="right" id="tabledata" width="15%">${mro_data['note']}</td>
            </tr>
            %endfor
            %for mro_data in get_spare_part_line(factory_data,data['form']):
                <tr height="30px">
                <td align="left" id="tabledata" width="15%">${mro_data['name']}</td>
                <td align="left" id="tabledata" width="15%">${mro_data['month_name']}</td>
                %for factory in factory_data:
                    %for main_line in factory.mainline_ids:
                        <td align="right" width="120px" id="tabledata">${formatLang(mro_data[main_line.name], dp='Account')}</td>
                    %endfor
                %endfor
                <td align="right" id="tabledata" width="15%">${mro_data['total_time_factories']}</td>
                <td align="right" id="tabledata" width="15%">${mro_data['total_amt_factories']}</td>
                <td align="right" id="tabledata" width="15%">${mro_data['note']}</td>
            </tr>
            %endfor
        </table>
        <br/>
        <br/>
		<table width="100%">
          <tr height="30px">
            <td id="tableheading"><b>${_("By Maintenance Manager")}</b></td>
            <td id="tableheading">${_("Signature")} ..........................</td>
            <td id="tableheading" width="90px">&nbsp; </td>
            <td id="tableheading"><b>${_("Production manager credence")}</b></td>
            <td id="tableheading">${_("Signature")} ..........................</td>
          </tr>
        </table>
	</body>
</html>
