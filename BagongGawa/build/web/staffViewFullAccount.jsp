 
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
  
<%      serviceTemplate t = new  serviceTemplate();
        CachedRowSet c = t.getServices();
        
        Account db = new Account();
        int FamId = Integer.parseInt(request.getParameter("FamId"));
        CachedRowSet crset = db.getFamilyAccounts(FamId);
%>
    <!-- Main Page Container -->
    <div class="page-container">

        <!-- For alternative headers START PASTE here -->
        <!-- A. HEADER -->      
        <div class="header">
      
            <!-- A.1 HEADER TOP -->
            <div class="header-top">
        
                <!-- Sitelogo and sitename -->
                <a class="sitelogo" href="staffDash.jsp" title="Go to Start page"></a>
                <div class="sitename">
                    <h1><a href="homepage.html" title="Go to Start page">CONVERGE</a></h1>
                    <h2>Generic Community Association Portal</h2>
                </div>
                <!-- Navigation Level 1 -->
                <div class="nav1">
                    <ul>
                        <li><a href="staffDash.jsp" title="Go to Start page">Home</a></li>
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
                        <li><a href="staffDash.jsp">Home</a></li>
                    </ul>
                    <ul>  
                        <li><a href="staffMyAccount.jsp">My Account</a><!--<![endif]-->
                    </ul>    
                    <ul>
                        <li><a href="#">Manage Association</a><!--<![endif]-->
                        <!--[if lte IE 6]><table><tr><td><![endif]-->
                        <ul>
                            <li><a href="staffResidentAccounts.jsp?criteria=0&search=All">Resident Accounts</a></li>
                            <li><a href="staffPhysicalLayout.jsp">Physical Layout</a></li>
                        </ul>
              <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                        </li>
                    </ul>
                    <!-- Navigation item -->
                    <ul>
                        <li><a href="logout.jsp">Logout</a></li>
                    </ul>
                </div>
            </div> 
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
                <!-- Title -->                
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
                            <dt><a href="staffPermit.jsp?permitID=All&status=Pending">Permits</a></dt>
<% 
                        }
                        if(c.getString("reservation").equals("Yes"))
                        {    
%> 
                            <dt><a href="staffReserve.jsp">Reservations</a></dt>
<% 
                        }
                        if(c.getString("socialgroups").equals("Yes"))
                        {    
%> 
                            <dt><a href="staffSocMain.jsp">Social Groups</a></dt> 
<% 
                        }
                        if(c.getString("vote").equals("Yes"))
                        {    
%> 
                            <dt><a href="staffVote.jsp">Polls or Elections</a></dt>
<% 
                        }
                        if(c.getString("bulletinBoard").equals("Yes"))
                        {    
%> 
                            <dt><a href="staffBulletinBoard.jsp">Bulletin Board</a></dt>
<% 
                        }
                        if(c.getString("billing").equals("Yes"))
                        {    
%>  
                            <dt><a href="staffBill.jsp">Billing</a></dt>
<% 
                        }
                        if(c.getString("newsletter").equals("Yes"))
                        {    
%> 
                            <dt><a href="staffNewsletter.jsp">Newsletter</a></dt>
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
                <h1 class="pagetitle">Residence Accounts</h1>
<%
                crset.next();
%>
                <h1 class="block">Head and Sub Accounts for residence <%=crset.getString("Address")%></h1>
                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostruderci tation ullamcorper suscipit lobortis nisl ut aliquip. orem ipsum dolor sit amet.</p>
                <hr class="clear-contentunit" />   

                <!-- <div class="column1-unit"> -->
<%
                crset.previous();
                String sexString = "";
                while(crset.next())
                {
                    if(crset.getString("Sex").equalsIgnoreCase("M"))
                        sexString = "Male";
                    else
                        sexString = "Female";
%>
                    <div class="column1-unit">
                        <h2><%=crset.getString("LastName")%> , <%=crset.getString("FirstName")%></h2> 
                        <p>Sex: <%=sexString%>
                        <br>Relationship: <%=crset.getString("StatInFam")%>
                        <br>Contact Number: <%=crset.getString("HouseNum")%></br><br>Email Address: <%=crset.getString("EmailAdd")%></br><br>Status in Community: <%=crset.getString("UserType")%></br><br>Account Status: <strong><%=crset.getString("Status")%></strong></p>
                        <br> 
<%
                        if(crset.getString("Status").equalsIgnoreCase("Enabled"))    
                        {    
%>                         
                            <p>Enable | <a href="processStaffEnableDisableAccount.jsp?ResId=<%=crset.getString("ResId")%>&action=0">Disable</a></p>
<%
                        }
                        else
                        {    
%>                             
                            <p><a href="processStaffEnableDisableAccount.jsp?ResId=<%=crset.getString("ResId")%>&action=1">Enable</a> | Disable</p>
<%
                        }
%>
                        <hr class="clear-contentunit"/>
                    </div>
<%
                }
%>
                <br/>
                <hr class="clear-contentunit"/>
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