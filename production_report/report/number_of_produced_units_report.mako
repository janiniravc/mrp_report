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
        .noborder td
        {
            border:none;
        }
        table.noBorder {border: none;}
        ${css}
    </style>
    <title>The report of the number of produced units</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>The report of the number of produced units</u></b></h2>
		<br/>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4" class="noBorder">
			<tr height="30px" class="noborder">
				<td width="25%" align="right" id="tableheading"><b>${_("Product Name")}</b></td>
				<td width="25%" align="left" id="tableheading"><b></b></td>
				
				<td width="25%" align="left" id="tableheading"><b>${_("Job Order No")}</b></td>
				<td width="25%" align="left" id="tableheading"><b></b></td>
			</tr>
			<tr height="30px" class="noborder">
                <td align="right" id="tableheading"><b>${_("Station/Line")}</b></td>
                <td align="left" id="tableheading"><b></b></td>
                
                <td align="left" id="tableheading"><b>${_("The Planned Production")}</b></td>
                <td align="left" id="tableheading"><b></b></td>
            </tr>
            <tr height="30px" class="noborder">
                <td align="right" id="tableheading"></td>
                <td align="left" id="tableheading"></td>
                
                <td align="left" id="tableheading"><b>${_("The number of producing units")}</b></td>
                <td align="left" id="tableheading"><b></b></td>
            </tr>
            <tr height="30px" class="noborder">
                <td align="right" id="tableheading"></td>
                <td align="left" id="tableheading"></td>
                
                <td align="left" id="tableheading"><b>${_("The details of the production")}</b></td>
                <td align="left" id="tableheading"><b></b></td>
            </tr>
		</table>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
			    <td width="4%" align="right" id="tableheading"><b>${_("S/N")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("The status (Complete/incomplete)")}</b></td>
				<td width="22%" align="left" id="tableheading"><b>${_("Color")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("Engine No")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("Vin / No")}</b></td>
			</tr>
			
			%for i in range(5):
				<% cnt = i+1 %>
                <tr height="20px">
                    <td align="right" id="tableheading">${cnt}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                </tr>
            %endfor
		<table>
		    
	</body>
</html>
