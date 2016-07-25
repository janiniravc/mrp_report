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
        
       #galley {
    width: 100%;
    height: auto;
    border: 1px #CCCCCC;
    float:none
    }
    
#galley table, th, td {
    border: 1px solid black;
    border-collapse:collapse;
    }
    
#galley table {
    table-layout: fixed;
    width: 100%;
    }
    
#galley th.vertical-label{      
    -webkit-transform: rotate(270deg) translateX(100%) translateY(33%);
    -moz-transform: rotate(270deg) translateX(100%) translateY(33%);
    -o-transform: rotate(270deg) translateX(100%) translateY(33%);
     -webkit-transform-origin: 100% 100%;
     -moz-transform-origin: 100% 100%;
     -o-transform-origin: 100% 100%;
    
     white-space:nowrap;
}
    
#galley th, th.vertical-label{
    font-family: "myriad Pro";
    font-decoration: bold;

    }
    
#galley .vheader{
    margin-left: 5px;
    }
        ${css}
    </style>
    <title>Production Efficiency Report</title>
    
</head>
	<body>
		<%setLang(user.lang)%>
		<h2 align="center"><b><u>Production Efficiency Report</u></b></h2>
		<br/><br/><br/>
		<div id="galley">

<table>
<thead>
  <tr height="340px" width="100%">
    <th width="8%"  class="vertical-label"><div class="vheader">
      <div valign="center">${_("Date")}</div>
    </div></th>
    <th width="8%" class="vertical-label"><div class="vheader">
      <div valign="center">${_("Production rate -")}</div>
      <div valign="center">${_("units per minute")}</div>
    </div></th>
    <th width="8%" class="vertical-label"><div class="vheader">
      <div valign="center">${_("Units produced")}</div>
    </div></th>
    <th width="8%" class="vertical-label"><div class="vheader">
      <div valign="center">${_("Rejected units -")}</div>
      <div valign="center">${_("final inspection")}</div>
    </div></th>
    <th width="8%" class="vertical-label"><div class="vheader">
      <div valign="center">${_("Time of duties")}</div>
      <div valign="center">${_("in day by minutes")}</div>
    </div></th>
    <th width="8%" class="vertical-label"><div class="vheader">
      <div align="center">${_("scheduled stoping")}</div>
      <div align="center">${_("time by minutes")}</div>
    </div></th>
    <th width="11%" class="vertical-label"><div class="vheader">
      <div valign="center">${_("Non-scheduled stoping")}</div>
      <div valign="center">${_("time by minutes")}</div>
      <div valign="center">${_(" - maintenance time")}</div>
    </div></th>
    <th width="8%" class="vertical-label"><div class="vheader">
      <div valign="center">${_("Time of produced units")}</div>
      <div valign="center">${_(" - units*time of production")}</div>
    </div></th>
    <th width="8%" class="vertical-label"><div class="vheader">
      <div align="center">${_("Time of Treatments")}</div>
      <div align="center">${_("- time of treatment for inspection returns")}</div>
    </div></th>
    <th width="8%" class="vertical-label"><div class="vheader">
      <div valign="center">${_("Time of production")}</div>
      <div valign="center">${_("by minutes")}</div>
    </div></th>
    <th width="8%" height="150" class="vertical-label"><div class="vheader">
      <div valign="center">${_("Net of operating")}</div>
      <div valign="center">${_("time by minutes")}</div>
    </div></th>
    <th width="8%" height="150" class="vertical-label"><div class="vheader">
      <div valign="center">${_("Availability")}</div>
    </div></th>
    <th width="8%" height="150" class="vertical-label"><div class="vheader">
      <div valign="center">${_("Performance")}</div>
    </div></th>
    <th width="8%" height="150" class="vertical-label"><div class="vheader">
      <div valign="center">${_("Quality")}</div>
    </div></th>
    <th width="8%" class="vertical-label"><div class="vheader">
      <div valign="center">${_("Production efficiency")}</div>
    </div></th>
  </tr>
</thead>
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
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                    <td align="left" id="tableheading">${''}</td>
                </tr>
            %endfor
</tbody>
</table>
</div>
		
		
		
		
	</body>
</html>
