 
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
        <title>Converge - Administrator : Community Facilities</title>
    </head>
    
    <!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->
    
    <body>
        <%
            if (session.getAttribute("uname") == null) {
                response.sendRedirect("homepage.jsp");
            }
            Thesis db = new Thesis();
            Unit ik = new Unit();
            serviceTemplate t = new serviceTemplate();

            CachedRowSet c = t.getServices();
            String divu = ik.getDivUnit();

            CachedRowSet crset = db.getFacilities();
Unit u = new Unit();
    addFacility ADDFAC = new addFacility();
    CachedRowSet vilinfo = u.getVillageInfo();
    CachedRowSet facSet = ADDFAC.getAllFacility();
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
                        Thesis db3 = new Thesis();
                        CachedRowSet checkdiectorset = db3.getDirectors7();
                        
                        if(checkdiectorset.size()>0)
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
                    <h1 class="pagetitle">Setting up your Community &nbsp; 1 2 3 <font color="red">4</font> 5 6 7</h1>
                    <div class="column1-unit">
                    <h1 class="side">Community Facilities &nbsp;</h1>
                    
                    </div>
                    <!-- Content unit - One column -->
                    <h1 class="side"><img src="icons/facilities_icon.jpg" alt="Image description" title="Image title" /></h1>
                    <h3 class="side">&nbsp;</h3>
                    <p>This page contains the list of facilities of your community. An admin can add new facilities of your community.<br>
                                         
                       </p>  
                    
                    <%
            if (crset != null) {
                if (crset.size() == 0) {
                    %>
                    <div align="center"><h1>There are no Facilities added yet </h1></div>
                    
                    <%	} else {
                    %>
                    <ul>
                            <li><font color="red">To edit details of current facilities go to:<i> Manage Association -> Facilities</i> then click <i>Edit Facilities</i></font></li>
                        </ul>
                    <div class="column1-unit">
                        <form method="post" action="index.html">
                            <table width="536">
                                <tr><th width="207" class="top" scope="col">Facility Name</th><th width="100" class="top" scope="col">Facility Type</th><th width="100" class="top" scope="col">Location</th><!--<th width="100" class="top" scope="col">Capacity</th><th width="100" class="top" scope="col">Land Area</th><th width="100" class="top" scope="col">Usage Fee</th><th width="100" class="top" scope="col">Reservation Fee</th>-->
                                    
                                </tr>
                                <%
                        while (crset.next()) {
                                %>
                                <tr><td><%=crset.getString("FaciName")%></td><td><%=crset.getString("Type")%></td><td><%=divu%>&nbsp;<%=crset.getString("Location")%></td><!--<td>%=crset.getInt("Capacity")%></td><td>%=crset.getInt("LandArea")%> square meters</td><td>%=crset.getInt("UsageFee")%></td><td>%=crset.getInt("ReservationFee")%></td>-->
                                </tr>
                                
                                <%
                        }
                                %>
                            </table>
                            <%
                }
            }
                            %>
                            
                            
                            <br />
                        <p><input type="button" onclick="window.location.href='assocSetupPart2a.jsp?facility=0'" name="submit" id="submit" class="button" value="Add New Facility" tabindex="6" /></p></form>
                        <hr class="clear-contentunit" /><br><Br>
                        <input type="button" class="button2" value="Finish" onclick="window.location.href='associationDash.jsp'">
                    </div>          
                    
                    
                    
            </div></div>
            
            <!-- C. FOOTER AREA -->      
            
            <div class="footer">
                <p>Copyright &copy; 2006 Your Company | All Rights Reserved</p>
                <p class="credits">Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a> | Modified by <a href="#" title="Adaptor Homepage">4B1C</a> | Powered by <a href="#" title="Content Management System">CCMS</a> | <a href="http://validator.w3.org/check?uri=referer" title="Validate XHTML code">W3C XHTML 1.0</a> | <a href="http://jigsaw.w3.org/css-validator/" title="Validate CSS code">W3C CSS 2.0</a></p>
            </div>      
        </div> 
        
        
    </body>
</html>



