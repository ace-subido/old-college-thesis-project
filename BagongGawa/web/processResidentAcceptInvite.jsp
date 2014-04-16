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
        
        int invId = Integer.parseInt(request.getParameter("invid"));
        int sId = Integer.parseInt(request.getParameter("sgid"));
        SocialGroup sg = new SocialGroup();
              
        sg.acceptGroupInvite(invId);   
        int ppp = sg.getAllPetitionInvitesforSGYES(sId).size();
        int ooo = sg.getSocGNumP2();
        
        CachedRowSet crcr = sg.getAllPetitionInvitesforSG(sId);
               
        
        if(ppp>=ooo){
            sg.updatePetitionStatus2(sId);
            
        }
         
      
       
            %>
            <script type= "text/javascript">
			<!--
				
				alert("You have accepted the invitation!");
				location = "residentSocMain.jsp";
			-->
			</script>
            <%
     
               
%>
</body>
</html>