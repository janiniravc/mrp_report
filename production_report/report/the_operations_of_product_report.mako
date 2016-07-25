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
    <title>The Report of the operations of the product</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>The Report of the operations of the product</u></b></h2>
		<br/>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4" class="noBorder">
			<tr height="30px" class="noborder">
			    <td align="right" id="tableheading"></td>
                <td align="left" id="tableheading"></td>
                
				<td width="25%" align="right" id="tableheading"><b>${_("Product Name")}</b></td>
				<td width="25%" align="left" id="tableheading"><b></b></td>
			</tr>
			<tr height="30px" class="noborder">
                <td align="right" id="tableheading"></td>
                <td align="left" id="tableheading"></td>
                
                <td width="25%" align="right" id="tableheading"><b>${_("Station / The line")}</b></td>
                <td width="25%" align="left" id="tableheading"><b></b></td>
            </tr>
		</table>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
			    <td width="4%" align="right" id="tableheading"><b>${_("S/N")}</b></td>
				<td width="22%" align="left" id="tableheading"><b>${_("standard Time")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("Operation code")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("Operation Name")}</b></td>
			</tr>
			
			%for i in range(5):
				<% cnt = i+1 %>
                <tr height="20px">
                    <td align="right" id="tableheading">${cnt}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                </tr>
            %endfor
		<table>
		
	</body>
</html>
