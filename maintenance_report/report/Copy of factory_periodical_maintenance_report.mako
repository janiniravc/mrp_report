<html>
<head>
    <style type="text/css">
        td.tdborder
        {
        	border-top-style:none;
        	border-left-style:none;
        	border-left-style:none;
            border-bottom-style:1px solid #000000;
            font-size: 22pt;
        }        
        td 
        {
            font-size: 12pt;            
        }   
        th 
        {
            font-weight:bold;
            text-align: left;
        }
        #noborder td
        {
            border:none;
        }
        #amount
        {
            text-align: right;
        }
        #company
        {
            text-align: center;
        }
        h3
        {
            font-size: 19px;
            font-weight:200;
        }
        tr.border_bottom td {
  			border-bottom:1px solid black;
		}
		.tablestyle
		{
			padding:0;
		}
		#tableheading
		{
			font-size: 9pt;
			font-family:"serif";
		}
		#tabledata
		{
			font-size: 8pt;
			font-family:"serif";
		}
		tr.border_bottom td {
  			border-bottom:1px solid black;
		}
		tr.border_bottom_small td {
  			border-bottom:1px solid #e6e6e6;
		}
		td.border_bottom_small {
  			border-bottom:1px solid #e6e6e6;
		}
		td.border_bottom {
  			border-bottom:1px solid #e6e6e6;
		}
		span.highlight {
    		background-color: white;
		}
		td.border_right{
  			border-right:1px solid black;
		}
		#terp_level_0_name
		{
			font-family:"Helvetica";
			font-weight:bold;
			font-size: 9pt;
			padding-left: 0px;
			padding-right: 0px;
		}
		#terp_level_1_name
		{
			font-family:"Helvetica";
			font-weight:bold;
			font-size: 9pt;
			padding-left: 0px;
			padding-right: 0px;
		}
		#terp_level_2_name
		{
			font-family:"Helvetica";
			font-weight:bold;
			font-size: 9pt;
			padding-left: 0px;
			padding-right: 0px;
			text-indent: 5px;
		}
		#terp_level_3_name
		{
			font-family:"Helvetica";
			font-weight:bold;
			font-size: 9pt;
			padding-left: 0px;
			padding-right: 0px;
			text-indent: 7px;
		}
		#terp_level_4_name
		{
			font-family:"Helvetica";
			font-size: 8pt;
			padding-left: 0px;
			padding-right: 0px;
			text-indent: 9px;
		}
		#terp_level_5_name
		{
			font-family:"Helvetica";
			font-size: 7.5pt;
			padding-left: 0px;
			padding-right: 0px;
			text-indent: 11px;
		}
		#terp_level_6_name
		{
			font-family:"Helvetica";
			font-size: 6.5pt;
			padding-left: 0px;
			padding-right: 0px;
			text-indent: 13px;
		}
		#terp_level_0_balance
		{
			font-family:"Helvetica";
			font-weight:bold;
			font-size: 9pt;
			padding-left: 0px;
			padding-right: 0px;
		}
		#terp_level_1_balance
		{
			font-family:"Helvetica";
			font-weight:bold;
			font-size: 10pt;
			padding-left: 0px;
			padding-right: 0px;
		}
		#terp_level_2_balance
		{
			font-family:"Helvetica";
			font-weight:bold;
			font-size: 9.5pt;
			padding-left: 0px;
			padding-right: 0px;
			text-indent: 5px;
		}
		#terp_level_3_balance
		{
			font-family:"Helvetica";
			font-weight:bold;
			font-size: 9pt;
			padding-left: 0px;
			padding-right: 0px;
			text-indent: 7px;
		}
		#terp_level_4_balance
		{
			font-family:"Helvetica";
			font-size: 8.5pt;
			padding-left: 0px;
			padding-right: 0px;
			text-indent: 9px;
		}
		#terp_level_5_balance
		{
			font-family:"Helvetica";
			font-size: 8pt;
			padding-left: 0px;
			padding-right: 0px;
			text-indent: 11px;
		}
		#terp_level_6_balance
		{
			font-family:"Helvetica";
			font-size: 7.5pt;
			padding-left: 0px;
			padding-right: 0px;
			text-indent: 13px;
		}
        ${css}
    </style>
    <title>Assets Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b>‫ ..............   تقرير الصيانة الدورى  لل   .................   من  العام‬</b></h2>
		<h2 align="center"><b>‫....... ‪Periodical maintenance report from ....... to‬‬</b></h2>
		<br/>
		<table width="100%" border="1" cellspacing="0" cellpadding="1" style="border: 1px solid #e6e6e6;">
			<tr>
				<td align="center" id="tableheading"><b>${_("Notes")}</b></td>
				<td align="center" id="tableheading"><b>${_("Total Amount of factories (SDG)")}</b></td>
				<td align="center" id="tableheading"><b>${_("Total Amount of factories (Hour)")}</b></td>
				<td align="center" id="tableheading">
				    
				    <table width="100%" cellspacing="0" cellpadding="0">
				        <tr>
				            <td style="border-bottom:2px solid #e6e6e6;" colspan="9" align="center" id="tableheading"><b>${_("Factory name")}</b></td>
				        </tr>
				        <tr>
                            <td style="border-bottom:2px solid #e6e6e6;border-right:2px solid #e6e6e6;" colspan="3" align="center" id="tableheading"><b>${_("Body build factory B3")}</b></td>
                            <td style="border-bottom:2px solid #e6e6e6;border-right:2px solid #e6e6e6;" colspan="3" align="center" id="tableheading"><b>${_("Paint build factory B2")}</b></td>
                            <td style="border-bottom:2px solid #e6e6e6;" colspan="3" align="center" id="tableheading"><b>${_("Aggregation build factory B1")}</b></td>
                        </tr>
                        <tr>
                            <td style="border-right:2px solid #e6e6e6;" align="center" id="tableheading"><b>${_("Cost for factory (SDG)")}</b></td>
                            <td style="border-right:2px solid #e6e6e6;" align="center" id="tableheading"><b>${_("Saloon line")}</b></td>
                            <td style="border-right:2px solid #e6e6e6;" align="center" id="tableheading"><b>${_("Nissan line")}</b></td>
                            <td style="border-right:2px solid #e6e6e6;" align="center" id="tableheading"><b>${_("Cost for factory (SDG)")}</b></td>
                            <td style="border-right:2px solid #e6e6e6;" align="center" id="tableheading"><b>${_("Saloon line")}</b></td>
                            <td style="border-right:2px solid #e6e6e6;" align="center" id="tableheading"><b>${_("Nissan line")}</b></td>
                            <td style="border-right:2px solid #e6e6e6;" align="center" id="tableheading"><b>${_("Cost for factory (SDG)")}</b></td>
                            <td style="border-right:2px solid #e6e6e6;" align="center" id="tableheading"><b>${_("Saloon line")}</b></td>
                            <td align="center" id="tableheading"><b>${_("Nissan line")}</b></td>
                        </tr>
				    </table>
				    
				</td>
				<td align="center" id="tableheading"><b>${_("Months/year's quarters")}</b></td>
				<td align="center" id="tableheading"><b>${_("Statement")}</b></td>
				
			</tr>
			<tr height="30px">
                <td align="left" id="tabledata" width="15%"></td>
                <td align="right" id="tabledata" width="15%"></td>
                <td align="right" id="tabledata" width="15%"></td>
                <td align="right" id="tabledata" width="15%"></td>
                <td align="left" id="tabledata" width="15%"></td>
                <td align="left" id="tabledata" width="15%"></td>
            </tr>
            <tr height="30px">
                <td align="left" id="tabledata" width="15%"></td>
                <td align="right" id="tabledata" width="15%"></td>
                <td align="right" id="tabledata" width="15%"></td>
                <td align="right" id="tabledata" width="15%"></td>
                <td align="left" id="tabledata" width="15%"></td>
                <td align="left" id="tabledata" width="15%"></td>
            </tr>
            <tr height="30px">
                <td align="left" id="tabledata" width="15%"></td>
                <td align="right" id="tabledata" width="15%"></td>
                <td align="right" id="tabledata" width="15%"></td>
                <td align="right" id="tabledata" width="15%"></td>
                <td align="left" id="tabledata" width="15%"></td>
                <td align="left" id="tabledata" width="15%"></td>
            </tr>
            <tr height="30px">
                <td align="left" id="tabledata" width="15%"></td>
                <td align="right" id="tabledata" width="15%"></td>
                <td align="right" id="tabledata" width="15%"></td>
                <td align="right" id="tabledata" width="15%"></td>
                <td align="left" id="tabledata" width="15%"></td>
                <td align="left" id="tabledata" width="15%"></td>
            </tr>
        </table>
        <br/>
        <br/>
		
	</body>
</html>
