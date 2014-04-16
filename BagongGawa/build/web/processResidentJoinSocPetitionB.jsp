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
        int a = Integer.parseInt(request.getParameter("n"));
        int ab = (Integer)session.getAttribute("residentId");
        SocialGroup sg = new SocialGroup();
        System.out.println(a);
        String lolol = (String)session.getAttribute("FirstName")+" "+(String)session.getAttribute("LastName");
        sg.addResidentPetTable2(a, ab, lolol);
        
         int z = sg.getSocGNumP();
        int y = sg.getTotalPet(a);
        
        if(z <= y){            
            sg.updatePetitionStatus(a);
            
            String sfff = sg.getSocGDApp();
            CachedRowSet temp = sg.getSGDirectorApp();
            
            /*if(sfff.equals("Simultaneous")){
                temp = sg.getSGDirectorAppSim();
            }
            else{
                temp = sg.getSGDirectorAppChainFrost();
            }*/
            
            while(temp.next()){
                sg.setSGForDirApp(temp.getInt("resID"), temp.getString("dirName"), a, temp.getInt("socpath"));  
            }
            
        }      
        %>
        <script type= "text/javascript">
			<!--
				
				alert("You have joined the petition!");
				location = "residentSocMain.jsp";
			-->
			</script>
          <%      
        
         
        %>
    </body>
</html>
