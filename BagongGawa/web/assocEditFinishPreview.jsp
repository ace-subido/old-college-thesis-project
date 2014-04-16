 
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
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="./css/layout4_setup.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="./css/layout4_text.css" />
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
    Permits p = new Permits();
    String permitID = (String)session.getAttribute("permitID");
    CachedRowSet checkSet = p.getCheckDetails(permitID);
    CachedRowSet fieldSet = p.getFieldDetails(permitID);
    String permitName = fieldSet.getString("permitName");
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
                <h1 class="pagetitle"><%=permitName%> Permit</h1>
                <div class="column1-unit">
                    <h1 class="block"><%=permitName%> Permit Details</h1>
                    <p>Below are the list of details needed for <b><%=permitName%></b> permit application. Please select the details that you wish to apply in your permit.</p>
<%
                    if(checkSet.size() != 0 && fieldSet.size() != 0)
                    {
                        while(checkSet.next())
                        {
%>          
                                <table width="536" border="1">
                                    <h2 align="center"><strong><%=permitName%> DESCRIPTION</strong></h2>
                                    <div align="center">
                                        <label for="n" id="pfeetag" class="left">Permit Fee:</label> 
                                        <input type="text" id="pfee" name="pfee" class="field" disabled value="<%=fieldSet.getDouble("pfee")%>"></input>
                                    </div>
                                    <div align="center">
                                        <label for="n" id="rfeetag" class="left">Renew Fee:</label> 
                                        <input type="text" id="rfee" name="rfee" class="field" disabled value="<%=fieldSet.getDouble("renewfee")%>"></input>
                                    </div>
                                    <tr>
                                        <th width="81" scope="col"><div align="center">Include this detail</div></th>
                                        <th width="205" scope="col"><div align="center">Permit Details</div></th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div align="center">
                                                <input name="check1" type="checkbox" id="check1" checked="true" disabled="true"/>
                                             </div>
                                        </td>
                                        <td>
                                            <div align="center">Date of Application</div>
                                        </td>   
                                    </tr>
<%
                                if(checkSet.getString("field2").equalsIgnoreCase("Yes") || checkSet.getString("field2").equalsIgnoreCase("On")
                                        || !fieldSet.getString("field2").equals(""))
                                {
%>                                    
                                    <tr>
                                        <td>
                                            <div align="center">
                                                <input name="check2" type="checkbox" id="check2" disabled="true"
<%
                                                    if(checkSet.getString("field2").equalsIgnoreCase("Yes") || checkSet.getString("field2").equalsIgnoreCase("On"))
                                                    {    
%>
                                                            checked="true" 
<% 
                                                    }
%>
                                                            />
                                            </div>
                                        </td>
                                        <td>
                                            <div align="center"><%=fieldSet.getString("field2")%></div>
                                        </td>    
                                    </tr>
<%
                                }
                                if(checkSet.getString("field3").equalsIgnoreCase("Yes") || checkSet.getString("field3").equalsIgnoreCase("On")
                                        || !fieldSet.getString("field3").equals(""))
                                {
%>
                                    <tr>
                                        <td>
                                            <div align="center">
                                                <input name="check3" type="checkbox" id="check3" disabled="true"
<%
                                                    if(checkSet.getString("field3").equalsIgnoreCase("Yes") || checkSet.getString("field3").equalsIgnoreCase("On"))
                                                    {    
%>
                                                            checked="true" 
<% 
                                                    }
%>
                                                            />
                                                </div>
                                        </td>
                                        <td>
                                            <div align="center"><%=fieldSet.getString("field3")%></div>
                                        </td> 
                                    </tr>
<%
                                }
                                if(checkSet.getString("field4").equalsIgnoreCase("Yes") || checkSet.getString("field4").equalsIgnoreCase("On")
                                        || !fieldSet.getString("field4").equals(""))
                                {
%>                                    
                                    <tr>
                                        <td>
                                            <div align="center">
                                                <input name="check4" type="checkbox" id="check4" disabled="true"
                <%
                                                    if(checkSet.getString("field4").equalsIgnoreCase("Yes") || checkSet.getString("field4").equalsIgnoreCase("On"))
                                                    {    
                %>
                                                            checked="true" 
                <% 
                                                    }
                %>
                                                            />
                                                </div>
                                        </td>
                                        <td>
                                            <div align="center"><%=fieldSet.getString("field4")%></div>
                                        </td> 
                                    </tr>
                <%
                                }
                                if(checkSet.getString("field5").equalsIgnoreCase("Yes") || checkSet.getString("field5").equalsIgnoreCase("On")
                                        || !fieldSet.getString("field5").equals(""))
                                {
                %>                                    
                                    <tr>
                                        <td>
                                            <div align="center">
                                                <input name="check5" type="checkbox" id="check5" disabled="true"
                <%
                                                    if(checkSet.getString("field5").equalsIgnoreCase("Yes") || checkSet.getString("field5").equalsIgnoreCase("On"))
                                                    {    
                %>
                                                            checked="true" 
                <% 
                                                    }
                %>
                                                            />
                                                </div>
                                        </td>
                                        <td>
                                            <div align="center"><%=fieldSet.getString("field5")%></div>
                                        </td>    
                                    </tr>
                <%
                                }
                                if(checkSet.getString("field6").equalsIgnoreCase("Yes") || checkSet.getString("field6").equalsIgnoreCase("On")
                                        || !fieldSet.getString("field6").equals(""))
                                {
                %>                                      
                                    <tr>
                                        <td>
                                            <div align="center">
                                                <input name="check6" type="checkbox" id="check6" disabled="true"
                <%
                                                    if(checkSet.getString("field6").equalsIgnoreCase("Yes") || checkSet.getString("field6").equalsIgnoreCase("On"))
                                                    {    
                %>
                                                            checked="true" 
                <% 
                                                    }
                %>
                                                            />
                                            </div>
                                        </td>
                                        <td>
                                            <div align="center"><%=fieldSet.getString("field6")%></div>
                                        </td>    
                                    </tr>
                <%
                                }
                                if(checkSet.getString("field7").equalsIgnoreCase("Yes") || checkSet.getString("field7").equalsIgnoreCase("On")
                                        || !fieldSet.getString("field7").equals(""))
                                {
                %>                                     
                                    <tr>
                                        <td>
                                            <div align="center">
                                                <input name="check7" type="checkbox" id="check7" disabled="true"
                <%
                                                    if(checkSet.getString("field7").equalsIgnoreCase("Yes") || checkSet.getString("field7").equalsIgnoreCase("On"))
                                                    {    
                %>
                                                            checked="true" 
                <% 
                                                    }
                %>
                                                            />
                                                </div>
                                        </td>
                                        <td>
                                            <div align="center"><%=fieldSet.getString("field7")%></div>
                                        </td> 
                                    </tr>
                <%
                                }
                                if(checkSet.getString("field8").equalsIgnoreCase("Yes") || checkSet.getString("field8").equalsIgnoreCase("On")
                                        || !fieldSet.getString("field8").equals(""))
                                {
                %>                                     
                                    <tr>
                                        <td>
                                            <div align="center">
                                                <input name="check8" type="checkbox" id="check8" disabled="true"
                <%
                                                    if(checkSet.getString("field8").equalsIgnoreCase("Yes") || checkSet.getString("field8").equalsIgnoreCase("On"))
                                                    {    
                %>
                                                            checked="true" 
                <% 
                                                    }
                %>
                                                            />
                                                </div>
                                        </td>
                                        <td>
                                            <div align="center"><%=fieldSet.getString("field8")%></div>
                                        </td> 
                                    </tr>
                <%
                                }
                                if(checkSet.getString("field9").equalsIgnoreCase("Yes") || checkSet.getString("field9").equalsIgnoreCase("On")
                                        || !fieldSet.getString("field9").equals(""))
                                {
                %>                                    
                                    <tr>
                                        <td>
                                            <div align="center">
                                                <input name="check9" type="checkbox" id="check9" disabled="true"
                <%
                                                    if(checkSet.getString("field9").equalsIgnoreCase("Yes") || checkSet.getString("field9").equalsIgnoreCase("On"))
                                                    {    
                %>
                                                            checked="true" 
                <% 
                                                    }
                %>
                                                            />
                                                </div>
                                        </td>
                                        <td>
                                            <div align="center"><%=fieldSet.getString("field9")%></div>
                                        </td>    
                                    </tr>
                <%
                                }
                                if(checkSet.getString("field10").equalsIgnoreCase("Yes") || checkSet.getString("field10").equalsIgnoreCase("On")
                                        || !fieldSet.getString("field10").equals(""))
                                {
                %>                                     
                                    <tr>
                                        <td>
                                            <div align="center">
                                                <input name="check10" type="checkbox" id="check10" disabled="true"
                <%
                                                    if(checkSet.getString("field10").equalsIgnoreCase("Yes") || checkSet.getString("field10").equalsIgnoreCase("On"))
                                                    {    
                %>
                                                            checked="true" 
                <% 
                                                    }
                %>
                                                            />
                                            </div>
                                        </td>
                                        <td>
                                            <div align="center"><%=fieldSet.getString("field10")%></div>
                                        </td>   
                                    </tr>
                <%
                                }
                                if(checkSet.getString("field11").equalsIgnoreCase("Yes") || checkSet.getString("field11").equalsIgnoreCase("On")
                                        || !fieldSet.getString("field11").equals(""))
                                {
                %>                                    
                                    <tr>
                                        <td>
                                            <div align="center">
                                                <input name="check11" type="checkbox" id="check11" disabled=="true"
                <%
                                                    if(checkSet.getString("field11").equalsIgnoreCase("Yes") || checkSet.getString("field11").equalsIgnoreCase("On"))
                                                    {    
                %>
                                                            checked="true" 
                <% 
                                                    }
                %>
                                                            />
                                                </div>
                                        </td>
                                        <td>
                                            <div align="center"><%=fieldSet.getString("field11")%></div>
                                        </td> 
                                    </tr>
                <%
                                }
                                if(checkSet.getString("field12").equalsIgnoreCase("Yes") || checkSet.getString("field12").equalsIgnoreCase("On")
                                        || !fieldSet.getString("field12").equals(""))
                                {
                %>                                    
                                    <tr>
                                        <td>
                                            <div align="center">
                                                <input name="check12" type="checkbox" id="check12" disabled="true"
                <%
                                                    if(checkSet.getString("field12").equalsIgnoreCase("Yes") || checkSet.getString("field12").equalsIgnoreCase("On"))
                                                    {    
                %>
                                                            checked="true" 
                <% 
                                                    }
                %>
                                                            />
                                                </div>
                                        </td>
                                        <td>
                                            <div align="center"><%=fieldSet.getString("field12")%></div>
                                        </td> 
                                    </tr>
                <%
                                }
                                if(checkSet.getString("field13").equalsIgnoreCase("Yes") || checkSet.getString("field13").equalsIgnoreCase("On")
                                        || !fieldSet.getString("field13").equals(""))
                                {
                %>                                     
                                    <tr>
                                        <td>
                                            <div align="center">
                                                <input name="check13" type="checkbox" id="check13" disabled="true"
                <%
                                                    if(checkSet.getString("field13").equalsIgnoreCase("Yes") || checkSet.getString("field13").equalsIgnoreCase("On"))
                                                    {    
                %>
                                                            checked="true" 
                <% 
                                                    }
                %>
                                                            />
                                                </div>
                                        </td>
                                        <td>
                                            <div align="center"><%=fieldSet.getString("field13")%></div>
                                        </td>    
                                    </tr>
                <%
                                }
                                if(checkSet.getString("field14").equalsIgnoreCase("Yes") || checkSet.getString("field14").equalsIgnoreCase("On")
                                        || !fieldSet.getString("field14").equals(""))
                                {
                %>                                     
                                    <tr>
                                        <td>
                                            <div align="center">
                                                <input name="check14" type="checkbox" id="check14" disabled="true"
                <%
                                                    if(checkSet.getString("field14").equalsIgnoreCase("Yes") || checkSet.getString("field14").equalsIgnoreCase("On"))
                                                    {    
                %>
                                                            checked="true" 
                <% 
                                                    }
                %>
                                                            />
                                            </div>
                                        </td>
                                        <td>
                                            <div align="center"><%=fieldSet.getString("field14")%></div>
                                        </td>     
                                    </tr>
                <%
                                }
                                if(checkSet.getString("field15").equalsIgnoreCase("Yes") || checkSet.getString("field15").equalsIgnoreCase("On")
                                        || !fieldSet.getString("field15").equals(""))
                                {
                %>                                    
                                    <tr>
                                        <td>
                                            <div align="center">
                                                <input name="check15" type="checkbox" id="check15" disabled="true"
                <%
                                                    if(checkSet.getString("field15").equalsIgnoreCase("Yes") || checkSet.getString("field15").equalsIgnoreCase("On"))
                                                    {    
                %>
                                                            checked="true" 
                <% 
                                                    }
                %>
                                                            />
                                                </div>
                                        </td>
                                        <td>
                                            <div align="center"><%=fieldSet.getString("field15")%></div>
                                        </td> 
                                    </tr>
                <%
                                }
                                if(checkSet.getString("field16").equalsIgnoreCase("Yes") || checkSet.getString("field16").equalsIgnoreCase("On")
                                        || !fieldSet.getString("field16").equals(""))
                                {
                %>                                    
                                    <tr>
                                        <td>
                                            <div align="center">
                                                <input name="check4" type="checkbox" id="check4" disabled="true"
                <%
                                                    if(checkSet.getString("field16").equalsIgnoreCase("Yes") || checkSet.getString("field16").equalsIgnoreCase("On"))
                                                    {    
                %>
                                                            checked="true" 
                <% 
                                                    }
                %>
                                                            />
                                                </div>
                                        </td>
                                        <td>
                                            <div align="center"><%=fieldSet.getString("field16")%></div>
                                        </td> 
                                    </tr>
                <%
                                }
                                if(checkSet.getString("field17").equalsIgnoreCase("Yes") || checkSet.getString("field17").equalsIgnoreCase("On")
                                        || !fieldSet.getString("field17").equals(""))
                                {
                %>                                    
                                    <tr>
                                        <td>
                                            <div align="center">
                                                <input name="check17" type="checkbox" id="check17" disabled="true"
                <%
                                                    if(checkSet.getString("field17").equalsIgnoreCase("Yes") || checkSet.getString("field17").equalsIgnoreCase("On"))
                                                    {    
                %>
                                                            checked="true" 
                <% 
                                                    }
                %>
                                                            />
                                                </div>
                                        </td>
                                        <td>
                                            <div align="center"><%=fieldSet.getString("field17")%></div>
                                        </td>    
                                    </tr>
                <%
                                }
                                if(checkSet.getString("field18").equalsIgnoreCase("Yes") || checkSet.getString("field18").equalsIgnoreCase("On")
                                        || !fieldSet.getString("field18").equals(""))
                                {
                %>                                     
                                    <tr>
                                        <td>
                                            <div align="center">
                                                <input name="check18" type="checkbox" id="check18" disabled="true"
                <%
                                                    if(checkSet.getString("field18").equalsIgnoreCase("Yes") || checkSet.getString("field18").equalsIgnoreCase("On"))
                                                    {    
                %>
                                                            checked="true" 
                <% 
                                                    }
                %>
                                                            />
                                            </div>
                                        </td>
                                        <td>
                                            <div align="center"><%=fieldSet.getString("field18")%></div>
                                        </td>     
                                    </tr>
                <%
                                }
                                if(checkSet.getString("field19").equalsIgnoreCase("Yes") || checkSet.getString("field19").equalsIgnoreCase("On")
                                        || !fieldSet.getString("field19").equals(""))
                                {
                %>                                    
                                    <tr>
                                        <td>
                                            <div align="center">
                                                <input name="check19" type="checkbox" id="check19" disabled="true"
                <%
                                                    if(checkSet.getString("field19").equalsIgnoreCase("Yes") || checkSet.getString("field19").equalsIgnoreCase("On"))
                                                    {    
                %>
                                                            checked="true" 
                <% 
                                                    }
                %>
                                                            />
                                                </div>
                                        </td>
                                        <td>
                                            <div align="center"><%=fieldSet.getString("field19")%></div>
                                        </td> 
                                    </tr>
                <%
                                }
                                if(checkSet.getString("field20").equalsIgnoreCase("Yes") || checkSet.getString("field20").equalsIgnoreCase("On")
                                        || !fieldSet.getString("field20").equals(""))
                                {
                %>                                     
                                    <tr>
                                        <td>
                                            <div align="center">
                                                <input name="check20" type="checkbox" id="check20" disabled="true"
                <%
                                                    if(checkSet.getString("field20").equalsIgnoreCase("Yes") || checkSet.getString("field20").equalsIgnoreCase("On"))
                                                    {    
                %>
                                                            checked="true" 
                <% 
                                                    }
                %>
                                                            />
                                            </div>
                                        </td>
                                        <td>
                                            <div align="center"><%=fieldSet.getString("field20")%></div>
                                        </td> 
                                    </tr>
                <%
                                }
                %>                                    
                                </table>
                <p></p>
                <p>
                <label id="yearstag" name="yearstag" style="font-size:10pt"><b>Permit will expire in</b></label>
                &nbsp;&nbsp;
                <%
                    if(fieldSet.getInt("years")!=6)
                    {    
                %>
                        <label id="yearstag" name="yearstag" style="font-size:10pt"><%=fieldSet.getInt("years")%> years</label>
                <%
                    }
                    else
                    {
                %>
                        <label id="yearstag" name="yearstag" style="font-size:10pt">No Expiration</label>
                <%
                    }
                %>
                </p>
                <p>               
                <label style="font-size:10pt"><b>Path</b></label>
                <%
                    String orig = fieldSet.getString("path");
                    String left = orig.substring(0,orig.indexOf("-"));
                    String right = orig.substring(orig.indexOf("-")+1);
                    String realPath = "";
                    Residents r = new Residents();
                    Election e = new Election();
                    if(left.equalsIgnoreCase("Admin"))
                        left = "Administrator";
                    else if(left.equalsIgnoreCase("Staff"))
                        left = "Staff";
                    else
                    {
                        CachedRowSet resSet = e.getDivisionExis3(Integer.parseInt(left));
                        resSet.next();
                        CachedRowSet nameSet = e.getDivisionName2(resSet.getInt("chargeOf"));
                        nameSet.next();
                        left = "Director for " + nameSet.getString("comDivisionName");
                    }

                    String left2 ="",left3="";
                    realPath = left;
                    if(!right.equalsIgnoreCase(""))
                    {
                        orig = right;
                        left2 = orig.substring(0,orig.indexOf("-"));
                        right = orig.substring(orig.indexOf("-")+1);

                        if(left2.equalsIgnoreCase("Admin"))
                            left2 = "Administrator";
                        else if(left2.equalsIgnoreCase("Staff"))
                            left2 = "Staff";
                        else
                        {
                            CachedRowSet resSet2 = e.getDivisionExis3(Integer.parseInt(left2));
                            resSet2.next();
                            CachedRowSet nameSet2 = e.getDivisionName2(resSet2.getInt("chargeOf"));
                            nameSet2.next();
                            left2 = "Director for " + nameSet2.getString("comDivisionName");
                        }
                        realPath = realPath + " -> " + left2;
                        
                        if(!right.equalsIgnoreCase(""))
                        {
                            realPath = realPath + " -> " + left2;

                            orig = right;
                            left3 = orig.substring(0,orig.indexOf("-"));
                            right = orig.substring(orig.indexOf("-")+1);

                            if(left3.equalsIgnoreCase("Admin"))
                                left3 = "Administrator";
                            else if(left3.equalsIgnoreCase("Staff"))
                                left3 = "Staff";
                            else
                            {
                                CachedRowSet resSet3 = e.getDivisionExis3(Integer.parseInt(left3));
                                resSet3.next();
                                CachedRowSet nameSet3 = e.getDivisionName2(resSet3.getInt("chargeOf"));
                                nameSet3.next();
                                left = "Director for " + nameSet3.getString("comDivisionName");
                            }
                            realPath = realPath+" -> "+left3;
                        }
                    }
                %>        
                         &nbsp;&nbsp;
                        <label><%=realPath%></label>
                        </p>
                        <div>
                            <label for="n" id="rulestag" class="left" style="font-size:10pt"><b>Rules</b></label> 
                        </div>            
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <textarea name="textarea1" wrap="soft" id="textarea1" rows="5" cols="47" disabled><%=fieldSet.getString("Rules")%></textarea>
                <%
                        }
                    }
                %>
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