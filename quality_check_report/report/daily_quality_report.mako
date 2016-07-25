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
    <title>Daily Quality Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>Daily Quality Report</u></b></h2>
		<br/>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
				<td width="10%" align="right" id="tableheading"><b>${_("Date : ")}</b></td>
				<td width="20%" align="left" id="tableheading"><b>${_("")}</b></td>
				<td width="10%" align="right" id="tableheading"><b>${_("Day: ")}</b></td>
				<td width="20%" align="left" id="tableheading"><b>${_(" ")}</b></td>
				<td width="10%" align="right" id="tableheading"><b>${_("By: ")}</b></td>
				<td width="30%" align="left" id="tableheading"><b>${_("")}</b></td>
			</tr>
		</table>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
				<td colspan="6" align="center" id="tableheading"><b>${_("1. products  inspection")}</b></td>
				<td colspan="6" align="center" id="tableheading"><b>${_("2. laborers")}</b></td>
				<td colspan="5" align="center" id="tableheading"><b>${_("3. Product Status")}</b></td>
				<td colspan="5" align="center" id="tableheading"><b>${_(" ")}</b></td>
			</tr>
			<tr height="30px">
				<td width="5%" align="left" id="tableheading"><b>${_("S/N")}</b></td>
				<td width="15%" align="left" id="tableheading"><b>${_("Products")}</b></td>
				<td width="7%" align="left" id="tableheading"><b>${_("Inspected")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Review")}</b></td>
				<td width="7%" align="center" id="tableheading"><b>${_("Accepted")}</b></td>
				<td width="7%" align="center" id="tableheading"><b>${_("Acceptance Percentage %")}</b></td>
				<td width="10%" align="center" id="tableheading"><b>${_("Station")}</b></td>
				<td width="7%" align="center" id="tableheading"><b>${_("Total")}</b></td>
				<td width="5%" align="center" id="tableheading"><b>${_("Absence")}</b></td>
				<td width="5%" align="center" id="tableheading"><b>${_("Attendance")}</b></td>
				<td width="12%" align="center" id="tableheading"><b>${_("Additional job/Notes")}</b></td>	
				
				<td width="2%" align="center" id="tableheading"><b>${_("Paint")}</b></td>
				<td width="2%" align="center" id="tableheading"><b>${_("Accepted")}</b></td>
				<td width="2%" align="center" id="tableheading"><b>${_("Under Inspection")}</b></td>
				<td width="2%" align="center" id="tableheading"><b>${_("Review")}</b></td>
				<td width="2%" align="center" id="tableheading"><b>${_("Inspected")}</b></td>
				
				<td width="2%" align="center" id="tableheading"><b>${_("Repetition")}</b></td>
				<td width="2%" align="center" id="tableheading"><b>${_("Notes")}</b></td>
						
			</tr>
			%for i in range(5):
				<% cnt = i+1 %>
                <tr height="20px">
                    <td align="right" id="tableheading">${cnt}</td>
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
		<br/>
		<br/>
	</body>
</html>
