 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.Calendar"%>

<!--  Version: Multiflex-3 Update-4 / Layout-4             -->
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
    <title>Converge - Administrator</title>
</head>

<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body>
<%
    if (session.getAttribute("uname") == null)
        response.sendRedirect("homepage.jsp");
    FacId fi = new FacId();
    addFacility af = new addFacility();
    serviceTemplate t = new serviceTemplate();
    CachedRowSet c = t.getServices();
    int i = af.getTotalBulletin();
    CachedRowSet crset = fi.getBulletinFromAdminLatest();
    Unit u = new Unit();
    addFacility ADDFAC = new addFacility();
    CachedRowSet vilinfo = u.getVillageInfo();
    CachedRowSet facSet = ADDFAC.getAllFacility();
    Jem jem = new Jem();
    int totalfacitype = jem.getTotalType();
    int totalfaci = jem.getTotalFac();
    Thesis db = new Thesis();
    CachedRowSet checkdiectorset = db.getDirectors99();
    int coolness = checkdiectorset.size();
   System.out.println(coolness);
%>
    <!-- Main Page Container -->
    <div class="page-container">
        <div class="header">
            <!-- A.1 HEADER TOP -->
            <div class="header-top">
                <!-- Sitelogo and sitename -->
                <a class="sitelogo" href="#" title="Go to Start page"></a>
                <div class="sitename">
                    <h1><a href="associationDash.jsp" title="Go to Start page">CONVERGE</a></h1>
                    <h2>Generic Community Association Portal</h2>
                </div>
                
                <!-- Navigation Level 1 -->
                <div class="nav1">
                    <ul>
                        <li><a href="associationDash.jsp" title="Go to Start page">Home</a></li>
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
<%
                        
                        
                        if(coolness>0)
                        {
%>
                                <li><a href="assocDirectorMain.jsp?criteria=0&search=All">Board of Directors or Officers</a></li>
<%
                        }
                        if(facSet.size()>0)
                        {    
%>                        
                                <li><a href="assocFacilities.jsp">Facilities</a></li>
<%
                        }    
                        if(vilinfo.size()>0)
                        {    
%>                 
                                <li><a href="assocVillInfo.jsp">Village Information</a></li>
<%
                        }
                        if(c.size()>0)
                        {    
%>                                        
                                <li><a href="assocServices.jsp">Association Services</a></li> 
<%
                        }
                        Jem j = new Jem();
                        CachedRowSet checkresSet = j.getResidentTable();
                        if(checkresSet.size()>0)
                        {    
%>                                
                                <li><a href="assocResidentAccounts.jsp?criteria=0&search=All">Residents and Accounts</a></li>
<%
                        }
%>                                
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
                <h1 class="pagetitle">Welcome Administrator </h1>
                <!-- Content unit - One column -->
                <h1 class="block">Notices</h1>
                <div class="column1-unit">                    
 
                    <h1><font color="red"><b>Getting Started</b></font></h1>
                    <p>The links below will help get your account up and running. </p>
                    <ul>
<%
                        if(vilinfo.size()<=0)
                        {
%> 
                            <a href="assocSetupPart1.jsp"><li>Adding information about your community and management divisions</li></a>
<%
                        }
                        else
                        {
%>                         
                            <li>Adding information about your community and management divisions</li>
<%
                        }
                        Account a = new Account();
                        CachedRowSet lotSet = a.getAllLot();    
                        if(lotSet.size()<=0)
                        {
%>
                        <a href="assocSetupPhysicalLayout.jsp"><li>Setting up your community's physical layout</li></a>
<%
                        }
                        else
                        {
%>
                        <li>Setting up your community's physical layout</li>
<%
                        }
                        if(totalfacitype<=3)
                        {
%>
                        <a href="assocSetupPart1a.jsp"><li>Adding types of facilities that are available in your community</li></a>
 <%
                        }
                        else
                        {
%>                       
                            <li>Adding types of facilities that are available in your community</li>
<%
                        }
                        if(totalfaci<=0)
                        {
%>
                        <a href="assocSetupPart2.jsp"><li>Adding facilities within your community</li></a>
<%
                        }
                        else
                        {
%>   
                            <li>Adding facilities within your community</li>
<%
                        }
                        if(checkresSet.size() < 3)
                        {    
%>
                        <a href="assocSetupResidents.jsp"><li>Adding of resident accounts</li></a>
<%
                        }
                        else
                        {
%>
                        <li>Adding of resident accounts</li>
<%
                        }
                        System.out.println(coolness);
                        if(coolness == 0)
                        {    
%>
                        <a href="assocSetupPart3.jsp"> <li>Adding Board of Directors and Officers of your community</li></a>
<%
                        }
                        else
                        {    
%>
                        <li>Adding Board of Directors and Officers of your community</li>
<%
                        }
                        if(c.size() <=0)
                        {
%>                        
                        <a href="assocSetupPart4.jsp"><li>Choosing services of Converge that will be available in your site</li></a>
<%                       
                        }
                        else
                        {    
%>
                        <li>Choosing services of Converge that will be available in your site</li>
<%
                        }
%>
                    </ul>
                </div> 
                
<% 
            if (i > 0)
            {
                Calendar myCalendar = Calendar.getInstance();

                while (crset.next())
                {
                    int amonth, ayear, aday, adweek;
%>  
                <hr class="clear-contentunit" />
                <div class="column1-unit">
                    <h1><font color="#FF0000">New announcement from the Association</font></h1>
                    <h3><%=crset.getString("bulletinTitle")%></h3>                    
                    <p><%=crset.getString("bulletinContent")%></p> 
                    <p><div class="button2"><%=crset.getTimestamp("bulletinDate").toString()%></div></p> 
                </div> 
<%
                }
            }
%>            
                        
                <hr class="clear-contentunit" /> 
            </div>
            
            <!-- B.3 SUBCONTENT -->
                   
        </div>
        <!-- C. FOOTER AREA -->      
        
        <div class="footer">
            <p>Copyright &copy; 2008 4B1C Group | All Rights Reserved</p>
            <p class="credits">Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a> | Modified by <a href="#" title="Adaptor Homepage">4B1C Group</a> | Powered by <a href="#" title="Content Management System">CCMS</a> | <a href="http://validator.w3.org/check?uri=referer" title="Validate XHTML code">W3C XHTML 1.0</a> | <a href="http://jigsaw.w3.org/css-validator/" title="Validate CSS code">W3C CSS 2.0</a></p>
        </div>    
    </div> 
</body>
</html>