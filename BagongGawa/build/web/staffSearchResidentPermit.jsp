
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
    <title>Converge - Staff</title>
</head>
<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->
<script language="JavaScript">
    function proc()
    {
        var criteria = document.getElementById("criteria").value;
        var search = document.getElementById("search").value;
        if (criteria == "0")
            window.location.href = "staffSearchResident.jsp?criteria=0" + "&search=" + search;
        else if (criteria == "1")
            window.location.href = "staffSearchResident.jsp?criteria=1" + "&search=" + search;
        else if (criteria == "2")
            window.location.href = "staffSearchResident.jsp?criteria=2" + "&search=" + search;
        else if (criteria == "3")
            window.location.href = "staffSearchResident.jsp?criteria=3" + "&search=" + search;
    }

    function poptastic(url)
    {
        var newwindow;
	newwindow=window.open(url,'name','height=50,width=400,location=yes,scrollbars=yes');
	if (window.focus) {newwindow.focus()}
    }
</script>
<body>
<%
    serviceTemplate t = new  serviceTemplate();

    CachedRowSet c = t.getServices();
    String crit = request.getParameter("criteria");
    String search = request.getParameter("search");
    Residents r = new Residents();
    Permits p = new Permits();           
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
                <h1 class="pagetitle">Permits</h1>   
                
                <hr class="clear-contentunit" />
                <div class="column1-unit">
                    <div align="right">
                        <br />
                        <label>Search</label>                        
                        <select id="permitType">
                            <option value="5" selected="selected">Select..    </option>
                    <%                            
                            CachedRowSet crset = p.getPermit();
                            String dbid="", pType="";
                            if(crset.size()>0)
                            {
                                while(crset.next())
                                {
                                    dbid = String.valueOf(crset.getInt("pId"));
                                    pType = crset.getString("permitName");
                    %>
                                    <option value=<%=dbid%>><%=pType%></option>
                    <%
                                }
                            }
                    %>    
                        </select>
                        <label>by:</label>
                        <select id="criteria">
                            <option value="4" selected="selected">Select..    </option>
                            <option value="0">Permit Number</option>
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
                    <%
                            int counter = 0;
                    %>
                            <table width="636">
                                <tr>
                                    <th width="100" class="top" scope="col"><div align="center">Resident Name</div></th>
                                    <th width="100" class="top" scope="col"><div align="center">Address</div></th>
                                    <th width="82" class="top" scope="col"><div align="center">Contact No.</div></th>
                                    <th width="150" class="top" scope="col"><div align="center">Email Address</div></th>
                                    <th width="90" class="top" scope="col"><div align="center"></div></th>                                    
                                </tr>
                    <%
                            CachedRowSet resSet = r.getListRes(crit,search);
                            while(resSet.next() && counter < 10)
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
                                    <td>
                                        <div align="center">
                                            <a href="javascript:poptastic('staffChoosePermit.jsp?residentID=<%=resSet.getInt("ResId")%>');">Apply Permit</a>
                                        </div>    
                                    </td>
                                    
                                </tr>
                    <%
                                counter++;
                            }
                    %>
                            </table>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <!-- Content unit - One column -->    
        <div class="footer">
            <p>Copyright &copy; 2006 Your Company | All Rights Reserved</p>
            <p class="credits">	Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a> | Modified by <a href="#" title="Adaptor Homepage">4B1C</a> | Powered by <a href="#" title="Content Management System">CCMS</a> | <a href="http://validator.w3.org/check?uri=referer" title="Validate XHTML code">W3C XHTML 1.0</a> | <a href="http://jigsaw.w3.org/css-validator/" title="Validate CSS code">W3C CSS 2.0</a></p>
        </div>
    </div>
    
</body>
</html>