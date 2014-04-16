 <%-- 
    Document   : getFacReserves
    Created on : Jul 19, 2008, 1:25:02 AM
    Author     : ace-dlsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxSocialGroup.js"></script>
<%
    SocialGroup sg = new SocialGroup();
    CachedRowSet ctv = sg.getSocGCat();
        
    if(ctv.size() >0)
    {
        while(ctv.next())
        {
            response.getWriter().write("<ul><li>" + ctv.getString("scatName") + " " +"<a href='assocajaxDelSocCat.jsp?name="+ ctv.getString("scatName") +"'>Delete</a></li></ul>");
        }
    }
    else
    {
        response.getWriter().write("<font color='red'> No list of categories yet</font>");
    }
%>