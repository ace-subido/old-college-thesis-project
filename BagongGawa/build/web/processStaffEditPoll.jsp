 
<%@page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
<%    
    String pollname = request.getParameter("pollname");
    String polldesc = request.getParameter("textarea1");
    String pollphase = request.getParameter("pollphase");
    String hiddenid = request.getParameter("hidid");
    String cDate = request.getParameter("date");
    int month2, year2, day2;
    String orig = "", left = "", right = "";
    java.util.Date closeDate = new java.util.Date();
    orig = cDate;
    left = orig.substring(0,orig.indexOf("-"));
    right = orig.substring(orig.indexOf("-")+1);

    year2 = Integer.parseInt(left);

    orig = right;
    left = orig.substring(0,orig.indexOf("-"));
    right = orig.substring(orig.indexOf("-")+1);

    month2 = Integer.parseInt(left);
    day2 = Integer.parseInt(right);
    String d2= year2+"-"+month2+"-"+day2+" "+00+":"+00+":00";
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    closeDate = sdf.parse(d2); 
    
    Polls db = new Polls();
    int checkExisting = db.checkExistingPollName2(Integer.parseInt(hiddenid),pollname);
    if(checkExisting == 0)
    {    
        db.updatePoll(Integer.parseInt(hiddenid), pollname,closeDate,polldesc,pollphase);
%>
        <script type= "text/javascript">
        <!--
            alert("Poll Edited");
            location = "staffmanagepoll.jsp";
        -->
        </script>      
<%
    }
    else
    {    
%>
    <script type= "text/javascript">
    <!--
        alert("That exact poll name already exists");
        history.back();
    -->
    </script>  
<%
    }
%>
</body>
</html>