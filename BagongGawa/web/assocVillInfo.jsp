 
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
  <title>Converge - Administrator : Village Information </title>
</head>
<script type="text/javascript">
    function bo()
    {
        alert("This list contains the current Management Divisions of the Community");
    }
    
    function checkForm()
    {
       var i = 0;
        if(document.getElementById('villname').value.length == 0)
        {    
            document.getElementById('villnametag').style.color = "red";
            i++;
        }
        else
            document.getElementById('villnametag').style.color = "black";
                                        
        if(document.getElementById('villad').value.length == 0)
        {    
            document.getElementById('villadtag').style.color = "red";
            i++;
        }
        else
            document.getElementById('villadtag').style.color = "black";
        
        if (i > 0)
        {
            alert("Check Fields in red.");
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
		
    Unit u = new Unit();
    CachedRowSet crset = u.getVillageInfo();
    serviceTemplate t = new  serviceTemplate();
            
    CachedRowSet c = t.getServices();
    Election e = new Election();
    CachedRowSet divSet = e.getAllDivisionNames();
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
                <h1 class="pagetitle">Community Information</h1>
                <!-- Content unit - One column -->
                    <div class="column1-unit">
                        <h1 class="side"><img src="icons/board-icon.jpg" alt="Image description"  title="Image title" />View Community Information</h1>
                        <h3 class="side">&nbsp;</h3>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostruderci tation ullamcorper suscipit lobortis nisl ut aliquip. orem ipsum dolor sit amet.</p>  
                        <br>
                        <hr class="clear-contentunit" />
                        <div class="contactform">
<%
                        if(crset.size() > 0)
                        {	
                            while(crset.next())
                            {	  
                                session.setAttribute("villId", crset.getInt("ID"));
%>
                        <form name="vinfo" onSubmit="return(checkForm())" action="processAssocVillInfo2.jsp" method="get">
                            <input type="hidden" value="old" name="formType"/>
                            <input type="hidden" value="<%=crset.getInt("ID")%>" name="id"/>
                            <fieldset>
                                <legend>&nbsp;Fill in Community Information &nbsp;</legend>
                                <p>
                                    <label class="left" id="villnametag">Community Name:</label>
                                    <input type="text" name="villname" id="villname" class="field" value="<%=crset.getString("NameOfAssoc")%>" tabindex="1" title="Enter village name"/></p>
                                <p>
                                    <label class="left" id="villadtag">Community Address:</label>
                                    <input type="text" name="villad" id="villad" class="field" value="<%=crset.getString("AddressAssoc")%>" tabindex="1" title="Enter village adress" /></p>
                                <p>
                                    <label class="left" id="villunittag">Type of Community:</label>
<%
                                    String unitStr = "";
                                    if(crset.getString("DivisionUnit").equalsIgnoreCase("phase"))
                                        unitStr = "Subdivision / Village";
                                    else
                                        unitStr = "Building";
                                        
%>
                                    <label class="left" id="villunittag"><%=unitStr%></label>
                                    <input type=hidden name="villunit" id="villunit" value=<%=crset.getString("DivisionUnit")%>>
                                </p>
                                <p><input type="submit" name="submit" id="submit" class="button2" value="Save Changes" tabindex="6"/></p>
                            </fieldset>
                            <fieldset>
                                <legend>List of Community Management Divisions (<a href="" onclick="bo()"> ? </a>)</legend>
                                
                                <table width="636" align="center">
                                    <tr>
                                        <th width="100" class="top" scope="col"><div align="center">Division Name</div></th>
                                        <th width="70" class="top" scope="col"><div align="center"></div></th>
                                    </tr>
<%                    
                                    if(divSet.size() > 0)                        
                                    {
                                        int s=0;
                                        String name="";
                                        while(divSet.next())
                                        {    
                                            s = divSet.getInt("comDivId");
                                            name = divSet.getString("comDivisionName");
%>                 
                                    <tr>
                                        <td><div align="center"><%=name%></div></td>
                                        <td><div align="center"><a href="assocEditComManDiv.jsp?id=<%=s%>&name=<%=name%>">Edit Division Name</a></div></td>
                                    </tr>    
<%
                                        }
                                    }   
                                    else
                                    {
%>
                                        <h6 class="left">&nbsp;&nbsp;No community management divisions yet</h6>
<%
                                    }
%>                                
                                </table>
                                <p><input type="button" onclick="window.location.href='assocCreateComManDiv.jsp'" name="submit" id="submit" class="button2" value="Add New Division" tabindex="6" /></p>
                            </fieldset>
                        </form>
<%               
                            }
                        }
                        else
                        {
%>
                        <form name="vinfo" onSubmit="return(checkForm())" action="processAssocVillInfo.jsp" method="get">
                            <input type="hidden" value="new" name="formType"/>
                            <input type="hidden" value="1" name="id"/>
                            <fieldset>
                                <legend>&nbsp;VILLAGE INFORMATION&nbsp;</legend>
                                <p>
                                    <label class="left" id="villnametag">Village Name:</label>
                                    <input type="text" name="villname" id="villname" class="field" value="" tabindex="1" title="Enter village name"/></p>
                                <p>
                                    <label class="left" id="villadtag">Village Address:</label>
                                    <input type="text" name="villad" id="villad" class="field" value="" tabindex="1" title="Enter village adress" /></p>
                                <p>
<%
                                    String unitStr = "";
                                    if(crset.getString("DivisionUnit").equalsIgnoreCase("phase"))
                                        unitStr = "Subdivision / Village";
                                    else
                                        unitStr = "Building";       
%>
                                    <label class="left" id="villunittag"><%=unitStr%></label>
                                    <input type=hidden name="villunit" id="villunit" value=<%=crset.getString("DivisionUnit")%>>
                                </p>
                                <p><input type="submit" name="submit" id="submit" class="button2" value="Save Changes" tabindex="6"/></p>
                            </fieldset>
                            <div class="contactform" align="center">
                            <fieldset>
                                <legend>List of Community Management Divisions (<a href="" onclick="bo()"> ? </a>)</legend>
                                <table width="636" align="center">
                                    <tr>
                                        <th width="100" class="top" scope="col"><div align="center">Division Name</div></th>
                                        <th width="70" class="top" scope="col"><div align="center"></div></th>
                                    </tr>
<%                    
                                    if(divSet.size() > 0)                        
                                    {
                                        int s=0;
                                        String name="";
                                        while(divSet.next())
                                        {    
                                            s = divSet.getInt("comDivId");
                                            name = divSet.getString("comDivisionName");
%>                 
                                    <tr>
                                        <td><div align="center"><%=name%></div></td>
                                        <td><div align="center"><a href="assocEditComManDiv.jsp?id=<%=s%>&name=<%=name%>">Edit Division Name</a></div></td>
                                    </tr>    
<%
                                        }
                                    }    
                                    else
                                    {
%>
                                        <h6 class="left">&nbsp;&nbsp;No community management divisions yet</h6>
<%
                                    }
%>                                
                                </table>
                            </fieldset>
                            </div>
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