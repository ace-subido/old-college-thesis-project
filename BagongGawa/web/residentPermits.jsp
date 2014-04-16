  
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
<script language="javascript" type="text/javascript">
var newwindow;
function poptastic(url)
{   
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
                int rID = (Integer)session.getAttribute("residentId");
                String resID = String.valueOf(rID);
                CachedRowSet resPermits = p.getResidentPermits(resID);
                String type  = (String)session.getAttribute("type");
                int exp = p.getResidentExpiration(rID);
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
                                if(Integer.parseInt(left)!=0 && Integer.parseInt(right)!=0 && exp!=0)
                                {
%>
                                    <dt><a href="residentPermits.jsp">Permits <br> (<%=left%>)Approved (<%=right%>)Rejected <br> (<%=exp%>)Expired</a></dt>
<%
                                }
                                else if(Integer.parseInt(left)!=0 && Integer.parseInt(right)==0 && exp==0)
                                {    
%>
                                    <dt><a href="residentPermits.jsp">Permits <br> (<%=left%>)Approved</a></dt>                                
<%
                                }
                                else if(Integer.parseInt(left)!=0 && Integer.parseInt(right)==0 && exp!=0)
                                {    
%>
                                    <dt><a href="residentPermits.jsp">Permits <br> (<%=left%>)Approved (<%=exp%>)Expired</a></dt>                                
<%
                                }
                                else if(Integer.parseInt(left)==0 && Integer.parseInt(right)!=0 && exp==0)
                                {    
%>
                                    <dt><a href="residentPermits.jsp">Permits <br> (<%=right%>)Rejected</a></dt>                                
<%
                                }
                                else if(Integer.parseInt(left)==0 && Integer.parseInt(right)!=0 && exp!=0)
                                {    
%>
                                    <dt><a href="residentPermits.jsp">Permits <br> (<%=right%>)Rejected (<%=exp%>)Expired</a></dt>                                
<%
                                }
                                else if(Integer.parseInt(left)==0 && Integer.parseInt(right)==0 && exp!=0)
                                {    
%>
                                    <dt><a href="residentPermits.jsp">Permits <br> (<%=exp%>)Expired</a></dt>                                
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
            <%
                int resiPermitID = (Integer)session.getAttribute("residentId");
                int limit = p.countLimit(resiPermitID);
            %>
            <h1 class="pagetitle">Permit Application</h1>
            <br />
            <!-- Content unit - One column -->
            <%
                if(limit>=5)
                {    
            %>
                    <h1 class="block">You Cannot Apply for New Permit. Permit limit reached.</h1>
            <%
                }
                else
                {    
            %>        
                <h1 class="block">Apply For New Permit</h1>
            <%
                }
            %>    
            <hr class="clear-contentunit" />        
            <p>Feel free to apply for a new permit for you to be able to use any of the facilities or services our village has to offer! Just click on any facilities or services you want to apply for permit.</p>  
            <%
                CachedRowSet pset = p.getPermit();
            %>
                <ul>
            <%
                if(pset.size()>0)
                {
                    String num = "", listPermit = "";
                    
                    while(pset.next())
                    {
                        num = String.valueOf(pset.getInt("pId"));
                        listPermit = pset.getString("permitName");    
                        
                        if(limit<5)
                        {    
            %>       

                    <li> <a href=residentAddPermit.jsp?permitID=<%=num%>&residentID=<%=rID%>><%=listPermit%></a></li>
            <%
                        }
                        else if(limit>=5)
                        {
            %>   
                    <li> <%=listPermit%></li>
            <%
                        }    
                    }    
                }
            %>          
                </ul> 
                <p>
                <!-- Content unit - One column -->
                </p>
                <h1 class="block"> Permits Status</h1>
                <hr class="clear-contentunit" />
                <div class="column1-unit">
                <p>Here are the list of permits that you applied for. You can see in the table the status of the permit and when was it approved or rejected. Click View in order to preview the specific permit you applied.
            <%  
                    if (resPermits.size() > 0)
                    {
            %>
                        <table width="536" border="1" align="left">
                            <tr>
                                <th width="70" scope="col"><div align="center">Permit Type</div></th>
                                <th width="100" scope="col"><div align="center">Date of Application</div></th>                                    
                                <th width="45" scope="col"><div align="center">Status</div></th>
                                <th width="110" scope="col"><div align="center">Date of Approval/Rejection</div></th>
                                <th width="25" scope="col"><div align="center">View</div></th>
                            </tr>
            <%
                            int counter = 0, size=resPermits.size();
                            CachedRowSet getPermitName;
                            while (resPermits.next() && counter < 5)
                            {
                                java.util.Date appDate = resPermits.getTimestamp("field1");
                                java.util.Date approveDate = resPermits.getTimestamp("permitApprove");
                                java.util.Date rejectDate = resPermits.getTimestamp("permitReject");
                                Calendar myCalendar = Calendar.getInstance();

                                myCalendar.setTime(appDate);

                                int month = myCalendar.get(Calendar.MONTH)+1;
                                int day = myCalendar.get(Calendar.DATE);
                                int year = myCalendar.get(Calendar.YEAR);

                                myCalendar.setTime(approveDate);

                                int month2 = myCalendar.get(Calendar.MONTH)+1;
                                int day2 = myCalendar.get(Calendar.DATE);
                                int year2 = myCalendar.get(Calendar.YEAR);

                                myCalendar.setTime(rejectDate);

                                int month3 = myCalendar.get(Calendar.MONTH)+1;
                                int day3 = myCalendar.get(Calendar.DATE);
                                int year3 = myCalendar.get(Calendar.YEAR);
                                    
                                boolean approve = false, reject = false;
                                Converter conv = new Converter();
                                String realMonth=conv.convMonth(month), realMonth2=conv.convMonth(month2), realMonth3=conv.convMonth(month3);
                                String resPermitID = String.valueOf(resPermits.getInt("pID"));
                                String permitID = String.valueOf(resPermits.getInt("permitID"));
                                getPermitName = p.getFieldDetails(permitID);
                                String permitName = getPermitName.getString("permitName");
                                String stat = resPermits.getString("Status");
                                if(stat.equalsIgnoreCase("Approved"))
                                    approve = true;

                                if(stat.equalsIgnoreCase("Rejected"))
                                    reject = true;
                                
                                String expStat = resPermits.getString("expiration");
            %>
                            
                            <tr>
                                <td>
                                    <div align="center">
            <% 
                                        if(resPermits.getString("view").equalsIgnoreCase("false") && !resPermits.getString("Status").equalsIgnoreCase("Pending"))
                                        {
                                            if(expStat.equalsIgnoreCase("Expired") && stat.equalsIgnoreCase("Approved"))
                                            {    
            %>
                                            <font color="red">
                                            <b><%=permitName%></b>
                                            </font>
            <%
                                            }
                                            else
                                            {    
            %>
                                            <b><%=permitName%></b>
            <%
                                            }
                                        }
                                        else if(resPermits.getString("view").equalsIgnoreCase("true") && !resPermits.getString("Status").equalsIgnoreCase("Pending"))
                                        {
                                            if(expStat.equalsIgnoreCase("Expired") && stat.equalsIgnoreCase("Approved"))
                                            {    
            %>
                                            <font color="red">  
                                            <%=permitName%>
                                            </font>
            <%
                                            }
                                            else
                                            {    
            %>
                                            <%=permitName%>
            <%
                                            }
                                        }
                                        else if(resPermits.getString("view").equalsIgnoreCase("false") && resPermits.getString("Status").equalsIgnoreCase("Pending"))
                                        {
            %>
                                            <%=permitName%>
            <%
                                        }
                                        else if(resPermits.getString("view").equalsIgnoreCase("true") && resPermits.getString("Status").equalsIgnoreCase("Pending"))
                                        {      
            %>
                                            <%=permitName%>
            <%
                                        }
            %>
                                    </div>
                                </td>
                                <td>
                                    <div align="center">
                                        <%=realMonth%>&nbsp;<%=day%>,&nbsp;<%=year%>
                                    </div>
                                </td>                                    
                                <td>
                                    <div align="center">
                                        <%=stat%>
                                    </div>
                                </td>
                                <td>
                                    <div align="center">
            <%
                                        if(approve==true && reject == false)
                                        {    
            %>                            
                                            <%=realMonth2%>&nbsp;<%=day2%>,&nbsp;<%=year2%>
            <%                            
                                        }
                                        else if(approve == false && reject==false)
                                        {
            %>
                                            -
            <%                            
                                        }
                                        else if(approve == false && reject==true)
                                        {    
            %>                            
                                            <%=realMonth3%>&nbsp;<%=day3%>,&nbsp;<%=year3%>
            <%                            
                                        }
            %>
                                    </div>
                                </td>
                                <td>
                                    <div align="center">
                                        <a href="javascript:poptastic('viewPermitDetails.jsp?resPermitID=<%=resPermitID%>&type=<%=type%>&Back=false&page=1&status=<%=stat%>');">View</a>
                                    </div>
                                </td>
                            </tr>                                
            <%
                            counter++;
                            }
            %>
                        </table>
            <%
                        if(size > 5)
                        {    
            %>            
                            <a href="javascript:poptastic('residentSeeMorePermits.jsp?page=1&type=<%=type%>');">See More Permits</a>
            <%
                        }
                    }
                    else
                    {    
            %>
                        <div align="center">
                            <h1>No Existing Permit</h1>
                        </div>
            <%
                    }
            %>            
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