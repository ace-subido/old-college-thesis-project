 <%-- 
    Document   : processStaffApproveSocGPetitionB
    Created on : Oct 10, 2008, 6:51:00 PM
    Author     : ace-dlsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <script type="text/javascript" src="./js/ajaxSocialGroup.js"></script>
        <title>Loading...</title>
    </head>
    <body>
        <center><p><img src="img/ajax-loader.gif"/></p></center>
        <% 
        String a = request.getParameter("rhiz44");
        double ab = Double.parseDouble(request.getParameter("rhiz33"));
        String c = request.getParameter("rhiz22");
        
        Billing b = new Billing();
        
        b.addWaterChargeSetting(a, ab, c);
                
        
        %>
        <script type= "text/javascript">
			<!--
				
				alert("Electric Fee Type has been added!");
				location = "assocBill.jsp";
			-->
			</script>
          <%      
        
        
        %>
    </body>
</html>
