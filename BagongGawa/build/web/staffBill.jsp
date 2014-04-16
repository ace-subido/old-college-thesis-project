
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
  <script type= "text/javascript">
  <!--
  
  
function ReverseContentDisplay(d) {

if(document.getElementById(d).style.display == "none") {
   document.getElementById(d).style.display = "block"; }
else { document.getElementById(d).style.display = "none"; }
}
  
  
  -->     
  </script>
  <link rel="icon" type="image/x-icon" href="./img/favicon.ico" />
   <title>Converge - Staff</title>
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
       Billing b2 = new Billing();
       CachedRowSet br = b.getBillingSetting();
       br.next();
       
       int days2=0, days3=0;
       String lll2="", ppp2="", ggg2="";
       String lll3="", ppp3="", ggg3="";
       
       int j = br.getInt("cutOffDate");
       
       java.util.Date d1 = new java.util.Date();
       d1 = b.reformatThisDate(d1);
       
       String today = b.makeDateToString(d1);
       Calendar myCalendar = Calendar.getInstance();
       myCalendar.setTime(d1);
       
       java.util.Date yey1 = null;
       java.util.Date yey2 = null;      
       java.util.Date yey3 = null;              
              
       int temp = myCalendar.get(Calendar.DAY_OF_MONTH);       
       if(j > temp){
           yey1 = b.getStartDate(j, "lastmonth");
           yey2 = b2.getEndDate(j, "thismonth");
       }
       else if (j <= temp){
           yey1 = b.getStartDate(j, "thismonth");
           yey2 = b2.getEndDate(j, "nextmonth");           
       }
         String ggg ="";
         
       //auto generation of bills
             
       int days = b.getDaysInBetween(d1, yey2);
       
       if(j == temp){
          yey3 = b.getStartDate(j, "lastmonth");
          session.setAttribute("ABPrdEq", yey3);
          days=0;
          CachedRowSet crpo = b.getAllAssBillBatch();
          int tester = 0;
          ggg = b.makeDateToString(yey3);  
          while(crpo.next()&&crpo!=null){
            if(yey1.compareTo(crpo.getTimestamp("edate"))==0){
                tester =1;
            }
          }
          
          if(tester==0){ 
            
            b.issueAssocBill(yey3, yey1, br.getDouble("assocdue"), br.getString("aduemeasureunit"));
            
            CachedRowSet hmm = b.getAssocBDowns();
            CachedRowSet gmm = b.getAssocIssueBatchWITHEDATE(yey1);
            gmm.next();
            int lollol = gmm.getInt("id");
            
            if(hmm!=null){
            while(hmm.next()){ 
                                               
               b.recordAssocBillCharges(lollol, hmm.getString("subtotalName"), hmm.getDouble("subtotalamount"), hmm.getString("subtotaltype"));                            
                }
            }
          }
       }      
       
       String ppp = b.makeDateToString(yey1);
       String lll = b.makeDateToString(yey2);
       
       
       session.setAttribute("ABPrdStart", yey1);
       session.setAttribute("ABPrdEnd", yey2);       
       session.setAttribute("DAYSZZ", days);
       
       if(br.getString("water").equals("Yes")){
           int j2 = br.getInt("wcutdate");
       
             java.util.Date d2 = new java.util.Date();
              d2 = b.reformatThisDate(d2);
              
            Calendar myCalendar2 = Calendar.getInstance();
            myCalendar2.setTime(d2);
       
            java.util.Date sey1 = null;
            java.util.Date sey2 = null;      
            java.util.Date sey3 = null;              
              
            int temp2 = myCalendar.get(Calendar.DAY_OF_MONTH);       
            if(j2 > temp2){
                sey1 = b.getStartDate(j2, "lastmonth");
                sey2 = b2.getEndDate(j2, "thismonth");
            }
            else if (j2 <= temp2){
                sey1 = b.getStartDate(j2, "thismonth");
                sey2 = b2.getEndDate(j2, "nextmonth");           
            }
               ggg2 ="";
                    
           //auto generation of bills
             
            days2 = b.getDaysInBetween(d2, sey2);
       
           if(j2 == temp2){
              sey3 = b.getStartDate(j2, "lastmonth");
                session.setAttribute("WBPrdEq", sey3);
                days2=0;
                CachedRowSet crpo2 = b.getAllWatBillBatch();
                int tester2 = 0;
                ggg2 = b.makeDateToString(sey3);  
                while(crpo2.next()&&crpo2!=null){
                    if(sey1.compareTo(crpo2.getTimestamp("edate"))==0){
                        tester2 =1;
                    }
                }
          
                if(tester2==0){ 
                    
                    b.issueWaterBill(sey3, sey1, br.getDouble("waterpercube"));
                    
                    CachedRowSet hmm2 = b.getWaterCharges();
                    CachedRowSet gmm2 = b.getWaterIssueBatchWITHEDATE(sey1);
                    gmm2.next();
                    int lollol2 = gmm2.getInt("id");
            
            
                    if(hmm2!=null){
                    while(hmm2.next()){ 
                    
                        b.recordWaterBillCharges(lollol2, hmm2.getString("wname"), hmm2.getDouble("wfee"), hmm2.getString("wfeecomptype"));                            
                        }
                    }
                }
            }      
       
               ppp2 = b.makeDateToString(sey1);
               lll2 = b.makeDateToString(sey2);
       
       
               session.setAttribute("WBPrdStart", sey1);
               session.setAttribute("WBPrdEnd", sey2);       
               session.setAttribute("DAYSZZ2", days2);
       
       }
       
       %>
                <!-- Pagetitle -->
                <h1 class="pagetitle">Community Billing Management</h1>
		<div class="column1-unit">
                    <h1 class="side"><img src="icons/calculator-accept-128x128.png" alt="Image description" title="Image title" /></h1>
                    <p><b>Date Today : <%=today%></b><br><br>
                   
                     <a href="javascript:ReverseContentDisplay('HMMHMM1')">Association Bills Management</a><br>

                    
                        <%if(br.getString("water").equals("Yes")){%>
                    <a href="javascript:ReverseContentDisplay('HMMHMM2')">Water Bills Management</a><br><%}
       if(br.getString("elec").equals("Yes")){%>
                    <a href="javascript:ReverseContentDisplay('HMMHMM3')">Electric Bills Management</a> <br>   <%}%>
                     <br>
                     
                         <a href="staffBillReports.jsp">Generate Bill Report</a><br>   
                    
                    </p>       
                </div>
                <hr class="clear-contentunit"/>
               
                <div class="column1-unit"  id="HMMHMM1" style="display:block;">                    
                <div class="column2-unit-left">


                    
                    <h1 class="block">Association Dues</h1><br>
                    <p>Current Billing Period : <br>
                        <%if(days==0){%>
                       <br> Today is the cut-off for the billing period : <br><%=ggg%> <br> to <br><%=ppp%><br>
                    <br>Next Billing Period : <br><%=ppp%><br> to <br> <%=lll%></p>
                    <%}else{
           %>
                   <p> <%=ppp%> <br> to <br><%=lll%><br><br>
                    There are <%=days%> days before the next billing period!</p>
           <%}%>         
                </div>
                 <div class="column2-unit-right">
                     <h1 class="block">Association Bill Management</h1><br><p>This is the Association Billing Module. You can generate bill batches here and also clear residents<br><br>
                         <%if(br.getString("penalty").equals("Enabled")){
                            %>
                    <a href="staffBillPenalty.jsp">Add/Remove a Penalty Fee to a Resident</a><br>
                    <%}if(br.getString("miscalleneous").equals("Enabled")){
                        %>
                    <a href="staffAddMiscalleneous.jsp">Add Miscalleneous Fee</a><br>
                    <%}%>
                        <p> <a href="staffGenAssocBill.jsp">Bill Batch Management</a><br>
                        <a href="staffBillClearA.jsp">Resident Bill Clearance</a><br>                               
                                                    </p>
               </div>
            </div>
            
            
            
            
            <div class="column1-unit"  id="HMMHMM2" style="display:block;">
                <div class="column2-unit-left">
                    
                      <%if(br.getString("water").equals("Yes")){%>
                    <h1 class="block">Water Billing</h1><br><p>Current Billing Period : <br>
                   <%if(days2==0){%>
                       <br> Today is the cut-off for the billing period : <br><%=ggg2%> <br> to <br><%=ppp2%><br>
                    <br>Next Billing Period : <%=ppp2%><br> to <br> <%=lll2%></p>
                    <%}else{
           %>
                   <p> <%=ppp2%> <br> to <br><%=lll2%><br><br>
                    There are <%=days2%> days before the next billing period!</p>
           <%}%>  </div>       
           <div class="column2-unit-right">
                        <h1 class="block">Water Bill Management </h1>
                        <p><br> <a href="staffGenWaterBill.jsp">Water Bill Batch Management</a><br>
                        <a href="staffBillInputW.jsp">Input Meter Readings</a><br>                               
                        <a href="staffBillClearW.jsp">Resident Bill Clearance</a><br>                               
                       
                 </div>
                    <%}%>
                
                 
               
            </div>
            
            
            <div class="column1-unit"  id="HMMHMM3" style="display:block;">
                <div class="column2-unit-left">
       <%if(br.getString("elec").equals("Yes")){%>
                    <h2>Electricity Billing</h2>
                    <p>Current Billing Period : <br>
                    There are days before the next billing period!</p>
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

