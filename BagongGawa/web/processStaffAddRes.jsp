<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
<html>
<head>
<title>Converge Generic Community Association Portal</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <script type= "text/javascript">
    <!--
      function sendMo()
      {
          document.mailer.action = "http://faustmeister.info/webmailer/Default.aspx";
          document.mailer.method = "POST";
          document.mailer.submit();
          alert("Message sent");
      }
    -->
    </script>
</head>

<body>
<%
    if(session.getAttribute("uname") == null)
        response.sendRedirect("homepage.jsp");
    Account a = new Account();
    String lotID = request.getParameter("lotID");
    CachedRowSet lotSet = a.getLots(Integer.parseInt(lotID));
    lotSet.next();
    String Status = "Disabled";
    
    String LastName = request.getParameter("LastName");
    String FirstName = request.getParameter("FirstName");
    String Sex = request.getParameter("Sex");
    String HouseNum = request.getParameter("HouseNum");
    String EmailAdd = request.getParameter("EmailAdd");
    String StatInFam = "head";
    String UserType = "Resident"; 
    
    NewClass nu = new NewClass();
    String Username = nu.getPasswordForRes();
    String Password = nu.getPasswordForRes();

    a.addHeadAccount(LastName, FirstName, Sex, lotID,HouseNum,lotSet.getString("address"), EmailAdd, StatInFam, UserType, Password, Username, Status);

    int Id = a.getResId(); 
    a.addToHeadTable(Id);
          
    CachedRowSet crset2 = a.getFamId(Id);
    int FamzId=0;
    while(crset2.next())
        FamzId = crset2.getInt("FamId");
    a.addFamId(FamzId,Id);
    a.updateLot(String.valueOf(Id),lotID);
         
    String bo = "Hello, " + FirstName + " " + LastName + "! <br> Your temporary Username and Password is: " + Password + " <br> Please change your Username/Password as soon as you login. <br> Remember to change your username and password in the My Account menu to fully ENABLE your account. <br> Thank you! (This is an automated e-mail. Do not reply)";     
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
        location = "staffAddRes.jsp";
        alert("Resident Account Added To Database");
    -->
    </script>
</body>
</html>