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
    int rid = Integer.parseInt(request.getParameter("rid"));
    
    Jem jem = new Jem();
    
     jem.updateResidentTablelots(rid);
     jem.removeFromResidentHead(rid);
     jem.clearLotsTable(rid);
     
   
            
        
       
    
%>
<script type= "text/javascript">
			<!--
				
				alert("Successfuly removed resident from address");
				location = "staffPhysicalLayout.jsp";
			-->
			</script>
   