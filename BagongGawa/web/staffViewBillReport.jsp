
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
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
            <!-- Pagetitle -->        
            
            <%
            Billing b = new Billing();
            String uu = request.getParameter("katsz5");
            int a = Integer.parseInt(request.getParameter("katsz6"));
            
            
            CachedRowSet ss = b.getAllAssIssuedBatchWITHID(a);                     
           ss.next();        
           java.util.Date yey1 = ss.getTimestamp("sdate");         
           java.util.Date yey2 = ss.getTimestamp("edate");       
           
           CachedRowSet tempy3 = b.getAChargesWITHISSUEID(a);            
            double ss2 = ss.getDouble("basecharge");
            String ss3 = ss.getString("ameasure");
              
           double chargetotal = 0.00, chargetotal2 = 0.00;
           
           CachedRowSet hmmh = b.getAllBillsWITHISSUEID(a);
           
           Thesis db = new Thesis();
              int div = db.getVillageInfoDivision();
              Unit ik = new Unit();
              String tet = ik.getDivUnit();
            
           String qwer = b.makeDateToString(yey1)+" to "+b.makeDateToString(yey2);
            %>
            
<%if(uu.equals("Month")){%>
<div class="column1-unit">
                <h1>Billing Report for the Bill Batch of <%=qwer%></h1>
                <h2>Association Bill Batch # <%=a%></h2>
                <hr class="clear-contentunit"/><br>
                     
             
                <p><b>Association Dues Details </b></p>
                <table>
                    <tr><%if(ss3.equals("SQM")){ %>
                        <th>Base Charge Per Square Meter</th>
                        <th>P <%=ss2%> </th>
                        <%}else{%>
                        <th>Base Charge</th>
                        <th>P <%=ss2%></th>
                        <%}%>          
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
                        <td>P <%=tempy3.getDouble("chargeamt")%></td>                        
                        <%chargetotal = chargetotal + tempy3.getDouble("chargeamt");
                        }else{
                            %>
                        <td><%=tempy3.getString("chargename")%> (Per Square Meter)</td>
                        <td>P <%=tempy3.getDouble("chargeamt")%></td> 
                        <%chargetotal = chargetotal + tempy3.getDouble("chargeamt");
                        }%>
                    </tr>
                    <%}%>
                     <tr>
                        <td class='td2'>Total :</td>
                        <td class='td2'>P <%=chargetotal%></td>                        
                    </tr>                    
                </table>
                <%}%>
                <p><b>Community Totals (Paid/Partially Paid Bills)</b></p>
                <table>
                    <tr> 
                           <th>Location</th>
                        <th>Association Dues Total</th>
                       <th>Miscalleneous Charges Total</th>
                         <th>Penalty Charges Total</th>
                       <th>Permits Charges Total</th>
                           <th>Reservation Charges Total</th>
                    </tr>
                    <%     for (int i = 1; i <= div; i++)
                         {
                        Vector<Integer> hmmh2 = b.getAllHousesInBldg(i);
                        double adue = 0.00, miscdue = 0.00, pendue = 0.00, perdue = 0.00, resdue = 0.00;
                        for(int xx=0; xx < hmmh2.size(); xx++){
                           
                            while(hmmh.next()){
                                
                                if(hmmh2.elementAt(xx)!=hmmh.getInt("lotID")){
                               
                                if(!(hmmh.getString("status").equals("unpaid"))){
                                     
                                adue=adue+hmmh.getDouble("assocduessubtotl");
                                perdue=perdue+hmmh.getDouble("permitsubtotl");
                                resdue=resdue+hmmh.getDouble("reservesubtotl");                                
                                
                                CachedRowSet tempy = b.getAllPenaltiesWithLOTID(hmmh.getInt("lotID"));
                                CachedRowSet tempy2 = b.getAllMiscFees();  
                                 while(tempy.next()){
                                    java.util.Date ewan = tempy.getTimestamp("dDate");
                                    if(ewan.compareTo(yey1) > 0 && ewan.compareTo(yey2) < 0){ 
                                        if(tempy.getString("type").equals("Penalty Flat")){
                                           pendue=pendue+tempy.getDouble("feeamt"); 
                                        }
                                     }
                                 }
                                while(tempy2.next()){
                                 java.util.Date ewan = tempy2.getTimestamp("dDate");
                                 if(ewan.compareTo(yey1) > 0 && ewan.compareTo(yey2) < 0){
                                     miscdue=miscdue+tempy2.getDouble("feeamt");
                                 }
                                }                                   
                              }
                                    }
                            }                   
                           
                            hmmh.first();
                        }   %>
                            <tr>
                        <td class='td2'><%=tet%> <%=i%></td>
                        <td class='td2'>P <%=adue%></td>
                        <td class='td2'>P <%=miscdue%></td>
                        <td class='td2'>P <%=pendue%></td>
                        <td class='td2'>P <%=perdue%></td>
                        <td class='td2'>P <%=resdue%></td>
                        
                   </tr>
                          <% 
                            
                     chargetotal2 = chargetotal2 + adue + miscdue + pendue + perdue + resdue;
                    }%>
                   
                  
                   <tr>
                       <td class='td3'><b>Overall Paid Total</b></td>
                        <td class='td3'></td>
                                                 <td class='td3'></td>
                                                  <td class='td3'></td>
                                                   <td class='td3'></td>
                         
                         <td class='td3'><b>P <%=chargetotal2%></b></td>
                   </tr>
                </table>
                 <p><b>Community Totals (Unpaid Bills)</b></p>
                <table>
                    <tr> 
                           <th>Location</th>
                        <th>Association Dues Total</th>
                       <th>Miscalleneous Charges Total</th>
                         <th>Penalty Charges Total</th>
                       <th>Permits Charges Total</th>
                           <th>Reservation Charges Total</th>
                    </tr>
                    <%     chargetotal = 0.00;
                    for (int i = 1; i <= div; i++)
                         {
                        Vector<Integer> hmmh2 = b.getAllHousesInBldg(i);
                        double adue = 0.00, miscdue = 0.00, pendue = 0.00, perdue = 0.00, resdue = 0.00;
                        for(int xx=0; xx < hmmh2.size(); xx++){
                       
                            while(hmmh.next()){
                              
                                if(hmmh2.elementAt(xx)!=hmmh.getInt("lotID")){
                                
                                    if(hmmh.getString("status").equals("unpaid")){
                                        
                                adue=adue+hmmh.getDouble("assocduessubtotl");
                                perdue=perdue+hmmh.getDouble("permitsubtotl");
                                resdue=resdue+hmmh.getDouble("reservesubtotl");                                
                                
                                CachedRowSet tempy = b.getAllPenaltiesWithLOTID(hmmh.getInt("lotID"));
                                CachedRowSet tempy2 = b.getAllMiscFees();  
                                 while(tempy.next()){
                                    java.util.Date ewan = tempy.getTimestamp("dDate");
                                    if(ewan.compareTo(yey1) > 0 && ewan.compareTo(yey2) < 0){ 
                                        if(tempy.getString("type").equals("Penalty Flat")){
                                           pendue=pendue+tempy.getDouble("feeamt"); 
                                        }
                                     }
                                 }
                                while(tempy2.next()){
                                 java.util.Date ewan = tempy2.getTimestamp("dDate");
                                 if(ewan.compareTo(yey1) > 0 && ewan.compareTo(yey2) < 0){
                                     miscdue=miscdue+tempy2.getDouble("feeamt");
                                 }
                                }                                   
                              }
                                    }
                            }                   
                           
                            hmmh.first();
                        }   %>
                            <tr>
                        <td class='td2'><%=tet%> <%=i%></td>
                        <td class='td2'>P <%=adue%></td>
                        <td class='td2'>P <%=miscdue%></td>
                        <td class='td2'>P <%=pendue%></td>
                        <td class='td2'>P <%=perdue%></td>
                        <td class='td2'>P <%=resdue%></td>
                        
                   </tr>
                          <% 
                           
                     chargetotal2 = chargetotal2 + adue + miscdue + pendue + perdue + resdue;
                    }%>
                   
                  
                   <tr>
                       <td class='td3'><b>Overall Unpaid Total</b></td>
                        <td class='td3'></td>
                                                 <td class='td3'></td>
                                                  <td class='td3'></td>
                                                   <td class='td3'></td>
                         
                         <td class='td3'><b>P <%=chargetotal2%></b></td>
                   </tr>
                </table>
                
                <%}else{
               
               CachedRowSet ju = b.getAllAssBillBatch();
               
               
               %>
               
               <h1>Billing Report for the year of <%=uu%></h1>              
                <hr class="clear-contentunit"/><br>
                     
             
                <p><b>Association Dues Details </b></p>
                <table>
                  <%  while(ju.next()){
                  if(b.compareYears(Integer.parseInt(uu), ju.getTimestamp("edate"))==1){
                         %>
                  
                    <tr><%if(ss3.equals("SQM")){ %>
                        <th>Month</th>                        
                    </tr>
                  <tr>
                        <th>Base Charge </th>
                    </tr><tr>
                        <th>Computation</th>
                        
                    </tr>
                </table>
               <%}
                  }}}
                  %>
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