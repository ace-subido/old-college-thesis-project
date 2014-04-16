 <%-- 
    Document   : getFacReserves
    Created on : Jul 19, 2008, 1:25:02 AM
    Author     : ace-dlsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxgetReserve.js"></script>
<script type="text/javascript" src="./js/jem.js"></script>
<html>
<head></head>
<body>
<%  
    String cat = request.getParameter("cat");
    String text1 = request.getParameter("username");

    ConnectorThesis ct = new ConnectorThesis();     
    ct.delModerator(cat, text1);
%>
    <input type="hidden" id="cat" value="<%=cat%>">
    <script type= "text/javascript">
    <!--  
        var cat = document.getElementById("cat");
        alert("removed moderator");
        location = "staffBulletinCategories.jsp?cat="+cat.value;                                     
    -->    
    </script>
</body>
</html>