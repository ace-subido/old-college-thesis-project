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
    CachedRowSet crset = db.getResident(a);
    String Username = request.getParameter("Username");
    String Password = request.getParameter("password");
    String LastName = request.getParameter("LastName");
    String FirstName = request.getParameter("FirstName");
    //String Location = request.getParameter("Location");
    String Address = request.getParameter("Address");
    String Sex = request.getParameter("Sex");
    String HouseNum = request.getParameter("HouseNum");
    //int LotArea = Integer.parseInt(request.getParameter("LotArea"));
    //int UnitCount = Integer.parseInt(request.getParameter("UnitCount"));
    String EmailAdd = request.getParameter("EmailAdd");
    crset.next();
    String UserType = crset.getString("UserType"); 
    String Status = "enabled";
    boolean check = false;
    
    if(!(crset.getString("Username").equalsIgnoreCase(Username)))
    {    
        check = db.checkusername(Username);
    
        if(check)
        {
%>
        <script type= "text/javascript">
        <!--
            history.back();
            alert("Username exist. Please choose another one");
        -->
        </script>    
<%
        }

    }
        else 
            db.updateResInfo(LastName, FirstName, Sex, Address, HouseNum, EmailAdd, UserType, Password,Username, Status, a);
        
%>  
<script type= "text/javascript">
<!--
    location = "resMyAccount.jsp";
    alert("Resident Account Details Saved");
-->
</script>
</body>
</html>