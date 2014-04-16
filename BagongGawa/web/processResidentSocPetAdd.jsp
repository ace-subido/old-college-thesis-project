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
        String sgname = request.getParameter("rofl");
        String sgcat = request.getParameter("catsz");
        String sgdet = request.getParameter("folas");
        
        Vector<String> bb = new Vector<String>();
        
        bb.add(sgname);
        bb.add(sgcat);
        bb.add(sgdet);
        
        session.setAttribute("petitioncontainer", bb);
        
        response.sendRedirect("residentSocPetAdd2.jsp");
       
        
        



        
%>
</body>
</html>