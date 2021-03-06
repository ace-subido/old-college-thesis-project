   
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
                <h1 class="pagetitle">Manage Election</h1>
                <h1 class="block">Election List</h1>
                <p>Here are the list of election.  Included in the list are the election name, start date, closing date, and the status whether the election is closed or still open.  Just click View in order to see the details of the specific election, edit to modify nomination, and close to stop the nomination.</p>
                <hr class="clear-contentunit" />   
                <!-- <div class="column1-unit"> -->
                <div class="column1-unit">
                        <table width="636">
<%
                Election2 db = new Election2();
                CachedRowSet p = db.getElection();
                int ctr=0;
                while(p.next())
                {
                    ctr++;
                    int Pollid = p.getInt("ElecId");                    
                    if(ctr==1)
                    {    
%>
                    
                            <tr>
                                <th width="94" class="top" scope="col"><div align="center">Poll Name</div></th>
                                <th width="125" class="top" scope="col"><div align="center">Start Date</div></th>
                                <th width="125" class="top" scope="col"><div align="center">Closing Date</div></th>
                                <th width="70" class="top" scope="col"><div align="center">Status</div></th>
                                <th width="150" class="top" scope="col"><div align="center"></div></th>
                            </tr>
<%
                    }
%>                        
                            <tr>
                                <td><div align="center"><%=p.getString("ElecName")%></div></td>
<%
                                java.util.Date startDate = p.getTimestamp("ElecSDate");
                                java.util.Date closeDate = p.getTimestamp("ElecCDate");
                                Calendar myCalendar = Calendar.getInstance();

                                myCalendar.setTime(startDate);
                                int month = myCalendar.get(Calendar.MONTH)+1;
                                int day = myCalendar.get(Calendar.DATE);
                                int year = myCalendar.get(Calendar.YEAR);

                                myCalendar.setTime(closeDate);
                                int month2 = myCalendar.get(Calendar.MONTH)+1;
                                int day2 = myCalendar.get(Calendar.DATE);
                                int year2 = myCalendar.get(Calendar.YEAR);

                                Converter conv = new Converter();
                                String realMonth=conv.convMonth(month), realMonth2=conv.convMonth(month2);
%>
                                <td><div align="center"><%=realMonth%>&nbsp;<%=day%>,&nbsp;<%=year%></div></td>
                                <td><div align="center"><%=realMonth2%>&nbsp;<%=day2%>,&nbsp;<%=year2%></div></td>
                                <td><div align="center"><%=p.getString("ElecStatus")%></div></td>
<%
                                if(p.getString("ElecStatus").equalsIgnoreCase("Open"))
                                {    
%>                        
                                <td><div align="center"><a href="staffeditelec.jsp?elecid=<%=p.getInt("ElecId")%>">Edit</a> | <a href="processStaffStopElec.jsp?elecid=<%=p.getInt("ElecId")%>">Stop</a></div></td>
<%
                                }
                                else
                                {    
%>
                                <td><div align="center"><a href="javascript:poptastic('staffviewelec.jsp?elecid=<%=p.getInt("ElecId")%>');">View</a></div></td>
<%
                                }
%>
                            </tr>
                        
<%
                }
%>
                </table>
                    </div>
                    <hr class="clear-contentunit"/>
<%
                if(ctr==0)
                {    
%>
                <h1><div align="center">No Election Exist</div></h1>
<%
                }
%>
                <br> 
                <hr class="clear-contentunit"/>
            </div>                             
        </div> 
        
        <div class="footer">
            <p>Copyright &copy; 2006 Your Company | All Rights Reserved</p>
            <p class="credits">	Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a> | Modified by <a href="#" title="Adaptor Homepage">4B1C</a> | Powered by <a href="#" title="Content Management System">CCMS</a> | <a href="http://validator.w3.org/check?uri=referer" title="Validate XHTML code">W3C XHTML 1.0</a> | <a href="http://jigsaw.w3.org/css-validator/" title="Validate CSS code">W3C CSS 2.0</a></p>
        </div>  
    </div>
</body>
</html>