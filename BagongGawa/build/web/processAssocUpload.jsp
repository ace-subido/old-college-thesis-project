 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.sql.*, java.text.*,java.util.Date"%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%
    if(session.getAttribute("uname") == null)
        response.sendRedirect("homepage.jsp");

    String filename= request.getParameter("uploadfile");
    Setup setup = new Setup();
    boolean success = setup.upload(filename);
    Jem jem = new Jem();
    if(success==true)
    {    
        jem.addPhBl(jem.getLotsTotalPhBl());
%>
        <script type= "text/javascript">
            <!--
                alert("Uploading successful");
                location = "associationDash.jsp";                
            -->
        </script>
<%
    }
    else if (success==false)
    {    
%>
        <script type= "text/javascript">
            <!--
                alert("Uploading not successful");
                history.back();                
            -->
        </script>
<%
    }
%>  
</body>

</html>