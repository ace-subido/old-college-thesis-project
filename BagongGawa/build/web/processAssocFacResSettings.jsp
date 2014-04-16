 <%-- 
    Document   : processAssocFacResSettings
    Created on : Jul 21, 2008, 12:32:55 PM
    Author     : ace-dlsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.sql.*, java.text.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%
      ConnectorThesis souljaboy = new ConnectorThesis();
      
      int toreshour = Integer.parseInt(request.getParameter("do2"));
      int toresmin = Integer.parseInt(request.getParameter("do3"));
      int toAMPM = Integer.parseInt(request.getParameter("do4"));
      int frreshour = Integer.parseInt(request.getParameter("co2"));
      int frresmin = Integer.parseInt(request.getParameter("co3"));
      int frAMPM = Integer.parseInt(request.getParameter("co4"));
      int a = Integer.parseInt(request.getParameter("ty"));
      int b = Integer.parseInt(request.getParameter("yt"));
      int c = Integer.parseInt(request.getParameter("daya"));
      
      java.util.Date bt = new java.util.Date();
      java.util.Date ba = new java.util.Date();
      
      if(toAMPM == 1)
            toreshour = toreshour + 12;
      if(frAMPM == 1)
            frreshour = frreshour + 12;
      
            SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss");
            String d1 = frreshour+":"+frresmin+":00";
            String d2 = toreshour+":"+toresmin+":00";
            bt = sdf.parse(d1);
            ba = sdf.parse(d2);
            
       souljaboy.updateFacilitySetting(c, a, b, ba, bt);
       %>
        <script type= "text/javascript">
			<!--
				
				alert("Reservations settings for this facility has been updated!");
				location = "associationDash.jsp";
			-->
			</script><%
      
      
      %>
    </body>
</html>
