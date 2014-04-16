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
    int blfl = Integer.parseInt(request.getParameter("blfl"));
    int phbl = Integer.parseInt(request.getParameter("phbl"));
    int loun = Integer.parseInt(request.getParameter("loun"));
    Jem jem = new Jem();
    int temp = jem.getLotArea(loun, blfl, phbl);
   
        
    
        
        response.getWriter().write("<p><label class='left'>lot area in sqm.</label><input type='text' name='lotarea' class='field' value='"+temp+"'></p>");
    
%>