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
    Account db = new Account();
    CachedRowSet crset = db.getResident(a);
    crset.next();
    String Username = request.getParameter("Username");
    String Password = request.getParameter("password");
    if(Password.equalsIgnoreCase(""))
        Password = crset.getString("Password");
    String Sex = request.getParameter("Sex");
    String HouseNum = request.getParameter("HouseNum");
    String EmailAdd = request.getParameter("EmailAdd");
    
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
        else
        {
            db.updateResInfo(Sex,HouseNum,EmailAdd,Password,Username,a);
        }
    }
    else
    {  
        db.updateResInfo(Sex,HouseNum,EmailAdd,Password,Username,a);
    }    
%>    
<script type= "text/javascript">
<!--
    location = "assocMyAccount.jsp";
    alert("Administrator Account Details Saved");
-->
</script>    
</body>
</html>