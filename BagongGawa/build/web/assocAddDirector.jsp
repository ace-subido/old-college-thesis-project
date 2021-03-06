 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<!--  Version: Multiflex-3 Update-4 / Layout-4             -->
<!--  Date:    December 11, 2006                           -->
<!--  Author:  Wolfgang                                    -->
<!--  License: Fully open so urce without restrictions.     -->
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
    <title>Converge - Administrator</title>
    <style type="text/css">
    <!--
    .style2 {color: #000000}
    -->
    </style>
</head>
<body>
<%	
    if(session.getAttribute("uname") == null)
        response.sendRedirect("homepage.jsp");

    int resID = Integer.parseInt(request.getParameter("residentID"));

    String divID = request.getParameter("divId");
    String hid = request.getParameter("type");
    session.setAttribute("divTYPE", hid);
    Permits p = new Permits();
    Residents r = new Residents();
    serviceTemplate t = new  serviceTemplate();        
    CachedRowSet c = t.getServices();
    CachedRowSet residentDB = r.getResInfo(resID);
    residentDB.next();
    Election e = new Election();
    CachedRowSet divSet = e.getDivisionName2(Integer.parseInt(divID));
    divSet.next();
    Polls poll = new Polls();
    CachedRowSet pSet = poll.getMaxDays();
    pSet.next();
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
                        Thesis db = new Thesis();
                        CachedRowSet checkdiectorset = db.getDirectors7();
                        
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
                <div class="column1-unit">
                    <form method="post" action="processAssocAddDirector.jsp">
                        <table width="536" border="1">
                            <input type="hidden" name="hidid" id="hidid" value="<%=residentDB.getInt("ResId")%>">
                            <p></p>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="fullnametag" class="left">Name</label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="fullname" id="fullname"><%=residentDB.getString("lastName")%>,&nbsp;<%=residentDB.getString("firstName")%></label>
                                    </div>            
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="addresstag" class="left">Address</label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="address" id="address"><%=residentDB.getString("Address")%></label>
                                    </div>            
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="phonetag" class="left">House Number</label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="phone" id="phone"><%=residentDB.getString("HouseNum")%></label>
                                    </div>            
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="emailtag" class="left">Email Address</label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="email" id="email"><%=residentDB.getString("EmailAdd")%></label>
                                    </div>            
                                </td>
                            </tr>
                        </table>
                        <table width="536" border="1">
                            <input type="hidden" name="hidid" id="hidid" value="<%=residentDB.getInt("ResId")%>">
                            <input type="hidden" name="hidid2" id="hidid2" value="<%=divID%>">
<%
                        Calendar myCalendar = Calendar.getInstance();

                        int month = myCalendar.get(Calendar.MONTH)+1;
                        int year = myCalendar.get(Calendar.YEAR);
                        int day = myCalendar.get(Calendar.DATE);
                        Converter conv = new Converter();
                        String realMonth = conv.convMonth(month);
%>                            
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="fullnametag" class="left">Division Name</label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="fullname" id="fullname"><%=divSet.getString("comDivisionName")%></label>
                                    </div>            
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label>Start date of being a director</label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="field1" id="field1"><%=realMonth%>&nbsp;<%=day%>,&nbsp;<%=year%></label>
                                    </div>            
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label>End date of being a director</label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="field1" id="field1"><%=realMonth%>&nbsp;<%=day%>,&nbsp;<%=year+pSet.getInt("years")%></label>
                                    </div>            
                                </td>
                            </tr>
                        </table>
                        <p>
                            <div align="center">
                                <input type="submit" value="Appoint" class="button">
                            </div>
                        </p>
                    </form>    
                </div>
            </div>
        </div>
    
        <div class="footer">
            <p>Copyright &copy; 2006 Your Company | All Rights Reserved</p>
            <p class="credits">Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a> | Modified by <a href="#" title="Adaptor Homepage">Your Name</a> | Powered by <a href="#" title="Content Management System">Your CMS</a> | <a href="http://validator.w3.org/check?uri=referer" title="Validate XHTML code">W3C XHTML 1.0</a> | <a href="http://jigsaw.w3.org/css-validator/" title="Validate CSS code">W3C CSS 2.0</a></p>
        </div>
    </div>
    </body>
</html>