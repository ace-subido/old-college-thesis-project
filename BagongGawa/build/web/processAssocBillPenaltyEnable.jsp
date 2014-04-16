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
        <center><p><img src="img/ajax-loader.gif"/></p></center>

        <%
      
        String mg = request.getParameter("batsz4");
        String mg2 = request.getParameter("batsz3");
        Billing b = new Billing();
        
        if(mg!=null){
        if(mg.equals("E")){
            b.updatePenaltySettingE();
        }
        else{
            b.updatePenaltySettingD();
        }
          %>
        <script type= "text/javascript">
			<!--
				
				alert("Penalty and Miscalleneous settings Saved!");
				location = "assocBill.jsp";
			-->
			</script>
          <%   
        }
        
        if(mg2!=null){
        if(mg2.equals("E")){
            b.updateMiscSettingE();
        }
        else{
            b.updateMiscSettingD();
        }
          %>
        <script type= "text/javascript">
			<!--
				
				alert("Penalty and Miscalleneous settings Saved!");
				location = "assocBill.jsp";
			-->
			</script>
          <%   
        }
        
       
      
      

        
%>
</body>
</html>
