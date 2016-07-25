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
    <title>Status of Produced Unit Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>Report of Status of Produced Unit</u></b></h2>
		<br/>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
				<td width="15%" align="right" id="tableheading"><b>${_("The Work Order No.:")}</b></td>
				<td width="15%" align="left" id="tableheading"><b>${_("")}</b></td>
				<td width="20%" align="left" id="tableheading"><b>${_("Product Name:")}</b></td>
				<td width="20%" align="left" id="tableheading"><b>${_(" ")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("VIN No:")}</b></td>
				<td width="20%" align="left" id="tableheading"><b>${_("")}</b></td>
			</tr>
		</table>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
				<td rowspan="2" width="5%" align="right" id="tableheading"><b>${_("S/N")}</b></td>
				<td rowspan="2" width="13%" align="center" id="tableheading"><b>${_("Station")}</b></td>
				<td align="center" id="tableheading"><b>${_("Unfinished Operations")}</b></td>
				<td colspan="3" align="center" id="tableheading"><b>${_("Shortfalls / Damaged")}</b></td>
				<td rowspan="2" width="17%" align="center" id="tableheading"><b>${_("Reasons")}</b></td>
				<td align="center" id="tableheading"><b>${_("Quality note")}</b></td>
			</tr>
			
			<tr height="30px">
				<td width="10%" align="center" id="tableheading"><b>${_("Operations Code")}</b></td>
				<td width="10%" align="center" id="tableheading"><b>${_("Part No")}</b></td>
				<td width="20%" align="left" id="tableheading"><b>${_("Part Name(Arabic, English)")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Quantity")}</b></td>
				<td width="15%" align="center" id="tableheading"><b>${_("Problem")}</b></td>
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
                </tr>
            %endfor
		<table>
            
	</body>
</html>
