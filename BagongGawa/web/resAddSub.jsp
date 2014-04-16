
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
<script type= "text/javascript">
    function clr()
    {
        document.getElementById('LastNametag').style.color="black";
        document.getElementById('FirstNametag').style.color="black";
        document.getElementById('HouseNumtag').style.color="black";
        document.getElementById('EmailAddtag').style.color="black";
        
        document.getElementById('LastName').value = "";
        document.getElementById('FirstName').value = "";
        document.getElementById('HouseNum').value = "";
        document.getElementById('EmailAdd').value = "";
        document.getElementById('Sex').checked = "M";
    }
    function checkForm()
    {
        var i = 0;        
        if(document.getElementById('LastName').value.length == 0)
        {    
            document.getElementById('LastNametag').style.color = "red";
            i++;
        }
        else
            document.getElementById('LastNametag').style.color = "black";
        
        if(document.getElementById('FirstName').value.length == 0)
        {    
            document.getElementById('FirstNametag').style.color = "red";
            i++;
        }
        else
            document.getElementById('FirstNametag').style.color = "black";
        
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
						 <li><a href="resViewSubAccounts.jsp">View Sub-Accounts</a></li>

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

            <!-- B.1 MAIN CONTENT -->
            <div class="main-content">
                <div class="column1-unit">
                    <h1 align="center" class="side">Add Resident Sub-Account</h1>
                    <h3 class="side"></h3>
                    <br><hr />
                    <div class="column1-unit">
                        <div class="contactform">
                            <form name="form1" onsubmit="return (checkForm())" method="post" action="processResAddSub.jsp">
                            <fieldset>
                                <legend>RESIDENT DETAILS</legend>
                                <p> 
                                    <label for="n" class="left" id="LastNametag">Last Name: </label> 
                                    <input type="text" class="field" id="LastName" name="LastName" value=""></input> 
                                </p>
                                <p> 
                                    <label for="n" class="left" id="FirstNametag">First Name: </label> 
                                    <input type="text" class="field" id="FirstName" name="FirstName" value=""></input> 
                                </p>                                
                                <p>
                                    <label class="left">Relationship </label>
                                    <select id = "StatInFam" name="StatInFam" class="combo">
                                        <option>Spouse</option>
                                        <option>Son</option>
                                        <option>Daughter</option>
                                        <option>Sibling</option>
                                        <option>Other Relative</option>
                                        <option>Tenant</option>
                                        <option>Other</option>
                                    </select>
                                </p>
                                <p>
                                    <label class="left" id="Sextag">Sex </label>
                                    <input type="radio" id="Sex" name="Sex" value="M" checked>Male &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" id="Sex" name="Sex" value="F">Female
                                </p>
                                <p> 
                                    <label for="n" class="left" id="Addresstag">Address: </label> 
                                    <label for="n" class="left" id="Address"><%=x.getString("Address")%></label> 
                                </p>
                                <p> 
                                    <label for="n" class="left" id="HouseNumtag">Contact Number: </label> 
                                    <input type="text"  class="field" id="HouseNum" name="HouseNum" value=""></input> 
                                </p>
                                <p> 
                                    <label for="n" class="left" id="EmailAddtag">Email Address: </label> 
                                    <input type="text"  class="field" id="EmailAdd" name="EmailAdd" value=""></input> 
                                </p>
                                <p>&nbsp;</p>
                                <p>
                                    <input type="submit" name="Submit" class="button2" value="Save"/>
                                    <input type="button" value="Clear" class="button2" onClick="clr();">
                                </p>
                            </fieldset>
                            </form>
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