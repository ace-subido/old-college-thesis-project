<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.sql.*, java.text.*,java.util.Date"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<script type= "text/javascript">
    var isCheck = confirm("Are you sure you want to close this election?");
    var go;
    if (isCheck)
    {    
<%
        int Pollid = Integer.parseInt(request.getParameter("elecid"));
        java.util.Date closeDate = new java.util.Date();
        Calendar myCalendar = Calendar.getInstance();
        int month = myCalendar.get(Calendar.MONTH)+1;
        int year = myCalendar.get(Calendar.YEAR);
        int day = myCalendar.get(Calendar.DATE);
        String d= year+"-"+month+"-"+day+" "+00+":"+00+":00";;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        closeDate = sdf.parse(d); 
        Election2 p = new Election2();
        p.updateStatus(Pollid,closeDate);
        
        CachedRowSet winner = p.getSpecificElection(Pollid);
        int max=-1,id=0;
        boolean in=true;
        while(winner.next())
        {    
            if(max<winner.getInt("ElecVoteNum"))
            {    
                id = winner.getInt("ElecResId");
                max=winner.getInt("ElecVoteNum");
            }
        }
        Election elec = new Election();
        String name="";
        int div=0;
        if(max>0)
        {
            Polls pol = new Polls();
            Residents residents = new Residents();
            CachedRowSet resSet = residents.getResInfo(id);
            resSet.next();
            name = resSet.getString("FirstName") +" "+ resSet.getString("LastName");
            CachedRowSet pSet = pol.getMaxDays();

            pSet.next();
            java.util.Date startDate = new java.util.Date();
            java.util.Date closedDate = new java.util.Date();
            int month2 = myCalendar.get(Calendar.MONTH)+1;
            int year2 = myCalendar.get(Calendar.YEAR);
            int day2 = myCalendar.get(Calendar.DATE);
            String d3= year2+"-"+month2+"-"+day2+" "+00+":"+00+":00";;
            String d4= (year2+pSet.getInt("years"))+"-"+month2+"-"+day2+" "+00+":"+00+":00";;
            startDate = sdf.parse(d3); 
            closedDate = sdf.parse(d4);
            
            CachedRowSet aSet = p.getSpecificElec(Pollid);
            aSet.next();
            CachedRowSet bSet = elec.getSpecificNomination(aSet.getInt("ElecNomId"));
            bSet.next();
            div =bSet.getInt("NomDivId");
            elec.addDirector(id, div, startDate, closedDate, name);
            p.updateStatus2(aSet.getInt("ElecNomId"),"Closed");
            Account r = new Account();
            Polls poll = new Polls();
            int starting = poll.getStart();
            int last = elec.getLast();
            if(starting<=day)
            {    
                r.updateType(id,"Director");
                r.servingDirector(last);
            }   
        }    
%>      
        location="staffVote.jsp";
    }          
    else                   
        history.back();
    
</script>      
<h1><%=div%></h1>
</body>
</html>