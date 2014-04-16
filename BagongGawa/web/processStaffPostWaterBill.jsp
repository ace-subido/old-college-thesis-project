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
        
        Billing b = new Billing();
       
        int q = Integer.parseInt(request.getParameter("lolols"));                       
        double r = Double.parseDouble(request.getParameter("lolol"));                       
        int s = Integer.parseInt(request.getParameter("hihi"));                       
        
        CachedRowSet hmm = b.getWaterBill(q);
        hmm.next();
        
      
       Integer aaa2 = s;
       
       double bbb = r*aaa2.doubleValue();
        java.util.Date d1 = new java.util.Date();
        java.util.Date d2 = b.reformatThisDate(d1);
        bbb = bbb + hmm.getDouble("watersubtotl");
        b.updateWaterBill(q, bbb, s, d2);           
        session.removeAttribute("InputSelectedWResident");
         %>
        <script type= "text/javascript">
			<!--
				
				alert("The reading was issued!");
				location = "staffBillInputW.jsp";
			-->
			</script>
          <%      
               
%>
</body>
</html>