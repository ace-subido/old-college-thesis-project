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
        String a = request.getParameter("lili1");
        String cat = request.getParameter("jatsz2");
        int sgid = Integer.parseInt(request.getParameter("sgid"));
        int post = Integer.parseInt(request.getParameter("ahihi"));
        String det = request.getParameter("folas");
        SocialGroup sg = new SocialGroup();
        
        sg.updateGroupSettings(a, cat, post, det, sgid);
        
        %>
<input type="hidden" id="newRes" name="newRes" value="<%=sgid%>"/>       
 <script type= "text/javascript">
			<!--
                        var test = document.getElementById("newRes").value;
				
				alert("Social Group Settings Saved!");
				location = "residentSocialGroupEdit.jsp?sgid="+test;
			-->
			</script>
          <%      
        
        
        %>
    </body>
</html>
