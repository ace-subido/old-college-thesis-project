 <%-- 
    Document   : getFacReserves
    Created on : Jul 19, 2008, 1:25:02 AM
    Author     : ace-dlsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxSocialGroup.js"></script>
<script type="text/javascript" src="./js/ajaxSearch.js"></script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <script type="text/javascript" src="./js/ajaxSocialGroup.js"></script>
        <title>Loading...</title>
    </head>
    <body>
        <center><p><img src="img/ajax-loader.gif"/></p></center>
        <%
        
        Billing b = new Billing();
       
        int q = Integer.parseInt(request.getParameter("bnum"));   
        int y =  Integer.parseInt(request.getParameter("daya2"));                              
        
        String r = request.getParameter("fs4"); 
        
        double h = Double.parseDouble(request.getParameter("daya"));         
        double i = Double.parseDouble(request.getParameter("pamt")); 
        
       
            double temp = h - i;
            if(temp==0.00){                
                b.clearAssocBill(q, r);    
            }
            else{
                b.partialAssocBill(q, r, temp);
            }
       
                  
        
         %>
        <script type= "text/javascript">
			<!--
				
				alert("The bill has been cleared!");
				location = "staffBillClearA.jsp";
			-->
			</script>
          <%      
               
%>
</body>
</html>