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
    <title>BOM Product per Station Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>Report of BOM for Product per Station</u></b></h2>
		<br/>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
				<td width="5%" align="right" id="tableheading"><b>${_("Date")}</b></td>
				<td width="15%" align="left" id="tableheading"><b>${_("")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Product Name")}</b></td>
				<td width="30%" align="left" id="tableheading"><b>${_(" ")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Station")}</b></td>
				<td width="30%" align="left" id="tableheading"><b>${_("")}</b></td>
			</tr>
		</table>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
				<td width="3%" align="right" id="tableheading"><b>${_("S/N")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("PART CODE")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("SAP NO")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("PART NO")}</b></td>
				<td width="12%" align="left" id="tableheading"><b>${_("PART NAME (EN)")}</b></td>
				<td width="11%" align="left" id="tableheading"><b>${_("PART NAME (AR)")}</b></td>
				<td width="5%" align="left" id="tableheading"><b>${_("QTY/UNIT")}</b></td>
				<td width="5%" align="left" id="tableheading"><b>${_("UNIT")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("STATION")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("TASK NAME")}</b></td>
				<td width="5%" align="left" id="tableheading"><b>${_("TASK CODE")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Safety Category")}</b></td>
				<td width="5%" align="left" id="tableheading"><b>${_("Reordering level")}</b></td>
			</tr>
			
			%for i in range(5):
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
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                </tr>
            %endfor
            
	</body>
</html>
