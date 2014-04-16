 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

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
  <link rel="icon" type="image/x-icon" href="./img/favicon.ico" />
  <title>Converge - Administrator : Polls and Elections Services </title>
</head>
<script type="text/javascript">
  
function checkForm()
{
    var i = 0;
    
    if(document.getElementById('polls').value.length == 0 || isNaN(document.getElementById('polls').value)==1)
    {    
        document.getElementById('pollstag').style.color = "red";
        i++;
    }
    else
        document.getElementById('pollstag').style.color = "black";
    
    if(document.getElementById('nom').value.length == 0 || isNaN(document.getElementById('nom').value)==1)
    {    
        document.getElementById('nomtag').style.color = "red";
        i++;
    }
    else
        document.getElementById('nomtag').style.color = "black";
    
    if(document.getElementById('elec').value.length == 0 || isNaN(document.getElementById('elec').value)==1)
    {    
        document.getElementById('electag').style.color = "red";
        i++;
    }
    else
        document.getElementById('dvtag').style.color = "black";
    
    if(document.getElementById('years').selectedIndex == "0")
    {
        document.getElementById('yearstag').style.color = "red";
        i++;            
    }
    else
        document.getElementById('yearstag').style.color = "rgb(80,80,80)";                                        

    if(document.getElementById('start').value == 0)
    {
        document.getElementById('starttag').style.color = "red";
        i++;            
    }
    else
        document.getElementById('starttag').style.color = "rgb(80,80,80)"; 
                                        
    if(i>0)
    {
        alert("Check fields in red");
        return false;
    }
    else
        return true;
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
	
         ConnectorThesis ct = new ConnectorThesis();
         CachedRowSet cr = ct.checkPollsSettings();
Unit u = new Unit();
    addFacility ADDFAC = new addFacility();
    CachedRowSet vilinfo = u.getVillageInfo();
    CachedRowSet facSet = ADDFAC.getAllFacility();
%>
    <!-- Main Page Container -->
    <div class="page-container">
        <div class="header">
            <!-- A.1 HEADER TOP -->
            <div class="header-top">
                <!-- Sitelogo and sitename -->
                <a class="sitelogo" href="#" title="Go to Start page"></a>
                <div class="sitename">
                    <h1><a href="associationDash.jsp" title="Go to Start page">CONVERGE</a></h1>
                    <h2>Generic Community Association Portal</h2>
                </div>
                
                <!-- Navigation Level 1 -->
                <div class="nav1">
                    <ul>
                        <li><a href="associationDash.jsp" title="Go to Start page">Home</a></li>
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
                        <li><a href="associationDash.jsp">Home</a></li>
                    </ul>
                    <ul>  
                        <li><a href="assocMyAccount.jsp">My Account</a><!--<![endif]-->
                    </ul>
                    <!-- Navigation item -->
                    <ul>
                        <li><a href="#">Manage Association</a><!--<![endif]-->
              <!--[if lte IE 6]><table><tr><td><![endif]-->
                            <ul>
<%
                        Thesis db = new Thesis();
                        CachedRowSet checkdiectorset = db.getDirectors7();
                        
                        if(checkdiectorset.size()>0)
                        {
%>
                                <li><a href="assocDirectorMain.jsp?criteria=0&search=All">Board of Directors or Officers</a></li>
<%
                        }
                        if(facSet.size()>0)
                        {    
%>                        
                                <li><a href="assocFacilities.jsp">Facilities</a></li>
<%
                        }    
                        if(vilinfo.size()>0)
                        {    
%>                 
                                <li><a href="assocVillInfo.jsp">Village Information</a></li>
<%
                        }
                        if(c.size()>0)
                        {    
%>                                        
                                <li><a href="assocServices.jsp">Association Services</a></li> 
<%
                        }
                        Jem j = new Jem();
                        CachedRowSet checkresSet = j.getResidentTable();
                        if(checkresSet.size()>0)
                        {    
%>                                
                                <li><a href="assocResidentAccounts.jsp?criteria=0&search=All">Residents and Accounts</a></li>
<%
                        }
%>                                
                            </ul>
                            <!--[if lte IE 6]></td></tr></table></a><![endif]-->
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
            <!-- B.1 MAIN NAVIGATION -->
            <div class="main-navigation">
                <!-- Navigation Level 3 -->
                <div class="round-border-topright"></div>
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
                            <dt><a href="assocPermit.jsp">Permits</a></dt>
<% 
                        }
                        if(c.getString("reservation").equals("Yes"))
                        {    
%>
                            <dt><a href="assocReservationList.jsp">Reservations</a></dt>
<% 
                        }
                        if(c.getString("socialgroups").equals("Yes"))
                        {    
%>
                            <dt><a href="assocSocGroup.jsp">Social Groups</a></dt> 
<% 
                        }
                        if(c.getString("vote").equals("Yes"))
                        {    
%>
                            <dt><a href="assocPolls.jsp">Polls or Elections</a></dt>
<% 
                        }
                        if(c.getString("bulletinBoard").equals("Yes"))
                        {    
%>
                            <dt><a href="assocBulletinBoard.jsp">Bulletin Board</a></dt>
<% 
                        }
                        if(c.getString("billing").equals("Yes"))
                        {    
%> 
                            <dt><a href="assocBill.jsp">Billing</a></dt>
<% 
                        }
                        if(c.getString("newsletter").equals("Yes"))
                        {    
%>
                            <dt><a href="assocNewsletter.jsp">Newsletter</a></dt>
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
            <h1 class="pagetitle">Polls and Elections</h1>

        <!-- Content unit - One column -->
        
            <div class="column1-unit">
                <h1 class="side"><img src="icons/ballotbox-icon2.jpg" alt="Image description"  title="Image title" /></h1>
                <h3 class="side">&nbsp;</h3>
                <center><p>Configure settings for the polls and election service.</p></center>
                <div class="contactform">
<%
                if(cr.size() <= 0)
                {
%>
                <form name="form1" onSubmit="return(checkForm())" method="get" action="processAssocPolls.jsp">
                    <input type="hidden" name="stat" value="new">
                    <input type="hidden" name="hiddenstat" value="Setup">
                    <h1>Polls</h1>
                    <p>
                        <label class="left" name="pollstag" id="pollstag">Maximum number of days a poll can last</label>
                        <input name="polls" class="field" value="" id="polls"/>
                    </p>
                    <h1>Election Nomination</h1>
                    <p>
                        <label class="left" id="nomtag">Maximum number of days an election nomination can last</label>
                        <input name="nom" class="field" id="nom" value=""/>
                    </p>
                    <h1>Election Proper</h1>
                    <p>
                        <label class="left" id="electag">Maximum number of days an election proper can last</label>
                        <input name="elec" class="field" id="elec" value=""/>
                    </p>
                    <p>
                        <label>Director will Serve in </label>
                        <select name="years" id="years">
                            <option value="0">Select...&nbsp;</option>
                            <option value="1">&nbsp;1 year&nbsp;&nbsp;&nbsp;&nbsp;</option>
                            <option value="2">&nbsp;2 years&nbsp;&nbsp;&nbsp;&nbsp;</option>
                            <option value="3">&nbsp;3 years&nbsp;&nbsp;&nbsp;&nbsp;</option>
                        </select>
                    </p>
                    <p>
                        <label class="left" id="starttag">Director will start his term on day</label>
                        <select name="start" id="start" >
                            <option value="0" selected>Select...</option>
<%
                            for(int i=1; i<32; i++)    
                            {    
%>
                            <option value=<%=i%>><%=i%></option>
<%
                            }
%>
                        </select>
                    </p>    
                <p><input type="submit" class="button2" value="Submit"/></p>
                </form>
<%
                }
                else
                { 
                    cr.next();
%>
                    <form name="form1" onSubmit="return(checkForm())" method="get" action="processAssocPolls.jsp">
                        <input type="hidden" name="stat" value="old">
                        <input type="hidden" name="hiddenstat" value="Setup">
                        <h1>Polls</h1>
                        <p>
                            <label class="left" name="pollstag" id="pollstag">Maximum number of days a poll can last</label>
                            <input name="polls" class="field" value="<%=cr.getInt("polldays")%>" id="polls"/>
                        </p>
                        <h1>Election Nomination</h1>
                        <p>
                            <label class="left" id="nomtag">Maximum number of days an election nomination can last</label>
                            <input name="nom" class="field" id="nom" value="<%=cr.getInt("nomdays")%>"/>
                        </p>
                        <h1>Election Proper</h1>
                        <p>
                            <label class="left" id="electag">Maximum number of days an election proper can last</label>
                            <input name="elec" class="field" id="elec" value="<%=cr.getInt("elecdays")%>"/>
                        </p>
<%
                        Election e = new Election();
                        CachedRowSet dirSet = e.getDivisionExist();
                        
                        if(dirSet.size()<=0)
                        {    
%>
                        <p>
                            <label>Director will Serve in </label>
                            <select name="years" id="years">
                                <option value="0">Select...&nbsp;</option>
                                <option value="1">&nbsp;1 year&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                <option value="2">&nbsp;2 years&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                <option value="3">&nbsp;3 years&nbsp;&nbsp;&nbsp;&nbsp;</option>
                            </select>
                        </p>
<%
                        }
                        else
                        {
%>
                            <label>Director will Serve in <%=cr.getInt("years")%> year/s</label>
                            <input type="hidden" name="years" value=<%=cr.getInt("years")%>>
<%
                        }    
%>
                        <p>
                            <label class="left" id="starttag">Director will start his term on day</label>
                            <select name="start" id="start">
                                <option value="0" selected>Select...</option>
<%
                                for(int i=1; i<32; i++)    
                                {    
%>
                                <option value=<%=i%>><%=i%></option>
<%
                                }
%>
                            </select>
                        </p>
                        <p><input type="submit" class="button2" value="Submit"/></p>
                    </form>
<%
                }
%>
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