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
    <title>Weekly Production Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>The Planning and Production Control</u></b></h2>
		<h2 align="center"><b><u>Weekly Production Report</u></b></h2>
		<br/>
		<table width="100%">
			
			<tr height="30px">
                <td align="right" id="tableheading"><b>${_("From Date :")}</b></td>
                <td align="left">${formatLang(data['form']['start_date'], date=True)}</td>
                <td align="right" id="tableheading"><b>${_("To Date :")}</b></td>
                <td align="left">${formatLang(data['form']['end_date'], date=True)}</td>
            </tr>
		</table>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
               <td width="7%" align="left" rowspan="2" id="tableheading"><b>${_("The Factory")}</b></td>
				<td width="7%" align="left" rowspan="2" id="tableheading"><b>${_("Products")}</b></td>
				<td width="7%" align="left" rowspan="2" id="tableheading"><b>${_("Plan")}</b></td>
				<td width="7%" align="left" rowspan="2" id="tableheading"><b>${_("Done")}</b></td>
                <td align="center" colspan="7" id="tableheading"><b>${'Under the Progress'}</b></td>
                </tr>
			<tr>
				<td width="10%" align="left" id="tableheading"><b>${_("Warehouse")}</b></td>
				<td width="10%" align="left" id="tableheading"><b>${_("Production")}</b></td>
				<td width="9%" align="left" id="tableheading"><b>${_("Quality")}</b></td>
				<td width="9%" align="left" id="tableheading"><b>${_("Audits")}</b></td>
				<td width="9%" align="left" id="tableheading"><b>${_("PDI")}</b></td>
				<td width="9%" align="left" id="tableheading"><b>${_("The lack of conformity")}</b></td>
				<td width="9%" align="left" id="tableheading"><b>${_("Total")}</b></td>
			</tr>
			
			%for factory in get_factory():
                <tr height="30px">
                    <td align="left" id="tableheading">${factory.name or ''}</td>
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
            
            <tr height="30px">
	            <td align="left" colspan="10"id="tableheading">${_("The total of the products under the progress is in the assembly plant")}</td>
	            <td align="left" id="tableheading">${''}</td>
	        </tr>
			<tr height="30px">
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
			</table>
			
			<br/>
			<table width="100%">
			<tr height="40px">
				<td width="25%" align="right" id="tableheading"><b>${_("Head of the planning and production control:")}</b></td>
				<td width="25%" align="left" valign="bottom" id="tableheading"><b>..........................</b></td>
				<td width="25%" align="right" id="tableheading"><b>${_("Head of the Production Control Unit:")}</b></td>
				<td width="25%" align="left" valign="bottom" id="tableheading"><b> ..........................</b></td>
			</tr>
			<tr height="40px">
				<td width="25%" align="center" colspan="4" id="tableheading"><b>${_("The approval of the Director of production:...........................")}</b></td>
			</tr>
			</table>
	</body>
</html>
