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
        
        SocialGroup sg = new SocialGroup();
        Thesis db = new Thesis();
        ResidentObject ro = new ResidentObject();
        
        int lololol = sg.getSocGNumP2();     
         
        Vector<ResidentObject> vr = (Vector<ResidentObject>)session.getAttribute("InvitedResidents");
        
        if(vr != null){
        if(vr.size() < lololol){
            %>
            <script type= "text/javascript">
			<!--
				
				alert("You must invite more residents!");
				location = "residentSocPetAdd2.jsp";
			-->
			</script>
            <%
        }
        else{
            response.sendRedirect("residentSocPetAdd3.jsp");
        }}
        else{
               %>
            <script type= "text/javascript">
			<!--
				
				alert("You must some residents!");
				location = "residentSocPetAdd2.jsp";
			-->
			</script>
            <%
        }
               
%>
</body>
</html>