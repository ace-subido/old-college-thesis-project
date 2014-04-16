 <%-- 
    Document   : processassocResDel
    Created on : Jul 18, 2008, 7:39:51 PM
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
                
        Thesis db = new Thesis(); 
        
        db.cancelReservation(lol);
        
        //gawin dito yung notifications
        
      %> <script type= "text/javascript">
			<!--
				
				alert("Resident already notified");
				location = "assocReservationList.jsp";
			-->
	 </script>
        <%
                        
        %>
    </body>
</html>
