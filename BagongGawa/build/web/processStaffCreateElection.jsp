 
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
    String nomname = request.getParameter("pollname");
    String nomdesc = request.getParameter("textarea1");
    String cDate = request.getParameter("date");
    String divID = request.getParameter("nameDiv");
    Election2 db = new Election2();
    String open = "Open", orig = "", left = "", right = "";
    int checkExisting = db.checkExistingNomName(nomname);
    int month, year, day, month2, year2, day2;
        
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
        
        db.addElection(nomname,open,startDate,closeDate,nomdesc,Integer.parseInt(divID));
        
        Election e = new Election();
        e.updateJustClose(Integer.parseInt(divID));
        CachedRowSet choiceSet = db.getElecChoices(Integer.parseInt(divID));
        CachedRowSet allElec = db.getAllElection();
        int id=0;
        while(allElec.next())
            id = allElec.getInt("ElecId");
        
        Election2 e2 = new Election2();
        while(choiceSet.next())
            e2.addToNomChoices(id,choiceSet.getInt("NomResId"));
%>
        <script type= "text/javascript">
            <!--
                alert("Election Ready");
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
        alert("That exact election name already exists");
        history.back();
    -->
    </script>   
<% 
    }
%>
</body>
</html>