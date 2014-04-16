 <%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<html>
    <head>
        <script type="text/javascript" src="./js/ajaxgetReserve.js"></script>
        <script type="text/javascript" src="./js/jem.js"></script>
    </head>
    <body>
        
    </body>
</html>

        <%
        
        Thesis ct = new Thesis();
            
        int resid = Integer.parseInt(request.getParameter("num"));
        CachedRowSet ctv = ct.getResInfo(resid);
        
        if(ctv.size() >0)
        {
           
            while(ctv.next())
            {
                 response.getWriter().write("<p><h3>Name: <font color='green'>" + ctv.getString("FirstName") + " " + ctv.getString("LastName") + "</font></h3></p>");
                 response.getWriter().write("<p><h3>Username: <font color='green'>" + ctv.getString("Username") + "</font></h3></p>");
                 response.getWriter().write("<p><h3>Address:  <font color='green'>" + ctv.getString("Address") + "</font></h3></p>");
                 response.getWriter().write("<p><h3>Telephone Number: <font color='green'>" + ctv.getString("HouseNum") + "</font></h3></p>");
                 response.getWriter().write("<p><h3>Email Address: <font color='green'>" + ctv.getString("EmailAdd") + "</font></h3></p>");
                 response.getWriter().write("<p><h3>User Type: <font color='green'>" + ctv.getString("UserType") + "</font></h3></p>");
                 response.getWriter().write("<center><p><a href='assocAddBoard3.jsp?num="+resid+"'/>Confirm</a></p></center>");
                 
            }
           
        }
        
%>
