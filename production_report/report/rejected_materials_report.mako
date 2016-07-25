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
    <title>Rejected Materials Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>Report of the Rejected Materials in Production Line</u></b></h2>
		<br/>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
				<td width="5%" align="right" id="tableheading"><b>${_("Date:")}</b></td>
				<td width="15%" align="left" id="tableheading"><b>${_("")}</b></td>
				<td width="20%" align="left" id="tableheading"><b>${_("Lot No:")}</b></td>
				<td width="20%" align="left" id="tableheading"><b>${_(" ")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Product name:")}</b></td>
				<td width="30%" align="left" id="tableheading"><b>${_("")}</b></td>
			</tr>
		</table>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
				<td rowspan="2" width="3%" align="right" id="tableheading"><b>${_("S/N")}</b></td>
				<td rowspan="2" width="6%" align="left" id="tableheading"><b>${_("Form No")}</b></td>
				<td rowspan="2" width="6%" align="left" id="tableheading"><b>${_("Vin No")}</b></td>
				<td colspan="4" align="center" id="tableheading"><b>${_("Rejected Materials")}</b></td>
				<td colspan="2" align="center" id="tableheading"><b>${_("Reasons")}</b></td>
				<td rowspan="2" width="13%" align="left" id="tableheading"><b>${_("Place of Compensation")}</b></td>
				<td rowspan="2" width="13%" align="left" id="tableheading"><b>${_("Case of Compensation from KD Materials")}</b></td>
			</tr>
			
			<tr height="30px">
				<td width="7%" align="left" id="tableheading"><b>${_("Part No")}</b></td>
				<td width="13%" align="left" id="tableheading"><b>${_("Part Name(Arabic, English)")}</b></td>
				<td width="6%" align="left" id="tableheading"><b>${_("Quantity")}</b></td>
				<td width="7%" align="left" id="tableheading"><b>${_("LOT No")}</b></td>
				<td width="13%" align="left" id="tableheading"><b>${_("Reason")}</b></td>
				<td width="13%" align="left" id="tableheading"><b>${_("Station")}</b></td>
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
                </tr>
            %endfor
		<table>
		<br>
        <table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
				<td align="right" id="tableheading"><b>${_("* With the possibility of comparing the amendments between different LOTs per product")}</b></td>
			</tr>
		</table>
            
	</body>
</html>
