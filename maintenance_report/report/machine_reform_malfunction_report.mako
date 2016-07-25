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
        .noborder td
        {
            border:none;
        }
        ${css}
    </style>
    <title>Maintenance Report</title>
</head>
	<body>
		<%setLang(user.lang)%>
		%for o in objects:
			<h2 style="text-align:center;">${_("The report of the implementation of the reform of the malfunction")}</h2>
			<table width="100%" border="0" cellspacing="0" cellpadding="2">
				<tr>
					<td width="5%">${_("Machine name / Equipment")}</td>
					<td>${o.asset_id and o.asset_id.name or ''}</td>
					<td width="5%">${_("Reports in accordance with maintenance")}</td>
					<td >${_("No")}</td>
					<td >${_("Date")}</td>
                    <td>${formatLang(o.date_planned,date=True)}</td>
				</tr>
	        </table>
			<br/>
			<table width="100%" border="1" cellspacing="0" cellpadding="10" style="border-left:2px solid black;border-right:2px solid black;border-top:2px solid black;border-bottom:2px solid black;">
			<tr class="noborder">
			 <td>
			     <table width="100%" border="0" cellspacing="0" cellpadding="2">
			        <tr>
                        <td width="5%">${_("Request Date")}</td>
                        <td>${formatLang(o.date_planned,date=True)}</td>
                        <td width="5%">${_("Reform time")}</td>
                        <td >${_("From")}</td>
                        <td>${formatLang(o.ready_date,date=True)}</td>
                        <td >${_("To")}</td>
                        <td>${formatLang(o.done_date,date=True)}</td>
                    </tr>
			     </table>
			 </td>
			</tr>
            <tr class="noborder">
                <td><b>${_("Explain the problem")}</b>    <p style="border-bottom:1px solid black;">${o.problem_description or ''}</p></td>
            </tr>
            <tr class="noborder">
                <td><b>${_("Actions taken")}</b>     <p style="border-bottom:1px solid black;">${o.solution_description or ''}</p></td>
            </tr>
            <tr>
                <td>${_("Spare parts replacement (if Any)")}
                    <table width="100%" border="0" cellspacing="0" cellpadding="2" style="border 1px solid black;border-collapse:collapse;">
                    <tr class="border_bottom_head">
                        <th>${_("Parts")}</th>
                        <th>${_("Quantity")}</th>
                        <th>${_("Price")}</th>
                    </tr>
                    %for part_line in  o.parts_lines:
                    <tr class="" style="height:25px;">
                        <td>${part_line.parts_id and part_line.parts_id.name or ''}</td>
                        <td>${part_line.parts_qty}</td>
                        <td style="text-align:center;">${ part_line.parts_id and formatLang(part_line.parts_id.list_price, dp='Account') or 0 }</td>
                    </tr>
                    %endfor
                    </table>
                </td>
            </tr>
            <tr class="noborder">
                <td>
                    <b>${_("Been Repaired")}</b>
                    <% failure_status = '' %>
                    %if o.failure_status == 'fixed':
                        <% failure_status = 'Fixed' %>
                    %elif o.failure_status == 'not_fixed':
                        <% failure_status = 'Not Fixed' %>
                    %endif
                    ${failure_status}
                </td>
            </tr>
            <tr class="noborder">
                <td>
                    ${_("Malfunction Classification")}
                    <% failure_class = '' %>
                    %if o.failure_class == 'affective':
                        <% failure_class = 'Affective' %>
                    %elif o.failure_class == 'not_affective':
                        <% failure_class = 'Not Affective' %>
                    %endif
                     ${failure_class}
                </td>
            </tr>
            <tr class="noborder">
                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="2" style="border 1px solid black;border-collapse:collapse;">
                        <tr>
                            <td >${_("The case of the machine After Reform")} : </td>
                            <td >${_("Interim Operating")} : </td>
                            <td width="120px"><b>${o.received_status or ''}</b></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr class="noborder">
                <td><b>${_("There is no reform of machine / Equipment prepared because of")}</b>     <p style="border-bottom:1px solid black;">${o.damage_description or ''}</p></td>
            </tr>
            <tr class="noborder">
                <td><b>${_("Observations and recommendations")}</b>     <p style="border-bottom:1px solid black;">${o.recommendations or ''}</p></td>
            </tr>
            <tr class="noborder">
                <td><b>${_("the executors names/process of reform")}</b>     <p style="border-bottom:1px solid black;">${o.eng_name_id and o.eng_name_id.name or ''}</p></td>
            </tr>
            
            
            <tr class="noborder">
                <td><b>${_("Signature of Maintenance Engineer")}</b>     <p style="border-bottom:1px solid black;"> </p></td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="2" style="border 1px solid black;border-collapse:collapse;">
                        <tr style="text-align:center;">
                            <td>
                                ${_("Maintenance Engineer")}
                            </td>
                            <td>
                                ${_("Signature")} <br/>-----------------------
                            </td>
                            <td width="120px"></td>
                            <td>
                                ${_("Date")} : <br/>
                            </td>
                            <td width="120px"></td>
                        </tr>
                    </table>
                </td>
            </tr>
			</table>
			<br/>

	        <br/>
	        <br/>
	        <br/>
	        <br/>
	        <br/>
	        <table width="100%">
	        	
	        </table>
	        
	        <p style="page-break-before:always"></p>
        %endfor
	</body>
</html>