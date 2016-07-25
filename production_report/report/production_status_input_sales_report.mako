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
    <title>Report of Production status and input and sales</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>Report of Production status and input and sales</u></b></h2>
		<br/>
		<table width="100%" cellspacing="0" cellpadding="4">
		    <tr height="30px">
                <td rowspan="2" align="center" id="tableheading"><b>${_("Car model")}</b></td>
                <td align="center" id="tableheading"><b>${_("Salon")}</b></td>
                <td rowspan="2" align="center" id="tableheading"><b>${_("GREAT WALL")}</b></td>
                <td rowspan="2" align="center" id="tableheading"><b>${_("jeep")}</b></td>
                <td rowspan="2" align="center" id="tableheading"><b>${_("L.T")}</b></td>
                <td rowspan="2" align="center" id="tableheading"><b>${_("KIA")}</b></td>
                <td rowspan="2" align="center" id="tableheading"><b>${_("STSTION")}</b></td>
                <td rowspan="2" align="center" id="tableheading"><b>${_("TOTAL")}</b></td>
            </tr>
			<tr height="30px">
			    <td align="center" id="tableheading"><b>${_("BYD")}</b></td>
			</tr>
			
			%for i in range(5):
				<% cnt = i+1 %>
                <tr height="20px">
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
		<h4 align="right">Complete product (remaining in the store without a contract of sale + The Product Sold has not been delivered)</h4>
		<h4 align="right"><u>Net production ** remaining in the store without a contract of sale</u></h4>
		
	</body>
</html>
