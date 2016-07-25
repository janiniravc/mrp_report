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
    <title>Proportion Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<br/>
		<h2 align="center"><br>From <u> ${formatLang(data['form']['start_date'], date=True)} </u> to <u> ${formatLang(data['form']['end_date'], date=True)} </u></b></h2>
		<% machine_data = get_machine_line(data['form']) %>
		<% factory_data = get_factory_line(data['form']) %>
		<br/>
		<h3 align="center"><u>For Machine : </u></h3>
		%for machine in machine_data:
		  <div><b>${_("Machine")}</b>    ${machine['machine_name']}</div>
          <div><b>${_("Number of treatment")}</b>    ${machine['no_of_treatment_maintenace']}</div>
          <div><b>${_("Total of Maintenance")}</b>    ${machine['total_maintenace']}</div>
          <div><b>${_("Percentage")}</b>    ${machine['percentage_maintenance']}</div>
          <br/>
          <br/>
        %endfor
        <br/>
        <p style="page-break-before:always"></p>
        <h3 align="center"><u>For Factory : </u></h3>
        %for factory in factory_data:
          <div><b>${_("Machine")}</b>    ${factory['factory_name']}</div>
          <div><b>${_("Number of treatment")}</b>    ${factory['no_of_treatment_maintenace']}</div>
          <div><b>${_("Total of Maintenance")}</b>    ${factory['total_maintenace']}</div>
          <div><b>${_("Percentage")}</b>    ${factory['percentage_maintenance']}</div>
          <br/>
          <br/>
        %endfor

	</body>
</html>
