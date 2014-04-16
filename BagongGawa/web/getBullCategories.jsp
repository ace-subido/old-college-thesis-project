 <%-- 
    Document   : getFacReserves
    Created on : Jul 19, 2008, 1:25:02 AM
    Author     : ace-dlsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxgetReserve.js"></script>
<script type="text/javascript" src="./js/jem.js"></script>
<%
    ConnectorThesis ct = new ConnectorThesis();
            
    CachedRowSet ctv = ct.getBulletinCat();
        
    if(ctv.size() >0)
    {
        response.getWriter().write("<select id='bullCategory'>");
        while(ctv.next())
        {
            System.out.println(ctv.getString("catName"));
            response.getWriter().write("<option value="+ ctv.getString("catName")+ ">" + ctv.getString("catName") + "</option>");
        }
        response.getWriter().write("</select>");
    }
    else
    {
        response.getWriter().write("<script><!-- document.getElementById('board').write('test'); --></script>");
    }
%>