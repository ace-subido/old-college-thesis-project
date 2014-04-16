
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
      <%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.sql.*"%>

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
    <title>Converge - Administrator : Community Services</title>
</head>

<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body>
<script type="text/javascript">
    function helpform()
    {
        alert("Toggle if reservations should be for approval or not");
    }
    
    function runhelp()
    {
        alert("Input the facility's only available time for reservation.");
    }

    function checkForm()
    {
        var toHour = document.fg2.do2;
        var toMin = document.fg2.do3;
        var toAMPM = document.fg2.do4;
        var frHour = document.fg2.co2;
        var frMin = document.fg2.co3;
        var frAMPM = document.fg2.co4;
    
        if(toHour.value==frHour.value && toAMPM.value == frAMPM.value && toMin.value==frMin.value)
        {
            alert("Invalid Time Input (same from and to time frame)");
            return(false);
        }
    
        if(toHour.value==frHour.value && toMin.value < frMin.value)
        {
            alert("Invalid TIME INPUT LOLZ123@@");
            return(false);
        }
    
        if(toHour.value < frHour.value && toAMPM.value < frAMPM.value)
        {
            alert("Invalid TIME INPUT LOLZ@@");
            return(false);
        }    
        
        if(toHour.value == 13)
        {
            alert("Choose the To time Hour value");
            return(false);
        }
        
        if(toMin.value == 13)
        {
            alert("Choose the To time minute value");
            return(false);
        }
   
        if(frHour.value == 13)
        {
            alert("Choose the From time Hour value");
            return(false);
        }
        
        if(frMin.value == 13)
        {
            alert("Choose the From time minute value");
            return(false);
        } 
        return(true);
    }
</script>
<%
    if(session.getAttribute("uname") == null)
        response.sendRedirect("homepage.jsp");
    ConnectorThesis db = new ConnectorThesis();  
    
    int a = Integer.parseInt(request.getParameter("tit"));
    String url = "window.location.href='assocSetupPart2.jsp'";
    CachedRowSet crs = db.getFacilitySettings(a); 
    serviceTemplate t = new serviceTemplate();
    CachedRowSet c = t.getServices();
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
                        Thesis db3 = new Thesis();
                        CachedRowSet checkdiectorset = db3.getDirectors7();
                        
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
                <h1 class="pagetitle">Reservation Service Settings</h1>
                <div class="column1-unit">
                    <h1 class="side"><img src="icons/reservation-icon.jpg" alt="Image description" title="Image title" />List of Services</h1>
                    <h3 class="side">&nbsp;</h3>
                    
                </div> 
                <!-- Content unit - One column -->
                <hr class="clear-contentunit" />
                <div class="column1-unit">
                    <div class="contactform" id="pupu">       
                        <form name="facresset" method="post" onsubmit="return(checkform())"action="processAssocFacResSettings.jsp">
                            <fieldset>
                                <legend>&nbsp;FACILITY RESERVATION SETTINGS&nbsp;1 <font color="red">2</font></legend>
                                <input type = "hidden" name="daya" value="<%=a%>" />
<% 
                            while(crs.next())
                            {
                                java.util.Date ot = crs.getTimestamp("OpTime");
                                java.util.Date ct = crs.getTimestamp("ClTime");
                                Calendar myCalendar = Calendar.getInstance();
                             
                                myCalendar.setTime(ot);
                              
                                int ohour = myCalendar.get(Calendar.HOUR);
                                int omin = myCalendar.get(Calendar.MINUTE);
                                int oampm = myCalendar.get(Calendar.AM_PM);
                              
                                myCalendar.setTime(ct);
                              
                                int chour = myCalendar.get(Calendar.HOUR);
                                int cmin = myCalendar.get(Calendar.MINUTE);
                                int campm = myCalendar.get(Calendar.AM_PM);
%>
                                <p> &nbsp;&nbsp;&nbsp;<b>Reservation Settings for Facility <%=crs.getString("FaciName")%> - <%=crs.getString("Type")%></b></p>        
                                <p>
                                    <label for="contact_street" class="left">Amount of Hours you can reserve this facility:</label>
                                    <input type="text" name="ty" id="contact_street" class="field" value="<%=crs.getInt("hoursperDay")%>" tabindex="1" />
                                </p>
                                <p>
                                    <label for="contact_postalcode" class="left">Amount of Days in advance to reserve this facility:</label>
                                    <input type="text" name="yt" id="contact_postalcode" class="field" value="<%=crs.getInt("advDaysRes")%>" tabindex="1" />
                                </p>
                                <p><label for="contact_city" class="left">Set Facility Reservation Schedule (<a href="javascript:runhelp()">?</a>):</label></p>
                                <p>&nbsp;&nbsp;&nbsp;From:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <select name="co2">
                                    <option value=13> Select Hour... </option>
<% 
                                for(int i = 1; i <13;i++)
                                {
                                    if(i == ohour)
                                    {
%>
                                    <option value=<%=i%> selected> &nbsp;<%=ohour%></option>
<% 
                                    }
                                    else
                                    {
%>
                                    <option value=<%=i%>> &nbsp;<%=i%></option>
<%
                                    }
                                }
%>             
                                </select>&nbsp;:&nbsp; 
                                <select name="co3" >
                                    <option value=13> Select Minutes... </option>
<%
                                    if(omin == 00)
                                    {
%>
                                    <option value=00 selected> &nbsp;00</option>
                                    <option value=30> &nbsp;30</option>             
<%
                                    }
                                    else
                                    {
%>
                                    <option value=00> &nbsp;00</option>
                                    <option value=30 selected> &nbsp;30</option>                  
<%
                                    }
%>
                                </select>&nbsp;&nbsp; &nbsp; 
                                <select name="co4">
<%
                                if(oampm == 0)
                                {
%>
                                    <option value=0 selected> &nbsp;AM&nbsp;</option>
                                    <option value=1> &nbsp;PM&nbsp;</option>             
<%  
                                }
                                else
                                {
%>
                                    <option value=0> &nbsp;AM&nbsp;</option>
                                    <option value=1 selected> &nbsp;PM&nbsp;</option>             
<%
                                }
%>
                                </select>
                            </p>
                            <p>&nbsp;&nbsp;&nbsp;To:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <select name="do2">
                                <option value=13> Select Hour... </option>
<% 
                            for(int i = 1; i <13;i++)
                            {
                                if(i == chour)
                                {
%>
                                    <option value=<%=i%> selected> &nbsp;<%=chour%></option>
<% 
                                }
                                else
                                {
%>
                                    <option value=<%=i%>> &nbsp;<%=i%></option>
<%
                                }
                            }
%>             
                            </select>&nbsp;:&nbsp; 
                            <select name="do3" name="tit" >
                                <option value=13> Select Minutes... </option>
<%
                            if(cmin == 00)
                            {
%>
                                <option value=00 selected> &nbsp;00</option>
                                <option value=30> &nbsp;30</option>             
<%
                            }
                            else
                            {
%>
                                <option value=00> &nbsp;00</option>
                                <option value=30 selected> &nbsp;30</option>                  
<%
                            }
%>            
                            </select>&nbsp;&nbsp; &nbsp; 
                            <select name="do4">
<%
                            if(campm == 0)
                            {
%>
                                <option value=0 selected> &nbsp;AM&nbsp;</option>
                                <option value=1> &nbsp;PM&nbsp;</option>            
<%  
                            }
                            else
                            {
%>
                                <option value=0> &nbsp;AM&nbsp;</option>
                                <option value=1 selected> &nbsp;PM&nbsp;</option>                 
<%
                            }  
                        } 
                         
%>  
                        </select></p><br> 
                        
                        <p><input type="submit" name="submit" id="submit" class="button2" value="Save Changes" tabindex="6"/> <input type="button" name="submit" id="submit" class="button2" onclick="<%=url%>" value="Back" tabindex="6"/></p>
                        </fieldset>
                    </form>
                </div>           
            </div> 
            <hr class="clear-contentunit" />
            </div>
        </div>
        <!-- C. FOOTER AREA -->      
        <div class="footer">
            <p>Copyright &copy; 2006 Your Company | All Rights Reserved</p>
            <p class="credits">Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a> | Modified by <a href="#" title="Adaptor Homepage">4B1C</a> | Powered by <a href="#" title="Content Management System">CCMS</a> | <a href="http://validator.w3.org/check?uri=referer" title="Validate XHTML code">W3C XHTML 1.0</a> | <a href="http://jigsaw.w3.org/css-validator/" title="Validate CSS code">W3C CSS 2.0</a></p>
        </div>      
    </div> 
</body>
</html>