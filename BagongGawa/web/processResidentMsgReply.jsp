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
        
        int mid = Integer.parseInt(request.getParameter("mid"));
        String mtitle = "Re : "+request.getParameter("mtitle");
        int fromid = Integer.parseInt(request.getParameter("toid"));
        String fromname = request.getParameter("toname");
        int toid = Integer.parseInt(request.getParameter("fromid"));
        String toname = request.getParameter("fromname");
        String content = request.getParameter("folas");
        
        Ace face = new Ace();
        
        face.sendMessage(content, fromid, toid, fromname, toname, mtitle);        
        
        response.sendRedirect("residentMessageViewRep.jsp?num="+mid);
       
        
        



        
%>
</body>
</html>