 <%-- 
    Document   : processResidentCreateEvent1
    Created on : Jul 22, 2008, 3:53:32 AM
    Author     : ace-dlsu
--%>

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
        String tempy = request.getParameter("ctr");
        System.out.println(tempy);
        if(tempy.equals("YES"))
            response.sendRedirect("residentCreateEvent2a.jsp");
        else
            response.sendRedirect("residentCreateEvent2b.jsp");
        %>
    </body>
</html>
