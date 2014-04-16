 
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

<script type= "text/javascript">
    function clr()
    {
       document.getElementById('name').value="";
       document.getElementById('pfee').value="";
       document.getElementById('rfee').value="";
       document.getElementById('field2').value="";
       document.getElementById('field3').value="";
       document.getElementById('field4').value="";
       document.getElementById('field5').value="";
       document.getElementById('field6').value="";
       document.getElementById('field7').value="";
       document.getElementById('field8').value="";
       document.getElementById('field9').value="";
       document.getElementById('field10').value="";
       document.getElementById('field11').value="";
       document.getElementById('field12').value="";
       document.getElementById('field13').value="";
       document.getElementById('field14').value="";
       document.getElementById('field15').value="";
       document.getElementById('field16').value="";
       document.getElementById('field17').value="";
       document.getElementById('field18').value="";
       document.getElementById('field19').value="";
       document.getElementById('field20').value="";
       document.getElementById('field2').style.background = "white";
       document.getElementById('field3').style.background = "white";
       document.getElementById('field4').style.background = "white";
       document.getElementById('field5').style.background = "white";
       document.getElementById('field6').style.background = "white";
       document.getElementById('field7').style.background = "white";
       document.getElementById('field8').style.background = "white";
       document.getElementById('field9').style.background = "white";
       document.getElementById('field10').style.background = "white";
       document.getElementById('field11').style.background = "white";
       document.getElementById('field12').style.background = "white";
       document.getElementById('field13').style.background = "white";
       document.getElementById('field14').style.background = "white";
       document.getElementById('field15').style.background = "white";
       document.getElementById('field16').style.background = "white";
       document.getElementById('field17').style.background = "white";
       document.getElementById('field18').style.background = "white";
       document.getElementById('field19').style.background = "white";
       document.getElementById('field20').style.background = "white";
       document.getElementById('textarea1').style.background = "white";
       document.getElementById('field2').style.border = "solid 1px rgb(200,200,200)";
       document.getElementById('field3').style.border = "solid 1px rgb(200,200,200)";
       document.getElementById('field4').style.border = "solid 1px rgb(200,200,200)";
       document.getElementById('field5').style.border = "solid 1px rgb(200,200,200)";
       document.getElementById('field6').style.border = "solid 1px rgb(200,200,200)";
       document.getElementById('field7').style.border = "solid 1px rgb(200,200,200)";
       document.getElementById('field8').style.border = "solid 1px rgb(200,200,200)";
       document.getElementById('field9').style.border = "solid 1px rgb(200,200,200)";
       document.getElementById('field10').style.border = "solid 1px rgb(200,200,200)";
       document.getElementById('field11').style.border = "solid 1px rgb(200,200,200)";
       document.getElementById('field12').style.border = "solid 1px rgb(200,200,200)";
       document.getElementById('field13').style.border = "solid 1px rgb(200,200,200)";
       document.getElementById('field14').style.border = "solid 1px rgb(200,200,200)";
       document.getElementById('field15').style.border = "solid 1px rgb(200,200,200)";
       document.getElementById('field16').style.border = "solid 1px rgb(200,200,200)";
       document.getElementById('field17').style.border = "solid 1px rgb(200,200,200)";
       document.getElementById('field18').style.border = "solid 1px rgb(200,200,200)";
       document.getElementById('field19').style.border = "solid 1px rgb(200,200,200)";
       document.getElementById('field20').style.border = "solid 1px rgb(200,200,200)";
       document.getElementById('textarea1').style.border = "solid 1px rgb(200,200,200)";
       
       document.getElementById('check2').checked=false;
       document.getElementById('check3').checked=false;
       document.getElementById('check4').checked=false;
       document.getElementById('check5').checked=false;
       document.getElementById('check6').checked=false;
       document.getElementById('check7').checked=false;
       document.getElementById('check8').checked=false;
       document.getElementById('check9').checked=false;
       document.getElementById('check10').checked=false;
       document.getElementById('check11').checked=false;
       document.getElementById('check12').checked=false;
       document.getElementById('check13').checked=false;
       document.getElementById('check14').checked=false;
       document.getElementById('check15').checked=false;
       document.getElementById('check16').checked=false;
       document.getElementById('check17').checked=false;
       document.getElementById('check18').checked=false;
       document.getElementById('check19').checked=false;
       document.getElementById('check20').checked=false;
       document.getElementById('path').selectedIndex = "0";
       document.getElementById('path1').selectedIndex = "0";
       document.getElementById('path2').selectedIndex = "0";
       document.getElementById('years').selectedIndex = "0";
       document.getElementById('name').focus();

       document.getElementById('nametag').style.color="rgb(80,80,80)";
       document.getElementById('pfeetag').style.color="rgb(80,80,80)";
       document.getElementById('rfeetag').style.color="rgb(80,80,80)";
       document.getElementById('rulestag').style.color="black";
    }
    function checkForm()
    {
        var i = 0, once=true;
        if(document.getElementById('name').value.length == 0)
        {
            document.getElementById('nametag').style.color = "red";
            i++;            
        }
        else
            document.getElementById('nametag').style.color = "rgb(80,80,80)";
        
        if(document.getElementById('pfee').value.length == 0 || isNaN(document.getElementById('pfee').value)==1)
        {
            document.getElementById('pfeetag').style.color = "red";
            i++;            
        }
        else
            document.getElementById('pfeetag').style.color = "rgb(80,80,80)";
        
        if(document.getElementById('rfee').value.length == 0 || isNaN(document.getElementById('rfee').value)==1)
        {
            document.getElementById('rfeetag').style.color = "red";
            i++;            
        }
        else
            document.getElementById('rfeetag').style.color = "rgb(80,80,80)";
        
        if(document.getElementById('check2').checked == true)
        {
            if(document.getElementById('field2').value.length == 0)
            {
                document.getElementById('field2').style.background = 'red';
                i++;                
            }
            else
            {
                document.getElementById('field2').style.background = "white";
                document.getElementById('field2').style.border = "solid 1px rgb(200,200,200)";
                once = false;
            }   
        }
        
        if(document.getElementById('check3').checked == true)
        {
            if(document.getElementById('field3').value.length == 0)
            {
                document.getElementById('field3').style.background = "red";
                i++;
            }
            else
            {
                document.getElementById('field3').style.background = "white";
                document.getElementById('field3').style.border = "solid 1px rgb(200,200,200)";
                once = false;
            }   
        }
        
        if(document.getElementById('check4').checked == true)
        {
            if(document.getElementById('field4').value.length == 0)
            {
                document.getElementById('field4').style.background = "red";
                i++;
            }
            else
            {
                document.getElementById('field4').style.background = "white";
                document.getElementById('field4').style.border = "solid 1px rgb(200,200,200)";
                once = false;
            }   
        }
            
        if(document.getElementById('check5').checked == true)
        {
            if(document.getElementById('field5').value.length == 0)
            {
                document.getElementById('field5').style.background = "red";
                i++;
            }
            else
            {
                document.getElementById('field5').style.background = "white";
                document.getElementById('field5').style.border = "solid 1px rgb(200,200,200)";
                once = false;
            }   
        }
        
        if(document.getElementById('check6').checked == true)
        {
            if(document.getElementById('field6').value.length == 0)
            {
                document.getElementById('field6').style.background = "red";
                i++;
            }
            else
            {
                document.getElementById('field6').style.background = "white";
                document.getElementById('field6').style.border = "solid 1px rgb(200,200,200)";
                once = false;
            }   
        }
        
        if(document.getElementById('check7').checked == true)
        {
            if(document.getElementById('field7').value.length == 0)
            {
                document.getElementById('field7').style.background = "red";
                i++;
            }
            else
            {
                document.getElementById('field7').style.background = "white";
                document.getElementById('field7').style.border = "solid 1px rgb(200,200,200)";
                once = false;
            }   
        }
        
        if(document.getElementById('check8').checked == true)
        {
            if(document.getElementById('field8').value.length == 0)
            {
                document.getElementById('field8').style.background = "red";
                i++;
            }
            else
            {
                document.getElementById('field8').style.background = "white";
                document.getElementById('field8').style.border = "solid 1px rgb(200,200,200)";
                once = false;
            }   
        }
        
        if(document.getElementById('check9').checked == true)
        {
            if(document.getElementById('field9').value.length == 0)
            {
                document.getElementById('field9').style.background = "red";
                i++;
            }
            else
            {
                document.getElementById('field9').style.background = "white";
                document.getElementById('field9').style.border = "solid 1px rgb(200,200,200)";
                once = false;
            }   
        }
        
        if(document.getElementById('check10').checked == true)
        {
            if(document.getElementById('field10').value.length == 0)
            {
                document.getElementById('field10').style.background = "red";
                i++;
            }
            else
            {
                document.getElementById('field10').style.background = "white";
                document.getElementById('field10').style.border = "solid 1px rgb(200,200,200)";
                once = false;
            }   
        }
       
        if(document.getElementById('check11').checked == true)
        {
            if(document.getElementById('field11').value.length == 0)
            {
                document.getElementById('field11').style.background = 'red';
                i++;
            }
            else
            {
                document.getElementById('field11').style.background = "white";
                document.getElementById('field11').style.border = "solid 1px rgb(200,200,200)";
                once = false;
            }   
        }
        
        if(document.getElementById('check12').checked == true)
        {
            if(document.getElementById('field12').value.length == 0)
            {
                document.getElementById('field12').style.background = 'red';
                i++;
            }
            else
            {
                document.getElementById('field12').style.background = "white";
                document.getElementById('field12').style.border = "solid 1px rgb(200,200,200)";
                once = false;
            }   
        }
        
        if(document.getElementById('check13').checked == true)
        {
            if(document.getElementById('field13').value.length == 0)
            {
                document.getElementById('field13').style.background = "red";
                i++;
            }
            else
            {
                document.getElementById('field13').style.background = "white";
                document.getElementById('field13').style.border = "solid 1px rgb(200,200,200)";
                once = false;
            }   
        }
        
        if(document.getElementById('check14').checked == true)
        {
            if(document.getElementById('field14').value.length == 0)
            {
                document.getElementById('field14').style.background = "red";
                i++;
            }
            else
            {
                document.getElementById('field14').style.background = "white";
                document.getElementById('field14').style.border = "solid 1px rgb(200,200,200)";
                once = false;
            }   
        }
            
        if(document.getElementById('check15').checked == true)
        {
            if(document.getElementById('field15').value.length == 0)
            {
                document.getElementById('field15').style.background = "red";
                i++;
            }
            else
            {
                document.getElementById('field15').style.background = "white";
                document.getElementById('field15').style.border = "solid 1px rgb(200,200,200)";
                once = false;
            }   
        }
        
        if(document.getElementById('check16').checked == true)
        {
            if(document.getElementById('field16').value.length == 0)
            {
                document.getElementById('field16').style.background = "red";
                i++;
            }
            else
            {
                document.getElementById('field16').style.background = "white";
                document.getElementById('field16').style.border = "solid 1px rgb(200,200,200)";
                once = false;
            }   
        }
        
        if(document.getElementById('check17').checked == true)
        {
            if(document.getElementById('field17').value.length == 0)
            {
                document.getElementById('field17').style.background = "red";
                i++;
            }
            else
            {
                document.getElementById('field17').style.background = "white";
                document.getElementById('field17').style.border = "solid 1px rgb(200,200,200)";
                once = false;
            }   
        }
        
        if(document.getElementById('check18').checked == true)
        {
            if(document.getElementById('field18').value.length == 0)
            {
                document.getElementById('field18').style.background = "red";
                i++;
            }
            else
            {
                document.getElementById('field18').style.background = "white";
                document.getElementById('field18').style.border = "solid 1px rgb(200,200,200)";
                once = false;
            }   
        }
        
        if(document.getElementById('check19').checked == true)
        {
            if(document.getElementById('field19').value.length == 0)
            {
                document.getElementById('field19').style.background = "red";
                i++;
            }
            else
            {
                document.getElementById('field19').style.background = "white";
                document.getElementById('field19').style.border = "solid 1px rgb(200,200,200)";
                once = false;
            }   
        }
        
        if(document.getElementById('check20').checked == true)
        {
            if(document.getElementById('field20').value.length == 0)
            {
                document.getElementById('field20').style.background = "red";
                i++;
            }
            else
            {
                document.getElementById('field20').style.background = "white";
                document.getElementById('field20').style.border = "solid 1px rgb(200,200,200)";
                once = false;
            }   
        }
        
        if(document.getElementById('textarea1').value.length == 0)
        {
            document.getElementById('rulestag').style.color = "red";
            i++;            
        }
        else
            document.getElementById('rulestag').style.color = "rgb(80,80,80)";
        
        if(document.getElementById('path').selectedIndex == "0")
        {
            document.getElementById('pathtag').style.color = "red";
            i++;            
        }
        else
        {
            if(document.getElementById('path1').selectedIndex == 0 && document.getElementById('path2').selectedIndex > 0)
            {
                document.getElementById('pathtag').style.color = "red";
                i++;            
            }
            else
                document.getElementById('pathtag').style.color = "rgb(80,80,80)";
        }
        
        if(document.getElementById('years').selectedIndex == "0")
        {
            document.getElementById('yearstag').style.color = "red";
            i++;            
        }
        else
            document.getElementById('yearstag').style.color = "rgb(80,80,80)";

        if (i > 0)
        {
            alert("Check Fields in red.");
            return false;
        }
        else
        {
            if(once == true)
            {    
                alert("Need to have at least 1 field");
                return false;
            }
            else
                return true;
        }   
    }
</script>        
<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body>
<%
    if(session.getAttribute("uname") == null)
        response.sendRedirect("homepage.jsp");

	serviceTemplate sTemplate = new  serviceTemplate();
        
        CachedRowSet c = sTemplate.getServices(); 
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
                <h1 class="pagetitle">Permits</h1>
                <div class="column1-unit">
                    <!-- Content unit - One column -->
                    <h1 class="block" align="center">ADD NEW PERMIT</h1>
                    <br>
                    <form name="addpermit" onSubmit="return (checkForm())" action ="processAssocAddPermit.jsp" method="get">
                        <div align="center">
                            <label for="n" id="nametag" class="left">Permit Name:</label> 
                            <input type="text" id="name" name="name" class="field" value=""></input>
                        </div>
                        <input type="hidden" name="tempID" value="0">
                        <br/>
                        
                        <div align="center">
                            <label for="n" id="pfeetag" class="left">Permit Fee:</label> 
                            <input type="text" id="pfee" name="pfee" class="field" value=""></input>
                        </div>
                        <br/>
                        
                        <div align="center">
                            <label for="n" id="rfeetag" class="left">Renew Fee:</label> 
                            <input type="text" id="rfee" name="rfee" class="field" value=""></input>
                        </div>
                        <table width="536" border="1">
                            <tr>
                                <th width="81" scope="col"><div align="center">Include this detail</div></th>
                                <th width="205" scope="col"><div align="center">Permit Detail</div></th>
                            </tr>
                        <%
                            int next = 2;
                            String n = "", check = "";
                        %>    
                            <tr>
                                <td>
                                    <div align="center">
                                        <input name="check1" type="checkbox" id=check1 disabled="true" checked = "true"/>
                                    </div>
                                </td>
                                <td>
                                    <div align="center">
                                        <input type="text" id="field1" name="field1" class="field" value="Date of Application" disabled="true"></input>
                                    </div>
                                </td>
                            </tr>
                        <%        
                            while(next<=20)
                            {
                                n = "field"+Integer.toString(next);
                                check = "check"+Integer.toString(next);
                        %>
                                <tr>
                                    <td>
                                        <div align="center">
                                            <input name='<%=check%>' type="checkbox" id='<%=check%>'/>
                                        </div>
                                    </td>
                                    <td>
                                        <div align="center">
                                            <input type="text" id='<%=n%>' name='<%=n%>' class="field" value=""></input>
                                        </div>
                                    </td>
                                </tr>
                        <%
                            next++;
                            }
                        %>        
                        </table>
                        <p></p>
                        <p>
                        <label id="yearstag" name="yearstag" style="font-size:10pt"><b>Permit will expire in</b></label>
                        &nbsp;&nbsp;
                        <select name="years" id="years">
                            <option value="0">Select...&nbsp;</option>
                            <option value="6">&nbsp;No Expiration</option>
                            <option value="1">&nbsp;1 year&nbsp;&nbsp;&nbsp;&nbsp;</option>
                            <option value="2">&nbsp;2 years&nbsp;&nbsp;&nbsp;&nbsp;</option>
                            <option value="3">&nbsp;3 years&nbsp;&nbsp;&nbsp;&nbsp;</option>
                            <option value="4">&nbsp;4 years&nbsp;&nbsp;&nbsp;&nbsp;</option>
                            <option value="5">&nbsp;5 years&nbsp;&nbsp;&nbsp;&nbsp;</option>
                        </select>
                        </p>
                        <p>
                        <label id="pathtag" name="pathtag" style="font-size:10pt"><b>Path</b></label>
                        &nbsp;&nbsp;
                        <select name="path" id="path">
                            <option value="Select" selected="selected">Select..&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                            <option value="Admin" >Administrator&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                        <%
                            Residents r = new Residents();
                            Election e = new Election();
                            CachedRowSet directorSet = r.getResDirector();
                            CachedRowSet nameSet;
                            while(directorSet.next())
                            {    
                                nameSet = e.getDivisionName2(directorSet.getInt("chargeOf"));
                                nameSet.next();
                        %>
                            <option value=<%=directorSet.getInt("ResId")%>>Director for <%=nameSet.getString("comDivisionName")%></option>
                        <%
                            }
                        %>
                            <option value="Staff" >Staff&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                        </select>
                        ->
                        <select name="path1" id="path1">
                            <option value="Select" selected="selected">Select..&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                            <option value="Admin" >Administrator&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                        <%
                            CachedRowSet directorSet2 = r.getResDirector();
                            CachedRowSet nameSet2;
                            while(directorSet2.next())
                            {    
                                nameSet2 = e.getDivisionName2(directorSet2.getInt("chargeOf"));
                                nameSet2.next();
                        %>
                            <option value=<%=directorSet2.getInt("ResId")%>>Director for <%=nameSet2.getString("comDivisionName")%></option>
                        <%
                            }
                        %>
                            <option value="Staff" >Staff&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                        </select>
                        ->
                        <select name="path2" id="path2">
                            <option value="Select" selected="selected">Select..&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                            <option value="Admin" >Administrator&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                        <%
                            CachedRowSet directorSet3 = r.getResDirector();
                            CachedRowSet nameSet3;
                            while(directorSet3.next())
                            {    
                                nameSet3 = e.getDivisionName2(directorSet3.getInt("chargeOf"));
                                nameSet3.next();
                        %>
                            <option value=<%=directorSet3.getInt("ResId")%>>Director for <%=nameSet3.getString("comDivisionName")%></option>
                        <%
                            }
                        %>
                            <option value="Staff" >Staff&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                        </select>
                        </p>
                        <div>
                            <label for="n" id="rulestag" class="left" style="font-size:10pt"><b>Rules</b></label> 
                        </div>            
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <textarea name="textarea1" id="textarea1" rows="5" cols="47" onfocus="" wrap="soft"></textarea>
                        <br>
                        <p></p>
                        <div align="center">
                            <input type ="submit" value="Add" name="submit" align="center">
                            <input type="button" value="Clear" onClick="clr();">
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