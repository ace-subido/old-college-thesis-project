 
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
    <title>Converge - Administrator : Create Resident</title>
    <script type= "text/javascript">
    <!--
        function res()
        {
            if (document.login.r[0].checked || document.login.r[1].checked)
                return (false); 
            else
                return (true);	
        }
        
        function checkForm()
        {
            var name = document.login.n;
            var location = document.login.l;
            var type = document.login.t;
            var reservation = document.login.r;
            var capacity = document.login.c;
            var land = document.login.a;
            var resFee = document.login.rf;
            
            if(name.value == "")
            {
                alert("fill in Facility Name");
                return(false);
            }
            else if (location.value == 0)
            {
                alert("fill in Location");
                return(false);
            }
            else if (type.value == 0)
            {
                alert("fill in Facility Type");
                return(false);
            }
            else if (res())  
            {
                alert("fill in Allow Reservation");
                return(false);
            }
            else if (capacity.value == "")
            {
                alert("fill in Capacity");
                return(false);
            }
            else if (land.value == "")
            {
                alert("fill in Land Area");
                return(false);
            }
            else if (resFee.value == "")
            {
                alert("fill in Reservation Fee");
                return(false);
            }
        }
        
        function able()
        {
            if (document.login.r[0].checked)
            {
                document.login.rf.disabled = false;
            }
            if (document.login.r[1].checked)
            {   
                document.login.rf.value = 0;
                document.login.rf.disabled = true;
            }
        }
        
        function checkForm2()
        {
            var name = document.login2.n;
            var location = document.login2.l;
            var type = document.login2.t;
            var reservation = document.login2.r;
            var capacity = document.login2.c;
            var land = document.login2.a;
            var resFee = document.login2.rf;

            if(name.value == "")
            {
                alert("fill in Facility Name");
                return(false);
            }
            else if (location.value == 0)
            {
                alert("fill in Location");
                return(false);
            }
            else if (type.value == 0)
            {
                alert("fill in Facility Type");
                return(false);
            }
            else if (resFee.value == "")
            {
                alert("fill in Reservation Fee");
                return(false);
            }
            else if (capacity.value == "")
            {
                alert("fill in Capacity");
                return(false);
            }
            else if (land.value == "")
            {
                alert("fill in Land Area");
                return(false);
            }
        }
        
        function tit()
        {
            if(document.login2.r.value == "Yes")
                document.login2.rf.disabled = false;
            if(document.login2.r.value == "No")
            {  
                document.login2.rf.value = '0';
                document.login2.rf.disabled = true;
            }
        }
    -->
    </script>
</head>
    
<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->
    
<body>
<%
    if (session.getAttribute("uname") == null)
        response.sendRedirect("homepage.jsp");

    Thesis db = new Thesis();
    ConnectorThesis db2 = new ConnectorThesis();

    FacId tf = new FacId();
    Vector<String> v = new Vector<String>();

    v = db2.getFacilityType();

    int div = db.getVillageInfoDivision();
    String tet = (String) session.getAttribute("divunit");

    int id = tf.getTotalFac();
    System.out.print(id);
    id++;
    System.out.print(id);
    System.out.println(tet);

    serviceTemplate t = new  serviceTemplate();

    CachedRowSet c = t.getServices();

    CachedRowSet crset = db.getResidents(request.getParameter("Username"));
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
                <h1 class="pagetitle">Residents and Accounts</h1>
<%
            if (crset.size() == 0)
            {
%>
                <!-- Content unit - One column -->
                <h1 class="block">Add Resident Account</h1><br>
                <hr class="clear-contentunit" />
                <div class="column1-unit">
                    <a href="assocCreateField.jsp">Add a new Field in this form</a>
                    <div class="contactform">
                        <form name ="login" onSubmit="return(checkForm())" action="processAssocCreateFac.jsp" method="get">                
                            <input type="hidden" value="new" name="formType">
                            <input type="hidden"value="<%=id%>" name="totalFac">
                            <fieldset>
                                <legend>&nbsp;RESIDENT DETAILS&nbsp;</legend>
                                <p>
                                    <label for="vill_name" class="left">Last Name:</label> 
                                    <input type="text" name="ln" id="asso_name" class="field" value="">
                                </p><br />
                                <p>
                                    <label for="vill_name" class="left">First Name:</label> 
                                    <input type="text" name="fn" id="asso_name" class="field" value="">
                                </p><br />
                                <p>
                                    <label for="vill_name" class="left">Account Username:</label> 
                                    <input type="text" name="fn" id="asso_name" class="field" value="">
                                </p><br />
                                <p>
                                    <label for="vill_name" class="left">Account Password:</label> 
                                    <input type="text" name="fn" id="asso_name" class="field" value="">
                                </p><br />
                                <p>
                                    <label for="vill_name" class="left">Address:</label> 
                                    <input type="text" name="fn" id="asso_name" class="field" value="">
                                </p><br />
                                <p>
                                    <label for="vill_name" class="left">Email Address:</label> 
                                    <input type="text" name="fn" id="asso_name" class="field" value="">
                                </p><br />
                                <p>
                                    <label for="vill_name" class="left">Residential Phone No.:</label> 
                                    <input type="text" name="fn" id="asso_name" class="field" value="">
                                </p>
                            </fieldset>
                            <fieldset>
                                <p><input type="submit" name="submit2" id="submit2" class="button" value="Submit" /></p>
                            </fieldset>
                        </form>
                    </div>   
<%
                }
                else
                {
                    while (crset.next())
                    {
%>
                    <!-- Content unit - One column -->
                    <h1 class="block">Edit Resident Account</h1><br>
                    <hr class="clear-contentunit" />
                    <div class="column1-unit">
                        <a href="assocCreateField.jsp">Add a new Field in this form</a>
                        <div class="contactform">
                            <form name="login2" onSubmit="return(checkForm2())" action="processAssocCreateRes.jsp" method="get">
                                <fieldset>
                                    <legend>&nbsp;RESIDENT DETAILS&nbsp;</legend>
                                    <input type="hidden" value="old" name="formType">
                                    <input type="hidden" name="id" value="<%=crset.getInt("FacilityId")%>">
                                    <input type="hidden" name="lok" value="<%=crset.getString("FaciName")%>">
                                    <p>
                                        <label for="n" class="left">Last Name:</label> 
                                        <input type="text" name="lname" id="asso_name" class="field" value="<%=crset.getString("LastName")%>">
                                    </p><br />
                                    <p>
                                        <label for="n" class="left">First Name:</label> 
                                        <input type="text" name="fname" id="asso_name" class="field" value="<%=crset.getString("FirstName")%>">
                                    </p><br />
                                    <p>
                                        <label for="n" class="left">Account Username:</label> 
                                        <input type="text" name="username" id="asso_name" class="field" value="<%=crset.getString("Username")%>">
                                    </p><br />
                                    <p>
                                        <label for="n" class="left">Account Password:</label> 
                                        <input type="text" name="password" id="asso_name" class="field" value="<%=crset.getString("Password")%>">
                                    </p><br />
                                    <p>
                                        <label for="n" class="left">Address:</label> 
                                        <input type="text" name="address" id="asso_name" class="field" value="<%=crset.getString("Address")%>">
                                    </p><br />
                                    <p>
                                        <label for="n" class="left">Email Address:</label> 
                                        <input type="text" name="email" id="asso_name" class="field" value="<%=crset.getString("EmailAdd")%>">
                                    </p><br />
                                    <p>
                                        <label for="n" class="left">Residential Phone No.:</label> 
                                        <input type="text" name="phone" id="asso_name" class="field" value="<%=crset.getInt("HouseNum")%>">
                                    </p>
                                    <p>
                                        <label for="l" class="left"></label>
                                    </p>
                                    <br />
                                </fieldset>
                                <fieldset>
                                    <input type="submit" name="submit" id="submit" class="button" value="Submit" />
                                    <br /><p><label for="vill_name" class="left"></label>
                                    </p>
                                    <br />
                                    
                                    <p>&nbsp;</p>
                                </fieldset>
                            </form>
                        </div> 
<%
                        }
                    }
%>                        
                    <br /><br />
                    <hr class="clear-contentunit" />
                    </div>
                </div>    
            </div>
        </div>
            
        <!-- C. FOOTER AREA -->      
        <div class="footer">
            <p>Copyright &copy; 2006 4B1C | All Rights Reserved</p>
            <p class="credits">Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a> | Modified by <a href="#" title="Adaptor Homepage">4B1C</a> | Powered by <a href="#" title="Content Management System">CCMS</a> | <a href="http://validator.w3.org/check?uri=referer" title="Validate XHTML code">W3C XHTML 1.0</a> | <a href="http://jigsaw.w3.org/css-validator/" title="Validate CSS code">W3C CSS 2.0</a></p>
        </div>      
    </div> 
</body>
</html>