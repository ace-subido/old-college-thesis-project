 
<%@page import="thesis.*, sun.jdbc.rowset.*, java.util.*,java.text.*"%>
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
    String pollphase = request.getParameter("pollphase");
    String polldesc = request.getParameter("textarea1");
    String cDate = request.getParameter("date");
    Polls db = new Polls();
    String open = "Open", orig = "", left = "", right = "";
    int checkExisting = db.checkExistingPollName(pollname);
    int pollid, month, year, day, month2, year2, day2;
        
    if(checkExisting == 0)
    {
        java.util.Date startDate = new java.util.Date();
        Calendar myCalendar = Calendar.getInstance();
        month = myCalendar.get(Calendar.MONTH)+1;
        year = myCalendar.get(Calendar.YEAR);
        day = myCalendar.get(Calendar.DATE);
        String d= year+"-"+month+"-"+day+" "+00+":"+00+":00";;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        startDate = sdf.parse(d); 
        
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
        String d2= year2+"-"+month2+"-"+day2+" "+00+":"+00+":00";;
        closeDate = sdf.parse(d2); 
        
        db.addPoll(pollname,open,startDate,closeDate,polldesc,pollphase);
        Vector<String> poll = (Vector<String>)session.getAttribute("funky");
        pollid = db.getPollId(pollname);
        for(int a=0; a < poll.size(); a++)
           db.addPollChoice(pollid,poll.elementAt(a));
          
        session.removeAttribute("funky");
%>
    <script type= "text/javascript">
    <!--
        alert("Poll Added");
        location = "staffVote.jsp";
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
    session.removeAttribute("funky");
    }
%>
</body>
</html>