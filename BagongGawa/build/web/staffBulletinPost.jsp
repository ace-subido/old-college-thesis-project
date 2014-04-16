 
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
    <script language="JavaScript" type="text/javascript" src="scripts/wysiwyg.js"></script>
    <script language="JavaScript" type="text/javascript" src="scripts/wysiwyg-settings.js"></script>

    <link rel="icon" type="image/x-icon" href="./img/favicon.ico" />
    <title>Converge - Staff</title>
    <script type="text/javascript" src="./js/ajaxgetReserve.js"></script>
    <script type="text/javascript" src="./js/jem.js"></script>
    <style type="text/css">
            <!--
            .button2 {float:right; margin-right:20px; padding:1px !important /*Non-IE6*/; padding:0 /*IE6*/; background:rgb(230,230,230); border:solid 1px rgb(150,150,150); text-align:center; font-family:verdana,arial,sans-serif; color:rgb(0,0,0); font-size:110%; font-weight:bold}
            .button2:hover {cursor: pointer; border:solid 1px rgb(80,80,80); background:rgb(220,220,220); color:rgb(80,80,80);}
            -->
        </style> 
   
 <script type= "text/javascript">
<!--
    function checkCat()
    {
        var y = document.test.bullCategory;
        var v = document.test.bName;
        var x = document.test.textarea1;
        if (v.value == "" || v.value == " ")
        {
             alert("Type in a NAME of this post");
             return(false);
        }
        else if (x.value == "" || x.value == " ")
        {
             alert("TextArea empty");
             return(false);
        } 
    }
-->
</script>  
</head>

<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body>
<%
    Thesis db = new Thesis();
    ConnectorThesis ct = new ConnectorThesis();
    CachedRowSet ctv = ct.getBulletinCat();
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

            <!-- A.4 HEADER BREADCRUMBS -->
            <!-- Breadcrumbs -->
            <div class="header-breadcrumbs">
                <ul>
                    <li><a href="staffDash.jsp">Tahanan Village</a></li> 
                    <li><a href="staffBulletinBoard.jsp">Bulletin Board</a></li>
                    <li><a>Site Announcements</a></li> <li>Post new Thread</li>
                </ul>
            </div>
        </div>
 
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
            <div id="board">
<%            
                if(ctv.size() >0)
                {
%>
                    <script language="javascript1.2">
                        var mysettings = new WYSIWYG.Settings();

                        // define the location of the openImageLibrary addon
                        mysettings.ImagePopupFile = "popups/insert_image.html";
                        // define the width of the insert image popup
                        mysettings.ImagePopupWidth = 600;
                        // define the height of the insert image popup
                        mysettings.ImagePopupHeight = 245;
                        mysettings.addToolbarElement("font", 3, 1); 
                        mysettings.addToolbarElement("fontsize", 3, 2);
                        mysettings.addToolbarElement("headings", 3, 3);
                        // attach the editor to the textarea with the identifier 'textarea1'.
                        WYSIWYG.attach('textarea1', mysettings);
                    </script>
                    <div align="center">&nbsp; &nbsp;&nbsp;<h2><font color="#666633">Bulletinboard Broadcast</font></h2><br></div>
                    <div align="center" id="alertLoc"></div>
                    <div align="center" id="alertName"></div>     
                    <div align="center">
                        <br><br>
                        <form name="test" action="staffAddBulletinPost.jsp" method="get" onSubmit="return(checkCat())">
                            <label>Title of Post: </label>
                            <input type="text" id="bName" name="bName" value="" width="10px"><br><br>
                            <!-- Include the Free Rich Text Editor Runtime -->
                            &nbsp;<textarea name="textarea1" id="textarea1">Type Here</textarea>
                            <br><br>
                            <div class="main-content">  
                                <div class="column1-unit">
                                    <input class="button2" type="submit" value="Post Message">&nbsp;
                                </div>
                            </div>
                        </form>
                    </div>
<%
                }
                else
                {
%>
            <!-- B.1 MAIN CONTENT -->
                    <div class="main-content">
                        <!-- Pagetitle -->
                        <h1 class="pagetitle" align="center">Bulletinboard is currently unavailable :(</h1>
                    </div>
<%
                }
%>
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