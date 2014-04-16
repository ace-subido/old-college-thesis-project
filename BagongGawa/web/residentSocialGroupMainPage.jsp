 
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
    <title>Converge - Resident : Social Group</title>
    <script type="text/javascript" src="./js/ajaxSocialGroups.js"></script>
</head>

<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body>
<%  
    Thesis db = new Thesis();

    int sgid = Integer.parseInt(request.getParameter("sgid"));
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
                    <!-- Navigation item -->
                  
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
                int a = (Integer)session.getAttribute("residentId");
                 String poppy = (String)session.getAttribute("type");
                SocialGroup sg = new SocialGroup();
                CachedRowSet ctv = sg.getSGPetDisplay(sgid);
                
                String kiki = sg.getSGMemType(a, sgid);  

if(kiki == null)                                            
    kiki = "";
                
                CachedRowSet crcr2 = sg.getSGMEMBERS(sgid);
                CachedRowSet crcr3 = sg.getSGMEMBERS(sgid);
                
                ctv.next();
                
                String petdate = sg.makePetDateToString(ctv.getTimestamp("SGStartDate")); 
                
           
%>
                <!-- Pagetitle -->
                <input type="hidden" value="<%=a%>" id="as" name="as"/>
                <h1 class="pagetitle"><%=ctv.getString("SGName")%></h1>
		<div class="column1-unit">
                    <h1 class="side"><img src="icons/Lui-tler.jpg" alt="Image description" title="Image title" /></h1>
                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, ut aliquip. orem ipsum dolor sit amet.             
                    <br><br>
               <%if(ctv.getInt("SGResidentHeadID")==a){%>        
                    <a href="residentSocialGroupEdit.jsp?sgid=<%=ctv.getInt("SGID")%>">Group Settings</a><br>                    
                    <a href="residentSocialGroupNewslet.jsp?sgid=<%=ctv.getInt("SGID")%>">Submit Article to Newsletter Group</a><br>
                    <a href="residentSocialGroupReserve.jsp?sgid=<%=ctv.getInt("SGID")%>">Create Group Event</a><br>
                <%}
                if(kiki.equals("Admin")){               
                %>
                    <a href="residentSocialGroupMembers.jsp?sgid=<%=ctv.getInt("SGID")%>">Member Management</a><br>                    
                    <a href="residentSocialGroupPostAnnouncement.jsp?sgid=<%=ctv.getInt("SGID")%>">Post Announcement</a><br>                   
                <%}%>

                </p>
                </div>
                <hr class="clear-contentunit" />
                <div class="column1-unit">
                    <h1 class="block"><b>Social Group Details</b></h1>      
                    <br><br>                      
                    <p><b>Lead by : </b> <%=ctv.getString("SGRHNme")%><br>
                    <b>Date Formed : </b> <%=petdate%><br>
                    <b>Category : </b><%=ctv.getString("SGCategory")%><br>
                    <b>Group Type : </b><%=ctv.getString("SGMemSet")%><br><br>
                    <b>Details </b><br><%=ctv.getString("SGDetails")%></p>
                </div>
                <hr class="clear-contentunit"/>
                <div class="column2-unit-left">
                    <h1 class="block"><b>Administrators</b></h1><br> 
                     <ul>
                    <%
                    while(crcr3.next())
                    {
                        if(crcr3.getString("pos").equals("Admin")){
%>
                        <li><%=crcr3.getString("name")%></li>          
<%                      }
                    }
%>
                 </ul>
    <h1 class="block"><b>Members</b></h1><br>                            
                    <ul>
<%
                    while(crcr2.next())
                    {
                        if(crcr2.getString("pos").equals("Member")){
%>
                        <li><%=crcr2.getString("name")%></li>          
<%                      }
                    }                
                
%>
                    </ul>         
                </div>
                <div class="column2-unit-right">
                    <h1 class="block"><b>Announcements</b></h1>
                        
                </div>
                <!-- Content unit - Two columns -->
                 <hr class="clear-contentunit" />
                 <div class="column1-unit" id="popo" name="popo"></div>
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