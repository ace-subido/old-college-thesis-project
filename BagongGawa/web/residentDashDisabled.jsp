
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<!--  Version: Multiflex-3 Update-4 / Layout-4             -->
<!--  Date:    December 11, 2006                           -->
<!--  Author:  Wolfgang                                    -->
<!--  License: Fully open source without restrictions.     -->
<!--           Please keep footer credits with a link to   -->
<!--           Wolfgang (www.1-2-3-4.info). Thank you!     -->
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
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
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="./css/layout4_setup.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="./css/layout4_text.css" />
    <script type="text/javascript" src="./js/ieflickerhack.js"></script>  
    <link rel="icon" type="image/x-icon" href="./img/favicon.ico" />
    <title>Converge - Resident</title>
</head>

<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body>
<%
    serviceTemplate t = new  serviceTemplate();
    CachedRowSet c = t.getServices();
%>
    
                                <!-- Main Page Container -->
    <div class="page-container">    
    <!-- For alternative headers START PASTE here -->
    <!-- A. HEADER -->      
        <div class="header">
      
            <!-- A.1 HEADER TOP -->
            <div class="header-top">
        
                <!-- Sitelogo and sitename -->
                <a class="sitelogo" href="residentDash.jsp" title="Go to Start page"></a>
                <div class="sitename">
                    <h1><a href="residentDash.jsp" title="Go to Start page">CONVERGE</a></h1>
                    <h2>Generic Community Association Portal</h2>
                </div>

                <!-- Navigation Level 1 -->
                <div class="nav1">
                    <ul>
                        <li><a href="residentDashDisabled.jsp" title="Go to Start page">Home</a></li>
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
                        <li><a href="residentDashDisabled.jsp">Home</a></li>
                    </ul>
                    <ul>
                        <li><a href="#">My Account</a><!--<![endif]-->
                        <ul>
                            <li><a href="resMyAccountDisabled.jsp">Account Information</a></li>
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
            <div class="main-navigation">

            <!-- Navigation Level 3 -->
            <div class="round-border-topright"></div><br><br>
            <h1 class="first">Community Services</h1>

            <!-- Navigation with grid style -->
            <dl class="nav3-grid">
<%               
            if(c.size() >0)
            {
                while(c.next())
                {
                    if(c.getString("billing").equals("Yes"))
                    {    
%>  
                        <dt><a href="residentBill.jsp"><font color="#FF0000">Billing</font></a></dt>
<% 
                    }
                    if(c.getString("newsletter").equals("Yes"))
                    {    
%>  
                        <dt><a href="residentNewsletter.jsp">Newsletter</a></dt>
<% 
                    }
                }
            }
%>
            </dl>                            <Br /><Br />  
            </div>

            <!-- B.1 MAIN CONTENT -->
            <div class="main-content">
<%
                Residents r = new Residents();
                int rID = (Integer)session.getAttribute("residentId");
                CachedRowSet residentSet = r.getResInfo(rID);
                residentSet.next();
                String name = residentSet.getString("FirstName")+" "+residentSet.getString("LastName");
%>
                <!-- Pagetitle -->
                <h1 class="pagetitle">Welcome <%=name%></h1>

                <!-- Content unit - One column -->
                <div class="column1-unit">
                <h1 class="side"><img src="icons/padlock.png"/></h1>
                <p>SOME FEATURES ARE NOT YET AVAILABLE, PLEASE CHECK YOUR BILLING STATUS OR ACCOUNT INFORMATION</p>
                </div>          
                <hr class="clear-contentunit" />
            </div>
        </div>  
        <!-- C. FOOTER AREA -->      
        <div class="footer">
            <p>Copyright &copy; 2006 Your Company | All Rights Reserved</p>
            <p class="credits">Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a> | Modified by <a href="#" title="Adaptor Homepage">Your Name</a> | Powered by <a href="#" title="Content Management System">Your CMS</a> | <a href="http://validator.w3.org/check?uri=referer" title="Validate XHTML code">W3C XHTML 1.0</a> | <a href="http://jigsaw.w3.org/css-validator/" title="Validate CSS code">W3C CSS 2.0</a></p>
        </div>      
     
    </div>
</body>
</html>