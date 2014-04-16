<%-- 
    Document   :
    Created on : Jul 20, 2008, 9:38:19 PM
    Author     : od0902
--%>
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
        
       
        int ResId = Integer.parseInt(request.getParameter("ResId"));
         int action = Integer.parseInt(request.getParameter("action"));
       
         
        Pao db = new Pao();

        %>
         
<input type="hidden" id="daya" name="daya" value="<%=ResId%>"/>

<input type="hidden" id="daya2" name="daya2" value="<%=action%>"/>
<script type= "text/javascript">
        <!--
        var where_to=confirm("Choosing OK will disable the account");
        var test1 = document.getElementById("daya").value;
       var test2 = document.getElementById("daya2").value;
       if(where_to == true){
           window.location="processAssocConfirmAccount.jsp?num="+test1+"&action="+test2;
       }
       else
           {
               window.location="assocResidentAccounts.jsp";
           }
        -->
        </script>
    </body>
</html>
