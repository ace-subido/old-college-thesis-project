 <%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%
    String pollchoiceID = request.getParameter("pollz");
    int residentId = Integer.parseInt(request.getParameter("residentId"));
    int Pollid = Integer.parseInt(request.getParameter("Pollid"));

    Polls p = new Polls();

    p.addToVoteTable(residentId,Integer.parseInt(pollchoiceID),Pollid);
    int votenum = p.getVoteNum(Integer.parseInt(pollchoiceID));
    votenum++;
    p.updateVoteNum(votenum,Integer.parseInt(pollchoiceID));
%> 
    <script type= "text/javascript">
    <!--
        alert("Your vote has been cast");
        location = "resShowPollResults.jsp?pollid=<%=Pollid%>";
    -->
    </script>
</body>
</html>