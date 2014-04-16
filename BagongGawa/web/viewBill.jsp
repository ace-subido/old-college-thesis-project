
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
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="./css/layout1_setup.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="./css/layout1_text.css" />
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
          
%>
    <!-- Main Page Container -->
    <div class="page-container">
        <!-- A. HEADER -->      
    <div class="header">
      
        <!-- A.1 HEADER TOP -->
        <div class="header-top">        
            <!-- Sitelogo and sitename -->
            <a class="sitelogo" href=# title="Go to Start page"></a>
            <div class="sitename">
                <h1><a href=# title="Go to Start page">CONVERGE</a></h1>
                <h2>Generic Community Association Portal</h2>
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
    </div>     
 
        <!-- B.1 MAIN CONTENT -->
        <div class="main-content">
            <%
            int a = Integer.parseInt(request.getParameter("num"));
            Billing b = new Billing(); 
            
            CachedRowSet cr = b.getBillWITHBID(a);
            cr.next();
            
            int z = cr.getInt("lotID");
        
            CachedRowSet cr2 = b.getHouseWITHLOTID(z);
            cr2.next();
            
            int lotarea=cr2.getInt("lotarea");
            
            //Association dues
           CachedRowSet ss = b.getAllAssIssuedBatchWITHID(cr.getInt("issueID"));                     
           ss.next();        
           java.util.Date yey1 = ss.getTimestamp("sdate");         
           java.util.Date yey2 = ss.getTimestamp("edate");         
           
           CachedRowSet tempy3 = b.getAChargesWITHISSUEID(cr.getInt("issueID"));            
            double ss2 = ss.getDouble("basecharge");
            String ss3 = ss.getString("ameasure");
           
               
           CachedRowSet tempy = b.getAllPenaltiesWithLOTID(z);
           CachedRowSet tempy2a = b.getBillAllReservationsWITHLOTID(z);   
           CachedRowSet tempy2b = b.getBillAllPermitsWITHLOTID(z);   
           
           String qwer = b.makeDateToString(yey1)+" to "+b.makeDateToString(yey2);
          
           double chargetotal = 0.00;
           
           CachedRowSet hmph= b.getAllHousesOfRes(cr.getInt("residentID"));   
           Integer numhouses = hmph.size();
           CachedRowSet tempy2 = b.getAllMiscFees();    

%>
            <!-- Pagetitle -->            
            <div class="column1-unit">
                <h1>Bill# <%=a%> </h1>
                <h3>Address : <%=cr2.getString("address")%></h3>                
                <%if(cr.getString("status").equals("partial")){%>
                <h3>Payment Status : paritally paid </h3>                
                <%}else{%>
                <h3>Payment Status : <%=cr.getString("status")%></h3>                
                <%}%>
                
                <center><h2>
                    <%if(cr.getString("billType").equals("Assoc")){%>
                    Association Dues Details 
                <%}%>
                <%=cr.getString("residentName")%> for the Billing Period : <br>
               <%=qwer%> </h2></center>             
                <hr class="clear-contentunit"/><br>
                <p><b>Association Charges Details</b></p>
                <table>
                    <tr><%if(ss3.equals("SQM")){ %>
                        <th>Base Charge Per Square Meter</th>
                        <th>P <%=ss2%> * <%=lotarea%> square meters</th>
                        <%}else{%>
                        <th>Base Charge</th>
                        <th>P <%=ss2%></th>
                        <%}%>          
                    </tr>
                    <tr>
                        <td>Base Charge Sub-total :</td>
                        <td>P <%=ss2*lotarea%></td>
                        
                    </tr>
              
    <%if(tempy3.size()>0 && tempy3!=null){
        %>
        
              
                    <tr>
                        <th>Bill Sub-charges</th>
                        <th>Amount</th>                        
                    </tr>
        <%while(tempy3.next()){            %>
        
                    <tr>
                        <% if(tempy3.getString("chargecomptype").equals("FLAT RATE")){%>
                        <td><%=tempy3.getString("chargename")%></td>
                        <td><%=tempy3.getDouble("chargeamt")%></td>                        
                        <%chargetotal = chargetotal + tempy3.getDouble("chargeamt");
                        }else{
                            %>
                        <td><%=tempy3.getString("chargename")%> (Per Square Meter)</td>
                        <td><%=tempy3.getDouble("chargeamt")%> * <%=lotarea%> square meters</td> 
                        <%chargetotal = chargetotal + (tempy3.getDouble("chargeamt")*lotarea);
                        }%>
                    </tr>
                    <%}%>
                     <tr>
                        <td class='td2'>Total :</td>
                        <td class='td2'>P <%=chargetotal%></td>                        
                    </tr>                    
                </table>
              
                
                
                
                 <%}if(tempy.size()>0 && tempy!=null){
        %>
                 <p><b>Penalty Details</b></p>
                 <table>
                    <tr>
                        <th>Penalty</th>
                        <th>Offender</th>
                        <th>Date</th> 
                        <th>Amount</th>                        
                    </tr>
                    <%  
                     while(tempy.next()){
                    java.util.Date ewan = tempy.getTimestamp("dDate");
                   if(ewan.compareTo(yey1) > 0 && ewan.compareTo(yey2) < 0){ 
                      if(tempy.getString("type").equals("Penalty Flat")){
                          %>
                    <tr>
                        <td><%=tempy.getString("dueName")%></td>
                        <td><%=tempy.getString("residentName")%></td>  
                        <td><%=b.makeDateToString(tempy.getTimestamp("dDate"))%></td>
                        <td>P <%=tempy.getDouble("feeamt")%></td>                        
                    </tr>    
                          <%}   }                
                   }%>
                </table>
                <%}%>
                
                   <%
           if(tempy2.size()>0 && tempy2!=null){
        %>
        
            
                <p><b>Miscallenous Fees Details</b></p>
                 <table>
                    <tr>
                        <th>Fee Name</th>
                        <th>Amount</th>                        
                    </tr>
                    
                    <% while(tempy2.next()){
                   java.util.Date ewan = tempy2.getTimestamp("dDate");
                   if(ewan.compareTo(yey1) > 0 && ewan.compareTo(yey2) < 0){             %>
                    <tr>
                        <td><%=tempy2.getString("dueName")%></td>
                        <td>P <%=tempy2.getDouble("feeamt")/numhouses.doubleValue()%></td>                        
                    </tr>
                    <%}
                    
                    }%>
              
<tr>
                        <td class='td2'>Penalties and Miscallenous Dues Total</td>
                        <td class='td2'>P <%=b.roundTwoDecimals(cr.getDouble("penaltymiscsubtotl"))%></td>
  </table> 
               <%  }%>
                
  <%if(tempy2a.size()>0 && tempy2a!=null){
        %>
                 <p><b>Reservation Transactions</b></p>
                 <table>
                    <tr>
                        <th>Details</th>
                        <th>Requested by</th>
                        <th>Transaction Date</th> 
                        <th>Amount</th>                        
                    </tr>
                    <% 
                    while(tempy2a.next()){
                    java.util.Date ewan2 = tempy2a.getTimestamp("reserveDate");
                   if(ewan2.compareTo(yey1) > 0 && ewan2.compareTo(yey2) < 0){ 
                      
                          %>
                    <tr>
                        <td><%=tempy2a.getString("reserveName")%></td>
                        <td><%=tempy2a.getString("residentName")%></td>  
                        <td><%=b.makeDateToString(tempy2a.getTimestamp("reserveDate"))%></td>
                        <td>P <%=tempy2a.getDouble("reserveFee")%></td>                        
                    </tr>    
                          <%     }             
                   }%>
 <tr>
                        <td class='td2'>Total</td>
                     <td class='td2'></td>
                       <td class='td2'></td>
                        <td class='td2'>P <%=cr.getDouble("reservesubtotl")%></td>                       
                    </tr>                
</table>
                <%}%>
                
 <%if(tempy2b.size()>0 && tempy2b!=null){
        %>
                 <p><b>Permit Transactions</b></p>
                 <table>
                    <tr>
                        <th>Details</th>
                        <th>Requested by</th>
                        <th>Transaction Date</th> 
                        <th>Amount</th>                        
                    </tr>
                    <%  
                      while(tempy2b.next()){
                    java.util.Date ewan2b = tempy2b.getTimestamp("permitDate");
                   if(ewan2b.compareTo(yey1) > 0 && ewan2b.compareTo(yey2) < 0){ 
                      
                          %>
                    <tr>
                        <td><%=tempy2b.getString("permitName")%></td>
                        <td><%=tempy2b.getString("residentName")%></td>  
                        <td><%=b.makeDateToString(tempy2b.getTimestamp("permitDate"))%></td>
                        <td>P <%=tempy2b.getDouble("permitfee")%></td>                        
                    </tr>    
                          <%}   }         %>
                          <tr>
                        <td class='td2'>Total</td>
                     <td class='td2'></td>
                       <td class='td2'></td>
                        <td class='td2'>P <%=cr.getDouble("permitsubtotl")%></td>                       
                    </tr>             
                         </table>    
                        <%}%>
             
             <p><b>Total Amount of Bill &nbsp;&nbsp;&nbsp;&nbsp; : </b>P <%=b.roundTwoDecimals(cr.getDouble("billTotal"))%><br>
           <b>Remaining Balance  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  : </b>P <%=b.roundTwoDecimals(cr.getDouble("balance"))%><br>
            <b>Amount Currently Paid    : </b>P <%=b.roundTwoDecimals(cr.getDouble("billTotal")-cr.getDouble("balance"))%></p>
                <hr class="clear-contentunit"/><br>
                 <input type="button" class="button" value="Print" onClick="window.print()"></input>
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