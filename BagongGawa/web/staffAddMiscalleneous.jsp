
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
  <script type="text/javascript" src="./js/ajaxChecker.js"></script> 
  <script type="text/javascript" src="./js/ajaxBill.js"></script> 
  <link rel="icon" type="image/x-icon" href="./img/favicon.ico" />
   <title>Converge - Staff : Billing</title>
  <script type= "text/javascript">
    <!--
  function checkster()
        {       
            var y = document.rbaz.katsz4;
            var z = document.rbaz.miscfee;
                
            if (y.value == '0')
            {
                alert("Select how the miscallenous fee shall be issued!");
                return (false);
            }
            if (z.style.backgroundColor == "red")
            {
                alert("Invalid fee amount input!");
                return (false);
            }
        }
    -->
</script>
</head>

<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body>
<% 
    serviceTemplate t = new  serviceTemplate();
    addFacility af = new addFacility(); 
    FacId fi = new FacId();
    CachedRowSet c = t.getServices();
    int i = af.getTotalBulletin();
    CachedRowSet crset = fi.getBulletinFromAdminLatest();
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
                    <!-- Navigation item -->
                    <ul>
            <li><a href="#">Manage Association</a><!--<![endif]-->
              <!--[if lte IE 6]><table><tr><td><![endif]-->
             <ul>
                  <li><a href="staffResidentAccounts.jsp">Resident Accounts</a></li>
                                     
                </ul>
              <!--[if lte IE 6]></td></tr></table></a><![endif]-->
            </li>
          </ul>
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
        
        <% 
           Billing b = new Billing();
       CachedRowSet br = b.getBillingSetting();
       br.next();
        CachedRowSet ss2 = b.getAllAssIssuedBatch();
        %>
                <!-- Pagetitle -->
                <h1 class="pagetitle">Community Billing Management : Add Miscalleneous Fee</h1>
		<div class="column1-unit">
                    <h1 class="side"><img src="icons/calculator-accept-128x128.png" alt="Image description" title="Image title" /></h1>
                    <p>This is the Add a Miscalleneous Fee function. Miscallaneous fee's may include the community building a new streetlight. You can choose here to put the total cost of the fee for the entire community,
                    and the system automatically divides it. Or you can choose to put in the fee that will be charged per resident.
                    <br><br>
                    <p align="right"><a href="staffBill.jsp">Back to Association Billing Management</a></p>
                    
                    </p>       
                </div>
                <hr class="clear-contentunit"/>
                <div class="contactform">
                 <form name="rbaz" onsubmit="return(checkster())"action="processStaffAddMiscFee.jsp" method="get">
                       <fieldset><legend>Add Miscallenous Fees for Current Billing Period</legend>
                            <p> <label for="vill_name" class="left"> How should this miscallenous fee be divided? </label>                                                        
                                &nbsp; <select name='katsz4' id='katsz4' class='combo'>
                                    <option value='0'> Select... </option>
                                    <option value="PRes"> Per Resident </option>                                               
                            <option value="PCom"> Community Fee (to be divided amongst residents) </option>  </select>  </p>
                                <p><label for="vill_name" class="left"> Miscallenous Fee Name </label>                                                        
                                &nbsp;&nbsp;<input type="text" name="miscname" id="miscname" onkeyup="" class="field" value=""/> </p>
                                <p><label for="vill_name" class="left"> Fee Amount </label>                                                
                                &nbsp;&nbsp;<input type="text" name="miscfee" id="miscfee" onkeyup="data_changedouble(this)" class="field" value=""/> </p>
                                <p><input type="submit" name="sub" value="Save" align="center" class="button2"></p>
                       </fieldset>
                   </form>   
                   <fieldset><legend>View Miscallenous Fees</legend>
                            <p> <label for="vill_name" class="left"> Bill Batch:</label>                                                 
                            &nbsp;&nbsp;<select name='katsz4' onchange="showMiscFees(this.value)" id='katsz4' class='combo'>                                 
                                    <option value='0'> Select.... </option>
                                    <option value='-1'> Current Billing Period </option>
                                    <%while(ss2.next()){
                                    String qwer2 = b.makeDateToString(ss2.getTimestamp("sdate"))+" to "+b.makeDateToString(ss2.getTimestamp("edate"));
                                        %>
                                    <option value='<%=ss2.getInt("id")%>'><%=qwer2%></option>
                                    <%}%>
                                </select>
                                 
                            </p>
                         
                    </fieldset>
                </div>
                <div id ="PKOL2">                    
                </div>
                
            </div>
        </div>
        <!-- C. FOOTER AREA -->      

        <div class="footer">
            <p>Copyright &copy; 2008 4B1C Group | All Rights Reserved</p>
            <p class="credits">Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a> | Modified by <a href="#" title="Adaptor Homepage">4B1C Group</a> | Powered by <a href="#" title="Content Management System">CCMS</a> | <a href="http://validator.w3.org/check?uri=referer" title="Validate XHTML code">W3C XHTML 1.0</a> | <a href="http://jigsaw.w3.org/css-validator/" title="Validate CSS code">W3C CSS 2.0</a></p>
        </div>    
    </div> 
</body>
</html>
