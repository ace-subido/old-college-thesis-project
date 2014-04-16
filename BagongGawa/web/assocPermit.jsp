 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.Calendar"%>
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
    <link rel="icon" type="image/x-icon" href="./img/favicon.ico" />
    <title>Converge - Administrator</title>
</head>
<script language="JavaScript">
    function poptastic(url)
    {
        var newwindow;
	newwindow=window.open(url,'name','height=700,width=1000,location=yes,scrollbars=yes');
	if (window.focus) {newwindow.focus()}
    }
</script>
<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body>
<%
    if(session.getAttribute("uname") == null)
        response.sendRedirect("homepage.jsp");

    serviceTemplate sTemplate = new  serviceTemplate();
    
    CachedRowSet c = sTemplate.getServices();
    Permits p = new Permits();
    CachedRowSet permitSet = p.getPermit();
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
                <!-- Pagetitle -->
                <h1 class="pagetitle">Permit Application</h1>
                
                
                <h1 class="side"><img src="icons/permits-icon2.jpg" alt="" />List of Permits</h1>
                    <h3 class="side">&nbsp;</h3>
                    <p>Welcome to Permits Module. You can add a new permit and choose from the available templates that you would like to use, edit an existing permit, or simply create a new permit from scratch. You can also delete permits that were previously created. </p>
                    <p>&nbsp;        </p>
                    <form action="assocAddPermit.jsp">
                        <p><input type="submit" class="button2" value="Add Permit"/></p>
                    </form><hr class="content-unit"/>
                <%
                    if(permitSet.size()>0)
                    {
                        String num = "";
                        String listPermit = "";
                %>        
                       <br><br> <table>
                            <th><div align="center">Permit Name</div></th>
                            <th><div align="center"></div></th>                            
                <%
                        boolean isPending;
                        
                        while(permitSet.next())
                        {                            
                            num = String.valueOf(permitSet.getInt("pId"));
                            listPermit = permitSet.getString("permitName");
                            isPending = p.isPending(Integer.parseInt(num));
                %>       
                            <tr>
                                <td><div align=center><%=listPermit%></div></td>
                                <td><div align=center><a href="javascript:poptastic('assocViewPermit.jsp?permitID=<%=num%>');">view</a> |
                <%
                                if(isPending)
                                {    
                %>
                                edit | delete
                <%
                                }
                                else
                                {    
                %>
                                <a href=assocEditPermit.jsp?permitID=<%=num%>>edit</a> | <a href=assocDeletePermit.jsp?permitID=<%=num%>>delete</a>
                <%
                                }
                %>              
                                </div></td>
                            </tr>
                <%
                        }
                %>        
                        </table>                
                <%                
                    }
                %>  
                <p>
                <!-- Content unit - One column -->
                </p>
                <div class="column1-unit">
                <h1 class="block" align="center">Pending Permits</h1>
                <div align="center">
                <%
                    CachedRowSet pendingSet = p.getPendingPermit();
                    Residents r = new Residents();
                    CachedRowSet residentSet, getPermitName;
                    String left2="", orig2="";
                    int ctr2=0;
                    while(pendingSet.next())
                    {
                        if(pendingSet.getString("Status").equalsIgnoreCase("Pending"))
                        {  
                            orig2 = pendingSet.getString("path");
                            left2 = orig2.substring(0,orig2.indexOf("-"));
                        }
                        if(left2.equalsIgnoreCase("Admin") || !pendingSet.getString("Status").equalsIgnoreCase("Pending"))
                            ctr2++;
                    } 
                    int size = ctr2;
                    pendingSet.beforeFirst();
                    int counter = 0, month, day, year;
                    String id, resID, realMonth, permID, path="", orig, left, right;
                    Converter conv = new Converter();
                    java.util.Date appDate;
                    Calendar myCalendar;
                    boolean in = false, print=false;
                    if (pendingSet.size() == 0)
                    {
                        in = true;
                %>
                        <div align="center">
                            <h1>No Pending Permit Requests yet </h1>
                        </div>
                <%
                    }
                    else
                    {
                %>
                    <table width="636">                        
                <%      
                        while(pendingSet.next() && counter < 10)
                        {
                            orig = pendingSet.getString("path");
                            left = orig.substring(0,orig.indexOf("-"));
                            right = orig.substring(orig.indexOf("-")+1);
                            
                            if(left.equalsIgnoreCase("Admin"))
                            {
                                if(print==false)
                                {    
                %>
                        <tr>
                            <th width="94" class="top" scope="col"><div align="center">Resident Name</div></th>
                            <th width="82" class="top" scope="col"><div align="center">Contact No.</div></th>
                            <th width="82" class="top" scope="col"><div align="center">Permit Type</div></th>
                            <th width="115" class="top" scope="col"><div align="center">Date of Application</div></th>
                            <th width="45" class="top" scope="col"><div align="center">View Details</div></th>
                            <th width="20" class="top" scope="col"><div align="center"></div></th>
                            <th width="20" class="top" scope="col"><div align="center"></div></th>
                        </tr>
                <%
                                    print=true;
                                }
                            path = right;
                            appDate = pendingSet.getTimestamp("field1");
                            myCalendar  = Calendar.getInstance();
                            myCalendar.setTime(appDate);
                            month = myCalendar.get(Calendar.MONTH)+1;
                            day = myCalendar.get(Calendar.DATE);
                            year = myCalendar.get(Calendar.YEAR);
                            
                            realMonth = conv.convMonth(month);
                            id = String.valueOf(pendingSet.getInt("pID"));
                            permID = String.valueOf(pendingSet.getInt("permitID"));
                            String permitID = String.valueOf(permID);
                            
                            getPermitName = p.getFieldDetails(permitID);
                            String permitName = getPermitName.getString("permitName");
                            
                            resID = String.valueOf(pendingSet.getInt("resID"));
                            residentSet =  r.getResInfo(Integer.parseInt(resID));
                            residentSet.next();
                %>
                            <tr>
                                <td>
                                    <div align="center">
                                        <%=residentSet.getString("lastName")%> , <%=residentSet.getString("firstName")%>
                                    </div>    
                                </td>                                    
                                <td>
                                    <div align="center">
                                        <%=residentSet.getString("HouseNum")%>
                                    </div>    
                                </td>
                                <td>
                                    <div align="center">
                                        <%=permitName%>
                                    </div>    
                                </td>
                                <td>
                                    <div align="center">
                                        <%=realMonth%>&nbsp;<%=day%>,&nbsp;<%=year%>
                                    </div>    
                                </td>                                    
                                <td>
                                    <div align="center">
                                        <a href="javascript:poptastic('viewPermitDetails.jsp?resPermitID=<%=id%>&type=Admin&Back=false&page=1&status=Pending');">View</a>
                                    </div>    
                                </td>
                                <td>
                                    <div align="center">
                                        <a href="processApprovePermit.jsp?resPermitID=<%=id%>&ptype=All&action=1&status=Pending&path=<%=path%>&type=Admin&More=false"><img src="icons/check-mark-copy-16x16.png"></a>
                                    </div>    
                                </td>
                                <td>
                                    <div align="center">
                                        <a href="javascript:poptastic('rejectPermit.jsp?resPermitID=<%=id%>&ptype=All&action=0&status=Pending&path=<%=path%>&type=Admin&More=false&page=1');"><img src="icons/x.png"width="14" height="14"></a>
                                    </div>
                                </td>
                            </tr>
                <%
                            counter++;    
                            }
                        }
                    }
                %>
            </table>
                <%
                    if(size > 10)
                    {    
                %>            
                        <a href="javascript:poptastic('seeMorePermits.jsp?permitID=All&status=Pending&page=1&type=Admin&More=true');">See More Permits</a>
                <%
                    }
                    if(counter==0 && in==false)
                    {
                %>
                        <div align="center">
                            <h1>No Pending Permit Requests yet </h1>
                        </div>
                <%
                    }
                %>
                </div>
                </div>
                
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