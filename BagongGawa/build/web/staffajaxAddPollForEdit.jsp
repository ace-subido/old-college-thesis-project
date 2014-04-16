 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxPollPao.js"></script>

<%
    String pollchoice = request.getParameter("pollchoice");
    Pao polls = new Pao();
    Vector<String> poll = (Vector<String>)session.getAttribute("funky");
   
    if(poll==null)         
        poll = new Vector<String>(); 

    poll.add(pollchoice);
    session.removeAttribute("funky");
    session.setAttribute("funky",poll);  
    for(int a=0; a < poll.size(); a++)
    {
        response.getWriter().write("<ul><li>" +poll.elementAt(a)+ " " +"<a href='staffajaxDelPollForEdit.jsp?pollchoicename="+poll.elementAt(a)+"'>Delete</a></li></ul>");
    }
%>
<script type= "text/javascript">
<!--
    alert("Poll Added");
    location = "staffeditpoll.jsp";
-->
</script>