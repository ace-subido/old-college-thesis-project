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
        
       CachedRowSet ss = b.getAllAssIssuedBatchWITHID(a);
        ss.next();
        java.util.Date yey1 = ss.getTimestamp("sdate");         
        java.util.Date yey2 = ss.getTimestamp("edate");         
          
        java.util.Date yey3 = b.makeDueDate(br.getInt("delDate"), yey2);
          while(yu.next()){
              
              CachedRowSet hmph= b.getAllHousesOfRes(yu.getInt("ResId"));   
              
              CachedRowSet tempy3 = b.getAChargesWITHISSUEID(a);                                  
                                          
              double zk = 0.00;              
              
              while(hmph.next()){//collect assoc dues
               while(tempy3.next()){
                   
                  if(tempy3.getString("chargecomptype").equals("FLAT RATE")){
                   zk = zk + tempy3.getDouble("chargeamt"); 
                   }
               }              
               int lotid = hmph.getInt("lid");
                  String mumu = yu.getString("FirstName")+" "+yu.getString("LastName");
                  b.initializeWaterBills(yu.getInt("ResId"), mumu, zk, yey3, lotid, a);
              }
          }
        
        b.updateIssuedBatch(a);
                %>
            <script type= "text/javascript">
			<!--
				
				alert("Water Bills issued!");
				location = "staffGenWaterBill.jsp";
			-->
			</script>
            <%
%>
</body>
</html>