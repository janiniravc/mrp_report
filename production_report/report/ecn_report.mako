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
    <title>ECN Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>ECN Report</u></b></h2>
		<br/>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
				<td width="5%" align="right" id="tableheading"><b>${_("Date:")}</b></td>
				<td width="15%" align="left" id="tableheading"><b>${_("")}</b></td>
				<td width="20%" align="left" id="tableheading"><b>${_("Message number/Lot:")}</b></td>
				<td width="20%" align="left" id="tableheading"><b>${_(" ")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Product name:")}</b></td>
				<td width="30%" align="left" id="tableheading"><b>${_("")}</b></td>
			</tr>
		</table>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
				<td align="right" id="tableheading"></td>
				<td colspan="3" align="center" id="tableheading"><b>${_("Before the Amendment")}</b></td>
				<td colspan="3" align="center" id="tableheading"><b>${_("Before the Amendment")}</b></td>
				<td align="center" id="tableheading"><b>${_(" ")}</b></td>
			</tr>
			<tr height="30px">
				<td width="4%" align="right" id="tableheading"><b>${_("S/N")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("Part No.")}</b></td>
				<td width="22%" align="left" id="tableheading"><b>${_("Part Name(Arabic, English)")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("Quantity/Unit")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("Part No.")}</b></td>
				<td width="22%" align="left" id="tableheading"><b>${_("Part Name(Arabic, English)")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("Quantity/Unit")}</b></td>
				<td width="20%" align="left" id="tableheading"><b>${_("The Reason for the Amendment")}</b></td>
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
		<br>
        <table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
				<td align="right" id="tableheading"><b>${_("* With the possibility of comparing the amendments between different LOTs per product")}</b></td>
			</tr>
		</table>
            
	</body>
</html>
