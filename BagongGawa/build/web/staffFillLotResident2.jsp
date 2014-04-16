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
    
    int rid = Integer.parseInt(request.getParameter("num"));
    int phbl = Integer.parseInt(request.getParameter("phbl"));
    int blfl = Integer.parseInt(request.getParameter("blfl"));
    int lotnum = Integer.parseInt(request.getParameter("lotnum"));
    
    Account a = new Account();
   
    Jem jem = new Jem();
    String vType = jem.getVillageType();
     int lotID = jem.getLotId(lotnum, blfl, phbl);
    String Status = "Disabled";
    
    a.addToHeadTable(rid);
    
    jem.updateLot(rid, lotID);
    
    String address="";
    
    if(vType.equals("phase"))
        address="Lot "+lotnum+" Block "+blfl+" Phase "+phbl;
    else
         address="Unit "+lotnum+" Floor "+blfl+" Building "+phbl;
    
    jem.updateResidents(rid, address, lotID);
    
    %> 
    
    <script type= "text/javascript">
    <!--            
         alert("Resident Account and Lot saved");
        location = "staffPhysicalLayout.jsp";
       
    -->
    </script>
</body>
</html>