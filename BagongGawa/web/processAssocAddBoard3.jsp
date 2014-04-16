 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>

<% 
    if (session.getAttribute("uname") == null) {
                response.sendRedirect("homepage.jsp");
    }

    
    String c = request.getParameter("charge");
    String m = request.getParameter("month");
    String y = request.getParameter("year");
    String resId = request.getParameter("resId");
    
    Thesis t = new Thesis();
    Unit u = new Unit();
    CachedRowSet crset = t.getResInfo(Integer.parseInt(resId));
    ConnectorThesis ct2 = new ConnectorThesis();
    int totalDir = u.getTotalDir();
    
    totalDir++;
    
    if(ct2.dirDoesntExist(Integer.parseInt(resId), c))
    {
       while(crset.next())
         {
    if(t.addDirector(c, Integer.parseInt(m) , Integer.parseInt(y), totalDir, Integer.parseInt(resId), crset.getString("FirstName"), crset.getString("LastName")))
    {
        
        ConnectorThesis ct = new ConnectorThesis();
        ct.updateRes(Integer.parseInt(resId));
        addFacility af = new addFacility();
        af.updateCom(Integer.parseInt(resId), c);
        
    %>
    <script type= "text/javascript">
        <!--  
        alert("Added a new Director");
        location = "assocDirectorMain.jsp";
        -->    
 </script> 
    <%
        }
    else
    {
        %>
    <script type= "text/javascript">
        <!--  
        alert("Unable to add a new Director");
        location = "assocDirectorMain.jsp";
        -->    
 </script> 
    <%
        
    }
   }
  }
  else
  {
       %>
    <script type= "text/javascript">
        <!--  
        alert("Unable to add a new Director");
        location = "assocDirectorMain.jsp";
        -->    
 </script> 
    <% 
  }
%>
 
 