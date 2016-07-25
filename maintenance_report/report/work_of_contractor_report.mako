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
    <title>Machine Log Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b>‫‫ ‪<u>The report of the position of the implementation of the work of contractors</u></b></h2>
		<br/>
		<table width="100%" cellpadding="4">
			<tr height="30px">
				<td align="right" id="tableheading"><b>${_("Date From:")}</b></td>
				<td colspan="2" align="left" id="tableheading"><b>${_(' ')}</b></td>
				<td colspan="2" align="right" id="tableheading"><b>${_("To : ")}</b></td>
				<td colspan="2" align="left" id="tableheading"><b>${_(" ")}</b></td>
			</tr>
			<tr height="30px">
				<td width="10%" align="left" id="tableheading"><b>${_("Complaints after receipt")}</b></td>
				<td width="15%" align="left" id="tableheading"><b>${_('Date of receipt of the work')}</b></td>
				<td width="15%" align="left" id="tableheading"><b>${_("The implementation period")}</b></td>
				<td width="15%" align="left" id="tableheading"><b>${_("cost of contract")}</b></td>
				<td width="15%" align="left" id="tableheading"><b>${_("Date of contract")}</b></td>
				<td width="15%" align="left" id="tableheading"><b>${_("contractor name")}</b></td>
				<td width="15%" align="left" id="tableheading"><b>${_("work description")}</b></td>
			</tr>
			%for i in range(5):
				<tr height="30px">
					<td width="10%" align="left" id="tableheading"> ${" "}</td>
					<td width="15%" align="left" id="tableheading">${' '}</td>
					<td width="15%" align="left" id="tableheading">${' '}</td>
					<td width="15%" align="left" id="tableheading">${' '}</td>
					<td width="15%" align="left" id="tableheading">${' '}</td>
					<td width="15%" align="left" id="tableheading">${' '}</td>
					<td width="15%" align="left" id="tableheading">${' '}</td>
				</tr>
			%endfor
		</table>

	</body>
</html>
