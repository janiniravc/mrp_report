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
    <title>UNPACKING & QUALITY REPORT</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>UNPACKING & QUALITY REPORT</u></b></h2>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4" >
		    <tr height="30px">
		        <td width="25%" align="right" id="tableheading"><b>${_("Product model")}</b></td>
                <td width="25%" align="left" id="tableheading"><b></b></td>
                
                <td width="25%" align="right" id="tableheading"></td>
                <td align="left" id="tableheading"></td>
            </tr>
            
			<tr height="30px">
			    <td align="right" id="tableheading"><b>${_("LOT no.")}</b></td>
                <td align="left" id="tableheading"><b></b></td>
                
                <td align="right" id="tableheading"><b>${_("Report Date")}</b></td>
                <td align="left" id="tableheading"><b></b></td>
                
				
			</tr>
			<tr height="30px">
                <td align="right" id="tableheading"><b>${_("Unpacking Date")}</b></td>
                <td align="left" id="tableheading"><b></b></td>
                
                <td align="right" id="tableheading"></td>
                <td align="left" id="tableheading"></td>
            </tr>
            <tr height="30px">
                <td align="right" id="tableheading"><b>${_("Production Date")}</b></td>
                <td align="left" id="tableheading"><b></b></td>
                
                <td align="right" id="tableheading"></td>
                <td align="left" id="tableheading"></td>
            </tr>
		</table>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
			    <td width="4%" align="right" id="tableheading"><b>${_("S/N")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("SAP NUMBER")}</b></td>
				<td width="22%" align="left" id="tableheading"><b>${_("PART NUMBER")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("PART NAME")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("chinese name")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("BOX No.")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("QTY CLAIMED")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("lot no")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("reason CODE")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("NOTE")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("photos/good and not good")}</b></td>
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
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4" class="noBorder">
            <tr height="30px" class="noborder">
                <td align="left" id="tableheading"><b>${_("NOTE : ")}</b></td>
                <td colspan="3" align="left" id="tableheading"><b>...............................</b></td>
            </tr>
            <tr height="30px" class="noborder">
                <td align="left" id="tableheading"><b>${_("Prepared by")}</b></td>
                <td align="left" id="tableheading"><b>............................</b></td>
                <td align="left" id="tableheading"><b>${_("Checked by")}</b></td>
                <td align="left" id="tableheading"><b>............................</b></td>
            </tr>
		</table>
	</body>
</html>