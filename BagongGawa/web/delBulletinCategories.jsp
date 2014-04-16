 <%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>

<%
    String name = request.getParameter("name");
%>
    <script type= "text/javascript">
    <!--  
        var where_to= confirm("Choosing OK will permanently remove the category");
        if (where_to== true)
        {
<%
            ConnectorThesis ct = new ConnectorThesis();       
            ct.delBulletinCat(name);
%>
            window.location="assocBulletinBoard.jsp";
        }
        else
        {
            window.location="assocBulletinBoard.jsp";
        }
    -->    
    </script>