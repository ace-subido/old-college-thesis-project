
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
<script language="JavaScript">
    function poptastic(url)
    {
        var newwindow;
	newwindow=window.open(url,'name','height=700,width=1000,location=yes,scrollbars=yes');
	if (window.focus) {newwindow.focus()}
    }
</script>
<body>
<%
    serviceTemplate t = new  serviceTemplate();
    CachedRowSet c = t.getServices();
    Residents r = new Residents();
    int rID = (Integer)session.getAttribute("residentId");
    String resId = String.valueOf(rID);
%>
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
                        <li><a href="residentDash.jsp" title="Go to Start page">Home</a></li>
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
                        <li><a href="residentDash.jsp">Home</a></li>
                    </ul>
               
                   <ul>
                        <li><a href="residentMessageBox.jsp">Mailbox</a></li>
                    </ul>
                    <!-- Navigation item -->
                    <ul>  
                        <li><a href="#">My Account</a><!--<![endif]-->
                        <!--[if lte IE 6]><table><tr><td><![endif]-->
                        <ul>
                            <li><a href="resMyAccount.jsp">Account Information</a></li>
                            <li><a href="resAddSub.jsp">Add Sub-Account</a></li>
                                                            
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
            <div class="main-navigation">
                <!-- Navigation Level 3 -->
                <div class="round-border-topright"></div><br><br>
                <h1 class="first">Community Services</h1>

                <!-- Navigation with grid style -->
                <dl class="nav3-grid">
<%
                String orig, left="", right="";
                Permits p = new Permits();
                
                CachedRowSet resPermits = p.getResidentPermits(resId);
                String type  = (String)session.getAttribute("type");
                if(c.size() >0)
                {
                    while(c.next())
                    {
                        if(c.getString("permit").equals("Yes"))
                        {
                            if (resPermits.size() > 0)
                            {
                                orig = p.getResidentViewCount(rID);
                                left = orig.substring(0,orig.indexOf("-"));
                                right = orig.substring(orig.indexOf("-")+1);
                                if(Integer.parseInt(left)!=0 && Integer.parseInt(right)!=0)
                                {
%>
                                    <dt><a href="residentPermits.jsp">Permits <br> (<%=left%>)Approved (<%=right%>)Rejected</a></dt>
<%
                                }
                                else if(Integer.parseInt(left)!=0 && Integer.parseInt(right)==0)
                                {    
%>
                                    <dt><a href="residentPermits.jsp">Permits <br> (<%=left%>)Approved</a></dt>                                
<%
                                }
                                else if(Integer.parseInt(left)==0 && Integer.parseInt(right)!=0)
                                {    
%>
                                    <dt><a href="residentPermits.jsp">Permits <br> (<%=right%>)Rejected</a></dt>                                
<%
                                }
                                else if(Integer.parseInt(left)==0 && Integer.parseInt(right)==0)
                                {
%>
                                    <dt><a href="residentPermits.jsp">Permits</a></dt>
<%                        
                                }    
                            }
                            else
                            {    
%>
                                <dt><a href="residentPermits.jsp">Permits</a></dt>
<% 
                            }
                        }
                        if(type.equalsIgnoreCase("Director"))
                        {
%>                
                            <dt><a href="directorPermit.jsp">Permits to be Approved</a></dt>
<%          
                        }
                        if(c.getString("reservation").equals("Yes"))
                        {    
%> 
                            <dt><a href="residentReserve.jsp">Reservations</a></dt>
<% 
                        }
                        if(c.getString("socialgroups").equals("Yes"))
                        {    
%> 
                            <dt><a href="residentSocMain.jsp">Social Groups</a></dt> 
<% 
                        }
                        if(c.getString("vote").equals("Yes"))
                        {    
%> 
                            <dt><a href="residentPolls.jsp">Polls or Elections</a></dt>
<% 
                        }
                        if(c.getString("bulletinBoard").equals("Yes"))
                        {    
%> 
                            <dt><a href="residentBulletinBoard.jsp">Bulletin Board</a></dt>
<% 
                        }
                        if(c.getString("billing").equals("Yes"))
                        {    
%>  
                            <dt><a href="residentBill.jsp">Billing</a></dt>
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
                </dl><Br /><Br />  

            <!-- Title --> 
            </div>
 
        <!-- B.1 MAIN CONTENT -->
        <div class="main-content">
        <!-- Pagetitle -->
            <p>
                <!-- Content unit - One column -->
                </p>
                <div class="column1-unit">
                <h1 class="block" align="center">Pending Permits</h1>
                <div align="center">
                <%
                    CachedRowSet pendingSet = p.getPendingPermit();
                    
                    CachedRowSet residentSet, getPermitName;
                    int counter = 0, month, day, year;
                    String id, resID, realMonth, permID, path="";
                    orig=""; left=""; right="";
                    Converter conv = new Converter();
                    java.util.Date appDate;
                    Calendar myCalendar;
                    boolean in = false, print=false;
                    String left2="", orig2="";
                    int ctr2=0;
                    while(pendingSet.next())
                    {
                        if(pendingSet.getString("Status").equalsIgnoreCase("Pending"))
                        {  
                            orig2 = pendingSet.getString("path");
                            left2 = orig2.substring(0,orig2.indexOf("-"));
                        }
                        if(left2.equalsIgnoreCase(resId))
                            ctr2++;
                    } 
                    
                    pendingSet.beforeFirst();
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
                        while(pendingSet.next())
                        {
                            orig = pendingSet.getString("path");
                            left = orig.substring(0,orig.indexOf("-"));
                            right = orig.substring(orig.indexOf("-")+1);
                            counter++;
                            if(left.equalsIgnoreCase(resId))
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
                                        <a href="javascript:poptastic('viewPermitDetails.jsp?resPermitID=<%=id%>&type=Director&Back=false&page=1&status=Pending');">View</a>
                                    </div>    
                                </td>
                                <td>
                                    <div align="center">
                                        <a href="processApprovePermit.jsp?resPermitID=<%=id%>&ptype=All&action=1&status=Pending&path=<%=path%>&type=Director&More=false"><img src="icons/check-mark-copy-16x16.png"></a>
                                    </div>    
                                </td>
                                <td>
                                    <div align="center">
                                        <a href="javascript:poptastic('rejectPermit.jsp?resPermitID=<%=id%>&ptype=All&action=0&status=Pending&path=<%=path%>&type=Admin&More=false&page=1');"><img src="icons/x.png"width="14" height="14"></a>
                                    </div>
                                </td>
                            </tr>
                <%
                            }
                        }
                    }
                %>
            </table>
                <%
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

            <!-- Subcontent unit -->
            </div>        
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