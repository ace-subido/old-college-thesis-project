 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
<%
    String permit = request.getParameter("permitCheckBox");
    String reservation = request.getParameter("reservationCheckBox2");
    String vote = request.getParameter("voteCheckBox3");
    String bulletin = request.getParameter("bulletinCheckBox5");
    String billing = request.getParameter("billingCheckBox7");
    String newsletter = request.getParameter("newsletterCheckBox6");
    String socialgroups = request.getParameter("eventsCheckBox4");
    
    
    FacId fi = new FacId();
    fi.updateServicesTemplate(permit, reservation, vote, bulletin, billing, newsletter, socialgroups);
    
    
        
%>
<script type= "text/javascript">
<!--  
 alert("Successfully updated the services for your village");
 location = "assocServices.jsp";
 -->    
 </script>