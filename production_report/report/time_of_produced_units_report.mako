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
    <title>Report of the time of Producing units</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>Report of the time of Producing units</u></b></h2>
		<br/>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4" class="noBorder">
			<tr height="30px" class="noborder">
			    <td align="right" id="tableheading"></td>
                <td align="left" id="tableheading"></td>
                
				<td width="25%" align="right" id="tableheading"><b>${_("Product Name")}</b></td>
				<td width="25%" align="left" id="tableheading"><b></b></td>
			</tr>
			<tr height="30px" class="noborder">
                <td align="right" id="tableheading"><b>${_("Sub-line/The Line")}</b></td>
                <td align="left" id="tableheading"><b></b></td>
                
                <td align="right" id="tableheading"><b>${_("The Work Order No.")}</b></td>
                <td align="left" id="tableheading"><b></b></td>
            </tr>
		</table>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
			<tr height="30px">
			    <td width="4%" align="right" id="tableheading"><b>${_("S/N")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("The difference (minutes)")}</b></td>
				<td width="22%" align="left" id="tableheading"><b>${_("standard Time")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("Actual Time")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("Out time")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("Start time")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("Sub-line")}</b></td>
				<td width="8%" align="left" id="tableheading"><b>${_("VIN")}</b></td>
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
		<br/>
		<h4 align="right"><b><u>* with the possibility of comparison between job orders.</u></b></h4>
		<p style="page-break-before:always"></p>
		<table width="100%" cellspacing="0" cellpadding="4" class="noBorder">
            <tr height="30px" class="noborder">
                <td width="25%" align="right" id="tableheading"></td>
                <td width="25%" align="left" id="tableheading"></td>
                
                <td width="25%" align="right" id="tableheading"><b>${_("Product Name")}</b></td>
                <td width="25%" align="left" id="tableheading"><b></b></td>
            </tr>
            <tr height="30px" class="noborder">
                <td align="right" id="tableheading"><b>${_("The Line")}</b></td>
                <td align="left" id="tableheading"><b></b></td>
                
                <td align="right" id="tableheading"><b>${_("job Order No.")}</b></td>
                <td align="left" id="tableheading"><b></b></td>
            </tr>
        </table>
        <br/>
        <table width="100%" cellspacing="0" cellpadding="4">
            <tr height="30px">
                <td width="4%" align="right" id="tableheading"><b>${_("S/N")}</b></td>
                <td width="8%" align="left" id="tableheading"><b>${_("The difference (minutes)")}</b></td>
                <td width="22%" align="left" id="tableheading"><b>${_("The total of standard Time")}</b></td>
                <td width="8%" align="left" id="tableheading"><b>${_("The total duration of the producing unit")}</b></td>
                <td width="8%" align="left" id="tableheading"><b>${_("Sub-Line duration 3")}</b></td>
                <td width="8%" align="left" id="tableheading"><b>${_("Sub-Line duration 2")}</b></td>
                <td width="8%" align="left" id="tableheading"><b>${_("Sub-Line duration 1")}</b></td>
                <td width="8%" align="left" id="tableheading"><b>${_("VIN No")}</b></td>
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
        <br/>
        <h4 align="right"><b><u>* with the possibility of comparison between job orders.</u></b></h4>
	</body>
</html>
