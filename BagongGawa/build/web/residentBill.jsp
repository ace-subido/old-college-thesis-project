
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
  <title>Converge - Resident</title>
  <script type="text/javascript" src="./js/ajaxMensahe.js"></script>
 <script type= "text/javascript">
  <!--
  
  
function ReverseContentDisplay(d) {

if(document.getElementById(d).style.display == "none") {
   document.getElementById(d).style.display = "block"; }
else { document.getElementById(d).style.display = "none"; }
}
  
  
  -->     
  </script>
   
</head>

<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body>
    <%
    
    Thesis db = new Thesis();

       serviceTemplate t = new  serviceTemplate();
            
        CachedRowSet c = t.getServices();
    
    if (session.getAttribute("uname") == null)
        response.sendRedirect("homepage.jsp");
        
Pao jx = new Pao();
    int ResId = (Integer)session.getAttribute("residentId");
    CachedRowSet crset = jx.getResident(ResId);
    crset.next();
    String status = crset.getString("Status");
    CachedRowSet cStatInFam = jx.getStatInFam(ResId);
    cStatInFam.next();
    

    %>
  <!-- Main Page Container -->
  <div class="page-container">

   <!-- For alternative headers START PASTE here -->

    <!-- A. HEADER -->      
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
                       <%if(status.equalsIgnoreCase("enabled")){%>
                        <li><a href="residentDash.jsp">Home</a></li>
                        <%}else{%>
                        <li><a href="residentDashDisabled.jsp">Home</a></li>
                        <%}%>
                    </ul>
          
         
                    <ul>
                        <li><a href="residentMessageBox.jsp">Mailbox</a></li>
                    </ul>
                    <!-- Navigation item -->
                   <ul>  
                        <li><a href="#">My Account</a><!--<![endif]-->
                        <!--[if lte IE 6]><table><tr><td><![endif]-->
                        <ul>
                            
                            <li><a href="resMyAccount.jsp">Account Information</a></li>
                            <%if(cStatInFam.getString("StatInFam").equals("head"))
                        {%>
                           <li><a href="resAddSub.jsp">Add Sub-Account</a></li>  
                           <%}%>
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
        <h1 class="first">Community Services</h1>

        <!-- Navigation with grid style -->
        <dl class="nav3-grid">
<%               
            if(c.size() >0)
            {
            while(c.next())
            {
              if(c.getString("permit").equals("Yes")&&(status.equalsIgnoreCase("enabled")))
              {    
              %> <dt><a href="residentPermits.jsp">Permits</a></dt>
              <% 
              }
             
              if(c.getString("reservation").equals("Yes")&&(status.equalsIgnoreCase("enabled")))
              {    
              %> <dt><a href="residentReserve.jsp">Reservations</a></dt>
              <% 
              }
              %>
          <%
             if(c.getString("socialgroups").equals("Yes")&&(status.equalsIgnoreCase("enabled")))
              {    
              %> <dt><a href="residentSocMain.jsp">Social Groups</a></dt> 
              <% 
              }
              %>
         
          <%
              if(c.getString("vote").equals("Yes")&&(status.equalsIgnoreCase("enabled")))
              {    
              %> <dt><a href="residentPolls.jsp">Polls or Elections</a></dt>
              <% 
              }
              
              if(c.getString("bulletinBoard").equals("Yes")&&(status.equalsIgnoreCase("enabled")))
              {    
              %> <dt><a href="residentBulletinBoard.jsp">Bulletin Board</a></dt>
              <% 
              }
              %>
          
           <%
              if(c.getString("billing").equals("Yes"))
              {    
              %>  <dt><a href="residentBill.jsp">Billing</a></dt>
              <% 
              }
              %>
         <%
              if(c.getString("newsletter").equals("Yes"))
              {    
              %>  <dt><a href="residentNewsletter.jsp">Newsletter</a></dt>
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
       
       int j = br.getInt("cutOffDate");
       
       java.util.Date d1 = new java.util.Date();
       
       Calendar myCalendar = Calendar.getInstance();
       myCalendar.setTime(d1);
       
       java.util.Date yey1 = null;
       java.util.Date yey2 = null;        
              
       int temp = myCalendar.get(Calendar.DAY_OF_MONTH);
       
       if(j > temp){
           yey1 = b.getStartDate(j, "lastmonth");
           yey2 = b2.getEndDate(j, "thismonth");
       }
       else if (j <= temp){
           yey1 = b.getStartDate(j, "thismonth");
           yey2 = b2.getEndDate(j, "nextmonth");           
       }
      
           
       int days = b.getDaysInBetween(d1, yey2);
       String ppp = b.makeDateToString(yey1);
       String lll = b.makeDateToString(yey2);
       
       session.setAttribute("ABPrdStart", yey1);
       session.setAttribute("ABPrdEnd", yey2);
       session.setAttribute("DAYSZZ", days);
      
        %>
        <!-- Pagetitle -->
        
       <h1 class="block">Resident Bills</h1>
	
        
        <hr class="clear-contentunit" />
        <div id="mehmeh" name="mehmeh" class="column1-unit">
            <div class="column1-unit">
                    <h1 class="side"><img src="icons/calculator-accept-128x128.png" alt="Image description" title="Image title" /></h1>
                    <p>Click on the links in order to hide or show the interface(s) for the bills. 
                    <br><br>
               <a href="javascript:ReverseContentDisplay('HMMHMM1')">Association Bills</a><br>
               <br>   
                        <%if(br.getString("water").equals("Yes")){%>
                    <a href="javascript:ReverseContentDisplay('HMMHMM2')">Water Bills Management</a><br><%}
       if(br.getString("elec").equals("Yes")){%>
                    <a href="javascript:ReverseContentDisplay('HMMHMM3')">Electric Bills Management</a> <br>   <%}%>  <br>                  
           </div>
        <hr class="clear-contentunit" />
     <div class="column1-unit"  id="HMMHMM1" style="display:block;">                    
                <div class="column2-unit-left">


                    
                    <h1 class="block">Association Dues</h1><br><p>You can view your bill history, charge history and current fees.<br>
                   <p>
                </div>
                 <div class="column2-unit-right">
                     <h1 class="block">Association Bill Management</h1><br><p>
                         <%if(br.getString("penalty").equals("Enabled")){
                            %>
                    <a href="residentBillPenalty.jsp">View Current Penalties</a><br>
                    <%}if(br.getString("miscalleneous").equals("Enabled")){
                        %>
                    <a href="residentViewMiscalleneous.jsp">View Current Miscalleneous Fees</a><br>
                    <%}%>
                </p>
                        <p> <a href="residentBillHistory.jsp">View Your Bills</a><br>
                            <a href="residentAssocBatches.jsp">View Association Charges</a><br>
                        
                                                    </p>
               </div>
            </div>
     
        
        
      
</div></div>
</div>
    <!-- C. FOOTER AREA -->      

    <div class="footer">
      <p>Copyright &copy; 2006 Your Company | All Rights Reserved</p>
      <p class="credits">Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a> | Modified by <a href="#" title="Adaptor Homepage">Your Name</a> | Powered by <a href="#" title="Content Management System">Your CMS</a> | <a href="http://validator.w3.org/check?uri=referer" title="Validate XHTML code">W3C XHTML 1.0</a> | <a href="http://jigsaw.w3.org/css-validator/" title="Validate CSS code">W3C CSS 2.0</a></p>
    </div>      
  </div> 
  
</body>
</html>



