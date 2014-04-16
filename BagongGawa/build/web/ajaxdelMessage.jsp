<%-- 
    Document   : getFacReserves
    Created on : Jul 19, 2008, 1:25:02 AM
    Author     : ace-dlsu
--%>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>

<script type="text/javascript" src="./js/ajaxMensahe.js"></script>
<%        
    int mid = Integer.parseInt(request.getParameter("mID"));
    int a = (Integer)session.getAttribute("residentId");
     String petdate ="";
    Ace face = new Ace();
    
    face.deleteMessage(mid);
     CachedRowSet cr = face.retrieveUserMessages(a);
     response.getWriter().write("<h1><b>Messages</b></h1>");
    if(cr.size()>0){ 
    
    response.getWriter().write("<center><table width=430><tr> <th width=100 class=top scope=col><center>Sender</center></th> <th width=100 class=top scope=col><center>Date</center></th><th width=150 class=top scope=col><center>Message Title</center></th><th width=40 class=top scope=col></th><th width=40 class=top scope=col></th></tr>");
        while(cr.next()){
             
             petdate = face.makeDateToString(cr.getTimestamp("MDate"));
             response.getWriter().write(" <tr><td>"+cr.getString("fromName")+"</td><td>"+petdate+"</td><td>"+cr.getString("MTitle")+"</td>");
             response.getWriter().write("<td><center><a href=residentMessageViewRep.jsp?num="+cr.getInt("messageId")+">View</a></center></td>");
             response.getWriter().write("<td><center><a onclick=deleteMessage("+cr.getInt("messageId")+">Delete</a></center></td></tr>");
               
        }
    
    }
     else{
         response.getWriter().write("<center><p>There are no Messages!</p></center>");
     }
%>