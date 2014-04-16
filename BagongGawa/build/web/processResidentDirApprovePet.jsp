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
      
      int sgid = Integer.parseInt(request.getParameter("sgid"));
        int a = (Integer)session.getAttribute("residentId");
      SocialGroup sgsg = new SocialGroup();
      String mg = sgsg.getSocGDApp();                  

      String lolol = (String)session.getAttribute("FirstName")+" "+(String)session.getAttribute("LastName");                
       CachedRowSet ctv = sgsg.getSGPetDisplay(sgid);
     ctv.next();
      Ace face = new Ace();
      
      String jobolz = "The social group "+ctv.getString("SGName")+" has been recognized by the association due to being fully approved by the directors";     
      String jobolztitle = "Social Group Recognition : "+ctv.getString("SGName");
        
      
      
      if(mg.equals("Simultaneous")){
          
            sgsg.dirApproveSG(a, sgid);
            
            if(sgsg.checkNoDirApps(sgid)==0){
                sgsg.updatePetitionStatus3(sgid);
                int z = sgsg.getLeaderID(sgid);
                Vector<ResidentObject> vr = sgsg.getResidentPets(sgid);
                for(int bb=0; bb < vr.size(); bb++){
                    if(vr.elementAt(bb).residentid == z){
                        sgsg.makeLeader(vr.elementAt(bb), sgid);
                    }
                    else{
                        sgsg.movePetsToMem(vr.elementAt(bb), sgid);
                    }
                    face.sendMessage(jobolz, a, vr.elementAt(bb).residentid, lolol, vr.elementAt(bb).fname+" "+vr.elementAt(bb).lastname, jobolztitle);
                }
                sgsg.removepetitionsfrompettable(sgid);
                sgsg.removeDirectorsForApp(sgid);
                
                
                 %>
       <script type= "text/javascript">
			<!--
				
				alert("The petition is now a recognized social group! The petitioners are notified!");
				location = "residentDirSGApp.jsp";
			-->
			</script>
      <%
                //check sg settings//
            }
      %>
       <script type= "text/javascript">
			<!--
				
				alert("You have approved the group!");
				location = "residentDirSGApp.jsp";
			-->
			</script>
      <%
     
      }

       
      
      
      
      

        
%>
</body>
</html>