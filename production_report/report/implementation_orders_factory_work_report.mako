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
		<table width="100%" cellspacing="0" cellpadding="4" class="noBorder">
		    <tr height="30px" class="noborder">
		        <td width="25%" align="right" id="tableheading"><b>${_("Production management")}</b></td>
                <td width="25%" align="left" id="tableheading"><b></b></td>
                
                <td width="25%" align="right" id="tableheading"></td>
                <td align="left" id="tableheading"></td>
                
                
            </tr>
			<tr height="30px" class="noborder">
			    <td align="right" id="tableheading"></td>
                <td align="left" id="tableheading"></td>
                
				<td width="25%" align="right" id="tableheading"><b>${_("Date")}</b></td>
				<td width="25%" align="left" id="tableheading"><b></b></td>
			</tr>
			<tr height="30px" class="noborder">
                <td align="right" id="tableheading"><b>${_("Factory")}</b></td>
                <td align="left" id="tableheading"><b></b></td>
                
                <td align="right" id="tableheading"><b>${_("Job Order No.")}</b></td>
                <td align="left" id="tableheading"><b></b></td>
            </tr>
            <tr height="30px" class="noborder">
                <td align="right" id="tableheading"></td>
                <td align="left" id="tableheading"></td>
                
                <td width="25%" align="right" id="tableheading"><b>${_("Product Name")}</b></td>
                <td width="25%" align="left" id="tableheading"><b></b></td>
            </tr>
		</table>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
			    <td width="4%" align="right" id="tableheading"><b>${_("S/N")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("The reasons for the deviation")}</b></td>
				<td width="22%" align="left" id="tableheading"><b>${_("100 The execution Date (Done/Plan)")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("Deviation (Done-Plan)")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("Done")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("Plan")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("Date")}</b></td>
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
                </tr>
            %endfor
		<table>
		<br/>
		<h4 align="right"><b><u>* with the possibility of comparison between works.</u></b></h4>
		<p style="page-break-before:always"></p>
		<table width="100%" cellspacing="0" cellpadding="4" class="noBorder">
            <tr height="30px" class="noborder">
                <td width="25%" align="right" id="tableheading"></td>
                <td width="25%" align="left" id="tableheading"></td>
                
                <td width="25%" align="right" id="tableheading"><b>${_("Possibility to Comparability between the period for the period (Implementation of the annual production plan and quarterly and monthly with a comparison with previous years)")}</b></td>
                <td width="25%" align="left" id="tableheading"><b></b></td>
            </tr>
            <tr height="30px" class="noborder">
                <td align="right" id="tableheading"><b>${_("From")}</b>..........<b>${_("To")}</b>..........</td>
                <td align="left" id="tableheading"><b>${_("Product Name")}</b></td>
                
                <td align="right" id="tableheading"><b>${_("Factory")}</b></td>
                <td align="left" id="tableheading"><b></b></td>
            </tr>
        </table>
        <br/>
        <table width="100%" cellspacing="0" cellpadding="4">
            <tr height="30px">
                <td width="4%" align="right" id="tableheading"><b>${_("S/N")}</b></td>
                <td width="8%" align="left" id="tableheading"><b>${_("The reasons for the deviation")}</b></td>
                <td width="22%" align="left" id="tableheading"><b>${_("100 The execution Date (Done/Plan)")}</b></td>
                <td width="8%" align="left" id="tableheading"><b>${_("Deviation (Done-Plan)")}</b></td>
                <td width="8%" align="left" id="tableheading"><b>${_("Done")}</b></td>
                <td width="8%" align="left" id="tableheading"><b>${_("Plan")}</b></td>
                <td width="8%" align="left" id="tableheading"><b>${_("Job Order No")}</b></td>
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
                </tr>
            %endfor
        <table>
	</body>
</html>
