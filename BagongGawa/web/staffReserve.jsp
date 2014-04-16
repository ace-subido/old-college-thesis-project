 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

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
    <script type="text/javascript" src="./js/ajaxgetReserve.js"></script>  
    <link rel="icon" type="image/x-icon" href="./img/favicon.ico" />
    <title>Converge - Staff : Reservations</title>
</head>

<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body>
<% 
    serviceTemplate t = new  serviceTemplate();
    addFacility af = new addFacility(); 
    FacId fi = new FacId();
    CachedRowSet c = t.getServices();
    Thesis db = new Thesis();

    Vector<ReservationObject> v = db.getReservations2();
    //Vector<ReservationObject> v1 = new Vector<ReservationObject>();        
    v.trimToSize();
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
                <h1 class="pagetitle">Reservation Service</h1>
		<div class="column1-unit">
                    <h1 class="side"><img src="icons/reservation-icon.jpg" alt="Image description" title="Image title" />List of Reservations</h1>
                    <h3 class="side">&nbsp;</h3>
                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostruderci tation ull 
                    <br>
                    <ul>
                        <li> <a href="assocCancelAllRes.jsp">Cancel All Reservations</a></li>
                        <li> <a onclick='showAllReserveHistory()'>View Reservation History</a></li>                  
                    </ul>
                    </p>       
                </div>
                <hr class="clear-contentunit" />
                <div class="column1-unit">
<%
                if(v.size() == 0)
                {
%>
                    <h1>No upcoming reservations</h1>   <br>
<% 
                }
                else
                { 
%>
                    <h1>Upcoming reservations</h1>   
<%
        //v1 = v;       
                    for(int i = 0; i < v.capacity(); i++)
                    {   
                        if(v.elementAt(i).printed == 0)
                        { 
%>
                            <h5><b><%=v.elementAt(i).frresdatestr%></b></h5>
                            <p><b><img src="icons/reserve-calendar-icon.JPG"/>The "<%=v.elementAt(i).facName%>" is reserved from <%=v.elementAt(i).frreshour%>:<%=v.elementAt(i).frresminstr%> <%=v.elementAt(i).frresampm%> to <%=v.elementAt(i).toreshour%>:<%=v.elementAt(i).toresminstr%> <%=v.elementAt(i).toresampm%></b><br>
                            by <%=v.elementAt(i).resName%> | Edit Reservation | <a href="processAssocResDel.jsp?reservation=<%=v.elementAt(i).reservationID%>">Cancel Reservation</a> </p>
<%   
                            for(int j = 0; j < v.size(); j++)
                            { 
                                if(v.elementAt(i).difference == v.elementAt(j).difference && v.elementAt(i).reservationID != v.elementAt(j).reservationID)
                                {
%>
                                    <p><b><img src="icons/reserve-calendar-icon.JPG"/>The "<%=v.elementAt(i).facName%>" is reserved from <%=v.elementAt(j).frreshour%>:<%=v.elementAt(j).frresminstr%> <%=v.elementAt(j).frresampm%> to <%=v.elementAt(j).toreshour%>:<%=v.elementAt(j).toresminstr%> <%=v.elementAt(j).toresampm%></b><br>
                                    by <%=v.elementAt(j).resName%> | Edit Reservation |  <a href="processAssocResDel.jsp?reservation=<%=v.elementAt(j).reservationID%>">Cancel Reservation</a> </p>
<%
                                    v.elementAt(i).printed = 1;
                                    v.elementAt(j).printed = 1;
                                }             
                            }            
                        }     
                    }
                    session.setAttribute("ReservationVector", v);
                }
%> 
            </div>
            <hr class="clear-contentunit" />
            <div class="column1-unit" id="popo"></div></div>
        </div>
        
        <!-- C. FOOTER AREA -->      

        <div class="footer">
            <p>Copyright &copy; 2008 4B1C Group | All Rights Reserved</p>
            <p class="credits">Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a> | Modified by <a href="#" title="Adaptor Homepage">4B1C Group</a> | Powered by <a href="#" title="Content Management System">CCMS</a> | <a href="http://validator.w3.org/check?uri=referer" title="Validate XHTML code">W3C XHTML 1.0</a> | <a href="http://jigsaw.w3.org/css-validator/" title="Validate CSS code">W3C CSS 2.0</a></p>
        </div>    
    </div> 
</body>
</html>