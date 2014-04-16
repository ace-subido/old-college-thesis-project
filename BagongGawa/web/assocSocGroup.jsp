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
    <script type="text/javascript" src="./js/ieflickerhack.js"></script>  
    <link rel="icon" type="image/x-icon" href="./img/favicon.ico" />
    <title>Converge - Administrator : Social Groups</title>
    <style type="text/css">
        <!--
        .style1 {color: #FF0000}
        -->
    </style>
    <script type= "text/javascript">
    <!--
        function res()
        {       
            var y = document.ass.year;
                
            if (y.value == "")
            {
                alert("Fill in number of year(s)");
                return (false);
            }
        }
        function checky()
        {
            var y = document.ass.batsz4;
            
            if (y.value == '0'){
                alert("Select a type of approval set-up");
                return (false);
            }
        }
        
        function checky2()
        {
            var x = document.ass1235.mimi1;
            var y = document.ass1235.mimi2;
            var z = document.ass1235.mimi3;
            
            if (x.value == '0' && y.value == '0' && z.value == '0'){
                alert("No changes will be made");
                return (false);
            }           
            
        }
        
        
    -->
    </script>
    <script type="text/javascript" src="./js/ajaxSocialGroups.js"></script>
</head>
    
<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->
    
<body onload="showSocCategories()">
<%
    if (session.getAttribute("uname") == null)
        response.sendRedirect("homepage.jsp");
            
    serviceTemplate st = new  serviceTemplate();
    CachedRowSet c = st.getServices();       
            
    Thesis db = new Thesis();
    ConnectorThesis ct = new ConnectorThesis();
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
                <h1 class="pagetitle">Social Group Settings</h1>
                    
                <!-- Content unit - One column -->
         
                <div class="column1-unit">
<%
                    SocialGroup sgsg = new SocialGroup();
                    int tempywempy = sgsg.getSocGNumP();
                    int ampywampy = sgsg.getSocGNumP2();
                    String yampyyampy = sgsg.getSocGDApp();
                    
                    String temp1 = sgsg.getSocGNewsSet();
                    String temp2 = sgsg.getSocGBulletSet();
                    String temp3 = sgsg.getSocGReserveSet();
%>
                    <h1 class="block">Service Settings</h1>         
                    <hr class="clear-contentunit" />
                    <div class="contactform">
                        <form name="ass" action="processAssocSaveSGSettings.jsp" method="get">
                            <fieldset>
                                <p> <label for="vill_name" class="left"> How many residents should petition for a group to be subject to approval? </label>                                                        
                                &nbsp;&nbsp;<input type="text" name="lolol" id="lolol" class="field" value="<%=tempywempy%>"/> </p>
                                <p> <label for="vill_name" class="left"> How many residents should a petitioner invite for a request to be approvable? </label>                                                        
                                &nbsp;&nbsp;<input type="text" name="hihi" id="hihi" class="field" value="<%=ampywampy%>"/> </p>
                                <p> <input type="submit" name="sub" value="Save" align="center" class="button2"></p>
                            </fieldset>
                        </form>
                    </div>
                    <hr class="clear-contentunit"/>
                    <h1 class="block">Social Group Feature Settings</h1>         
                    <div class="contactform">
                        <form name="ass1235" onSubmit="return(checky2())" action="processAssocSaveSGSettings2.jsp" method="get">
                            <fieldset>
                                <p> <label for="vill_name" class="left"> Bulletin Board for the group</label>                                                        
                             &nbsp;&nbsp;<select name='mimi1' id='mimi1' class='combo'>
                                 <%if(temp2.equals("Enabled")){%>   
                                    <option value='0'> Select... </option>
                                    <option selected value="E"> Enabled </option>                                               
                                    <option value="D"> Disabled </option>                                               
                                    <%}else if(temp2.equals("Disabled")){
                        %>
                         <option value='0'> Select... </option>
                                    <option value="E"> Enabled </option>                                               
                                    <option selected value="D"> Disabled </option> 
                        <%}else{
                        %>
                                    <option value='0'> Select... </option>
                                    <option value="E"> Enabled </option>                                               
                                    <option value="D"> Disabled </option> 
                        <%}%>            
                                </select>
                                </p>
                                
                                <p> <label for="vill_name" class="left"> Newsletter Article Submission for the group</label>                                  
                                &nbsp;&nbsp;<select name='mimi2' id='mimi2' class='combo'>
                                 <%if(temp1.equals("Enabled")){%>   
                                    <option value='0'> Select... </option>
                                    <option selected value="E"> Enabled </option>                                               
                                    <option value="D"> Disabled </option>                                               
                                    <%}else if(temp1.equals("Disabled")){
                        %>
                         <option value='0'> Select... </option>
                                    <option value="E"> Enabled </option>                                               
                                    <option selected value="D"> Disabled </option> 
                        <%}else{
                        %>
                                    <option value='0'> Select... </option>
                                    <option value="E"> Enabled </option>                                               
                                    <option value="D"> Disabled </option> 
                        <%}%>            
                                </select> </p>
                                
                                <p> <label for="vill_name" class="left"> Facility Reservation for the group</label>                                                        
                                &nbsp;&nbsp;<select name='mimi3' id='mimi3' class='combo'>
                                 <%if(temp3.equals("Enabled")){%>   
                                    <option value='0'> Select... </option>
                                    <option selected value="E"> Enabled </option>                                               
                                    <option value="D"> Disabled </option>                                               
                                    <%}else if(temp3.equals("Disabled")){
                        %>
                         <option value='0'> Select... </option>
                                    <option value="E"> Enabled </option>                                               
                                    <option selected value="D"> Disabled </option> 
                        <%}else{
                        %>
                                    <option value='0'> Select... </option>
                                    <option value="E"> Enabled </option>                                               
                                    <option value="D"> Disabled </option> 
                        <%}%>            
                                </select> </p>
                                <p> <input type="submit" name="sub" value="Save" align="center" class="button2"></p>
                            </fieldset>
                        </form>
                    </div>
                    <hr class="clear-contentunit" />
                    <div class="column1-unit">
                        <h1 class="block">List of Social Group Categories</h1>  
                        <hr class="clear-contentunit" />     <br><br>         
                        <div id="listSocCat" name="listSocCat"></div><br>
                        <hr class="clear-contentunit" /><br><br>
                        <p>New Category Name:
                            <input type="text" name="newCat" id="newCat" />
                            <input type="button" name="Add Category" id="Add Category" value="Add Category" onclick='addSocCategories()' />
                        </p>
                    </div>   
                    <hr class="clear-contentunit" />
                    <div class="column1-unit">
                        <h1 class="block">Director Approval Settings</h1>
                      
                        <div class="contactform">
                        <form name="ass2" onSubmit="return(checky())" action="processAssocSocGroupDirApp.jsp" method="get">
                            <fieldset>
                                <p> <label for="vill_name" class="left"> Approval Type : &nbsp;&nbsp;&nbsp;(Current Setting) </label>                                                        
                                <select name='batsz4' id='batsz4' class='combo'>
                                 <%if(yampyyampy.equals("Chain")){%>   
                                    <option value='0'> Select... </option>
                                    <option selected value="CHAIN"> Chain </option>                                               
                                    <option value="SIM"> Simultaneous </option>                                               
                                    <%}else if(yampyyampy.equals("Simultaneous")){
                        %>
                         <option value='0'> Select... </option>
                                    <option value="CHAIN"> Chain </option>                                               
                                    <option selected value="SIM"> Simultaneous </option> 
                        <%}else{
                        %>
                                    <option value='0'> Select... </option>
                                    <option value="CHAIN"> Chain </option>                                               
                                    <option value="SIM"> Simultaneous </option> 
                        <%}%>            
                                </select>
                                
                                <p> <input type="submit" name="sub" value="Set-up" align="center" class="button2"></p>
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
            <p class="credits">Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a> | Modified by <a href="#" title="Adaptor Homepage">4B1C</a> | Powered by <a href="#" title="Content Management System">CCMS</a> | <a href="http://validator.w3.org/check?uri=referer" title="Validate XHTML code">W3C XHTML 1.0</a> | <a href="http://jigsaw.w3.org/css-validator/" title="Validate CSS code">W3C CSS 2.0</a></p>
        </div>      
    </div> 
</body>
</html>
