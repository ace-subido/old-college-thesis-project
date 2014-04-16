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
        String a = request.getParameter("mimi1");
        String b = request.getParameter("mimi2");
        String c = request.getParameter("mimi3");
        SocialGroup sg = new SocialGroup();
        
        
        if(a.equals("E")){
            sg.updateSocGBulletSet("Enabled");
        }
        else{
            sg.updateSocGBulletSet("Disabled");
        }
        
        if(b.equals("E")){
            sg.updateSocGNewsSet("Enabled");
        }
        else{
            sg.updateSocGNewsSet("Disabled");
        }
        
        if(c.equals("E")){
            sg.updateSocGReserveSet("Enabled");
        }
        else{
            sg.updateSocGReserveSet("Disabled");
        }
        
        %>
        <script type= "text/javascript">
			<!--
				
				alert("Settings Saved!");
				location = "assocSocGroup.jsp";
			-->
			</script>
          <%      
        
        
        %>
    </body>
</html>

