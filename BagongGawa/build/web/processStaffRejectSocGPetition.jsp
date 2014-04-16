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
        
        int lol1 = Integer.parseInt(request.getParameter("roflb"));
int lol2 = Integer.parseInt(request.getParameter("rofl2b"));
int lol3 = Integer.parseInt(request.getParameter("rofl3b"));

String mao1 = request.getParameter("rofl");
String mao2 = request.getParameter("rofl2");
String mao3 = request.getParameter("rofl3");       
                                                                          

String a = request.getParameter("folas");

if(a.equals("You can leave this space blank and the system will generate the message for you.")){
    a = "";
    a = "Who gives a shit about your petition request? Go home to your mommy and let her wipe your ass awww bahuhuhuhu!";
}
       
        SocialGroup sg = new SocialGroup();
        Ace face = new Ace();
        face.sendMessage(a, lol2, lol3, mao2, mao3, mao1);
        sg.removepetitionrequest(lol1);
        

        %>
        <script type= "text/javascript">
			<!--
				
				alert("The petition request has been rejected! The resident is notified!");
				location = "staffSocMain.jsp";
			-->
			</script>
          <%      
                
        %>
    </body>
</html>
