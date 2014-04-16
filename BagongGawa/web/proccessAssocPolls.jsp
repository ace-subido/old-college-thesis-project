 <%-- 
    Document   : getFacReserves
    Created on : Jul 19, 2008, 1:25:02 AM
    Author     : ace-dlsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxgetReserve.js"></script>
<%
        
                 
                
        String cat = request.getParameter("able");
        int cat2 = Integer.parseInt(request.getParameter("dv"));
        String stat = request.getParameter("stat");
        
        ConnectorThesis ct = new ConnectorThesis();
        
        int id = 1;
        if(stat.equals("new"))
        {
        ct.newPollsSettings(id, cat, cat2);
    %>
        <script type= "text/javascript">
        <!--  
        alert("Saved Settings");
        location = "assocPolls.jsp";
        -->    
        </script> 
  <%
        }
        else
        {
           
           ct.updatePollsSettings(id, cat, cat2);
    %>
        <script type= "text/javascript">
        <!--  
        alert("Saved Settings");
        location = "assocPolls.jsp";
        -->    
        </script>  
 <%           
        }
  %>
        

