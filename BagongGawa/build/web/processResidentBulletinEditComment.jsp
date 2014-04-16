 

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxgetReserve.js"></script>
        <%      
        int commentid = Integer.parseInt(request.getParameter("commentid"));
        
        String post=request.getParameter("textarea1");
        
        
        String cat=request.getParameter("cat");
        String bName=request.getParameter("title");
        ConnectorThesis ct = new ConnectorThesis();
      
            ct.editResidentComment(commentid, post);
         
%>
<html>
    <body>
        <input type="hidden" name="title" value="<%=bName%>" id="title">
<input type="hidden" name="cat" value="<%=cat%>" id="cat">
    </body>
</html>

<script type= "text/javascript">
            <!--  
                var cat = document.getElementById("cat");
              var title = document.getElementById("title");
             location = "residentBulletinViewPost.jsp?cat="+cat.value+"&title="+title.value;                             
                
            -->    
            </script>
