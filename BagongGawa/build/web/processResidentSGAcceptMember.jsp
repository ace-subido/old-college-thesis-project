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
        int a = Integer.parseInt(request.getParameter("sgid"));
        int b = Integer.parseInt(request.getParameter("rid"));
        
        int rdd = (Integer)session.getAttribute("residentId");
        String lolol = (String)session.getAttribute("FirstName")+" "+(String)session.getAttribute("LastName");
        
        SocialGroup sg = new SocialGroup();
        CachedRowSet ctv = sg.getSGMEMBER(a, b);
        CachedRowSet ctv2 = sg.getSGPetDisplay(a);
        ctv.next();
        ctv2.next();
        
        sg.acceptMemberApplicant(a, b);
                
        Ace face = new Ace();
        String lp = "Your application for membership has been approved! You have been accepted as a member of the "+ctv2.getString("SGName")+" group.";
        String f = "["+ctv2.getString("SGName")+"] Social Group Membership Acceptance";
        face.sendMessage(lp, rdd, b, ctv.getString("name"), lolol, f);
        
        %>
<input type="hidden" id="newRes" name="newRes" value="<%=a%>"/>           
    <script type= "text/javascript">
			<!--
			 var test = document.getElementById("newRes").value;
				
				alert("The applicant has been notified");
				location = "residentSocialGroupMembers.jsp?sgid="+test;
			-->
	</script>
        
    </body>
</html>
