 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<!--  Version: Multiflex-3 Update-4 / Layout-2             -->
<!--  Date:    December 11, 2006                           -->
<!--  Author:  Wolfgang                                    -->
<!--  License: Fully open source without restrictions.     -->
<!--           Please keep footer credits with a link to   -->
<!--           Wolfgang (www.1-2-3-4.info). Thank you!     -->

<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="3600" />
    <meta name="revisit-after" content="2 days" />
    <meta name="robots" content="index,follow" />
    <meta name="publisher" content="Your publisher infos here ..." />
    <meta name="copyright" content="Your copyright infos here ..." />
    <meta name="author" content="Design: Wolfgang (www.1-2-3-4.info) / Modified: Your Name" />
    <meta name="distribution" content="global" />
    <meta name="description" content="Your page description here ..." />
    <meta name="keywords" content="Your keywords, keywords, keywords, here ..." />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="./css/layout2_setup.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="./css/layout2_text.css" />
    <script type="text/javascript" src="./js/ieflickerhack.js"></script>

    <link rel="icon" type="image/x-icon" href="./img/favicon.ico" />
    <title>Converge - Administrator : Community Services</title>
    <style type="text/css">
        <!--
        .style2 {color: #000000}
        -->
    </style>
    <script type= "text/javascript">
    <!--
        function check(field)
        { 
            var checkboxid;
            var g=0;
    
            for(var j=0;j<field.length;j++)
            {
                if(field[j].checked == true)
                {
                    field[j].value = 'Yes';
                    g++;
                }
                else
                {
                    field[j].checked = true;
                    field[j].value = 'Nope';
                }
            }
            if(g>0)
                return (true);
            else
            {
                alert("Choose from the options");
                return (false);
            }
        } 
    -->
    </script>
</head>
<body>
<%
    String service = request.getParameter("service");
        
    ConnectorThesis ct = new ConnectorThesis();
    serviceTemplate t = new  serviceTemplate();
            
    CachedRowSet c = t.getServices();
    CachedRowSet crset2 = ct.getComManDivCachedUnAvail();
%>
    <!-- Main Page Container -->
    <div class="page-container">

    <!-- For alternative headers START PASTE here -->

    <!-- A. HEADER -->      
    <div class="header">
      
        <!-- A.1 HEADER TOP -->
        <div class="header-top">
        
            <!-- Sitelogo and sitename -->
            <a class="sitelogo" href="#" title="Go to Start page"></a>
            <div class="sitename">
                <h1><a href="homepage.html" title="Go to Start page">CONVERGE</a></h1>
                <h2>Generic Community Association Portal</h2>
            </div>
            <!-- Navigation Level 1 -->
            <div class="nav1">
                <ul>
                    <li><a href="#" title="Go to Start page">Home</a></li>
                    <li><a href="#" title="Get to know who we are">About</a></li>
                    <li><a href="#" title="Get in touch with us">Contact</a></li>																		
                    <li><a href="#" title="Get an overview of website">Sitemap</a></li>
                </ul>
            </div>              
        </div>
      
        <!-- A.2 HEADER MIDDLE -->
        <div class="header-middle">    
   
            <!-- Site message -->
            <div class="sitemessage">
                <h1>FAST &bull; EASY &bull; CUSTOMIZABLE</h1>
                <h2>CONVERGE is here, an online community portal dedicated to serve village associations</h2>         
            </div>        
        </div>
	        
        <!-- A.3 HEADER BOTTOM -->
        <div class="header-bottom">
      
            <!-- Navigation Level 2 (Drop-down menus) -->
            <div class="nav2">
	
            <!-- Navigation item -->
                <ul>
                    <li><a href="associationDash.jsp">Home</a></li>
                </ul>
          
          <!-- Navigation item -->
                <ul>
                    <li><a href="#">Manage Association</a><!--<![endif]-->
                    <!--[if lte IE 6]><table><tr><td><![endif]-->
                    <ul>
                        <li><a href="assocDirectorMain.jsp">Board of Directors or Officers</a></li>
                        <li><a href="assocFacilities.jsp">Facilities</a></li>
                        <li><a href="assocRuleFees.jsp">Rules & Regulations</a></li>
                        <li><a href="assocVillInfo.jsp">Village Information</a></li>
                        <li><a href="assocServices.jsp">Association Services</a></li> 
                    </ul>
                    <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                    </li>
                </ul>   
                <ul>
                    <li><a href="logout.jsp">Logout</a></li>
                </ul> 
            </div>
        </div>    

        <!-- A.4 HEADER BREADCRUMBS -->

        <!-- Breadcrumbs -->
        <div class="header-breadcrumbs">
            <ul>
                <li><a href="#">Tahanan Village</a></li>
            </ul>
        </div>
    </div>

    <!-- For alternative headers END PASTE here -->

 
    <!-- B. MAIN -->
    <div class="main">
       <!-- B.1 MAIN NAVIGATION -->
      <div class="main-navigation">

        <!-- Navigation Level 3 -->
        <div class="round-border-topright"></div>
        <Br />  

        <!-- Title -->                
        <h1 class="first">Service Settings</h1>            
        <dl class="nav3-grid">
<%               
            if(c.size() >0)
            {
            while(c.next())
            {
              if(c.getString("permit").equals("Yes"))
              {    
              %> <dt><a href="#">Permits</a></dt>
              <% 
              }
             
              if(c.getString("reservation").equals("Yes"))
              {    
              %> <dt><a href="#">Reservations</a></dt>
              <% 
              }
              %>
          <%
              if(c.getString("events").equals("Yes"))
              {    
              %> <dt><a href="#">Events Approval</a></dt> 
              <% 
              }
              %>
         
          <%
              if(c.getString("vote").equals("Yes"))
              {    
              %> <dt><a href="#">Polls or Elections</a></dt>
              <% 
              }
              
              if(c.getString("bulletinBoard").equals("Yes"))
              {    
              %> <dt><a href="testEditor.jsp">Bulletin Board</a></dt>
              <% 
              }
              %>
        
         
           <%
              if(c.getString("billing").equals("Yes"))
              {    
              %>  <dt><a href="#">Billing</a></dt>
              <% 
              }
              %>
         <%
              if(c.getString("newsletter").equals("Yes"))
              {    
              %> <dt><a href="#">Newsletter</a></dt>
              <% 
              }
             }
             }
              %>
          

        </dl>             
		</div>
        

 
      <!-- B.1 MAIN CONTENT -->
        
        <!-- Pagetitle -->
       
      <div class="main-content">
           <!-- Pagetitle -->
        <h1 class="pagetitle">Community Services</h1>
		<div class="column1-unit">
        <h1 class="side">Choose who will handle <%=service%></h1>
          <h3 class="side">&nbsp;</h3>
          <p> </p>Appoints the Comunity Managment Division(s) to handle this service
          <p></p>
		</div> 
        <p>
          <!-- Content unit - One column -->
        </p>
        
         <form name="choiceList" onSubmit="return(check(document.choiceList.list))" method="get" action="processEditServices.jsp">
          <input type="hidden" name ="service" value="<%=service%>">   
        <table width="536" border="1">
          <tr>
            <th width="81" scope="col"><div align="center">Appoint</div></th>
            <th width="205" scope="col"><div align="center">Community Management Division</div></th>
            
          </tr>
          <%
          int nCtr=0;
          while(crset2.next())
          {
              nCtr++;
              
          %>
          <input type="hidden" name="comDivId" value="<%=crset2.getInt("comDivId")%>"
          <tr>
            <td><div align="center">
              <input name="list" id="classcheckbox" type="checkbox" value="<%=crset2.getInt("comDivId")%>" />
            </div></td>
            <td><div align="center"><%=crset2.getString("comDivisionName")%></div></td>
           
          </tr> 
          <% 
          }
          %>
          
                </table>
                <input type="hidden" name="ctr" value="<%=nCtr%>">
                <label class="left"></label><br /><br />
                <input type="submit" class="button" value="Ok" />
                <input type="hidden" name="ctr" value="<%=nCtr%>"
            </form>
            <p>&nbsp; </p>
            <hr class="clear-contentunit" />
            </div>
        </div>
      
        <!-- C. FOOTER AREA -->      

        <div class="footer">
            <p>Copyright &copy; 2006 Your Company | All Rights Reserved</p>
            <p class="credits">Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a> | Modified by <a href="#" title="Adaptor Homepage">4B1C</a> | Powered by <a href="#" title="Content Management System">CCMS</a> | <a href="http://validator.w3.org/check?uri=referer" title="Validate XHTML code">W3C XHTML 1.0</a> | <a href="http://jigsaw.w3.org/css-validator/" title="Validate CSS code">W3C CSS 2.0</a></p>
        </div>      
    </div> 
</body>
</html>