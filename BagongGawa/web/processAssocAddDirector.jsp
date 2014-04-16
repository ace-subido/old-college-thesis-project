 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.sql.*, java.text.*,java.util.Date"%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>

<%
    if(session.getAttribute("uname") == null)
        response.sendRedirect("homepage.jsp");

    int res = Integer.parseInt(request.getParameter("hidid"));
    int div = Integer.parseInt(request.getParameter("hidid2"));
    String type = (String)session.getAttribute("divTYPE");
    Election db = new Election();
    Polls p = new Polls();
    Residents residents = new Residents();
    CachedRowSet resSet = residents.getResInfo(res);
    resSet.next();
    String name = resSet.getString("FirstName") +" "+ resSet.getString("LastName");
    CachedRowSet pSet = p.getMaxDays();

    pSet.next();
    
    java.util.Date startDate = new java.util.Date();
    java.util.Date closeDate = new java.util.Date();
    Calendar myCalendar = Calendar.getInstance();
    int month = myCalendar.get(Calendar.MONTH)+1;
    int year = myCalendar.get(Calendar.YEAR);
    int day = myCalendar.get(Calendar.DATE);
    String d= year+"-"+month+"-"+day+" "+00+":"+00+":00";;
    String d2= (year+pSet.getInt("years"))+"-"+month+"-"+day+" "+00+":"+00+":00";;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    startDate = sdf.parse(d); 
    closeDate = sdf.parse(d2);
    db.addDirector(res, div, startDate, closeDate, name);
    Account r = new Account();
    int starting = p.getStart();
    int last = db.getLast();
    if(starting==day)
    {    
        r.updateType(res,"Director");
        r.servingDirector(last);
    }    
           
    if(type.equalsIgnoreCase("setup"))
    {    
%>    
        <script type= "text/javascript">
        <!--
            location = "assocSetupPart3a.jsp?criteria=0&search=All";
        -->
        </script>
<%
    }
    else
    {    
%> 
        <script type= "text/javascript">
        <!--
            location = "assocDirectorMain.jsp?criteria=0&search=All";
        -->
        </script>
<%
    }
%>
</body>
</html>