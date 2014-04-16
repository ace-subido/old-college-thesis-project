 
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%
    String elecchoiceID = request.getParameter("pollz");
    int residentId = Integer.parseInt(request.getParameter("residentId"));
    int Elecid = Integer.parseInt(request.getParameter("Pollid"));

    Election2 p = new Election2();

    p.addToVoteTable(residentId,Integer.parseInt(elecchoiceID),Elecid);
    int votenum = p.getVoteNum(Integer.parseInt(elecchoiceID));
    votenum++;
    p.updateVoteNum(votenum,Integer.parseInt(elecchoiceID));
%> 
    <script type= "text/javascript">
    <!--
        alert("Your vote has been cast");
        location = "residentPolls.jsp";
    -->
    </script>
</body>
</html>