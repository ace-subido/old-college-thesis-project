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
    String LastName = request.getParameter("LastName");
    String FirstName = request.getParameter("FirstName");
    String Sex = request.getParameter("Sex");
    String Address = request.getParameter("Address");
    int LotArea = Integer.parseInt(request.getParameter("LotArea"));
    String HouseNum = request.getParameter("HouseNum");
    String EmailAdd = request.getParameter("EmailAdd");
    String StatInFam = "head";
    String UserType = "Resident"; 
    String Status = "Disabled";
    String Location = request.getParameter("Location");
    int UnitCount = Integer.parseInt(request.getParameter("UnitCount"));

    NewClass nu = new NewClass();
    String Username = nu.getPasswordForRes();
    String Password = nu.getPasswordForRes();

    Pao dboy = new Pao();

    dboy.addHeadAccount(LastName, FirstName, Sex, Address, LotArea, HouseNum, EmailAdd, StatInFam, UserType, Password, Username, Status, Location, UnitCount);

    CachedRowSet crset = dboy.getResId(LastName, FirstName); 
    int Id=0;
    while(crset.next())
        Id = crset.getInt("ResId");
    dboy.addToHeadTable(Id);
          
    CachedRowSet crset2 = dboy.getFamId(Id);
    int FamzId=0;
    while(crset2.next())
        FamzId = crset2.getInt("FamId");
    dboy.addFamId(FamzId,Id);
         
    String bo = "Hello, " + FirstName + " " + LastName + "!\r\n\n Your temporary Username and Password is: " + Password + "\r\n Please change your Username/Password as soon as you login. Remember to fill in the necessary Account Information in the My Account menu to fully ENABLE your account. Thank you! (This is an automated e-mail. Do not reply) \r\n";      
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
        location = "homepage.jsp";
        alert("Resident Account Added To Database");
    -->
    </script>
</body>
</html>