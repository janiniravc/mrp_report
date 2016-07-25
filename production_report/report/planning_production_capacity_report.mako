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
    <title>Planning Production Capacity Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>The Planning and Production Control</u></b></h2>
		<h2 align="center"><b><u>Planning of Production Capacity Of The Year......</u></b></h2>
		<br/>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
				<td width="5%" align="right" id="tableheading"><b>${_("S/N")}</b></td>
				<td width="15%" align="left" id="tableheading"><b>${_("Code")}</b></td>
				<td width="30%" align="left" id="tableheading"><b>${_("Product Name")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Annual Planned")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("First Quarter")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Second Quarter")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Third Quarter")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Fourth Quarter")}</b></td>
			</tr>
			
			%for i in range(9):
				<% cnt = i+1 %>
                <tr height="30px">
                    <td align="right" id="tableheading">${cnt}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                </tr>
            %endfor
            
			
			<br/>
			<table width="100%">
			<tr height="40px">
				<td width="25%" align="right" id="tableheading"><b>${_("Head of the planning and production control:")}</b></td>
				<td width="25%" align="left" valign="bottom" id="tableheading"><b>..........................</b></td>
				<td width="25%" align="right" id="tableheading"><b>${_("The Director Of The Management Of Production:")}</b></td>
				<td width="25%" align="left" valign="bottom" id="tableheading"><b> ..........................</b></td>
			</tr>
			<tr height="40px">
				<td width="25%" align="center" colspan="4" id="tableheading"><b>${_("The Approval Of The Director Of The Company:...........................")}</b></td>
			</tr>
			</table>
	</body>
</html>
