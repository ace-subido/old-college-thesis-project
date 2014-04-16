<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%
    if(session.getAttribute("uname") == null)
        response.sendRedirect("homepage.jsp");

    int a = (Integer)session.getAttribute("residentId");
    Pao db = new Pao();
    CachedRowSet x = db.getResident(a);
    x.next();

    String LastName = request.getParameter("LastName");
    String FirstName = request.getParameter("FirstName");
    String StatInFam = request.getParameter("StatInFam");
    String Address = x.getString("Address");
    String Sex = request.getParameter("Sex");
    String HouseNum = request.getParameter("HouseNum");
    String EmailAdd = request.getParameter("EmailAdd");
    String UserType = "Resident"; 
    int id;
    id = db.getLatestResId();
    
    id++;
    
    String Username = Integer.toString(id)+FirstName;
    String Password = "welcome";

    String Status = "enabled";
    
    int FamzId = (Integer)session.getAttribute("FamId");
    db.addSubAccount(LastName, FirstName, FamzId, Sex, Address, HouseNum, EmailAdd, StatInFam, UserType, Password, Username, Status);
%> 
 
<script type= "text/javascript">
<!--
      function sendMo()
      {
          document.mailer.action = "http://faustmeister.info/webmailer/Default.aspx";
          document.mailer.method = "POST";
          document.mailer.submit();
          alert("Send to mail");
      }
-->
</script>
<% 
    String bo = "Your temporary Username and Password is: " + Password + "\r\n Please change your Username/Password as soon as you login. \r\n";
%>          
    <form name="mailer" id="mailer">
        <input name="to" id="to" type="hidden" style="width: 300px" value="<%=EmailAdd%>" />
        <input name="from" id="from" type="hidden" style="width: 300px" value="tech-support@converge.com.ph" />
        <input name="subject" id="subject" type="hidden" style="width: 450px" value="Your Username and Password for Converge Generic Association Portal" />
        <input name="body" id="body" type="hidden" value="<%=bo%>">
        <br/>
    </form> 
    <script type= "text/javascript">
    <!--
        sendMo();
        location = "resAddSub.jsp";
        alert("Resident Account Added To Database");
    -->
    <%response.sendRedirect("resAddSub.jsp");%>
    </script>
</body>
</html>
