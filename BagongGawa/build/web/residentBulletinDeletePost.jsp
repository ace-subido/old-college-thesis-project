 

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxgetReserve.js"></script>
<%      
    int commentid =Integer.parseInt(request.getParameter("bulId"));
        
    String cat=request.getParameter("cat");
       
    ConnectorThesis ct = new ConnectorThesis();
      
    ct.delResidentPost(commentid);
    ct.delResidentAllComments(commentid);
%>
<html>
    <body>
        <input type="hidden" name="cat" value="<%=cat%>" id="cat">
    </body>
</html>

<script type= "text/javascript">
<!--  
    var cat = document.getElementById("cat");
              
    location = 'residentBulletinCategories.jsp?cat='+cat.value;
-->    
</script>