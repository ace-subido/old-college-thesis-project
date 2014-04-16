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
        
        SocialGroup sg = new SocialGroup();
        Thesis db = new Thesis();
        ResidentObject ro = new ResidentObject();
       
        int q = Integer.parseInt(request.getParameter("num"));       
                 
        session.removeAttribute("PenaltySelectedResident");
                        
        CachedRowSet resinfo = db.getResInfo(q);
        
        resinfo.next();
      
        ro.address = resinfo.getString("Address");
        ro.fname = resinfo.getString("FirstName");
        ro.lastname = resinfo.getString("LastName");
        ro.residentid = q;
        ro.telenumber = resinfo.getString("HouseNum");
        
        
        
        session.setAttribute("PenaltySelectedResident", ro);      
        
        response.sendRedirect("staffBillPenalty.jsp");
               
%>
</body>
</html>