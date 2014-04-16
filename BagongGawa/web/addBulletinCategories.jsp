<%-- 
    Document   : getFacReserves
    Created on : Jul 19, 2008, 1:25:02 AM
    Author     : ace-dlsu
--%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxgetReserve.js"></script>
<%
    String cat = request.getParameter("cat");
        
    ConnectorThesis ct = new ConnectorThesis();
    if(ct.checkBulletinCat(cat)==0)
    {
        ct.addBulletinCat(cat);
    }
    else
    {
        response.getWriter().write("<font color='red'>That category already exists</font>");
    }
    
    CachedRowSet ctv = ct.getBulletinCat();
        
    if(ctv.size() >0)
    {
        while(ctv.next())
        {
            response.getWriter().write("<ul><li>" + ctv.getString("catName") + " " +"<a href='delBulletinCategories.jsp?name="+ ctv.getString("catName") +"'>Delete</a></li></ul>");
        }
    }
    else
    {
        response.getWriter().write(" <font color='red'> No list of categories yet</font>");
    }
%>