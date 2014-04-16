 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
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
    <script type="text/javascript" src="./js/ajaxSocialGroups.js"></script>  
    <link rel="icon" type="image/x-icon" href="./img/favicon.ico" />
    <title>Converge - Staff : Social Groups</title>
</head>

<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body>
    <script type="text/javascript">
    <!-- 
        function checky()
        {
            var where_to= confirm("Choosing OK will reject the petition and send message!");
        
            if (where_to== true)
                return (true);
            else
                return (false);
        }
    -->
    </script>
<% 
    serviceTemplate t = new  serviceTemplate();
    addFacility af = new addFacility(); 
    FacId fi = new FacId();
    CachedRowSet c = t.getServices();
    Thesis db = new Thesis();

    Vector<ReservationObject> v = db.getReservations2();
    //Vector<ReservationObject> v1 = new Vector<ReservationObject>();        
    v.trimToSize();
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
                <h1 class="pagetitle">Social Groups : Reject Petition</h1>
		<div class="column1-unit">
                    <h1 class="side"><img src="icons/Lui-tler.jpg" alt="Image description" title="Image title" /></h1>
                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostruderci tation ull 
                    <br><br>
                    <a href="staffSocMain.jsp">Back to Social Groups : Main Page</a>                <br>
                    </p>       
                </div>
<% 
                SocialGroup sg = new SocialGroup();
       
                int a = Integer.parseInt(request.getParameter("sgid"));
                int rid = (Integer)session.getAttribute("residentId");
                String you = (String)session.getAttribute("FirstName")+" "+(String)session.getAttribute("LastName");
       
                System.out.println(a+"ijnl");
       
                CachedRowSet crcr = sg.getSGWithID(a);

                Ace daterz = new Ace();
                java.util.Date nyah = new java.util.Date();
                String date = daterz.makeDateToString(nyah)+", "+daterz.makeTimetoString(nyah);              
       
                crcr.next();
%>
                <hr class="clear-contentunit" />
                <div class="column1-unit">
                    <div class="contactform">
                        <form name="login" onSubmit="return(checky())" action="processStaffRejectSocGPetition.jsp" method="get">
                            <fieldset>
                                <legend>MESSAGE DETAILS</legend>
                                <p>
                                    <label for="vill_name" class="left">Message Subject:</label> 
                                    <input type="text" name="rofl" id="rofl" onkeydown="return false" class="field" value="[Social Groups] <%=crcr.getString("SGName")%> : Rejected Petition"/>
                                    <input type="hidden" name="roflb" id="roflb" class="field" value="<%=a%>"/></p>
                                <p>
                                    <label for="vill_name" class="left">From:</label> 
                                    <input type="text" name="rofl2" id="rofl2" onkeydown="return false" class="field" value="<%=you%>"/>
                                    <input type="hidden" name="rofl2b" id="rofl2b" class="field" value="<%=rid%>"/></p>
                                <p> 
                                    <label for="vill_name" class="left">To:</label> 
                                    <input type="text" name="rofl3" id="rofl3" onkeydown="return false" class="field" value="<%=crcr.getString("SGRHNme")%>"/>
                                    <input type="hidden" name="rofl3b" id="rofl3b" class="field" value="<%=crcr.getInt("SGResidentHeadID")%>"/></p>
                                <p> 
                                    <label for="vill_name" class="left">Date:</label> 
                                    <input type="text" name="roflopasdf" id="roflopasdf" onkeydown="return false" class="field" value="<%=date%>"/>
                                </p>    
                                <p>  
                                    <label for="vill_name" class="left">Reason:</label> 
                                    <textarea rows="5" cols="30" name="folas" id="folas" class="field" value="">You can leave this space blank and the system will generate the message for you.</textarea></p><br>
                                <p>
                                    <input type="submit" name="button" class="button2" value="Send Message"/></p>
                            </fieldset>
                        </form>
                    </div>
                </div>
   
                <hr class="clear-contentunit" />
                <div class="column1-unit" id="popo"></div>                                
            </div>
        </div>
        <!-- C. FOOTER AREA -->      

        <div class="footer">
            <p>Copyright &copy; 2008 4B1C Group | All Rights Reserved</p>
            <p class="credits">Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a> | Modified by <a href="#" title="Adaptor Homepage">4B1C Group</a> | Powered by <a href="#" title="Content Management System">CCMS</a> | <a href="http://validator.w3.org/check?uri=referer" title="Validate XHTML code">W3C XHTML 1.0</a> | <a href="http://jigsaw.w3.org/css-validator/" title="Validate CSS code">W3C CSS 2.0</a></p>
        </div>    
    </div> 
</body>
</html>