 <%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxSocialGroups.js"></script>
<%
    

    Billing bl = new Billing();       
    
    bl.deleteAllPenaltyFeesSettings();
%>
