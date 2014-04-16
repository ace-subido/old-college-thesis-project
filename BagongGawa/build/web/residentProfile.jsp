 
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
    <title>Converge - Resident</title>
    <script type="text/javascript" src="./js/ajaxMensahe.js"></script>
    <script type= "text/javascript">
    <!--
        function checky()
        {       
            var y = document.ass2.batsz4;
            var z = document.ass2.batsz3;
                
            if (y.value == '0')
            {
                alert("Penalty dues : Select if enabled or disabled!");
                return (false);
            }
            if (z.value == '0')
            {
                alert("Misc dues : Select if enabled or disabled!");
                return (false);
            }
        }
    </script>
</head>

<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body>
<%
    Thesis db = new Thesis();
    int resId = Integer.parseInt(request.getParameter("rid"));
    serviceTemplate t = new  serviceTemplate();
    CachedRowSet c = t.getServices();
    if (session.getAttribute("uname") == null)
    response.sendRedirect("homepage.jsp");
    CachedRowSet crset = db.getResInfo(resId);
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
                </dl><Br /><Br />  

            <!-- Title --> 
            </div>
 
          <!-- B.1 MAIN CONTENT -->
            <div class="main-content">
<%
                Ace lolz = new Ace();        
                crset.next();
                SocialGroup sg = new SocialGroup();
                CachedRowSet ctv4 = sg.getSocialGroups();
                Vector<Integer> v3 = sg.getResidentMembers(resId);
                String petdate = "";
%>
                <!-- Pagetitle -->
                <h1 class="block">Resident Profile</h1>
                <hr class="clear-contentunit" />
                <div id="mehmeh" name="mehmeh" class="column1-unit">
                <hr class="clear-contentunit" />                                        
                    <div class="column1-unit">
                        <p>
                            <h1 class="side"><img src="icons/Lui-tler.jpg" alt="Image description" title="Image title" /><%=crset.getString("FirstName")%> <%=crset.getString("LastName")%></h1><br>
                            <h3 class="side">Telephone number: <%=crset.getString("HouseNum")%></h3><br>
                            <h3 class="side">Address : <%=crset.getString("Address")%></h3><br>
                            <h3 class="side">Resident Type :<%=crset.getString("UserType")%></h3><br>
                            <br><p><a href="residentSendMessage.jsp?rid=<%=crset.getInt("ResId")%>">Send Message</a>     </p>
                        </p>  
                    </div>                         
                </div>
                <hr class="clear-contentunit" />
                <div class="column2-unit-left">
                    <h1 class="block">Groups the resident joined</h1>
<% 
                    if(ctv4.size() > 0 && v3!=null)
                    {
                        while(ctv4.next())
                        { 
                            int x = 0;
                            for(int l=0; v3.size() > l; l++)
                            {
                                x = v3.elementAt(l);
                                if(ctv4.getInt("SGID")==x)
                                {
                                    x=ctv4.getInt("SGID");
                                    l = v3.size();                     
                                }                   
                            }
                            if(x==ctv4.getInt("SGID"))
                            {   
                                petdate = sg.makePetDateToString(ctv4.getTimestamp("SGStartDate"));
%>
                                <hr class='clear-contentunit2'/>
                                <div onmouseover="style.backgroundColor='#F6FFDE';" onmouseout="style.backgroundColor='#FFFFFF';">
                                    <h2>&nbsp;&nbsp;<%=ctv4.getString("SGName")%></h2>
                                    <h3>&nbsp;&nbsp;Requested by : <%=ctv4.getString("SGRHNme")%></h3>
                                    <h3>&nbsp;&nbsp;Date : <%=petdate%></h3>
                                    <h3>&nbsp;&nbsp;Category : <%=ctv4.getString("SGCategory")%></h3>
                                    <p>&nbsp;&nbsp;<%=ctv4.getString("SGDetails")%></p>
                                    <p>&nbsp;&nbsp;<a href='residentSocialGroupMainPage.jsp?sgid=<%=ctv4.getInt("SGID")%>'>View Details</a></p>
                                </div>
<%                      
                            }
                        }
                    }
                    else
                    {
%>
                        <p>There are no social groups you've joined</p>
<%
                    }
%>        
                </div>
                <div class="column2-unit-right">
<%//put here get bulletin posts for resident with resident id
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