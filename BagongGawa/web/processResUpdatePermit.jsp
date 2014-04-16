 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.sql.*, java.text.*,java.util.Date"%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<script type= "text/javascript">
    function unloading()
    {
        opener.location.reload(true);
    }
</script>
<body>
<%
    if(session.getAttribute("uname") == null)
        response.sendRedirect("homepage.jsp");
    Permits p = new Permits();
    String permitID = (String)session.getAttribute("permitID");;
    CachedRowSet checkSet = p.getCheckDetails(permitID);
    CachedRowSet fieldSet = p.getFieldDetails(permitID);
    String hiddenRID = request.getParameter("hiddenRID");
    int rID= (Integer)session.getAttribute("residentId");
    String field2 = "", field3 = "",field4 = "", field5 = "",field6 = "", field7 = "",field8 = "", field9 = "", field10 = "";
    String field11 ="", field12 = "", field13 = "",field14 = "", field15 = "",field16 = "", field17 = "",field18 = "", field19 = "", field20 = "";
    checkSet.next();
    if(checkSet.getString("field2").equalsIgnoreCase("Yes") || checkSet.getString("field2").equalsIgnoreCase("On"))
        field2= fieldSet.getString("field2")+"-"+request.getParameter("field2");
    if(checkSet.getString("field3").equalsIgnoreCase("Yes") || checkSet.getString("field3").equalsIgnoreCase("On"))
        field3= fieldSet.getString("field3")+"-"+request.getParameter("field3");
    if(checkSet.getString("field4").equalsIgnoreCase("Yes") || checkSet.getString("field4").equalsIgnoreCase("On"))
        field4= fieldSet.getString("field4")+"-"+request.getParameter("field4");
    if(checkSet.getString("field5").equalsIgnoreCase("Yes") || checkSet.getString("field5").equalsIgnoreCase("On"))
        field5= fieldSet.getString("field5")+"-"+request.getParameter("field5");
    if(checkSet.getString("field6").equalsIgnoreCase("Yes") || checkSet.getString("field6").equalsIgnoreCase("On"))
        field6= fieldSet.getString("field6")+"-"+request.getParameter("field6");
    if(checkSet.getString("field7").equalsIgnoreCase("Yes") || checkSet.getString("field7").equalsIgnoreCase("On"))
        field7= fieldSet.getString("field7")+"-"+request.getParameter("field7");
    if(checkSet.getString("field8").equalsIgnoreCase("Yes") || checkSet.getString("field8").equalsIgnoreCase("On"))
        field8= fieldSet.getString("field8")+"-"+request.getParameter("field8");
    if(checkSet.getString("field9").equalsIgnoreCase("Yes") || checkSet.getString("field9").equalsIgnoreCase("On"))
        field9= fieldSet.getString("field9")+"-"+request.getParameter("field9");
    if(checkSet.getString("field10").equalsIgnoreCase("Yes") || checkSet.getString("field10").equalsIgnoreCase("On"))
        field10= fieldSet.getString("field10")+"-"+request.getParameter("field10");
    if(checkSet.getString("field11").equalsIgnoreCase("Yes") || checkSet.getString("field11").equalsIgnoreCase("On"))
        field11= fieldSet.getString("field11")+"-"+request.getParameter("field11");
    if(checkSet.getString("field12").equalsIgnoreCase("Yes") || checkSet.getString("field12").equalsIgnoreCase("On"))
        field12= fieldSet.getString("field12")+"-"+request.getParameter("field12");
    if(checkSet.getString("field13").equalsIgnoreCase("Yes") || checkSet.getString("field13").equalsIgnoreCase("On"))
        field13= fieldSet.getString("field13")+"-"+request.getParameter("field13");
    if(checkSet.getString("field14").equalsIgnoreCase("Yes") || checkSet.getString("field14").equalsIgnoreCase("On"))
        field14= fieldSet.getString("field14")+"-"+request.getParameter("field14");
    if(checkSet.getString("field15").equalsIgnoreCase("Yes") || checkSet.getString("field15").equalsIgnoreCase("On"))
        field15= fieldSet.getString("field15")+"-"+request.getParameter("field15");
    if(checkSet.getString("field16").equalsIgnoreCase("Yes") || checkSet.getString("field16").equalsIgnoreCase("On"))
        field16= fieldSet.getString("field16")+"-"+request.getParameter("field16");
    if(checkSet.getString("field17").equalsIgnoreCase("Yes") || checkSet.getString("field17").equalsIgnoreCase("On"))
        field17= fieldSet.getString("field17")+"-"+request.getParameter("field17");
    if(checkSet.getString("field18").equalsIgnoreCase("Yes") || checkSet.getString("field18").equalsIgnoreCase("On"))
        field18= fieldSet.getString("field18")+"-"+request.getParameter("field18");
    if(checkSet.getString("field19").equalsIgnoreCase("Yes") || checkSet.getString("field19").equalsIgnoreCase("On"))
        field19= fieldSet.getString("field19")+"-"+request.getParameter("field19");
    if(checkSet.getString("field20").equalsIgnoreCase("Yes") || checkSet.getString("field20").equalsIgnoreCase("On"))
        field20= fieldSet.getString("field20")+"-"+request.getParameter("field20");
    java.util.Date applicationDate = new java.util.Date();
    Calendar myCalendar = Calendar.getInstance();
    int month = myCalendar.get(Calendar.MONTH)+1;
    int year = myCalendar.get(Calendar.YEAR);
    int day = myCalendar.get(Calendar.DATE);
    String d= year+"-"+month+"-"+day+" "+00+":"+00+":00";;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    applicationDate = sdf.parse(d); 
    Permits db = new Permits();
    double dfee = fieldSet.getDouble("pfee");
    
    String expStr= "2000"+"-"+"01"+"-"+"01"+" "+00+":"+00+":00";
    java.util.Date expDate = new java.util.Date();
    expDate = sdf.parse(expStr);
    
    db.updateResidentPermit(hiddenRID,applicationDate,field2,field3, field4, field5, field6, field7, field8, field9, field10, field11, field12, field13, field14, field15, field16, field17, field18, field19, field20,fieldSet.getString("path"),dfee,expDate);
    session.removeAttribute("permitID");
%> 
</body>
    <script type= "text/javascript">
    <!--
        unloading();
        self.close();
    -->
    </script>
</html>