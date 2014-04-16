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
       
        int q = Integer.parseInt(request.getParameter("num"));  
        int ss = Integer.parseInt(request.getParameter("sgid"));            
      
        Vector<ResidentObject> vr = (Vector<ResidentObject>)session.getAttribute("InvitedResidents");
        
        if(vr==null){
            vr = new Vector<ResidentObject>();
        }
        
        CachedRowSet crs = sg.getAllPetitionInvitesforSG(ss);
        CachedRowSet resinfo = db.getResInfo(q);
        
        resinfo.next();
      
        ro.address = resinfo.getString("Address");
        ro.fname = resinfo.getString("FirstName");
        ro.lastname = resinfo.getString("LastName");
        ro.residentid = q;
        ro.telenumber = resinfo.getString("HouseNum");
        
        int temp = 0;
        
        while(crs.next()){
            if(crs.getInt("resID")==ro.residentid){
                temp = 1;
            }
        }
        
        if(temp==0){
            vr.add(ro);
        
            session.removeAttribute("InvitedResidents2");
            session.setAttribute("InvitedResidents2", vr);      
        
            response.sendRedirect("residentPetitionGroupInvite.jsp?sgid="+ss);
        }
        else{
            %>
            <input type="hidden" id="newRes" value="<%=ss%>"/>
            <script type= "text/javascript">
			<!--
				var test = document.getElementById("newRes").value;
				alert("That resident already has been invited!");
				location = "residentPetitionGroupInvite.jsp?sgid="+test;
			-->
			</script>
            <%
            
        }
               
%>
</body>
</html>