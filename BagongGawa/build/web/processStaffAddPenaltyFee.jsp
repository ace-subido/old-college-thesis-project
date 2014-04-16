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
        int a = Integer.parseInt(request.getParameter("id"));
        int b = Integer.parseInt(request.getParameter("subid"));
        String lolol = request.getParameter("type");
        Billing c = new Billing();
        Thesis db = new Thesis();
        
        CachedRowSet cr = db.getResInfo(a);
        cr.next();
        
        CachedRowSet cr2 = c.getPenaltyCharge(b);
        cr2.next();
        
        String aa = cr.getString("StatInFam");
        String temppp = "";
        if(lolol.equals("FLAT")){
            temppp = "Penalty Flat";
        }
        if(lolol.equals("PERCENT")){
            temppp = "Penalty Per";
        }
    
        if(aa.equals("head")){
            c.addPenaltyChargetoResidentFamHead(a, cr2.getDouble("penaltyamt"), cr2.getString("penaltyname"), cr.getString("FirstName")+" "+cr.getString("LastName"), cr.getInt("LotID"), temppp);
        }
        else{
            c.addPenaltyChargetoResident(a, cr2.getDouble("penaltyamt"), cr2.getString("penaltyname"), cr.getInt("FamId"), cr.getString("FirstName")+" "+cr.getString("LastName"), cr.getInt("LotID"), temppp);
        }

        
                
        
        %>
        <script type= "text/javascript">
			<!--
				
				alert("Penalty Fee has been added!");
				location = "staffBillPenalty.jsp";
			-->
			</script>
          <%      
        
        
        %>
    </body>
</html>
