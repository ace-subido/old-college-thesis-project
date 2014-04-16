 <%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
<%
        String bContent = request.getParameter("textarea1");
        String bName = request.getParameter("bName");
        
        java.util.Date utilDate = new java.util.Date(); 
        
        String user =(String)session.getAttribute("uname");
       FacId fi = new FacId();
       addFacility af = new addFacility();
       Unit u = new Unit();
       
       int i = af.getTotalBulletin();
       
       if(i>0)
       {
           u.updateBulletinFromAdminLatest();
       }
       i++;          
       
       
       
       
       fi.addBulletinAdmin(bName, bContent, user, i, utilDate);

%>
 <script type= "text/javascript">
 <!--  
 
 alert("Posted NEW message to bulleinboard");
  location = 'associationDash.jsp';                             
                
-->    
</script>
