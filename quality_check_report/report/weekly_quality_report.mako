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
    <title>Weekly QUALITY REPORT</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>WEEKLY QUALITY REPORT</u></b></h2>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4" >
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
			    <td align="right" rowspan="3" id="tableheading"><b>${_("S/N")}</b></td>
				<td align="left" id="tableheading"><b>${_("Name")}</b></td>
				<td align="left" colspan="6" id="tableheading"><b>${_("The inspection result")}</b></td>
				<td align="left" rowspan="3" id="tableheading"><b>${_("notes")}</b></td>
			</tr>
			<tr height="30px">
                <td align="right" id="tableheading"><b>${_("Product / The Process")}</b></td>
                <td align="left" id="tableheading"><b>${_("Recipient")}</b></td>
                <td align="left" rowspan="2" id="tableheading"><b>${_("identical")}</b></td>
                <td align="left" id="tableheading"><b>${_("Returns")}</b></td>
                <td align="left" rowspan="2" id="tableheading"><b>${_("Non-matching")}</b></td>
                <td align="left" id="tableheading"><b>${_("After Matching")}</b></td>
                <td align="left" id="tableheading"><b>${_("Accepted")}</b></td>
            </tr>
            <tr height="30px">
                <td align="right" id="tableheading"><b></b></td>
                <td align="left" id="tableheading"><b>${_("To inspection")}</b></td>
                <td align="left" id="tableheading"><b>${_("For review")}</b></td>
                <td align="left" id="tableheading"><b>${_("Review")}</b></td>
                <td align="left" id="tableheading"><b>${_("For Delivery")}</b></td>
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
	</body>
</html>