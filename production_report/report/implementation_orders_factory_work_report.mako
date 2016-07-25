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
    <title>The report of the implementation of orders of Factory Work</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>Implementation of orders of Factory Work</u></b></h2>
		<br/>
		%for mrp_production in get_line(data['form']):
		<table width="100%" cellspacing="0" cellpadding="4" class="noBorder">
			<tr height="30px" class="noborder">
			    <td align="right" id="tableheading"></td>
                <td align="left" id="tableheading"></td>
                
				<td width="25%" align="right" id="tableheading"><b>${_("Date")} : </b></td>
				<td width="25%" align="left" id="tableheading">${formatLang(mrp_production.date_planned, date=True)}</td>
			</tr>
			<tr height="30px" class="noborder">
                <td align="right" id="tableheading"><b>${_("Factory")} : </b></td>
                <td align="left" id="tableheading">${mrp_production.routing_id and mrp_production.routing_id.factory_id and mrp_production.routing_id.factory_id.name or ''}</td>
                
                <td align="right" id="tableheading"><b>${_("Job Order No.")} : </b></td>
                <td align="left" id="tableheading">${mrp_production.daily_job_order_id and mrp_production.daily_job_order_id.general_job_order_id and mrp_production.daily_job_order_id.general_job_order_id.production_order_no or ''}</td>
            </tr>
            <tr height="30px" class="noborder">
                <td align="right" id="tableheading"></td>
                <td align="left" id="tableheading"></td>
                
                <td width="25%" align="right" id="tableheading"><b>${_("Product Name")} : </b></td>
                <td width="25%" align="left" id="tableheading">${mrp_production.product_id and mrp_production.product_id.name or ''}</td>
            </tr>
		</table>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
			    <td width="4%" align="right" id="tableheading"><b>${_("S/N")}</b></td>
			    <td width="8%" align="left" id="tableheading"><b>${_("Date")}</b></td>
			    <td width="8%" align="left" id="tableheading"><b>${_("Plan")}</b></td>
			    <td width="8%" align="left" id="tableheading"><b>${_("Done")}</b></td>
			    <td width="8%" align="left" id="tableheading"><b>${_("Deviation (Plan - Done)")}</b></td>
			    <td width="22%" align="left" id="tableheading"><b>${_("100 The execution Date (Plan/Done)")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("The reasons for the deviation")}</b></td>
			</tr>
			%if mrp_production.daily_job_order_id and mrp_production.daily_job_order_id.general_job_order_id:
			    <% plan_qty = done_qty = 0 %>
			    <% plan_qty = mrp_production.product_qty %>
			    %if mrp_production.state == 'done':
			         <% done_qty = mrp_production.product_qty %>
			    %endif
                <tr height="20px">
                    <td align="right" id="tableheading">${1}</td>
                    <td align="left" id="tableheading">${formatLang(mrp_production.daily_job_order_id.general_job_order_id.date,date=True)}</td>
                    <td align="left" id="tableheading">${plan_qty}</td>
                    <td align="left" id="tableheading">${done_qty}</td>
                    <td align="left" id="tableheading">${plan_qty-done_qty}</td>
                    <td align="left" id="tableheading">${done_qty/plan_qty * 100}</td>
                    <td align="left" id="tableheading">${''}</td>
                </tr>
            %endif
		<table>
		<br/>
		<% start_date_last_year, end_date_last_year = get_dates(data['form']) %>
		<h4 align="right"><b><u>* with the possibility of comparison between works.</u></b></h4>
		<p style="page-break-before:always"></p>
		<table width="100%" cellspacing="0" cellpadding="4" class="noBorder">
            <tr height="30px" class="noborder">
                <td width="30%" align="right" id="tableheading"></td>
                <td width="25%" align="left" id="tableheading"></td>
                
                <td width="25%" align="right" id="tableheading"><b>${_("Possibility to Comparability between the period for the period (Implementation of the annual production plan and quarterly and monthly with a comparison with previous years)")}</b></td>
                <td width="20%" align="left" id="tableheading"><b></b></td>
            </tr>
            <tr height="30px" class="noborder">
                <td align="right" id="tableheading"><b>${_("From")}</b> : ${formatLang(start_date_last_year,date=True)}<b> ${_("To")}</b> : ${formatLang(end_date_last_year,date=True)}</td>
                <td align="left" id="tableheading"><b>${_("Product Name")} : </b> ${mrp_production.product_id and mrp_production.product_id.name or ''}</td>
                
                <td align="right" id="tableheading"><b>${_("Factory")} : </b></td>
                <td align="left" id="tableheading">${mrp_production.routing_id and mrp_production.routing_id.factory_id and mrp_production.routing_id.factory_id.name or ''}</td>
            </tr>
        </table>
        <br/>
        <table width="100%" cellspacing="0" cellpadding="4">
            <tr height="30px">
                <td width="4%" align="right" id="tableheading"><b>${_("S/N")}</b></td>
                <td width="8%" align="left" id="tableheading"><b>${_("Job Order No")}</b></td>
                <td width="8%" align="left" id="tableheading"><b>${_("Plan")}</b></td>
                <td width="8%" align="left" id="tableheading"><b>${_("Done")}</b></td>
                <td width="8%" align="left" id="tableheading"><b>${_("Deviation (Done-Plan)")}</b></td>
                <td width="22%" align="left" id="tableheading"><b>${_("100 The execution Date (Done/Plan)")}</b></td>
                <td width="8%" align="left" id="tableheading"><b>${_("The reasons for the deviation")}</b></td>
            </tr>
            <% cnt = 0 %>
            %for order_data in get_last_year_order(start_date_last_year, end_date_last_year, mrp_production.product_id.id or False, mrp_production.routing_id and mrp_production.routing_id.factory_id.id or False):
                <% cnt += 1 %>
                <tr height="20px">
                    <td align="right" id="tableheading">${cnt}</td>
                    <td align="left" id="tableheading">${order_data.get('job_order_no','')}</td>
                    <td align="left" id="tableheading">${order_data.get('plan_qty',0)}</td>
                    <td align="left" id="tableheading">${order_data.get('done_qty',0)}</td>
                    <td align="left" id="tableheading">${order_data.get('deviation',0)}</td>
                    <td align="left" id="tableheading">${order_data.get('deviation_per',0)}</td>
                    <td align="left" id="tableheading">${''}</td>
                </tr>
            %endfor
        <table>
        %endfor
	</body>
</html>
