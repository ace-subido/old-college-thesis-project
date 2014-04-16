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
   Thesis db = new Thesis();
    CachedRowSet temp = sgsg.getSGsForDirectorApps();
    
    int aa = Integer.parseInt(request.getParameter("num"));
    CachedRowSet ttt = sgsg.getSGDirectorAppWithID(aa); 

ttt.next();
String name = ttt.getString("dirName");
int socp = ttt.getInt("socpath");
  
    sgsg.setDirYesSocSIM(aa);
       
    while(temp.next()){
        sgsg.setSGForDirApp(aa, name, temp.getInt("SGID"), socp);  
    }
    
    response.sendRedirect("assocSocGroupDirApp.jsp?batsz4=SIM");
%>