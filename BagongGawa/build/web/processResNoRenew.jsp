 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<script type= "text/javascript">
    function unloading()
    {
        opener.location.reload(true);
    }
</script>
<body>

<%
    if(session.getAttribute("uname") == null)
        response.sendRedirect("homepage.jsp");

    String a = request.getParameter("resPermitID");
    Permits p = new Permits();
    p.norenew(Integer.parseInt(a));
%>    
<script type= "text/javascript">
<!--
    unloading();
    self.close();
-->
</script>
</body>
</html>