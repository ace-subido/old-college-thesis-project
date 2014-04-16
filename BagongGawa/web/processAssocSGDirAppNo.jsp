 <%-- 
    Document   : getFacReserves
    Created on : Jul 19, 2008, 1:25:02 AM
    Author     : ace-dlsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxSocialGroup.js"></script>
<%
     SocialGroup sgsg = new SocialGroup();
   
    CachedRowSet cr = sgsg.getSGDirectorApp();    
    
    int aa = Integer.parseInt(request.getParameter("num"));
    
    sgsg.setDirNoSocSIM(aa);
    
    
    response.sendRedirect("assocSocGroupDirApp.jsp?batsz4=SIM");
    
    %>