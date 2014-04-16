 

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxgetReserve.js"></script>
        <%      
        String bId = request.getParameter("bId");
        String poster="Staff";
        String comment=request.getParameter("txtarea");
        java.util.Date utilDate = new java.util.Date();
        
        String cat=request.getParameter("cat");
        String title=request.getParameter("title");
        ConnectorThesis ct = new ConnectorThesis();
        addFacility af = new addFacility();
         Unit u = new Unit();
        int i = af.getLastCommentId();
        
       i++;   
       
       
            ct.addCommentPost(bId, poster, comment, utilDate, i);
            
            
        
        
%>
<html>
    <body>
        <input type="hidden" name="title" value="<%=title%>" id="bultitle">
<input type="hidden" name="cat" value="<%=cat%>" id="cat">
    </body>
</html>

<script type= "text/javascript">
            <!--  
                var cat = document.getElementById("cat");
              var title = document.getElementById("bultitle");
             location = 'staffBulletinViewPost.jsp?cat='+cat.value+'&title='+title.value;                             
                
            -->    
            </script>
