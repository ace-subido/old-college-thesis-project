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
       
    
    Vector<ResidentObject> vr = (Vector<ResidentObject>)session.getAttribute("InvitedResidents2");
    session.removeAttribute("InvitedResidents2");
    
    String lolol = (String)session.getAttribute("FirstName")+" "+(String)session.getAttribute("LastName");
       
    SocialGroup sgpet = new SocialGroup();
    
    Ace face = new Ace();
    
    int sgid = (Integer)session.getAttribute("sgid");   
    CachedRowSet ctv = sgpet.getSGPetDisplay(sgid);
    ctv.next();
        
        String jobolz = "You have been invited to join the petition for the social group "+ctv.getString("SGName")+" by "+lolol;
        String jobolztitle = "Social Group Petition Invitiation : "+ctv.getString("SGName");
        
        for(int lili = 0; lili < vr.size(); lili++){
            sgpet.sendResidentInvites(vr.elementAt(lili), sgid);             
            face.sendMessage(jobolz, a, vr.elementAt(lili).residentid, lolol, vr.elementAt(lili).fname+" "+vr.elementAt(lili).lastname, jobolztitle);
        }
        
        ResidentObject ro = new ResidentObject();
        
        ro.fname = (String)session.getAttribute("FirstName");
        ro.lastname = (String)session.getAttribute("LastName");
        ro.residentid = a;
        
        sgpet.sendResidentInvitestoHead(ro, sgid);
         %>
		    <input type="hidden" id="newRes" value="<%=sgid%>"/>
          
	<script type= "text/javascript">
			<!--
				var test = document.getElementById("newRes").value;
				alert("The petition has been successfully sent! The invites are sent!");
				location = "residentPetitionMainPage.jsp?sgid="+test;
			-->
			</script>
			