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
    <title>Torque Readings Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>Torque Readings Report</u></b></h2>
		<br/>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
				<td width="20%" align="right" id="tableheading"><b>${_("Quality Section : ")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("")}</b></td>
				<td width="10%" align="right" id="tableheading"><b>${_("Fectory: ")}</b></td>
				<td width="25%" align="left" id="tableheading"><b>${_(" ")}</b></td>
				<td width="10%" align="right" id="tableheading"><b>${_("Station: ")}</b></td>
				<td width="25%" align="left" id="tableheading"><b>${_("")}</b></td>
			</tr>
		</table>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
				<td width="20%" align="left" id="tableheading"><b>${_("Operation")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Number")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Measurement")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Minimum Value")}</b></td>
				<td width="10%" align="center" id="tableheading"><b>${_("Allowed Value")}</b></td>
				<td width="10%" align="center" id="tableheading"><b>${_("Tolerance")}</b></td>
				<td width="10%" align="center" id="tableheading"><b>${_("Actual Reading")}</b></td>
				<td width="10%" align="center" id="tableheading"><b>${_("Deviation")}</b></td>
				<td width="10%" align="center" id="tableheading"><b>${_("Result")}</b></td>
			%for i in range(5):
				<% cnt = i+1 %>
                <tr height="20px">
                    <td align="right" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                </tr>
            %endfor
		<table>
		
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
				<td width="100%" align="left" id="tableheading">
					<b>${_("The result (Actual Reading ) acceptable if the (+/-) 5% of permitted value")}</b>
				</td>
			</tr>
		</table>
		<br/>
		<br/>
	</body>
</html>
