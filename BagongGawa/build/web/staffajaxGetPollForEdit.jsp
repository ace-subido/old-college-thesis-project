 <%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxPollPao.js"></script>
<%
    Pao polls = new Pao();
    
    Vector<String> poll = (Vector<String>)session.getAttribute("funky");
   
    if(poll==null)         
        poll = new Vector<String>();        
  
    for(int a=0; a < poll.size(); a++)
    {
        response.getWriter().write("<ul><li>" +poll.elementAt(a)+ " " +"<a href='staffajaxDelPollForEdit.jsp?pollchoicename="+poll.elementAt(a)+"'>Delete</a></li></ul>");
    }
%>