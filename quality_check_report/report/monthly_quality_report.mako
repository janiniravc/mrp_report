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
    <title>Monthly QUALITY REPORT</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>MONTHLY QUALITY REPORT</u></b></h2>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4" >
		    <tr height="30px">
		        <td width="25%" align="right" id="tableheading"><b>${_("Date ")}</b></td>
                <td width="25%" align="left" id="tableheading"><b></b></td>
                
                <td width="25%" align="right" id="tableheading"><b>${_("Factory ")}</b></td>
                <td align="left" id="tableheading"></td>
            </tr>
            <tr height="30px">
                <td width="25%" align="right" id="tableheading"><b>${_("From Date ")}</b></td>
                <td width="25%" align="left" id="tableheading"><b></b></td>
                
                <td width="25%" align="right" id="tableheading"><b>${_("To Date ")}</b></td>
                <td align="left" id="tableheading"></td>
            </tr>
		</table>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
		    <tr height="30px">
		      <td align="right" id="tableheading"><b></b></td>
                <td align="left" id="tableheading"><b></b></td>
                <td align="left" id="tableheading"><b></b></td>
                <td align="left" id="tableheading"><b>${_("Return")}</b></td>
                <td align="left" id="tableheading"><b>${_("Accepted")}</b></td>
                <td align="left" id="tableheading"><b></b></td>
                <td align="left" id="tableheading"><b>${_("notes")}</b></td>
		    </tr>
			<tr height="30px">
			    <td align="right" id="tableheading"><b>${_("S/N")}</b></td>
				<td align="left" id="tableheading"><b>${_("Products")}</b></td>
				<td align="left" id="tableheading"><b>${_("The recipient to inspect")}</b></td>
				<td align="left" id="tableheading"><b>${_("For review")}</b></td>
				<td align="left" id="tableheading"><b>${_("For delivery")}</b></td>
				<td align="left" id="tableheading"><b>${_("Non matching")}</b></td>
				<td align="left" id="tableheading"><b>${_("The period of stay (Day)")}</b></td>
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
                </tr>
            %endfor
		<table>
	</body>
</html>