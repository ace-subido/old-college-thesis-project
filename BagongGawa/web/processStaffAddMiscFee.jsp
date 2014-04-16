<%-- 
    Document   : processStaffApproveSocGPetitionB
    Created on : Oct 10, 2008, 6:51:00 PM
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
        <center><p><img src="img/ajax-loader.gif"/></p></center>
        <% 
        String z = request.getParameter("katsz4");
        String a = request.getParameter("miscname");
        double ab = Double.parseDouble(request.getParameter("miscfee"));
        
        Billing b = new Billing();
        
        if(z.equals("PRes")){
            b.addMiscFee(a, ab, "Misc Res");
        }
        else{
            CachedRowSet cr = b.getAllFamilyHeads();
            Integer aaa = cr.size();
            double bbb = ab / aaa.doubleValue();
            
            b.addMiscFee(a, bbb, "Misc Com");
        }
        
        %>
        <script type= "text/javascript">
			<!--
				
				alert("Miscalleneous Fee has been added!");
				location = "staffAddMiscalleneous.jsp";
			-->
			</script>
          <%      
        
        
        %>
    </body>
</html>
