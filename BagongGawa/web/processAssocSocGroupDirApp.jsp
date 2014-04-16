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
      
        String mg = request.getParameter("batsz4");
   SocialGroup sgsg = new SocialGroup();
        
    Thesis db = new Thesis();
     CachedRowSet crset = db.getDirectors();
      CachedRowSet crset2 = sgsg.getSGDirectorApp();  
        
      
      if(crset2.size() < 1){
        while(crset.next()){
           
             sgsg.setInitSGDirectorApp(crset.getInt("ResId"), crset.getString("FirstName")+" "+crset.getString("LastName"));
        }
       }      
      
      if(mg.equals("SIM")){
          sgsg.updateSocGDirApp("Simultaneous");
          response.sendRedirect("assocSocGroupDirApp.jsp?batsz4="+mg);
      }
      else{
          sgsg.updateSocGDirApp("Chain");         
         // response.sendRedirect("assocSocGroupDirApp2.jsp?batsz4="+mg);
           response.sendRedirect("assocSocGroup.jsp");
      }
      
      

        
%>
</body>
</html>