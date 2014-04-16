<%-- 
    Document   : processResVotePoll
    Created on : Nov 11, 2008, 11:59:08 PM
    Author     : od0902
--%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%
    int residentId = Integer.parseInt(request.getParameter("residentId"));
    int nomid = Integer.parseInt(request.getParameter("nomid"));
    int nomResid = Integer.parseInt(request.getParameter("NomresidentId"));

    Election p = new Election();

    p.addToVoteTable(residentId,nomResid,nomid);
%> 
    <script type= "text/javascript">
    <!--
        alert("Your vote has been cast");
        location = "residentPolls.jsp";
    -->
    </script>
</body>
</html>