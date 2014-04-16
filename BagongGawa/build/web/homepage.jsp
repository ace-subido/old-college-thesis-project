 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<!--  Version: Multiflex-3 Update-4 / Layout-1             -->
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
    <title>Converge Generic Community Association Portal</title>
  
    <script type= "text/javascript">
    <!--
        function checkForm()
        {
            var field = document.login.n;
            var as = document.login.p;
		
            if(field.value == "")
            {
		alert("fill in username and password field");
		return(false);
            }
            else if (as.value == "")
            {
		alert("fill in username and password field");
		return(false);
            }
        }
    -->
    </script>
</head>

<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body>
    <!-- Main Page Container -->
    <div class="page-container">

    <!-- For alternative headers START PASTE here -->

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
                    <h3>Create your community here.... </h3>          
                </div>        
            </div>
        </div>
        <br><br>
        <!-- For alternative headers END PASTE here -->

        <!-- B. MAIN -->
        <div class="main">
             <div class="main-navigation">
                <div class="round-border-topright"></div>
                <h1>Login</h1>
                <div class="loginform">
                    <form name = "login" onSubmit="return(checkForm())" action="processhomepage.jsp" method="get"> 
                        <p><input type="hidden" name="rememberme" value="0" /></p>
                        <fieldset>
                            <p><label for="username_1" class="top">User:</label><br />
                            <input type="text" name="n" id="username_1" class="field" value="" /></p>
                            <p><label for="password_1" class="top">Password:</label><br />
                            <input type="password" name="p" id="password_1" class="field" value="" /></p>
                            <p><input type="submit" name="cmdweblogin" class="button" value="LOGIN"  /></p><Br>
                            <p><a href="passForgotten.jsp"  id="forgotpsswd_1">Password forgotten?</a></p>
                            <br>
                            <hr />
                            <br>
                            <p><label class="top">Not yet a member? <a href="registerPage.jsp">Click Here</a></label><br />
                        </fieldset>
                    </form>
                </div>
            </div>
            <!-- B.1 MAIN CONTENT -->
            <div class="main-content">    
                <div class="column1-unit">
                    <br>
                    <p align="justify">Being the first generic community association portal, <strong>Converge</strong> promotes
                    community empowerment <br>through its online community association solutions. 
                    It is the new I.T. solution for community <br>associations here in Metro Manila.
                    <strong>Converge</strong> makes community association transactions fast, easy, reliable and 
                    customizable.			    </p>
				 
                    <p align="left">
                        Enliven and Empower your community. <br>
                        <b>“…because our paths converge”</b> – Rexxar of Warcraft3<br><br>

                        &bull;Non-technical Community Portal Launching<br>
                        &bull;Simple and Easy to Manage<br>
                        &bull;Reliable<br>
                        &bull;Online Interactivity and Communication<br>
                        &bull;Fast Information Dissemination<br>
                        &bull;Easy Resident-Association Transactions<br>
                        &bull;Customizable Content<br>
                    </p>
                </div>
                <hr class="clear-contentunit" />
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