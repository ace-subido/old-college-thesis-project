 <%-- 
    Document   : getFacReserves
    Created on : Jul 19, 2008, 1:25:02 AM
    Author     : ace-dlsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxgetReserve.js"></script>
<script type="text/javascript" src="./js/jem.js"></script>
<%
    int blfl = Integer.parseInt(request.getParameter("blfl"));
    int phbl = Integer.parseInt(request.getParameter("phbl"));
    int lotnum = Integer.parseInt(request.getParameter("lotnum"));
    String status="unoccupied";
    Jem jem = new Jem();
    int i=0;
   String vType; jem.getVillageType();
   
     CachedRowSet cr = jem.getLotDetails(lotnum, phbl, blfl);
     while(cr.next())
     {
        response.getWriter().write("<p><label class='left'>lotarea</label> <input type=text disabled value='"+cr.getInt("lotarea")+"'><p>");
        status = cr.getString("status");
        if(status.equals("unoccupied"))
        {
            response.getWriter().write("<p><label class='left'>Status</label> <a href='staffFillLotResident.jsp?lotnum="+lotnum+"&blfl="+phbl+"&phbl="+blfl+"'>"+cr.getString("status")+"</a></p>");
        
        }    
            
            
            
        i = cr.getInt("rid");
      }
        if(status.equals("Occupied"))
       {
        Thesis thesis = new Thesis();
        CachedRowSet c = thesis.getResInfo(i);
        while(c.next())
            {
            response.getWriter().write("<p><label class='left'>Name of Resident:</label> "+c.getString("FirstName")+ " "+ c.getString("LastName") + " ");
            
            response.getWriter().write("<p><div align='center'><a href='staffFreeUpLot.jsp?rid="+i+"'>Remove resident from this address</a></div></p><br><br><br>");
        
        }
        
       }
     
     
    
%>
