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
    <title>QUALITY CHECKLIST FOR EACH STATION REPORT</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>QUALITY CHECKLIST FOR EACH STATION REPORT</u></b></h2>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4" border="0" style="border:none">
		    <tr height="30px" class="noborder">
                <td width="50%" align="right" id="tableheading"><b>${_("Quality section")}</b></td>
                <td width="50%" align="left" id="tableheading"><b>${_("...........")}</b></td>
            </tr>
            <tr height="30px" class="noborder">
                <td width="50%" align="right" id="tableheading"><b>${_("Factory")}</b></td>
                <td width="50%" align="left" id="tableheading"><b>${_("...........")}</b></td>
            </tr>
            <tr height="30px" class="noborder">
                <td width="50%" align="right" id="tableheading"><b>${_("Station")}</b></td>
                <td width="50%" align="left" id="tableheading"><b>${_("...........")}</b></td>
            </tr>
		</table>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
			    <td align="left" id="tableheading"><b>${_("Inspection Name")}</b></td>
				<td align="left" id="tableheading"><b>${_("Inspection Code")}</b></td>
				<td align="left" id="tableheading"><b>${_("Maximum time for inspection")}</b></td>
				<td align="left" id="tableheading"><b>${_("Actual time")}</b></td>
				<td align="left" id="tableheading"><b>${_("Deviation")}</b></td>
			</tr>
			
			%for i in range(5):
				<% cnt = i+1 %>
                <tr height="20px">
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