<%@page  import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<script type= "text/javascript">
    var isCheck = confirm("Are you sure you want to close this poll?");
    var go;
    if (isCheck)
    {    
<%
        int Pollid = Integer.parseInt(request.getParameter("Pollid"));
        java.util.Date closeDate = new java.util.Date();
        Calendar myCalendar = Calendar.getInstance();
        int month = myCalendar.get(Calendar.MONTH)+1;
        int year = myCalendar.get(Calendar.YEAR);
        int day = myCalendar.get(Calendar.DATE);
        String d= year+"-"+month+"-"+day+" "+00+":"+00+":00";;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        closeDate = sdf.parse(d); 
        Polls p = new Polls();
        p.updateStatus(Pollid,closeDate);
%>      
        location= "staffmanagepoll.jsp";
    }          
    else                   
        history.back();
</script>      
</body>
</html>