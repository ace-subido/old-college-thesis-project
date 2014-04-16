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
    String cat = request.getParameter("cat");

    ConnectorThesis ct = new ConnectorThesis();

    CachedRowSet ctv = ct.getModerator(cat);
    String tes = "staff";

    if(ctv.size() >0)
    {
        response.getWriter().write("<ul>");
        while(ctv.next())
        {
                if(tes.equals((String)session.getAttribute("uname")))
                {    
                    response.getWriter().write("<li>"+ctv.getString("username")+ "<a href='staffRemoveMod.jsp?cat="+cat+"&username="+ctv.getString("username")+"'>Remove</a></li>");
                }
                else
                {
                    response.getWriter().write("<li>"+ctv.getString("username")+ "</li>");

                }

        }
        response.getWriter().write("</ul>");
    }
    else
    {
        response.getWriter().write("<p><i><font color='red'>No moderator(s) for this category yet.</font></i></p>");
    }    
%>