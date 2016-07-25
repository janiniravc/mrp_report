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
    <title>Auxiliary Materials of Product Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>Report of the List of Auxiliary Materials of Product per Station</u></b></h2>
		<br/>
		<br/>
		<% result = get_data(data['form']['product_id'][0],data['form']['station_ids'],data['form']['start_date'],data['form']['end_date']) %>
		%for data_dict in result:
			<br/>
			<br/>
			<table width="100%" cellspacing="0" cellpadding="4">
				<tr height="30px">
					<td width="5%" align="right" id="tableheading"><b>${_("Date")}</b></td>
					<td width="15%" align="left" id="tableheading">${formatLang(data_dict['date'],date=True)}</td>
					<td width="10%" align="left" id="tableheading"><b>${_("Product Name")}</b></td>
					<td width="30%" align="left" id="tableheading"><b>${data_dict['product']}</b></td>
					<td width="10%" align="left" id="tableheading"><b>${_("Station")}</b></td>
					<td width="30%" align="left" id="tableheading"><b>${data_dict['station']}</b></td>
				</tr>
			</table>
			<br/>
			<table width="100%" cellspacing="0" cellpadding="4">
				<tr height="30px">
					<td width="3%" align="right" id="tableheading"><b>${_("S/N")}</b></td>
					<td width="8%" align="left" id="tableheading"><b>${_("PART CODE")}</b></td>
					<td width="8%" align="left" id="tableheading"><b>${_("PART NO")}</b></td>
					<td width="14%" align="left" id="tableheading"><b>${_("PART NAME (EN)")}</b></td>
					<td width="13%" align="left" id="tableheading"><b>${_("PART NAME (AR)")}</b></td>
					<td width="8%" align="left" id="tableheading"><b>${_("QTY/UNIT")}</b></td>
					<td width="8%" align="left" id="tableheading"><b>${_("UNIT")}</b></td>
					<td width="14%" align="left" id="tableheading"><b>${_("STATION")}</b></td>
					<td width="14%" align="left" id="tableheading"><b>${_("TASK NAME")}</b></td>
					<td width="10%" align="left" id="tableheading"><b>${_("TASK CODE")}</b></td>
				</tr>
				
				<% cnt = 0 %>
				%for material in data_dict['material_obj_lst']:
					<% cnt = cnt+1 %>
	                <tr height="30px">
	                    <td align="right" id="tableheading">${cnt}</td>
	                    <td align="left" id="tableheading">${material.product_id.default_code}</td>
	                    <td align="left" id="tableheading">${'?'}</td>
	                    <td align="left" id="tableheading">${material.product_id.name}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="right" id="tableheading">${formatLang(material.product_qty)}</td>
	                    <td align="left" id="tableheading">${material.product_uom.name}</td>
	                    <td align="left" id="tableheading">${material.workcenter_id.name}</td>
	                    <td align="left" id="tableheading">${material.task_line_id and material.task_line_id.name}</td>
	                    <td align="left" id="tableheading">${material.task_line_id and material.task_line_id.code}</td>
	                </tr>
	            %endfor
	         </table>
	         <p style="page-break-before:always"></p>
	      %endfor
            
	</body>
</html>
