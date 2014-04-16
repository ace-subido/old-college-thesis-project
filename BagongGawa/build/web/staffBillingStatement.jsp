 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.Calendar, java.util.*"%>
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
    <title>Converge - Staff</title>
</head>

<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body>
<% 
    serviceTemplate t = new  serviceTemplate();
       
    CachedRowSet c = t.getServices();
        
    FacId f = new FacId();
    CachedRowSet crset = f.getBilling();
    addFacility mb = new addFacility();
    if(session.getAttribute("billbatch") == null)
    {
        int billbatch = mb.getMonthlyBillValuesBatch();
        billbatch++;
        Vector<String> vname = new Vector<String>();
        session.setAttribute("vname", vname);
        Vector<Integer> vamount = new Vector<Integer>();
        session.setAttribute("vamount", vamount);
        session.setAttribute("billbatch", billbatch);  
    }
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
                <div class="column1-unit">
                    <h1 align="center" class="side">Bills</h1>
                    <h3 class="side"></h3>
                    <br><hr />
                    <div class="column1-unit">
                        <div class="contactform">
                            <form name="form1" method="GET" action="processStaffBillingStatementNew.jsp">
                                <fieldset>
                                    <legend align="center">Billing Statement</legend>
<% 
                                    while(crset.next())
                                    {
                                        if(crset.getString("water").equals("Yes"))
                                        {
%>                       
                                            <legend>Water Expense</legend> <br><br>
                                            <label class="left">Maynilad/NAWASA Bill </label><input type="text" name="totMaynilad" value="" /> <br>
                                            <br />
                                            <script type= "text/javascript">
                                            <!--
                                                function q()
                                                {
                                                    alert("The total meter of the community in cubic meter");
                                                }
                                            -->
                                            </script>
                                            <label class="left">Community Meter ( <a href="#" onclick="q()">?</a> ) </label><input type="text" name="totComMeter" value="" /> 
                                            <br><br>
                                            <hr />
                                            <br>
<% 
                                        }
                                        if(crset.getString("realEstate").equals("Yes"))
                                        {
%>
                                            <legend>Real Property Tax</legend><br><br>
                                            <label class="left">Master Tax of the Community</label><input name="masterTax" type="text" id="masterTax" value="" /> 
                                            <br>
                                            <br>
                                            <hr />
<% 
                                        }
                                        if(crset.getString("garbage").equals("Yes"))
                                        {
%>              
                                            <br>
                                            <legend>Garbage</legend> <BR><BR>
                                            <label class="left">Fee for Garbage Collector</label><input name="garbage" type="text" id="garbage" value="" /> 
                                            <br /><br>
                                            <hr />
<% 
                                        }
                                        if(crset.getString("security").equals("Yes"))
                                        {
%>                
                                            <br>
                                            <legend>Security</legend> <br><br>
                                            <label class="left">Security Fee</label><input name="security" type="text" id="security" value="" /> 
                                            <br /><br>
                                            <hr />
<% 
                                        }
                                        if(crset.getString("salary").equals("Yes"))
                                        {
%>
                                            <br>
                                            <legend>Staff Salary</legend> <br><br>
                                            <label class="left">Total Salary of all Staffs</label><input name="salary" type="text" id="masterTax" value="" />            
                                            <br /><br>
                                            <hr />
<%
                                        }
%>
                                        <br><br>
<% 
                                        if(session.getAttribute("vname") != null)
                                        {
                                            Vector<String> vname = (Vector<String>)session.getAttribute("vname");
                                            Vector<Integer> vamount = (Vector<Integer>)session.getAttribute("vamount");
%>
                                            <label>List of added Expenses</label> <br /><br /><br>
<%
                                            if(vname.size() != 0 && vamount.size() != 0)
                                            {
                                                for(int q=0; q<vname.size(); q++)
						{
                                                    String temp = vname.get(q);
                                                    String temp2 = vamount.get(q).toString();
%>
                                                    <label><%=temp%>:  </label> 
                                                    <%=temp2%><br><br>
<%                                  
                                                }
                                            }
                                        } 
%>                
                                        <br><br>
                                        <p><input type="button" class="button" onclick="window.location.href='staffBill.jsp'" value="Back"/>
<% 
                                        if(crset.getString("addForStaff").equals("Yes"))
                                        {
%>
                                            <input type="button" class="button" onclick="window.location.href='staffBillingStatementAdded.jsp'" value="add other Expenses"/>
<% 
                                        }
                                    }
%>
                                    <input type="submit" class="button" value="OK"/>
                                    </p>
                                    <br />
                                    <br />
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>  
            </div>        
            <hr class="clear-contentunit" />
        </div>
      
        <!-- C. FOOTER AREA -->      

        <div class="footer">
            <p>Copyright &copy; 2008 4B1C Group | All Rights Reserved</p>
            <p class="credits">Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a> | Modified by <a href="#" title="Adaptor Homepage">4B1C Group</a> | Powered by <a href="#" title="Content Management System">CCMS</a> | <a href="http://validator.w3.org/check?uri=referer" title="Validate XHTML code">W3C XHTML 1.0</a> | <a href="http://jigsaw.w3.org/css-validator/" title="Validate CSS code">W3C CSS 2.0</a></p>
        </div>    
    </div> 
</body>
</html>