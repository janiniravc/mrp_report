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
    <title>Auxiliary Materials in Warehouse Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>Report of Auxiliary Materials in Warehouse until</u></b></h2>
		<br/>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
				<td width="5%" align="left" id="tableheading"><b>${_("S/N")}</b></td>
				<td width="20%" align="left" id="tableheading"><b>${_("Material Name")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Unit")}</b></td>
				<td width="15%" align="left" id="tableheading"><b>${_("Currently In Warehouse")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Unit would be Enough for")}</b></td>
				<td width="15%" align="left" id="tableheading"><b>${_("Consumption per product")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Number of Cars Covered by Stock")}</b></td>
				<td width="15%" align="left" id="tableheading"><b>${_("status of Material")}</b></td>
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
