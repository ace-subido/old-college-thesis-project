
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
    <%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>

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
<title>Converge - Staff</title>
</head>

<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body>
<%serviceTemplate t = new  serviceTemplate();
        CachedRowSet c = t.getServices();
        
        Pao db = new Pao();
        
        CachedRowSet crset = db.getResidentAccounts();
 %>
     <!-- Main Page Container -->
    <div class="page-container">
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
                    <ul>  
                        <li><a href="assocMyAccount.jsp">My Account</a><!--<![endif]-->
                    </ul>
                    <!-- Navigation item -->
                    <ul>
                        <li><a href="#">Manage Association</a><!--<![endif]-->
              <!--[if lte IE 6]><table><tr><td><![endif]-->
                            <ul>
                                <li><a href="assocDirectorMain.jsp">Board of Directors or Officers</a></li>
                                <li><a href="assocFacilities.jsp">Facilities</a></li>                  
                                <li><a href="assocVillInfo.jsp">Village Information</a></li>
                                <li><a href="assocServices.jsp">Association Services</a></li> 
                                <li><a href="assocResidentAccounts.jsp">Residents and Accounts</a></li>                                  
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
                <h1 class="first">Community Services</h1>            
                <dl class="nav3-grid">
<%               
                if(c.size() >0)
                {
                    while(c.next())
                    {
                        if(c.getString("permit").equals("Yes"))
                        {    
%>
                            <dt><a href="assocPermit.jsp">Permits</a></dt>
<% 
                        }
                        if(c.getString("reservation").equals("Yes"))
                        {    
%>
                            <dt><a href="assocReservationList.jsp">Reservations</a></dt>
<% 
                        }
                        if(c.getString("socialgroups").equals("Yes"))
                        {    
%>
                            <dt><a href="assocSocGroup.jsp">Social Groups</a></dt> 
<% 
                        }
                        if(c.getString("vote").equals("Yes"))
                        {    
%>
                            <dt><a href="assocPolls.jsp">Polls or Elections</a></dt>
<% 
                        }
                        if(c.getString("bulletinBoard").equals("Yes"))
                        {    
%>
                            <dt><a href="assocBulletinBoard.jsp">Bulletin Board</a></dt>
<% 
                        }
                        if(c.getString("billing").equals("Yes"))
                        {    
%> 
                            <dt><a href="assocBill.jsp">Billing</a></dt>
<% 
                        }
                        if(c.getString("newsletter").equals("Yes"))
                        {    
%>
                            <dt><a href="assocNewsletter.jsp">Newsletter</a></dt>
<% 
                        }
                    }
                }
%>
                </dl>                 
            </div>
 
      <!-- B.1 MAIN CONTENT -->
      <div class="main-content">
        
        <!-- Pagetitle -->
        <h1 class="pagetitle">Resident Accounts</h1>

        <!-- Content unit - One column -->
        <!-- Content unit - One column -->
        <h1 class="block">Manage Accounts</h1>
<hr class="clear-contentunit" />        
              <p><img src="icons/register_user.png" alt="Image description" title="Image title" /><br><br><br>This feature allows the Administrator to add a new resident account, add a resident account to a lot unit, and enable/disable a resident account.</p>  
		    <hr class="clear-contentunit" />
		  
		  <br />
                  <form>
                  <p><input type="button" onclick= "window.location.href='assocSetupResidentsManual.jsp'" class="button" value="Add Account" tabindex="6" /> 
                 </p>
 
                  </form>
        
              <!-- Content unit - One column -->
              
        <h1 class="block">Enable/Disable Accounts</h1>
<hr class="clear-contentunit" />        
<p>Click on the <strong>check</strong> button to enable a resident head account, or click the <strong>cross</strong> button to disable it. Click on <strong>"View Details/Sub-accounts"</strong> if you want to view the full details of the specific head account, or if you want to enable/disable one or more of its sub-accounts.</p>  
		    <hr class="clear-contentunit" />
          
		    <%
	if (crset.size() == 0)
	{
    %>
		<div align="center">
		  <h1>There are no Resident Accounts yet </h1>
		</div>
				

<%
}
	else
            
	{	
%>
         
       <!-- <div class="column1-unit"> -->
        
          <table width="636">
            <tr>
              <th width="120" class="top" scope="col">Resident Name</th>
              <th width="89" class="top" scope="col">Address</th>
              <th width="82" class="top" scope="col">Contact No.</th>
              <th width="80" class="top" scope="col">Status</th>
              <th width="150" class="top" scope="col"></th>
              <th width="60" class="top" scope="col">Enable</th>
               <th width="60" class="top" scope="col">Disable</th>
             
            </tr>
           
			<%
                        
	 while(crset.next())
	{ 
             
             if((!(crset.getString("UserType").equals("Administrator")) && (!(crset.getString("UserType").equals("Staff")) && ((crset.getString("StatInFam").equals("head"))))))
             {

		%>
        
        <tr>
         <td> <%=crset.getString("LastName")%> , <%=crset.getString("FirstName")%></td><td><%=crset.getString("Address")%></td>
         <td><%=crset.getString("HouseNum")%></td><td><%=crset.getString("Status")%></td>
        <td><a href="assocViewFullAccount.jsp?FamId=<%=crset.getString("FamId")%>">View Details/Sub-Accounts</a></td>    
         <td><a href="processAssocEnableAccount.jsp?ResId=<%=crset.getString("ResId")%>&action=1"><img src="icons/check-mark-copy-16x16.png"></a></td>
        <td><a href="processAssocDisableAccount.jsp?ResId=<%=crset.getString("ResId")%>&action=0"><img src="icons/x.png"width="14" height="14"></a></td>
        </tr>   
		<%
	}
		
	}}
	%>
	  </table>	  <br />
<hr class="clear-contentunit" />
                   </div>                             
        <!-- Content unit - One column -->
 
    
  </div> 
   
  <div class="footer">
      <p>Copyright &copy; 2006 Your Company | All Rights Reserved</p>
      <p class="credits">	Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a> | Modified by <a href="#" title="Adaptor Homepage">4B1C</a> | Powered by <a href="#" title="Content Management System">CCMS</a> | <a href="http://validator.w3.org/check?uri=referer" title="Validate XHTML code">W3C XHTML 1.0</a> | <a href="http://jigsaw.w3.org/css-validator/" title="Validate CSS code">W3C CSS 2.0</a></p>
    </div>      
    </div>
</body>
</html>



