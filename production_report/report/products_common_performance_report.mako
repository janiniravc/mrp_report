<html>
<head>
    <style type="text/css">
       table {
            border-collapse: collapse;
        }
        
        table, th {
            border:2px solid #e6e6e6;
        }
        table, td{
            border:1px solid #e6e6e6;
        }
        ${css}
    </style>
    <title>Assets Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<br/>
		<h2 align="center"><br>Report of Common Performance</h2>
		<br/>
		<table width="100%" border="1" cellspacing="0" cellpadding="4" style="border: 1px solid #e6e6e6;">
			<tr>
				<td align="center" rowspan="2" id="tableheading"><b>${_("Sr No.")}</b></td>
				<td align="center" rowspan="2" id="tableheading"><b>${_("Products")}</b></td>
				<td style="border-bottom:2px solid #e6e6e6;" colspan="4" align="center" id="tableheading"><b>${_("The performance during the month")}</b></td>
				<td style="border-bottom:2px solid #e6e6e6;" colspan="4" align="center" id="tableheading"><b>${_("Performance until the end of the period")}</b></td>
                <td style="border-bottom:2px solid #e6e6e6;" colspan="4" align="center" id="tableheading"><b>${_("The performance during the year")}</b></td>
				<td style="border-bottom:2px solid #e6e6e6;" colspan="3" align="center" id="tableheading"><b>${_("The performance of the five-year plan")}</b></td>
			</tr>
			<tr>
                <td align="center" id="tableheading"><b>${_("Plan")}</b></td>
                <td align="center" id="tableheading"><b>${_("Done")}</b></td>
                <td align="center" id="tableheading"><b>${_("Percentage")}</b></td>
                <td align="center" id="tableheading"><b>${_("Under the progress")}</b></td>
                
                <td align="center" id="tableheading"><b>${_("Plan")}</b></td>
                <td align="center" id="tableheading"><b>${_("Done")}</b></td>
                <td align="center" id="tableheading"><b>${_("Percentage")}</b></td>
                <td align="center" id="tableheading"><b>${_("Under the progress")}</b></td>
                
                <td align="center" id="tableheading"><b>${_("Plan")}</b></td>
                <td align="center" id="tableheading"><b>${_("Done")}</b></td>
                <td align="center" id="tableheading"><b>${_("Percentage")}</b></td>
                <td align="center" id="tableheading"><b>${_("Under the progress")}</b></td>
                
                <td align="center" id="tableheading"><b>${_("Plan")}</b></td>
                <td align="center" id="tableheading"><b>${_("Done")}</b></td>
                <td align="center" id="tableheading"><b>${_("Percentage")}</b></td>
            </tr>
            <% sr_no = 0 %>
			%for product_data in get_products_line(data['form']):
			<% sr_no += 1 %>
			<tr>
			     <td align="left" id="tabledata">${sr_no}</td>
			     <td align="left" id="tabledata">${product_data['product_name']}</td>
			     <td align="left" id="tabledata">${product_data['month_plan']}</td>
			     <td align="left" id="tabledata">${product_data['month_done']}</td>
                 <td align="left" id="tabledata">${product_data['month_percentage']}</td>
                 <td align="left" id="tabledata">${product_data['month_progress']}</td>
                 
                 <td align="left" id="tabledata">${product_data['period_plan']}</td>
                 <td align="left" id="tabledata">${product_data['period_done']}</td>
                 <td align="left" id="tabledata">${product_data['period_percentage']}</td>
                 <td align="left" id="tabledata">${product_data['period_progress']}</td>
                 
                 <td align="left" id="tabledata">${product_data['current_year_plan']}</td>
                 <td align="left" id="tabledata">${product_data['current_year_done']}</td>
                 <td align="left" id="tabledata">${product_data['current_year_percentage']}</td>
                 <td align="left" id="tabledata">${product_data['current_year_progress']}</td>
                 
                 <td align="left" id="tabledata">${product_data['five_year_plan']}</td>
                 <td align="left" id="tabledata">${product_data['five_year_done']}</td>
                 <td align="left" id="tabledata">${product_data['five_year_progress']}</td>
			</tr>
			%endfor
        </table>
        
	</body>
</html>
