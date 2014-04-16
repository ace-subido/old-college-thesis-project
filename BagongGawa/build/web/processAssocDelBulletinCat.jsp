 <%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%> 

<%
        String name = request.getParameter("stat");
        ConnectorThesis ct = new ConnectorThesis();
        System.out.println(name);
           
        ct.delBulletinCat(name);
        
        %>
        <script type= "text/javascript">
        <!-- 
            window.location="assocBulletinBoard.jsp";
         -->    
        </script>