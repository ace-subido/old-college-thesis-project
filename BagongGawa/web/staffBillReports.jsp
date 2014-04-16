
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
  <script type="text/javascript" src="./js/ajaxBill.js"></script>  
  <link rel="icon" type="image/x-icon" href="./img/favicon.ico"/>
   <title>Converge - Staff</title>
    <script type= "text/javascript">
  <!--
  
  
function showReportA(d) {

     if(d=="Month"){
            if(document.getElementById("tago1").style.display == "none") {
                document.getElementById("tago1").style.display = "block"; }
            
            document.getElementById("tago2").style.display = "none"; 
     }
     if(d=="Year"){
            if(document.getElementById("tago2").style.display == "none") {
                document.getElementById("tago2").style.display = "block"; }
            
            document.getElementById("tago1").style.display = "none"; 
     }

}


function showReportB(d) {

     if(d=="Month"){
            if(document.getElementById("tago3").style.display == "none") {
                document.getElementById("tago3").style.display = "block"; }
            
            document.getElementById("tago4").style.display = "none"; 
     }
     if(d=="Year"){
            if(document.getElementById("tago4").style.display == "none") {
                document.getElementById("tago4").style.display = "block"; }
            
            document.getElementById("tago3").style.display = "none"; 
     }

}

function checkster() {

            var w = document.rsaz.bnum;
            var y = document.rsaz.pamt;
            
            var x = document.rsaz.fs5;
            var z = document.rsaz.daya;
            
            var hmm = z.value - y.value;
            
            if(hmm < 0){
                  alert("amount too large");
                    return false;
            }
           
           if(y.style.backgroundColor == "red"){
            alert("wrong number input");
            return false;
           }      

           if(w.value == ""){
            alert("please select a bill to pay");
            return false;
           }                 
           
           if(y.value == ""){
            alert("please input an amount");
            return false;
           }                 
           if(x.value == ""){
            alert("please select the payment detail");
            return false;
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
   // int i = af.getTotalBulletin();
      Thesis db = new Thesis();
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
     
     CachedRowSet ss3 = b.getAllWatIssuedBatch();
    
    
        %>
                <!-- Pagetitle -->
                <h1 class="pagetitle">Community Billing Management : Bill Reporting</h1>
		<div class="column1-unit">
                    <h1 class="side"><img src="icons/calculator-accept-128x128.png" alt="Image description" title="Image title" /></h1>
                    <p>This is the billing report module. You can generate bill reports by selecting which type of billing report first. You can then select from any year/batch of bills in which you can the report for the community
                    and its parts.</p>
                    
               
                    <p align="right"><a href="staffBill.jsp">Back to Billing Management</a></p>   
                    
                         
                </div>
            <div class="column1-unit">        
                 <div class="contactform">
                 <form name="rbat" target="_blank" action="staffViewBillReport.jsp" method="get">
                       <fieldset><legend>Generate Bill Report for Association Dues</legend>
                            <p> <label for="vill_name" class="left"> Select Type of Report </label>                                                        
                                &nbsp; <select name='katsz5' onchange="showReportA(this.value)" id='katsz5' class='combo'>
                                    <option value='0'> Select... </option>
                                    <option value="Month"> Monthly </option>                                               
                                    <option value="Year"> Annual </option>  </select>  </p>
                            <p>
                                <div id="tago1" style="display:none;">     
                                <p> <label for="vill_name" class="left"> Select Bill Batch </label>                                                        
                                &nbsp; <select name='katsz6' id='katsz6' class='combo'>
                                    <option value='0'> Select... </option>
                                       <%while(ss2.next()){
                                    String qwer2 = b.makeDateToString(ss2.getTimestamp("sdate"))+" to "+b.makeDateToString(ss2.getTimestamp("edate"));
                                        %>
                                    <option value='<%=ss2.getInt("id")%>'><%=qwer2%></option>
                                    <%}%>                                             
                                     </select>  </p>
                                <p> 
                                </div> 
                                
                                <div id="tago2" style="display:none;">     
                                <p> <label for="vill_name" class="left"> Select Year </label>                                                        
                                &nbsp;<select name='katsz7' id='katsz7' class='combo'>
                                    <option value='0'> Select... </option>
                                                                       
                                    <option value='2008'> 2008 </option>  
                                    </select>  </p>
                                <p></div>
                                
                          
                              
                            <p><input type="submit" name="sub" value="View Report" align="center" class="button2"></p>
                       </fieldset>
                   </form>   
                   
                   
                   
                        <%if(br.getString("water").equals("Yes")){%>
                   <form name="rbaz2" target="_blank" action="staffViewBillReportW.jsp" method="get">
                       <fieldset><legend>Generate Bill Report for Water Bills</legend>
                            <p> <label for="vill_name" class="left"> Select Type of Report </label>                                                        
                                &nbsp; <select name='katsz5' onchange="showReportB(this.value)" id='katsz5' class='combo'>
                                    <option value='0'> Select... </option>
                                    <option value="Month"> Monthly </option>                                               
                                    <option value="Year"> Annual </option>  </select>  </p>
                            <p>
                                <div id="tago3" style="display:none;">     
                                <p> <label for="vill_name" class="left"> Select Bill Batch </label>                                                        
                                &nbsp; <select name='katsz5' id='katsz5' class='combo'>
                                    <option value='0'> Select... </option>
                                       <%while(ss3.next()){
                                    String qwer3 = b.makeDateToString(ss3.getTimestamp("sdate"))+" to "+b.makeDateToString(ss3.getTimestamp("edate"));
                                        %>
                                    <option value='<%=ss3.getInt("id")%>'><%=qwer3%></option>
                                    <%}%>        </select>  </p>
                                <p> 
                                </div> 
                                
                                <div id="tago4" style="display:none;">     
                                <p> <label for="vill_name" class="left"> Select Year </label>                                                        
                                &nbsp;<select name='katsz5' id='katsz5' class='combo'>
                                    <option value='0'> Select... </option>
                                    <option value="Month"> Monthly </option>                                               
                                    <option value="Year"> Annual </option>  
                                    </select>  </p>
                                <p></div>
                          
                              
                            <p><input type="submit" name="sub" value="View Report" align="center" class="button2"></p>
                       </fieldset>
                   </form>   
                   
                   <%
                       } if(br.getString("elec").equals("Yes")){%>
                   
                   <form name="rbaz3" target="_blank" action="staffViewBillReportE.jsp" method="get">
                       <fieldset><legend>Generate Bill Report for Electric Bills</legend>
                            <p> <label for="vill_name" class="left"> Select Type of Report </label>                                                        
                                &nbsp; <select name='katsz5' id='katsz5' class='combo'>
                                    <option value='0'> Select... </option>
                                    <option value="Month"> Monthly </option>                                               
                                    <option value="Year"> Annual </option>  </select>  </p>
                            <p>
                                <div id="tago5" style="display:none;">     
                                <p> <label for="vill_name" class="left"> Select Bill Batch </label>                                                        
                                &nbsp; <select name='katsz5' id='katsz5' class='combo'>
                                    <option value='0'> Select... </option>
                                    <option value="Month"> Monthly </option>                                               
                                    <option value="Year"> Annual </option>  </select>  </p>
                                <p> 
                                </div> 
                                
                                <div id="tago6" style="display:none;">     
                                <p> <label for="vill_name" class="left"> Select Year </label>                                                        
                                &nbsp;<select name='katsz5' id='katsz5' class='combo'>
                                    <option value='0'> Select... </option>
                                    <option value="Month"> Monthly </option>                                               
                                    <option value="Year"> Annual </option>  
                                    </select>  </p>
                                <p></div>
                        
                              
                            <p><input type="submit" name="sub" value="View Report" align="center" class="button2"></p>
                       </fieldset>
                   </form>
                   <%}%>
                   
               </div>
                
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

