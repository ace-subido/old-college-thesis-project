 <%-- 
    Document   : processResReserveDel
    Created on : Jul 19, 2008, 5:37:37 AM
    Author     : ace-dlsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
        
        Vector<ReservationObject> v = (Vector<ReservationObject>)session.getAttribute("ReservationVector");
        int lol = Integer.parseInt(request.getParameter("reservation"));
        int a = (Integer)session.getAttribute("residentId");
        Thesis db = new Thesis();      
        db.cancelReservationResident(lol, a);
        
        %><script type= "text/javascript">
			<!--
				
				alert("Reservation Cancelled!");
				location = "residentReserve.jsp";
			-->
	 </script>
        <%
        //gawin dito yung notifications
        
      %>
    </body>
</html>
