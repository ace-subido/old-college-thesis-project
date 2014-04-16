 <%-- 
    Document   : processResidentCreateSGPet
    Created on : Oct 8, 2008, 8:35:06 PM
    Author     : ace-dlsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   <html><body>
       
       <center><p><img src="img/ajax-loader.gif"/></p></center>
   </body></html>
   
<% 
    int a = (Integer)session.getAttribute("residentId");
       
    Vector<String> va = (Vector<String>)session.getAttribute("petitioncontainer");
    Vector<ResidentObject> vr = (Vector<ResidentObject>)session.getAttribute("InvitedResidents");
    session.removeAttribute("InvitedResidents");
    String sgpetcat = va.elementAt(1);
    String sgpetname = va.elementAt(0);
    String sgpetdet = va.elementAt(2);
    String lolol = (String)session.getAttribute("FirstName")+" "+(String)session.getAttribute("LastName");
       
    SocialGroup sgpet = new SocialGroup();
    
    Ace face = new Ace();
    
    if(sgpet.addSocGPetition(sgpetcat, sgpetname, sgpetdet, a, lolol) == 0){
        int b = sgpet.getSocGrpIDwithRID(a);
        
        String jobolz = "You have been invited to join the petition for the social group "+sgpetname+" by "+lolol;
        String jobolztitle = "Social Group Petition Invitiation : "+sgpetname;
        
        for(int lili = 0; lili < vr.size(); lili++){
            sgpet.sendResidentInvites(vr.elementAt(lili), b);             
            face.sendMessage(jobolz, a, vr.elementAt(lili).residentid, lolol, vr.elementAt(lili).fname+" "+vr.elementAt(lili).lastname, jobolztitle);
        }
        
        ResidentObject ro = new ResidentObject();
        
        ro.fname = (String)session.getAttribute("FirstName");
        ro.lastname = (String)session.getAttribute("LastName");
        ro.residentid = a;
        
        sgpet.sendResidentInvitestoHead(ro, b);
         %>
			<script type= "text/javascript">
			<!--
				
				alert("The petition has been successfully sent! The invites are sent!");
				location = "residentSocMain.jsp";
			-->
			</script>
			<%
    }
    else
        %>
			<script type= "text/javascript">
			<!--
				
				alert("That social group name already exists!");
				location = "residentSocPetAdd.jsp";
			-->
			</script>
			<%
        
%>