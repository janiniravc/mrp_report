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
    <title>The management of production Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>The management of production</u></b></h2>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
            <tr height="30px">
                <td width="5%" align="right" id="tableheading"><b>${_("From :")}</b></td>
                <td width="15%" align="left" id="tableheading"><b>${_("............")}</b></td>
                <td width="20%" align="left" id="tableheading"><b>${_("To :")}</b></td>
                <td width="15%" align="left" id="tableheading"><b>${_("............")}</b></td>
            </tr>
            <tr height="30px">
                <td width="5%" align="right" id="tableheading"><b>${_("Factory :")}</b></td>
                <td width="15%" align="left" id="tableheading"><b>${_("............")}</b></td>
                <td width="10%" align="left" id="tableheading"><b>${_("Product :")}</b></td>
                <td width="30%" align="left" id="tableheading"><b>${_("............")}</b></td>
            </tr>
        </table>
        <br/>
		%if data['form']['report_selection'] == 'Productivity of laborers':
			<table width="100%" cellspacing="0" cellpadding="4">
				<tr height="30px">
					<td colspan="5" align="center" id="tableheading"><b>${_("The productivity of labores")}</b></td>
				</tr>
				<tr height="30px">
					<td align="left" id="tableheading"><b>${_("The number of hours of jobs")}</b></td>
					<td align="left" id="tableheading"><b>${_("Number of laborer")}</b></td>
					<td align="left" id="tableheading"><b>${_("Total labores hours")}</b></td>
					<td align="left" id="tableheading"><b>${_("Number of units produced")}</b></td>
					<td align="left" id="tableheading"><b>${_("Productivity")}</b></td>
				</tr>
				%for i in range(5):
	                <tr height="20px">
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                </tr>
	            %endfor
			<table>
			<h4 align="center">Productivity = (total units produced / total working hours)</h4>
		%endif
		
		%if data['form']['report_selection'] == 'Productivity of Tools':
			<table width="100%" cellspacing="0" cellpadding="4">
	            <tr height="30px">
	                <td colspan="5" align="center" id="tableheading"><b>${_("Productivity tools")}</b></td>
	            </tr>
	            <tr height="30px">
	                <td align="left" id="tableheading"><b>${_("Operating Hours")}</b></td>
	                <td align="left" id="tableheading"><b>${_("Number of units produced")}</b></td>
	                <td align="left" id="tableheading"><b>${_("Productivity")}</b></td>
	            </tr>
	            %for i in range(5):
	                <tr height="20px">
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                </tr>
	            %endfor
	        <table>
	        <h4 align="center">Productivity = (total units produced / total operating hours)</h4>
	    %endif
        
        %if data['form']['report_selection'] == 'Productivity Of Raw Materials':
	        <table width="100%" cellspacing="0" cellpadding="4">
	            <tr height="30px">
	                <td colspan="5" align="center" id="tableheading"><b>${_("The Productivity of raw materials")}</b></td>
	            </tr>
	            <tr height="30px">
	                <td align="left" id="tableheading"><b>${_("The cost of raw materials (pounds)")}</b></td>
	                <td align="left" id="tableheading"><b>${_("Number of units produced")}</b></td>
	                <td align="left" id="tableheading"><b>${_("Productivity")}</b></td>
	            </tr>
	            %for i in range(5):
	                <tr height="20px">
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                </tr>
	            %endfor
	        <table>
	        <h4 align="center">Productivity = (total of productive units / cost of materials,(raw,auxiliary))</h4>
        %endif
        
        %if data['form']['report_selection'] == 'Productivity Of Capacity':
	        <table width="100%" cellspacing="0" cellpadding="4">
	            <tr height="30px">
	                <td colspan="5" align="center" id="tableheading"><b>${_("Productivity of capacity")}</b></td>
	            </tr>
	            <tr height="30px">
	                <td align="left" id="tableheading"><b>${_("capacity costs")}</b></td>
	                <td align="left" id="tableheading"><b>${_("Number of units produced")}</b></td>
	                <td align="left" id="tableheading"><b>${_("Productivity")}</b></td>
	            </tr>
	            %for i in range(5):
	                <tr height="20px">
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                </tr>
	            %endfor
	        <table>
	        <h4 align="center">Productivity = (total of productive units // Energy cost)</h4>
        %endif
        
        %if data['form']['report_selection'] == 'Overall Productivity':
	        <table width="100%" cellspacing="0" cellpadding="4">
	            <tr height="30px">
	                <td colspan="5" align="center" id="tableheading"><b>${_("The overall Productivity")}</b></td>
	            </tr>
	            <tr height="30px">
	                <td rowspan="2" align="left" id="tableheading"><b>${_("Laborers")}</b></td>
	                <td align="left" id="tableheading"><b>${_("Number of laborers (direct and indirect)")}</b></td>
	                <td align="left" id="tableheading"><b>${_("The cost of hour (pounds)")}</b></td>
	                <td align="left" id="tableheading"><b>${_("The total cost of hour")}</b></td>
	            </tr>
	            %for i in range(1):
	                <tr height="20px">
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                </tr>
	            %endfor
	            <tr height="30px">
	                <td rowspan="2" align="left" id="tableheading"><b>${_("Tools")}</b></td>
	                <td align="left" id="tableheading"><b>${_("Operating Hours")}</b></td>
	                <td align="left" id="tableheading"><b>${_("The cost of hour (pounds)")}</b></td>
	                <td align="left" id="tableheading"><b>${_("The total cost of hour")}</b></td>
	            </tr>
	            %for i in range(1):
	                <tr height="20px">
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                </tr>
	            %endfor
	            <tr height="30px">
	                <td rowspan="2" align="left" id="tableheading"><b>${_("Materials")}</b></td>
	                <td align="left" id="tableheading"><b>${_("The cost of materials")}</b></td>
	                <td align="left" id="tableheading"><b>${_("")}</b></td>
	                <td align="left" id="tableheading"><b>${_("Total of The cost of materials")}</b></td>
	            </tr>
	            %for i in range(1):
	                <tr height="20px">
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                </tr>
	            %endfor
	            <tr height="30px">
	                <td rowspan="2" align="left" id="tableheading"><b>${_("Capacity")}</b></td>
	                <td align="left" id="tableheading"><b>${_("Capacity Cost")}</b></td>
	                <td align="left" id="tableheading"><b>${_("")}</b></td>
	                <td align="left" id="tableheading"><b>${_("Total of Capacity cost")}</b></td>
	            </tr>
	            %for i in range(1):
	                <tr height="20px">
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                </tr>
	            %endfor
	            <tr height="30px">
	                <td align="left" id="tableheading"><b>${_("")}</b></td>
	                <td colspan="3" align="left" id="tableheading"><b>${_("overhead(%)")}</b></td>
	            </tr>
	            <tr height="30px">
	                <td align="left" id="tableheading"><b>${_("")}</b></td>
	                <td colspan="3" align="left" id="tableheading"><b>${_("Total costs")}</b></td>
	            </tr>
	            <tr height="30px">
	                <td align="left" id="tableheading"><b>${_("")}</b></td>
	                <td colspan="3" align="left" id="tableheading"><b>${_("The number of produced units")}</b></td>
	            </tr>
	            <tr height="30px">
	                <td align="left" id="tableheading"><b>${_("")}</b></td>
	                <td colspan="3" align="left" id="tableheading"><b>${_("The overall productivity = (number of units produced / total costs)")}</b></td>
	            </tr>
	        <table>
        %endif
        
        %if data['form']['report_selection'] == 'Efficiency of Capacity Productivity':
	        <table width="100%" cellspacing="0" cellpadding="4">
	            <tr height="30px">
	                <td colspan="5" align="center" id="tableheading"><b>${_("Efficiency of capacity Productivity")}</b></td>
	            </tr>
	            <tr height="30px">
	                <td align="left" id="tableheading"><b>${_("Maximum production Capacity")}</b></td>
	                <td align="left" id="tableheading"><b>${_("The actual production Capacity")}</b></td>
	                <td align="left" id="tableheading"><b>${_("Efficiency of capacity Productivity")}</b></td>
	                <td align="left" id="tableheading"><b>${_("Wastage")}</b></td>
	            </tr>
	            %for i in range(5):
	                <tr height="20px">
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                </tr>
	            %endfor
	        <table>
        %endif
        
        %if data['form']['report_selection'] == 'Cost of the Production Unit':
	        <table width="100%" cellspacing="0" cellpadding="4">
	            <tr height="30px">
	                <td colspan="5" align="center" id="tableheading"><b>${_("The cost of the production unit")}</b></td>
	            </tr>
	            <tr height="30px">
	                <td align="left" id="tableheading"><b>${_("Fixed total cost production")}</b></td>
	                <td align="left" id="tableheading"><b>${_("Number of units produced")}</b></td>
	                <td align="left" id="tableheading"><b>${_("cost fixed unit")}</b></td>
	                <td align="left" id="tableheading"><b>${_("Variable cost of the Unit")}</b></td>
	                <td align="left" id="tableheading"><b>${_("The cost per unit")}</b></td>
	            </tr>
	            %for i in range(5):
	                <tr height="20px">
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                    <td align="left" id="tableheading">${''}</td>
	                </tr>
	            %endfor
	        <table>
        %endif
	</body>
</html>
