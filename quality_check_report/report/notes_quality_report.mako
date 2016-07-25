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
    <title>Notes QUALITY REPORT</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>Notes QUALITY REPORT</u></b></h2>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4" border="0" style="border:none">
		    <tr height="30px" class="noborder">
                <td width="25%" colspan="3" align="right" id="tableheading"><b>${_("Date ")}</b></td>
                <td width="25%" colspan="3" align="left" id="tableheading"><b>${_("...........")}</b></td>
            </tr>
            <tr height="30px" class="noborder">
                <td width="25%" colspan="3" align="right" id="tableheading"><b>${_("Order ")}</b></td>
                <td width="25%" colspan="3" align="left" id="tableheading"><b>${_("...........")}</b></td>
            </tr>
            <tr height="30px" class="noborder">
                <td width="25%" colspan="3" align="right" id="tableheading"><b>${_("Job no ")}</b></td>
                <td width="25%" colspan="3" align="left" id="tableheading"><b>${_("...........")}</b></td>
            </tr>
            <tr height="30px" class="noborder">
                <td width="15%" align="right" id="tableheading"><b>${_("Station / Line ")}</b></td>
                <td width="10%" align="left" id="tableheading"><b>${_("...........")}</b></td>
                
                <td width="15%" align="right" id="tableheading"><b>${_("Product Name ")}</b></td>
                <td width="10%" align="left" id="tableheading"><b>${_("...........")}</b></td>
                
                <td width="45%" align="right" id="tableheading"><b>${_("Total of problems at station or main line ")}</b></td>
                <td width="5%" align="left" id="tableheading"></td>
            </tr>
            <tr height="30px" class="noborder">
                <td width="15%" align="right" id="tableheading"><b>${_("Time ")}</b></td>
                <td width="10%" align="left" id="tableheading"><b>${_("...........")}</b></td>
                
                <td width="15%" align="right" id="tableheading"><b>${_("From ")}</b></td>
                <td width="10%" align="left" id="tableheading"><b>${_("...........")}</b></td>
                
                <td width="15%" align="right" id="tableheading"><b>${_("To ")}</b></td>
                <td width="10%" align="left" id="tableheading"><b>${_("...........")}</b></td>
            </tr>
            
		   
		</table>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
		    <tr height="30px">
                <td align="left" colspan="3" id="tableheading"></td>
                <td align="left" colspan="4" id="tableheading"><b>${_("Quality Notes")}</b></td>
            </tr>
			<tr height="30px">
			    <td align="right" id="tableheading"><b>${_("Station")}</b></td>
				<td align="left" id="tableheading"><b>${_("Error")}</b></td>
				<td align="left" id="tableheading"><b>${_("Repetition")}</b></td>
				<td align="left" id="tableheading"><b>${_("Error")}</b></td>
				<td align="left" id="tableheading"><b>${_("VIN Numbers")}</b></td>
				<td align="left" id="tableheading"><b>${_("station")}</b></td>
				<td align="left" id="tableheading"><b>${_("Repetition")}</b></td>
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
		<h4 align="right">${_("With the possibility of comparison between the job order and another,or between the period for the period")}</h4>
		<br/>
		<div align="center"><b>${_("VIN No.")}</b></div>
		<table width="100%" cellspacing="0" cellpadding="4">
            <tr height="30px">
                <td align="right" id="tableheading"><b>${_("S/N")}</b></td>
                <td align="left" id="tableheading"><b>${_("Error")}</b></td>
                <td align="left" id="tableheading"><b>${_("Station")}</b></td>
                <td align="left" id="tableheading"><b>${_("Status")}</b></td>
            </tr>
            
            %for i in range(5):
                <% cnt = i+1 %>
                <tr height="20px">
                    <td align="right" id="tableheading">${cnt}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                </tr>
            %endfor
        <table>
	</body>
</html>