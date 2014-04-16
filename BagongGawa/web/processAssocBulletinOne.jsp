 <%-- 
    Document   : getFacReserves
    Created on : Jul 19, 2008, 1:25:02 AM
    Author     : ace-dlsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxgetReserve.js"></script>
        <%
        
                
                
        String cat = request.getParameter("status");
        
        ConnectorThesis ct = new ConnectorThesis();
        if(ct.checkBulletinStatus()==0)
        {
            ct.addBulletinStatus(cat);
            response.getWriter().write("<font color='red'>Status saved</font>");
        }
        else
        {
            ct.updateBulletinStatus(cat);
            response.getWriter().write("<font color='red'>Status saved</font>");
        }
            
        
        
        
        
%>
