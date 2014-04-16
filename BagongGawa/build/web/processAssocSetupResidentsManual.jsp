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
    String LastName = request.getParameter("LastName");
    String FirstName = request.getParameter("FirstName");    
    String EmailAdd = request.getParameter("EmailAdd");
    String Status = "enabled";
    String UserType = "Resident";
    String StatInFam = "head";

    int id;
    
    Pao dboy = new Pao();
    
    id = dboy.getLatestResId();
    
    id++;
    
    String Username = Integer.toString(id)+FirstName;
    String Password = "welcome";
    
    dboy.adminAddNewHeadAccount(UserType, StatInFam, Username, Password, EmailAdd, LastName, FirstName, Status);
    
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
   
    int phbl = Integer.parseInt(request.getParameter("phbl"));
    int blfl = Integer.parseInt(request.getParameter("blfl"));
    int ltrm = Integer.parseInt(request.getParameter("ltrm"));
    
    dboy.addResToLot(phbl,blfl,ltrm,Id);
    
    Jem j = new Jem();
    String vType = j.getVillageType();
    String Phase = "Phase ";
    String Block = " Block ";
    String Lot = " Lot ";
    String Building = "Building ";
    String Floor = " Floor ";
    String Room = " Room ";
    int LotID = j.getLotId(ltrm, blfl, phbl);
    
    if(vType.equals("phase"))
        {
                String newAddress = Phase+Integer.toString(phbl)+ Block +Integer.toString(blfl)+Lot+Integer.toString(ltrm);
                dboy.updateResAddressAndLotId1(newAddress, LotID, Id);
        }
    else
        {
                String newAddress = Building+Integer.toString(phbl)+Floor+Integer.toString(blfl)+Room+Integer.toString(ltrm);
                dboy.updateResAddressAndLotId2(newAddress, LotID ,Id);
        }
    
    
              
    String bo = "Hello, " + FirstName + " " + LastName + "!\r\n\n Your temporary Username is "+Username+" and your Password is: " + Password + "\r\n Please change your Username/Password as soon as you login. Remember to fill in the necessary Account Information in the My Account menu to fully ENABLE your account. Thank you! (This is an automated e-mail. Do not reply) \r\n";      
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
        alert("Resident Account Added To Database");
    -->
    </script>
<%response.sendRedirect("assocSetupResidentsManual.jsp");%>    
</body>
</html>