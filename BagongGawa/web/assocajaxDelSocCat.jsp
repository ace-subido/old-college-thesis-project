 <%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxSocialGroups.js"></script>
<%
    String name = request.getParameter("name");
%>
    <html>
        <body>
            <input type="hidden" name="omg" id="omg" value="<%=name%>"/>
        </body>
    </html>
<%
    SocialGroup sg = new SocialGroup();       
    sg.delSocGCat(name);
%>
<script type= "text/javascript">
<!--  
    var where_to= confirm("Choosing OK will permanently remove the category");
    var name = document.getElementById("omg").value;
        
    if (where_to== true)
    {                       
        window.location="assocSocGroup.jsp";
    }
    else
    {
        window.location="assocSocGroup.jsp";
    }
-->    
</script> 