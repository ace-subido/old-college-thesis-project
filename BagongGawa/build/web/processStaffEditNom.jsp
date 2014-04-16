
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
    String nomname = request.getParameter("pollname");
    String nomdesc = request.getParameter("textarea1");
    String hidid = request.getParameter("hidid");
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
    
    Election db = new Election();
    int checkExisting = db.checkExistingNomName(nomname);
    if(checkExisting == 0 || checkExisting == 1)
    {    
        db.updateNom(Integer.parseInt(hidid), nomname,closeDate,nomdesc);
%>
        <script type= "text/javascript">
        <!--
            alert("Poll Edited");
            location = "staffmanagenom.jsp";
        -->
        </script>      
<%
    }
    else
    {    
%>
    <script type= "text/javascript">
    <!--
        alert("That exact nomination name already exists");
        history.back();
    -->
    </script>  
<%
    }
%>
</body>
</html>