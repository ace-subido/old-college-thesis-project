
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*"%>
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
  <script type="text/javascript" src="./js/ieflickerhack.js"></script>  
  <script type="text/javascript" src="./js/ajaxSearch.js"></script>
  <link rel="icon" type="image/x-icon" href="./img/favicon.ico" />
  
  <title>Converge - Administrator : Board of Directors</title>
</head>
<script language="JavaScript">
    function proc()
    {
        var criteria = document.getElementById("criteria").value;
        var search = document.getElementById("search").value;
        if (criteria == "0")
            window.location.href = "assocSetupPart3a.jsp?criteria=0" + "&search=" + search;
        else if (criteria == "1")
            window.location.href = "assocSetupPart3a.jsp?criteria=1" + "&search=" + search;
        else if (criteria == "2")
            window.location.href = "assocSetupPart3a.jsp?criteria=2" + "&search=" + search;
        else if (criteria == "3")
            window.location.href = "assocSetupPart3a.jsp?criteria=3" + "&search=" + search;
    }
    
    function poptastic(url)
    {
        var newwindow;
	newwindow=window.open(url,'name','height=50,width=400,location=yes,scrollbars=yes');
	if (window.focus) {newwindow.focus()}
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
    Thesis db = new Thesis();
    CachedRowSet crset = db.getDirectors7();
    String crit = request.getParameter("criteria");
    String search = request.getParameter("search");
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
                <h1 class="pagetitle">Setting up your Community</h1>
                <!-- Content unit - One column -->
                <div class="column1-unit">
                    <h1 class="side"><img src="icons/board-icon.jpg" alt="Image description"  title="Image title" />List of Board of Directors or Officers</h1>
                    <h3 class="side">&nbsp;</h3>
                    <p>You can add new officers or board of directors of the community.</p><br>
                </div>          
<%
                if (crset.size() == 0)
                {
%>
		<div align="center">
                    <h1>There are no Directors appointed yet. Use the search feature below to find a resident and appoint him/her as director or officer. </h1>  
		</div>	
<%
                }
                
                Election e = new Election();
%>
                <input type=hidden name="setup" id="setup" value="setup">
                <div class="column1-unit">
                    <div align="right">
                        <br />
                        <label>Search by:</label>
                        <select id="criteria">
                            <option value="4" selected="selected">Select..    </option>
                            <option value="0">Last Name</option>
                            <option value="1">First Name</option>
                            <option value="2">Phone Number</option>
                            <option value="3">Email Address</option>
                        </select>
                        <input type=text value="" id="search" name="search">
                        <input type ="submit" value="Search" name="submit" align="center" onclick="proc()">
                    </div>
                    <br />
                    <hr class="clear-contentunit" />
                    <div>
                        <h1 class="block" align="center">List of Residents</h1>
                        <div align="center">
                            <table width="636">
                                <tr>
                                    <th width="100" class="top" scope="col"><div align="center">Resident Name</div></th>
                                    <th width="125" class="top" scope="col"><div align="center">Address</div></th>
                                    <th width="75" class="top" scope="col"><div align="center">Contact Number</div></th>
                                    <th width="180" class="top" scope="col"><div align="center">Email Address</div></th>
                                    <th width="70" class="top" scope="col"><div align="center"></div></th>
                                </tr>
                    <%
                            Residents r = new Residents();
                            CachedRowSet resSet = r.getListRes2
(crit,search);
Election elec = new Election();                                        CachedRowSet dirSet;

                            while(resSet.next())
                            {
                                dirSet = elec.getDirectorExistWaiting(resSet.getInt("ResID"));
                                            if(resSet.getString("userType").equalsIgnoreCase("Resident") && resSet.getString("StatInFam").equalsIgnoreCase("head") && dirSet.size()==0)

                                {    
                    %>
                                
                                <tr>
                                    <td>
                                        <div align="center">
                                            <%=resSet.getString("LastName")%>, <%=resSet.getString("FirstName")%>
                                        </div>    
                                    </td>
                                    <td>
                                        <div align="center">
                                            <%=resSet.getString("Address")%>
                                        </div>    
                                    </td>                                            
                                    <td>
                                        <div align="center">
                                            <%=resSet.getString("HouseNum")%>
                                        </div>    
                                    </td>
                                    <td>
                                        <div align="center">
                                            <%=resSet.getString("EmailAdd")%>
                                        </div>    
                                    </td>
                    <%
                                    CachedRowSet divisionSet = e.getDivisionExis3(resSet.getInt("ResId"));
                                    if(divisionSet.size()<=0)
                                    { 
                    %>
                                    <td>
                                        <div align="center">
                                            <a href="javascript:poptastic('assocChooseDivision.jsp?residentID=<%=resSet.getInt("ResId")%>&type=setup');">Add as Director</a>
                                        </div>    
                                    </td>
                    <%
                                    }
                                    else
                                    {    
                    %>
                                    <td>
                                        <div align="center">
                    <%
                                            divisionSet.next();
                                            CachedRowSet nameSet = e.getDivisionName2(divisionSet.getInt("chargeOf"));
                                            nameSet.next();
                    %>
                    
                                            Director of <%=nameSet.getString("comDivisionName")%>
                                        </div>    
                                    </td>
                    <%
                                    }
                    %>
                                </tr>
                    <%
                                }
                            }
                    %>
                            </table>
                        </div>
                    </div>
                </div>
                <br><hr /><br><br>
                <input type="button" class="button2" value="Finish" onclick="window.location.href='associationDash.jsp'"> 
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