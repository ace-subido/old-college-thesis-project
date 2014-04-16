
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
  <link rel="icon" type="image/x-icon" href="./img/favicon.ico" />
   <title>Converge - Staff</title>
   <script type= "text/javascript">
  <!--
  
  
function Clearer(d, h) {

            var y = document.rsaz.bnum;
            var x = document.rsaz.daya;
            
            x.value = h;
            x.style.backgroundColor = "gray";
                
            y.value = d;
            y.style.backgroundColor = "gray";

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
                    <ul>  
                        <li><a href="staffMyAccount.jsp">My Account</a><!--<![endif]-->
                    </ul>    
                    <ul>
                        <li><a href="#">Manage Association</a><!--<![endif]-->
                        <!--[if lte IE 6]><table><tr><td><![endif]-->
                        <ul>
                            <li><a href="staffResidentAccounts.jsp?criteria=0&search=All">Resident Accounts</a></li>
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
                ResidentObject ro = (ResidentObject)session.getAttribute("ClearSelectedWResident");

                java.util.Date sey1 = (java.util.Date)session.getAttribute("WBPrdStart");         
                java.util.Date sey2 = (java.util.Date)session.getAttribute("WBPrdEnd");

                String ppp = b.makeDateToString(sey1);
                String lll = b.makeDateToString(sey2);
                
                int lol = 0;
        double mom = 0.00;
%>
                <!-- Pagetitle -->
                <h1 class="pagetitle">Community Billing Management : Water Bill Clearance</h1>
		<div class="column1-unit">
                    <h1 class="side"><img src="icons/calculator-accept-128x128.png" alt="Image description" title="Image title" /></h1>
                    <p>This is where you add penalty fees to a resident of your choosing. If that resident isn't a family head then his penalties will be added to the house's main bill.
                    You must first search the resident you want to add a penalty with and then select a penalty, or remove some current penalties he has for the current billing period.
                    <p align="right"><a href="staffBill.jsp">Back to Water Billing Management</a></p>   
                    </p>       
                </div>
                <div class="column2-unit-left">
                    <hr class="clear-contentunit"/>
                    <h2>Search for Resident</h2>
                    <p>You can search for a resident by using his first or last name.</p>           
                    <br>          
                    <p><input type="text" id="text2" name="text2" onkeyup="getResidentWClear(this.value)"> &nbsp;<input type="button" value="Search Resident" onclick='displayWClearResident()'></p>
                    <p>Results:</p>
                    <br><div id="rodList2" name="rodList2"></div>
                </div>
                <div class="column2-unit-right" id="list2"></div>
                <hr class="clear-contentunit"/><br>
                <div class="column1-unit">
<%
                    if(ro!=null)
                    {
                        CachedRowSet cr = b.getAllUnPaidBillsOFRESID2(ro.residentid); 
            
            if(cr.size()>0){
                
            %>          
            <center><p><h2>Unpaid Bills of <%=ro.fname%> <%=ro.lastname%></h2></p></center>
            <center><table>
                                <tr>
                                        <th width="15">Bill#</th>
                                        <th width="120">Billing Period</th> 
                                        <th width="120">Payment Due Date</th>
                                        <th width="140">House Address</th>
                                        <th width="70">Total Dues</th>                                       
                                        <th width="70"></th>           
                                 
                                </tr>
                                <%while(cr.next()){
                                  
                                    CachedRowSet ss = b.getAllAssIssuedBatchWITHID(cr.getInt("issueID"));
                                    CachedRowSet tt = b.getHouseWITHLOTID(cr.getInt("lotID"));
                                    tt.next();
                                    ss.next();
                                    mom = cr.getDouble("balance");
                                       %>
                                <tr>
                                    <td class="td2"><a href="viewBill2.jsp?num=<%=cr.getInt("bid")%>" target="_blank"><%=cr.getInt("bid")%></a></td>
                                    <%
                                    String lili = b.makeDateToString(ss.getTimestamp("sdate"));
                                    String mimi = b.makeDateToString(ss.getTimestamp("edate"));
                                    String uhm = b.makeDateToString(cr.getTimestamp("billNotice"));
                                    %>
                                    <td class="td2"><%=lili%> - <%=mimi%></td>
                                    <td class="td2"><%=uhm%></td>
                                    <td class="td2"><%=tt.getString("address")%></td>
                                    <td class="td2">P <%=b.roundTwoDecimals(cr.getDouble("billtotal"))%></td>                                    
                                    <%if(cr.getString("status").equals("unpaid")){%>                                    
                                    <td class="td2">    <a href="javascript:Clearer('<%=cr.getInt("bid")%>', <%=mom%>)">Clear Bill</a></td>
                                <%}else{
                                                                             lol = 1;
                                        %>
                                    <td class="td2">    <a href="javascript:Clearer('<%=cr.getInt("bid")%>', <%=mom%>)">Clear Balance</a></td>
                                <%}%>
                                
                                </tr>
                                <%}
                                }
                                %>
                               
                                </table></center>
                                
                                <hr class="clear-contentunit"/>
                 <div class="contactform">
                    <form name="rsaz" onsubmit="return(checkster())"action="processStaffBillClearWater.jsp" method="get">
                       <fieldset><legend>PAYMENT : WATER BILL</legend>
                                 <p><label for="vill_name" class="left"> Bill Number </label>                                                        
                                &nbsp;&nbsp;<input type="text" name="bnum" id="bnum" onkeydown="return false" class="field" value=""/> </p>
                                                       <input type="hidden" name="daya2" id="daya2" value="<%=lol%>"/>
                            <p>
                            <label for="vill_name" class="left"> Payment Type </label>                                                        
                                &nbsp; <select name='fs4' id='fs4' class='combo'>
                                    
                                    <option value="CASH"> Cash </option>                                               
                            <option value="CHECK"> Check </option>  </select>  </p>
                                                      
                       
                            <p><label for="vill_name" class="left"> Remaining Balance </label>                                                
                                &nbsp;&nbsp;<input type="text" name="daya" id="daya" onkeydown="return false" class="field" value=""/> </p>            
                           
                                  
                            
                                <p><label for="vill_name" class="left"> Paid Amount </label>                                                
                                &nbsp;&nbsp;<input type="text" name="pamt" id="pamt" onkeyup="data_changedouble(this)" class="field" value=""/> </p>
                           
                                <p><input type="submit" name="sub" value="Clear Bill" align="center" class="button2"></p>
                           
                       </fieldset>
                       
                     </form>
                 
                     
                   </div>
<%
                        }
                   
%>        
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