
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.Calendar"%>
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
    <link rel="icon" type="image/x-icon" href="./img/favicon.ico" />
    <title>Converge - Administrator</title>
</head>
<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body>
<%
    if(session.getAttribute("uname") == null)
        response.sendRedirect("homepage.jsp");

    serviceTemplate sTemplate = new  serviceTemplate();
     
    CachedRowSet c = sTemplate.getServices();
    String templateID = request.getParameter("templateID");
    session.setAttribute("tempId", templateID);
    Permits p = new Permits();
    CachedRowSet pset = p.getTemplateDetails(templateID);
    String permitName = pset.getString("permitName");
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
                                <li><a href="assocResidentAccounts.jsp">Residents and Accounts</a></li>                                  
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
                <h1 class="pagetitle"><%=permitName%> Permit</h1>
                <div class="column1-unit">
                    <h1 class="block"><%=permitName%> Permit Details</h1>
                    <p>Below are the list of details needed for <b><%=permitName%></b> permit application.</p>
                   <center>
                        <table width="536" border="1">
                            <h2 align="center"><strong><%=permitName%> DESCRIPTION</strong></h2>
                            <tr>
                                <th width="81" scope="col"><div align="center">Include this Detail</div></th>
                                <th width="205" scope="col"><div align="center">Permit Details</div></th>
                            </tr>
                            <tr>
                                <td>
                                    <div align="center">
                                        <input name="date1" type="checkbox" id="date1" checked="true" disabled="true"/>
                                     </div>
                                </td>
                                <td>
                                    <div align="center">
                                        <label id="datefield1" name="field1" class="datefield">Date of Application</label>
                                    </div>
                                </td>    
                            </tr>
                        <%
                            if(!pset.getString("field").equals(""))
                            {
                        %>    
                            <tr>
                                <td>
                                    <div align="center">
                                        <input name="check1" type="checkbox" id="check1" checked="true" disabled="true"/>
                                     </div>
                                </td>
                                <td>
                                    <div align="center">
                                        <label id="field1" name="field1"><%=pset.getString("field")%></label>
                                    </div>
                                </td>    
                            </tr>
                        <%
                            }
                            if(!pset.getString("field2").equals(""))
                            {
                        %>    
                            <tr>
                                <td>
                                    <div align="center">
                                        <input name="check2" type="checkbox" id="check2" checked="true" disabled="true"/>
                                     </div>
                                </td>
                                <td>
                                    <div align="center">
                                        <label id="field2" name="field2"><%=pset.getString("field2")%></label>
                                    </div>
                                </td>    
                            </tr>
                        <%
                            }
                            if(!pset.getString("field3").equals(""))
                            {
                        %>                          
                            <tr>
                                <td>
                                    <div align="center">
                                        <input name="check3" type="checkbox" id="check3" checked="true" disabled="true"/>
                                     </div>
                                </td>
                                <td>
                                    <div align="center">
                                        <label id="field3" name="field3"><%=pset.getString("field3")%></label>
                                    </div>
                                </td>    
                            </tr>
                        <%
                            }
                            if(!pset.getString("field4").equals(""))
                            {
                        %>  
                            <tr>
                                <td>
                                    <div align="center">
                                        <input name="check4" type="checkbox" id="check4" checked="true" disabled="true"/>
                                     </div>
                                </td>
                                <td>
                                    <div align="center">
                                        <label id="field4" name="field4"><%=pset.getString("field4")%></label>
                                    </div>
                                </td>    
                            </tr>
                        <%
                            }
                            if(!pset.getString("field5").equals(""))
                            {
                        %>  
                            <tr>
                                <td>
                                    <div align="center">
                                        <input name="check5" type="checkbox" id="check5" checked="true" disabled="true"/>
                                     </div>
                                </td>
                                <td>
                                    <div align="center">
                                        <label id="field5" name="field5"><%=pset.getString("field5")%></label>
                                    </div>
                                </td>    
                            </tr>
                        <%
                            }
                            if(!pset.getString("field6").equals(""))
                            {
                        %>  
                            <tr>
                                <td>
                                    <div align="center">
                                        <input name="check6" type="checkbox" id="check6" checked="true" disabled="true"/>
                                     </div>
                                </td>
                                <td>
                                    <div align="center">
                                        <label id="field6" name="field6"><%=pset.getString("field6")%></label>
                                    </div>
                                </td>    
                            </tr>
                        <%
                            }
                            if(!pset.getString("field7").equals(""))
                            {
                        %>  
                            <tr>
                                <td>
                                    <div align="center">
                                        <input name="check7" type="checkbox" id="check7" checked="true" disabled="true"/>
                                     </div>
                                </td>
                                <td>
                                    <div align="center">
                                        <label id="field7" name="field7"><%=pset.getString("field7")%></label>
                                    </div>
                                </td>    
                            </tr>
                        <%
                            }
                            if(!pset.getString("field8").equals(""))
                            {
                        %>  
                            <tr>
                                <td>
                                    <div align="center">
                                        <input name="check8" type="checkbox" id="check8" checked="true" disabled="true"/>
                                     </div>
                                </td>
                                <td>
                                    <div align="center">
                                        <label id="field8" name="field8"><%=pset.getString("field8")%></label>
                                    </div>
                                </td>    
                            </tr>
                        <%
                            }
                            if(!pset.getString("field9").equals(""))
                            {
                        %>  
                            <tr>
                                <td>
                                    <div align="center">
                                        <input name="check9" type="checkbox" id="check9" checked="true" disabled="true"/>
                                     </div>
                                </td>
                                <td>
                                    <div align="center">
                                        <label id="field9" name="field9"><%=pset.getString("field9")%></label>
                                    </div>
                                </td>    
                            </tr>
                        <%
                            }
                            if(!pset.getString("field10").equals(""))
                            {
                        %>  
                            <tr>
                                <td>
                                    <div align="center">
                                        <input name="check10" type="checkbox" id="check10" checked="true" disabled="true"/>
                                     </div>
                                </td>
                                <td>
                                    <div align="center">
                                        <label id="field10" name="field10"><%=pset.getString("field10")%></label>
                                    </div>
                                </td>    
                            </tr>
                        <%
                            }
                            if(!pset.getString("field11").equals(""))
                            {
                        %>  
                            <tr>
                                <td>
                                    <div align="center">
                                        <input name="check11" type="checkbox" id="check11" checked="true" disabled="true"/>
                                     </div>
                                </td>
                                <td>
                                    <div align="center">
                                        <label id="field11" name="field11"><%=pset.getString("field11")%></label>
                                    </div>
                                </td>    
                            </tr>
                        <%
                            }
                            if(!pset.getString("field12").equals(""))
                            {
                        %>  
                            <tr>
                                <td>
                                    <div align="center">
                                        <input name="check13" type="checkbox" id="check13" checked="true" disabled="true"/>
                                     </div>
                                </td>
                                <td>
                                    <div align="center">
                                        <label id="field13" name="field13"><%=pset.getString("field12")%></label>
                                    </div>
                                </td>    
                            </tr>
                        <%
                            }
                            if(!pset.getString("field13").equals(""))
                            {
                        %>  
                            <tr>
                                <td>
                                    <div align="center">
                                        <input name="check14" type="checkbox" id="check14" checked="true" disabled="true"/>
                                     </div>
                                </td>
                                <td>
                                    <div align="center">
                                        <label id="field14" name="field14"><%=pset.getString("field13")%></label>
                                    </div>
                                </td>    
                            </tr>
                        <%
                            }
                        %>
                </table></center><hr class="clear-contentunit"/>
                        <br>
                    <form action="assocAddTemplatePermit.jsp">    
                        <div align="center">
                            <p>  <input type="submit" class="button2" value="Add this Permit" align="center"></p>
                        </div>
                    </form>
                </div>
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