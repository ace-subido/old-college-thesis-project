
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
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="./css/layout2_setup.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="./css/layout2_text.css" />
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
        int a = (Integer)session.getAttribute("residentId");
        Pao db = new Pao();
        CachedRowSet x = db.getResident(a);
        x.next();
    %>
    <!-- For alternative headers START PASTE here -->
    <!-- Main Page Container -->
    <div class="page-container">
        <!-- A. HEADER -->      
        <div class="header">

            <!-- A.1 HEADER TOP -->
            <div class="header-top">

                <!-- Sitelogo and sitename -->
                <a class="sitelogo" href="#" title="Go to Start page"></a>
                <div class="sitename">
                    <h1><a href="homepage.html" title="Go to Start page">CONVERGE</a></h1>
                    <h2>Generic Community Association Portal</h2>
                </div>

                <!-- Navigation Level 1 -->
                <div class="nav1">
                    <ul>
                        <li><a href="#" title="Go to Start page">Home</a></li>
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
                    <ul>  
                        <li><a href="#">My Account</a><!--<![endif]-->
                            <ul>
                                <li><a href="resMyAccount.jsp">Account Information</a></li>
                                <li><a href="resAddSub.jsp">Add Sub-Account</a></li>
                            </ul>
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
            </dl>
            <Br /><Br />  
        </div>

        <div class="main-content">
            <div class="column1-unit">
                <h1 align="center" class="side">Account Information</h1>
                <h3 class="side"></h3>
                <br><hr />
                <div class="column1-unit">
                    <div class="contactform">
<%
                        String sexString = "";
                        if(x.getString("Sex").equalsIgnoreCase("M"))
                            sexString = "Male";
                        else
                            sexString = "Female";
                        if(x.getString("StatInFam").equals("head"))
                        {
%>             
                            <fieldset>
                            <legend>ACCOUNT INFORMATION DETAILS</legend>
                            <p> 
                                <label for="n" class="left">Username: </label> 
                                <label><%=x.getString("Username")%></label> 
                            </p>
                            <p> 
                                <label for="n" class="left">UserType: </label> 
                                <label><%=x.getString("UserType")%></label> 
                            </p>
                            </fieldset>
                            <fieldset>
                            <legend>PERSONAL INFORMATION DETAILS</legend>
                            <p> 
                                <label for="n" class="left">Last Name: </label> 
                                <label><%=x.getString("LastName")%></label> 
                            </p>
                            <p> 
                                <label for="n" class="left">First Name: </label> 
                                <label><%=x.getString("FirstName")%></label> 
                            </p>
                            <p>
                                <label class="left">Sex </label>
                                <label><%=sexString%></label> 
                            </p>
                            <p> 
                                <label for="n" class="left">Address: </label> 
                                <label><%=x.getString("Address")%></label> 
                            </p>
                            <p> 
                                <label for="n" class="left">Contact Number: </label> 
                                <label><%=x.getString("HouseNum")%></label> 
                            </p>
                            <p> 
                                <label for="n" class="left">Email Address: </label> 
                                <label><%=x.getString("EmailAdd")%></label> 
                            </p>
                            <p> 
                                <label for="n" class="left">Account Status: </label> 
                                <label><%=x.getString("Status")%></label> 
                            </p>
                            <form action="resMyAccountEdit.jsp">    
                                <div align="center">
                                    <p>  <input type="submit" class="button2" value="Edit" align="center"></p>
                                </div>
                            </form>
                            </fieldset>
<%
                        }
                        else
                        {
%>
                            <fieldset>
                            <legend>ACCOUNT INFORMATION DETAILS</legend>
                            <p> 
                                <label for="n" class="left">Username: </label> 
                                <label><%=x.getString("Username")%></label> 
                            </p>
                            <p> 
                                <label for="n" class="left">UserType: </label> 
                                <label><%=x.getString("UserType")%></label> 
                            </p>
                            </fieldset>
                            <fieldset>
                            <legend>PERSONAL INFORMATION DETAILS</legend>
                            <p> 
                                <label for="n" class="left">Last Name: </label> 
                                <label><%=x.getString("LastName")%></label> 
                            </p>
                            <p>
                                <label for="n" class="left">First Name: </label> 
                                <label><%=x.getString("FirstName")%></label> 
                            </p>
                            <p>
                                <label class="left">Sex </label>
                                <label><%=sexString%></label> 
                            </p>
                            <p> 
                                <label for="n" class="left">Address: </label> 
                                <label><%=x.getString("Address")%></label> 
                            </p>
                            <p> 
                                <label for="n" class="left">Contact Number: </label> 
                                <label><%=x.getString("HouseNum")%></label> 
                            </p>
                            <p> 
                                <label for="n" class="left">Email Address: </label> 
                                <label><%=x.getString("EmailAdd")%></label> 
                            </p>
                            <p> 
                                <label for="n" class="left">Account Status: </label> 
                                <label><%=x.getString("Status")%></label> 
                            </p>
                            <form action="resMyAccountEdit.jsp">    
                                <div align="center">
                                    <p>  <input type="submit" class="button2" value="Edit" align="center"></p>
                                </div>
                            </form>
                            </fieldset>
<%
                        }
%>
                    </div>
                </div>
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