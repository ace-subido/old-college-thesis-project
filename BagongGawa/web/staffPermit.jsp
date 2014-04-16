 
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
        var pType = document.getElementById("permitType").value;
        var stat = document.getElementById("Status").value;
        if (document.getElementById("Status").value == "Pending" && pType != "0")
            window.location.href = "staffPermit.jsp?permitID=" + pType + "&status=Pending";
        else if (document.getElementById("Status").value == "Approved"  && pType != "0")
            window.location.href = "staffPermit.jsp?permitID=" + pType + "&status=Approved";
        else if (document.getElementById("Status").value == "Rejected"  && pType != "0")
            window.location.href = "staffPermit.jsp?permitID=" + pType + "&status=Rejected";
        
        if (document.getElementById("Status").value == "Pending" && pType == "0")
            window.location.href = "staffPermit.jsp?permitID=All&status=Pending";
        else if (document.getElementById("Status").value == "Approved"  && pType == "0")
            window.location.href = "staffPermit.jsp?permitID=All&status=Approved";
        else if (document.getElementById("Status").value == "Rejected"  && pType == "0")
            window.location.href = "staffPermit.jsp?permitID=All&status=Rejected";
    }

    function poptastic(url)
    {
        var newwindow;
	newwindow=window.open(url,'name','height=700,width=1000,location=yes,scrollbars=yes');
	if (window.focus) {newwindow.focus()}
    }
</script>
<body>    
    <%
        serviceTemplate t = new  serviceTemplate();
       
        CachedRowSet c = t.getServices();
        String ptype = request.getParameter("permitID");
        String stat = request.getParameter("status");
        
        Permits p = new Permits();
        CachedRowSet searchSet,fieldSet;
        String pName = "";
        if(!ptype.equalsIgnoreCase("All"))
        {    
            fieldSet = p.getFieldDetails(ptype);
            pName = fieldSet.getString("permitName");
        }
        if(!ptype.equalsIgnoreCase("All"))
            searchSet = p.getStaffPermitsSearch(ptype, stat);
        else
            searchSet = p.getStaffPermitsSearchAll(stat);
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
            <h1 class="first">Services</h1>            
            <dl class="nav3-grid">
<%               
                if(c.size() >0)
                {
                    while(c.next())
                    {
                        if(c.getString("permit").equals("Yes"))
                        {    
%>
                            <dt><a href="staffPermit.jsp?permitID=<%=ptype%>&status=<%=stat%>">Permits</a></dt>
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
                    
                <!-- Content unit - One column -->
                <h1 class="block">Manage Permits</h1> 
                <p>Welcome staff! As a staff of the homeowner's association, you have the privilage to apply a permit for the resident by clicking Apply Permit for Resident.  You can also approve or reject permit application if the administrator allows you to do so.
</p>  
                <ul>
                <li><a href="staffSearchResident.jsp?criteria=0&search=All">Apply Permit for Resident</a></li>
                </ul>
                <hr class="clear-contentunit" />
                <div class="column1-unit">
                    <div align="right">
                        <br />
                        <label>Permit Type</label>
                        <select id="permitType">
                            <option value="5" selected="selected">Select..    </option>
                            <option value="0">All</option>
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
                        <label>Status</label>
                        <select id="Status">
                            <option value="5" selected>Select..</option>
                            <option value="Pending">Pending</option>
                            <option value="Approved">Approved</option>
                            <option value="Rejected">Rejected</option>
                        </select>
                        <input type ="submit" value="Go" name="submit" align="center" onclick="proc()">
                    </div>
                    <br />
                    <hr class="clear-contentunit" />
                </div>
                <div class="column1-unit">
                <h1 class="block" align="center"><%=pName%> <%=stat%> Permits</h1>
                <div align="center">
                <%
                    Converter conv = new Converter();
                    Residents r = new Residents();
                    CachedRowSet residentSet,getPermitName;
                    
                    String left2="", orig2="";
                    int ctr2=0;
                    while(searchSet.next())
                    {
                        if(searchSet.getString("Status").equalsIgnoreCase("Pending"))
                        {  
                            orig2 = searchSet.getString("path");
                            left2 = orig2.substring(0,orig2.indexOf("-"));
                        }
                        if(left2.equalsIgnoreCase("Staff") || !searchSet.getString("Status").equalsIgnoreCase("Pending"))
                            ctr2++;
                    } 
                    int size = ctr2;
                    searchSet.beforeFirst();
                    
                    int counter=0, month, day, year;
                    boolean in=false,print=false;
                    java.util.Date appDate;
                    Calendar myCalendar;
                    String permID, path="",orig="",left="",right="",id="",resID="",realMonth="";
                    
                    if (searchSet.size() == 0)
                    {
                        in=true;
                %>
                        <div align="center">
                            <h1>No <%=pName%> <%=stat%> Permit Requests yet </h1>
                        </div>
                <%
                    }    
                    else
                    {                      
                %>                    
                        <table width="636">                            
                <%
                        while(searchSet.next() && counter < 10)
                        {
                            if(stat.equalsIgnoreCase("Pending"))
                            {    
                            orig = searchSet.getString("path");
                            left = orig.substring(0,orig.indexOf("-"));
                            right = orig.substring(orig.indexOf("-")+1);
                            }
                            if(left.equalsIgnoreCase("Staff") || !stat.equalsIgnoreCase("Pending"))
                            {
                                if(print==false)
                                {    
                %>
                        <tr>
                            <th width="94" class="top" scope="col"><div align="center">Resident Name</div></th>
                            <th width="82" class="top" scope="col"><div align="center">Contact No.</div></th>
                            <th width="82" class="top" scope="col"><div align="center">Permit Type</div></th>
                            <th width="115" class="top" scope="col"><div align="center">Date of Application</div></th>
                            <th width="45" class="top" scope="col"><div align="center">View Details</div></th>
                            <th width="20" class="top" scope="col"><div align="center"></div></th>
                            <th width="20" class="top" scope="col"><div align="center"></div></th>
                        </tr>
                <%
                                    print=true;
                                }
                            path = right;
                            appDate = searchSet.getTimestamp("field1");
                            myCalendar  = Calendar.getInstance();
                            myCalendar.setTime(appDate);
                            month = myCalendar.get(Calendar.MONTH)+1;
                            day = myCalendar.get(Calendar.DATE);
                            year = myCalendar.get(Calendar.YEAR);
                            
                            realMonth = conv.convMonth(month);
                            id = String.valueOf(searchSet.getInt("pID"));
                            permID = String.valueOf(searchSet.getInt("permitID"));
                            String permitID = String.valueOf(permID);
                            
                            getPermitName = p.getFieldDetails(permitID);
                            String permitName = getPermitName.getString("permitName");
                            
                            resID = String.valueOf(searchSet.getInt("resID"));
                            residentSet =  r.getResInfo(Integer.parseInt(resID));
                            residentSet.next();
                %>
                            <tr>
                                <td>
                                    <div align="center">
                                        <%=residentSet.getString("lastName")%> , <%=residentSet.getString("firstName")%>
                                    </div>    
                                </td>                                       
                                <td>
                                    <div align="center">
                                        <%=residentSet.getString("HouseNum")%>
                                    </div>    
                                </td>
                                <td>
                                    <div align="center">
                                        <%=permitName%>
                                    </div>    
                                </td>
                                <td>
                                    <div align="center">
                                        <%=realMonth%>&nbsp;<%=day%>,&nbsp;<%=year%>
                                    </div>    
                                </td>                                    
                                <td>
                                    <div align="center">
                                        <a href="javascript:poptastic('viewPermitDetails.jsp?resPermitID=<%=id%>&type=Staff&Back=false&page=1&status=<%=stat%>');">View</a>
                                    </div>    
                                </td>
                <%
                                if(stat.equalsIgnoreCase("Pending"))
                                {
                %>                                
                                <td>
                                    <div align="center">
                                        <a href="processApprovePermit.jsp?resPermitID=<%=id%>&ptype=<%=ptype%>&action=1&status=<%=stat%>&path=<%=path%>&type=Staff&More=false"><img src="icons/check-mark-copy-16x16.png"></a>
                                    </div>    
                                </td>
                                <td>
                                    <div align="center">
                                        <a href="javascript:poptastic('rejectPermit.jsp?resPermitID=<%=id%>&ptype=<%=ptype%>&action=0&status=<%=stat%>&path=<%=path%>&type=Staff&More=false&page=1');"><img src="icons/x.png"width="14" height="14"></a>
                                    </div>
                                </td>
                <%
               
                                }
                                else
                                {    
                %>
                                    <td>
                                        <div align="center">-</div>    
                                    </td>
                                    <td>
                                        <div align="center">-</div>
                                    </td>
                  
                <%
                                }
                %>    
                            </tr>
                <%
                            counter++;    
                            }
                        }
                    }
                %>
                </table>
                </div>
                <%
                    if(size > 10)
                    {    
                %>            
                        <a href="javascript:poptastic('seeMorePermits.jsp?permitID=<%=ptype%>&status=<%=stat%>&page=1&type=Staff&More=true');">See More Permits</a>
                <%
                    }            
                    if(counter==0 && in==false)
                    {    
                %>
                        <div align="center">
                            <h1>No <%=pName%> <%=stat%> Permit Requests yet </h1>
                        </div>
                <%
                    }
                %>        
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