 
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
    <title>Converge - Staff</title>
</head>

<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->
<script type= "text/javascript">
    function clr()
    {
        document.getElementById('Usernametag').style.color="black";
        document.getElementById('passwordtag').style.color="black";
        document.getElementById('confirmtag').style.color="black";
        document.getElementById('HouseNumtag').style.color="black";
        document.getElementById('EmailAddtag').style.color="black";
        
        document.getElementById('Username').value = "";
        document.getElementById('password').value = "";
        document.getElementById('confirm').value = "";
        document.getElementById('HouseNum').value = "";
        document.getElementById('EmailAdd').value = "";
        document.getElementById('Sex').checked = "M";
                                        
    }
    function checkForm()
    {
        var i = 0;
        if(document.getElementById('Username').value.length == 0)
        {    
            document.getElementById('Usernametag').style.color = "red";
            i++;
        }
        else
            document.getElementById('Usernametag').style.color = "black";

        if(document.getElementById('password').value.length == 0)
        {
            if(document.getElementById('confirm').value.length != 0)
            {                   
                document.getElementById('passwordtag').style.color = "red";
                i++;
            }
        }
        else if(document.getElementById('confirm').value.length == 0)
        {
            if(document.getElementById('password').value.length != 0)
            {                   
                document.getElementById('confirmtag').style.color = "red";
                i++;
            }
        }
        else
        {
            if (document.getElementById('password').value != document.getElementById('confirm').value)
            {
		document.getElementById('confirmtag').style.color = "red";
		red++;
            }
            else
		document.getElementById('confirmtag').style.color = "black";
        }
        
        if (isNaN(document.getElementById('HouseNum').value)==1 || document.getElementById('HouseNum').value.length == 0)
        {    
            document.getElementById('HouseNumtag').style.color = "red";
            i++;
        }
        else
            document.getElementById('HouseNumtag').style.color = "black";
        
        if(document.getElementById('EmailAdd').value.length == 0)
        {    
            document.getElementById('EmailAddtag').style.color = "red";
            i++;
        }
        else
            document.getElementById('EmailAddtag').style.color = "black";
        
        if (i > 0)
        {
            alert("Check Fields in red.");
            return false;
        }
        else
            return true;        
    }
</script> 
<body>
<%
    serviceTemplate t = new  serviceTemplate();
    CachedRowSet c = t.getServices();
    int a = (Integer)session.getAttribute("residentId");
    Account db = new Account();
    CachedRowSet x = db.getResident(a);
    x.next();
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

        <div class="main-content">
            <div class="column1-unit">
                <h1 align="center" class="side">Account Information</h1>
                <h3 class="side"></h3>
                <br><hr />
                <div class="column1-unit">
                    <div class="contactform">
<%
                        if(x.getString("StatInFam").equals("head"))
                        {
%>             
                            <form name="form1" onsubmit="return (checkForm())" method="post" action="processStaffUpdateInfo.jsp">
                                <input type="hidden" class="field" id="LotAreahidden"  name="LotAreahidden" value="Yes"></input>
                                <input type="hidden"  class="field" id="UnitCounthidden" name="UnitCounthidden" value="Yes"></input> 
                                <fieldset>
                                <legend>ACCOUNT INFORMATION DETAILS</legend>
                                <p> 
                                    <label for="n" class="left" id="Usernametag">Username: </label> 
                                    <input type="text" class="field" id="Username" name="Username" value="<%=x.getString("Username")%>"></input> 
                                </p>
                                <p> 
                                    <label for="n" class="left" id="passwordtag">New Password: </label> 
                                    <input type="password" class="field" id="password" name="password" value=""></input> 
                                </p>
                                <p> 
                                    <label for="n" class="left" id="confirmtag">Confirm Password: </label> 
                                    <input type="password" class="field" id="confirm" name="confirm" value=""></input> 
                                </p>
                                <p> 
                                    <label for="n" class="left" id="UserTypetag">UserType: </label> 
                                    <label for="n" class="left" id="UserType"><%=x.getString("UserType")%></label> 
                                </p>
                                </fieldset>
                                <fieldset>
                                <legend>PERSONAL INFORMATION DETAILS</legend>
                                <p> 
                                    <label for="n" class="left" id="LastNametag">Last Name: </label> 
                                    <label><%=x.getString("LastName")%></label> 
                                </p>
                                <p> 
                                    <label for="n" class="left" id="FirstNametag">First Name: </label> 
                                    <label><%=x.getString("FirstName")%></label> 
                                </p>
                                <p>
                                    <label class="left">Sex </label>
<%                                        
                                    if(x.getString("Sex").equalsIgnoreCase("M"))
                                    {
%>                                  
                                        <input type="radio" id="Sex" name="Sex" value="M" checked>Male &nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" id="Sex" name="Sex" value="F">Female
<%
                                    }
                                    else
                                    {    
%>                                      
                                    <input type="radio" id="Sex" name="Sex" value="M">Male &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" id="Sex" name="Sex" value="F" checked>Female
<%
                                    }
%>
                                </p>
                                <p> 
                                    <label for="n" class="left" id="Addresstag">Address: </label> 
                                    <label><%=x.getString("Address")%></label> 
                                </p>
                                <p> 
                                    <label for="n" class="left" id="HouseNumtag">Contact Number: </label> 
                                    <input type="text"  class="field" id="HouseNum" name="HouseNum" value="<%=x.getString("HouseNum")%>"></input> 
                                </p>
                                <p> 
                                    <label for="n" class="left" id="EmailAddtag">Email Address: </label> 
                                    <input type="text"  class="field" id="EmailAdd" name="EmailAdd" value="<%=x.getString("EmailAdd")%>"></input> 
                                </p>
                                <p> 
                                    <label for="n" class="left">Account Status: </label> 
                                    <label><%=x.getString("Status")%></label> 
                                </p>
                                <p>
                                    <input type="submit" name="Submit" class="button2" value="Save"/>
                                    <input type="button" value="Clear" class="button2" onClick="clr();">
                                </p>
                                </fieldset>
                            </form>
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