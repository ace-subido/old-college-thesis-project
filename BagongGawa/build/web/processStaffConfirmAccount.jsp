 <%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%      
        int ResId = Integer.parseInt(request.getParameter("num"));
        int action = Integer.parseInt(request.getParameter("action"));
         
        Account db = new Account();
        
        if (action == 1)
            db.updateAccountStatus("Enabled", ResId);
        else if (action ==0)
            db.updateAccountStatus("Disabled", ResId);
%>
        <script type= "text/javascript">
        <!--
            alert("Resident Account Status Edited");
            location = "staffResidentAccounts.jsp?criteria=0&search=All";
        -->
        </script>
    </body>
</html>
