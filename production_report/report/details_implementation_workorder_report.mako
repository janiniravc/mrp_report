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
    <title>Details Implementation Work Order Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>Details of Implementation of Work Order</u></b></h2>
		<br/>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
				<td width="20%" align="right" id="tableheading"><b>${_("Date : ")}</b></td>
				<td width="30%" align="left" id="tableheading"><b>${_("")}</b></td>
				<td width="20%" align="right" id="tableheading"><b>${_("Department: ")}</b></td>
				<td width="30%" align="left" id="tableheading"><b>${_(" ")}</b></td>
			</tr>
			<tr>
				<td align="right" id="tableheading"><b>${_("job Order No:")}</b></td>
				<td align="left" id="tableheading"><b>${_("")}</b></td>
				<td align="right" id="tableheading"><b>${_("Product Name: ")}</b></td>
				<td align="left" id="tableheading"><b>${_("")}</b></td>
			</tr>
			<tr>
				<td align="right" id="tableheading"><b>${_("Factory:")}</b></td>
				<td align="left" id="tableheading"><b>${_("")}</b></td>
				<td align="right" id="tableheading"><b>${_(" ")}</b></td>
				<td align="left" id="tableheading"><b>${_("")}</b></td>
			</tr>
		</table>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
				<td rowspan="2" width="3%" align="left" id="tableheading"><b>${_("S/N")}</b></td>
				<td rowspan="2" width="7%" align="left" id="tableheading"><b>${_("VIN No")}</b></td>
				<td rowspan="2" width="10%" align="left" id="tableheading"><b>${_("Engine Number")}</b></td>
				<td rowspan="2" width="10%" align="left" id="tableheading"><b>${_("Color")}</b></td>
				<td rowspan="2" width="10%" align="center" id="tableheading"><b>${_("Date of Production")}</b></td>
				<td rowspan="2" width="15%" align="center" id="tableheading"><b>${_("History Of Quality Permit")}</b></td>
				<td rowspan="2" width="15%" align="center" id="tableheading"><b>${_("Date of Entry of Full Product Warehouse (Switching to Next Factory)")}</b></td>
				<td colspan="2" align="center" id="tableheading"><b>${_("Existence of Notes")}</b></td>
			</tr>
			<tr height="30px">
				<td width="15%" align="left" id="tableheading"><b>${_("Shortfalls")}</b></td>
				<td width="15%" align="left" id="tableheading"><b>${_("Note Quality")}</b></td>
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
                </tr>
            %endfor
		<table>
		<br/>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
				<td>
            		Date of entry into the store for factory assembly only to the other factories  being the date of entry to the store is the date of transfer to the next factory
            	</td>
            </tr>
	</body>
</html>
