<%-- 
    Document   : getFacReserves
    Created on : Jul 19, 2008, 1:25:02 AM
    Author     : ace-dlsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxSocialGroup.js"></script>
<script type="text/javascript" src="./js/ajaxSearch.js"></script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <script type="text/javascript" src="./js/ajaxSocialGroup.js"></script>
        <title>Loading...</title>
    </head>
    <body>
        <center><p>Generating.....<br><br><img src="img/ajax-loader.gif"/></p></center>
        <%
        Billing b = new Billing();
       int a = Integer.parseInt(request.getParameter("katsz4"));
       
        CachedRowSet br = b.getBillingSetting();
        br.next();
       
        CachedRowSet yu = b.getAllFamilyHeads();
       //int ff = b.getAllHouseIDWITHResID();
        CachedRowSet ss = b.getAllAssIssuedBatchWITHID(a);
        
        ss.next();
        java.util.Date yey1 = ss.getTimestamp("sdate");         
        java.util.Date yey2 = ss.getTimestamp("edate");         
        java.util.Date yey3 = b.makeDueDate(br.getInt("delDate"), yey2);
          while(yu.next()){
              
              CachedRowSet hmph= b.getAllHousesOfRes(yu.getInt("ResId"));   
              CachedRowSet tempy2 = b.getAllMiscFees();    
             
                           
              double x = 0.00, x2 = 0.00, x3=0.00, x4=0.00, ik = 0.00;
              
              //gets misc fees
              if(tempy2.size()>0){
                   while(tempy2.next()){
                   java.util.Date ewan = tempy2.getTimestamp("dDate");
                   if(ewan.compareTo(yey1) > 0 && ewan.compareTo(yey2) < 0){ 
                    ik = ik+tempy2.getDouble("feeamt");
                    }
                   }
                   Integer whoa = hmph.size();
                   ik = ik/whoa.doubleValue();
              }                 
                                         
              Integer ssss = hmph.size();
              double ss2 = ss.getDouble("basecharge");
              String ss3 = ss.getString("ameasure");
              
              while(hmph.next()){
               
               CachedRowSet tempy = b.getAllPenaltiesWithLOTID(hmph.getInt("lid"));
               CachedRowSet tempy2a = b.getBillAllReservationsWITHLOTID(hmph.getInt("lid"));   
               CachedRowSet tempy2b = b.getBillAllPermitsWITHLOTID(hmph.getInt("lid"));   
               
              CachedRowSet tempy3 = b.getAChargesWITHISSUEID(a);    
               Integer aaa = hmph.getInt("lotarea");
               
               double zk = 0.00;
               
               if(ss3.equals("SQM")){
                   zk = aaa.doubleValue()*ss2;
               }
               else{
                   zk = ss2*ssss.doubleValue();;
               }
              
               //collect penalties subtotal               
               double ahem = 0.00;
               if(tempy.size()>0){
                while(tempy.next()){
                   java.util.Date ewan = tempy.getTimestamp("dDate");
                   if(ewan.compareTo(yey1) > 0 && ewan.compareTo(yey2) < 0){ 
                      if(tempy.getString("type").equals("Penalty Per")){
                          ahem = ahem+tempy.getDouble("feeamt");
                      }
                    x = x+tempy.getDouble("feeamt");
                   }
                }
               }
               
               //collect permits subtotal
               if(tempy2b.size()>0){
                while(tempy2b.next()){
                   java.util.Date ewan = tempy2b.getTimestamp("permitDate");
                   if(ewan.compareTo(yey1) > 0 && ewan.compareTo(yey2) < 0){ 
                    x2 = x2+tempy2b.getDouble("permitfee");
                   }
                }
               }
               
               //collect reservations subtotal
               if(tempy2a.size()>0){
                while(tempy2a.next()){
                   java.util.Date ewan = tempy2a.getTimestamp("reserveDate");
                   if(ewan.compareTo(yey1) > 0 && ewan.compareTo(yey2) < 0){ 
                    x3 = x3+tempy2a.getDouble("reserveFee");
                   }
                }
               }
              
              //collect assoc charges
             if(tempy3.size()>0 && tempy3!=null){
              while(tempy3.next()){
                  if(tempy3.getString("chargecomptype").equals("FLAT RATE")){
                     x4 = x4+tempy3.getDouble("chargeamt");
                  }
                  else{                     
                     x4 = x4+(tempy3.getDouble("chargeamt")*aaa.doubleValue());
                  }
              }
                zk = zk+x4;               
              }          
              
               
              double total=zk+ik+x;  
            if(ahem!=0.00){
                ahem = ahem/100.00;
                total = ahem*total;
            }                                     
              
              String mumu = yu.getString("FirstName")+" "+yu.getString("LastName");
              int lotid = hmph.getInt("lid");
              b.initializeAssocBills(yu.getInt("ResId"), total, mumu, x+ik, x3, x2, zk, yey3, lotid, a);
              int hihi = b.getBillIDWITHRESLOTISSUEID(lotid, yu.getInt("ResId"), a);
              b.updateBillBalanceWITHBILLID(hihi, total);
              }
        }
        
        b.updateIssuedBatch(a);
                %>
            <script type= "text/javascript">
			<!--
				
				alert("Association Bills issued!");
				location = "staffGenAssocBill.jsp";
			-->
			</script>
            <%
%>
</body>
</html>