<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%
    if(session.getAttribute("uname") == null)
        response.sendRedirect("homepage.jsp");
    
    String perID = (String)session.getAttribute("delId");
    int permitID = Integer.parseInt(perID);
     
    Permits db = new Permits();
    db.deletePermit(permitID);
%> 
</body>
<script type= "text/javascript">
    <!--
        location = "assocPermit.jsp";
    -->
</script>
</html>