 <%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
<% 
    if (session.getAttribute("uname") == null) {
                response.sendRedirect("homepage.jsp");
    }

    String dN= request.getParameter("dirName");
    String c = request.getParameter("charge");
    String m = request.getParameter("month");
    String y = request.getParameter("year");
    String resId = request.getParameter("resId");
    String dD = request.getParameter("dirId");
    
   addFacility af = new addFacility();
   af.upDateDir(Integer.parseInt(dD), Integer.parseInt(m), Integer.parseInt(y));
    
        
       
        
    %>
    <script type= "text/javascript">
        <!--  
        alert("Updated Director");
        location = "assocDirectorMain.jsp";
        -->    
    </script> 
   
    
   