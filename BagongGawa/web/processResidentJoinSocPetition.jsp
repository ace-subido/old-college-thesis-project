 <%-- 
    Document   : processResReserveDel
    Created on : Jul 19, 2008, 5:37:37 AM
    Author     : ace-dlsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <script type="text/javascript" src="./js/ajaxSocialGroup.js"></script>
        <title>Loading...</title>
    </head>
    <body>
        <% 
        int a = Integer.parseInt(request.getParameter("sgid"));
        
        System.out.println(a);
        %>
      <center><p><img src="img/ajax-loader.gif"/></p></center>
<input type="hidden" id="qop" name="qop" value="<%=a%>"/>
       
       <script type= "text/javascript">
        <!--  
        var where_to= confirm("Choosing OK will make you join the the petition");
        var test = document.getElementById("qop").value;
        
        if (where_to== true)
        {                       
            window.location="processResidentJoinSocPetitionB.jsp?n="+test;
        }
        else
        {
            window.location="residentSocMain.jsp";
        }
        -->    
        </script> 
    </body>
</html>
