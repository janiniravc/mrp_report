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
        ${css}
    </style>
    <title>Cost of Business Audits Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>Cost of Business Audits Report (rework)</u></b></h2>
		<br/>
		%for mrp_production in get_work_order(data['form']):
		<table width="100%" cellspacing="0" cellpadding="4">
            <tr height="30px">
                <td width="5%" align="right" id="tableheading"><b>${_("Date:")}</b></td>
                <td width="15%" align="left" id="tableheading"><b>${formatLang(mrp_production.date_planned, date=True)}</b></td>
                <td width="20%" align="left" id="tableheading"><b>${_("No. of ordered work :")}</b></td>
                <td width="15%" align="left" id="tableheading"><b>${mrp_production.name}</b></td>
                <td width="10%" align="left" id="tableheading"><b>${_("Product name:")}</b></td>
                <td width="30%" align="left" id="tableheading"><b>${mrp_production.product_id.name or ''}</b></td>
            </tr>
        </table>
        <br/>
		
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
				<td align="right" id="tableheading"></td>
				<td colspan="5" align="center" id="tableheading"><b>${_("Cost of hours for laborers")}</b></td>
				<td colspan="4" align="center" id="tableheading"><b>${_("Cost of changed mater")}</b></td>
			</tr>
			<tr height="30px">
				<td width="4%" align="right" id="tableheading"><b>${_("S/N")}</b></td>
				<td align="left" id="tableheading"><b>${_("The names of workers")}</b></td>
				<td align="left" id="tableheading"><b>${_("Hours")}</b></td>
				<td align="left" id="tableheading"><b>${_("Station")}</b></td>
				<td align="left" id="tableheading"><b>${_("Cost/laborer (SDG)")}</b></td>
				<td align="left" id="tableheading"><b>${_("cost of hours for laborers (SDG)")}</b></td>
				<td align="left" id="tableheading"><b>${_("Part name/Part number")}</b></td>
				<td align="left" id="tableheading"><b>${_("Quantity")}</b></td>
				<td align="left" id="tableheading"><b>${_("Price (SDG)")}</b></td>
				<td align="left" id="tableheading"><b>${_("Cost of Materials")}</b></td>
			</tr>
			<% cnt = 0 %>
			<% total = total_part_cost_of_material = percentage = 0 %>
            %for line in get_line(mrp_production):
                <% cnt += 1 %>
                <% total += line.get('workers_hour_cost',0) %>
                <% total_part_cost_of_material += line.get('part_cost_of_material',0) %>
                <tr height="20px">
                    <td align="right" id="tableheading">${cnt}</td>
                    <td align="left" id="tableheading">${line.get('workers_name','')}</td>
                    <td align="left" id="tableheading">${line.get('workers_hour','0')}</td>
                    <td align="left" id="tableheading">${line.get('workers_station','')}</td>
                    <td align="left" id="tableheading">${line.get('workers_per_hour_cost','0')}</td>
                    <td align="left" id="tableheading">${line.get('workers_hour_cost','0')}</td>
                    <td align="left" id="tableheading">${line.get('part_name','')}</td>
                    <td align="left" id="tableheading">${line.get('part_qty','0')}</td>
                    <td align="left" id="tableheading">${line.get('part_price','0')}</td>
                    <td align="left" id="tableheading">${line.get('part_cost_of_material','0')}</td>
                </tr>
                
            %endfor
            <% percentage =  (total+total_part_cost_of_material * 100) / 100 %>
                <tr height="20px">
                    <td align="left" colspan="5" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${total}</td>
                    <td align="left" colspan="4" id="tableheading">${_("Total")}</td>
                </tr>
                <tr height="20px">
                    <td align="left" colspan="5" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${total+total_part_cost_of_material}</td>
                    <td align="left" colspan="4" id="tableheading">${_("Total Cost of rework for job order")}</td>
                </tr>
                <tr height="20px">
                    <td align="left" colspan="5" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${100}</td>
                    <td align="left" colspan="4" id="tableheading">${_("Total Cost of production for job")}</td>
                </tr>
                <tr height="20px">
                    <td align="left" colspan="5" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${percentage}</td>
                    <td align="left" colspan="4" id="tableheading">${_("(%) Percentage Cost of rework")}</td>
                </tr>
		<table>
		%endfor
		
        
	</body>
</html>
