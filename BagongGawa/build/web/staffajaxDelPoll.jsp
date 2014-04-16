  <%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxPollPao.js"></script>
<%   
    String pollchoicename = request.getParameter("pollchoicename");
    Vector<String> poll = (Vector<String>)session.getAttribute("funky");
    
    for(int a=0; a < poll.size(); a++)
    {
        if(pollchoicename.equals(poll.elementAt(a)))
        {
            poll.removeElementAt(a);
        }
    }
    session.setAttribute("funky",poll);
%>   

<script type= "text/javascript">
<!-- 
    window.location = "staffcreatepoll.jsp"; 
-->
</script>