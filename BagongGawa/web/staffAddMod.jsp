 <%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxgetReserve.js"></script>
<script type="text/javascript" src="./js/jem.js"></script>
<html>
<head></head>
<body>
<%        
    String cat = request.getParameter("cate");
    String text1 = request.getParameter("text1");


    ConnectorThesis ct = new ConnectorThesis();

    if(ct.getModerator2(cat, text1)==0)
    {
        ct.addModerator(cat, text1);
%>
        <input type="hidden" id="cat" value="<%=cat%>">
        <script type= "text/javascript">
        <!--  
            var cat = document.getElementById("cat");
            alert("Added new Moderator");
            location = "staffBulletinCategories.jsp?cat="+cat.value;                                 
        -->    
        </script>
<%           
    }
    else
    {
%>
        <input type="hidden" id="cat" value="<%=cat%>">
        <script type= "text/javascript">
        <!--
            alert("That resident is already a moderator in this category");
            location = "staffBulletinCategories.jsp?cat="+cat.value;
        -->    
        </script> 
<% 
   }     
%>
</body>
</html>