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

    String formT = request.getParameter("formType");	
    int VillID = Integer.parseInt(request.getParameter("id"));
    String aName = request.getParameter("villname");
    String bAd = request.getParameter("villad");
    String cDiv = request.getParameter("villunit");
    String what = request.getParameter("hiddenname");
    int a = 0;
    
    String f = "";
    Thesis db = new Thesis();

    if (formT.equals("new"))
    {
        db.setVillageInfo(aName, bAd, cDiv, a, f);
%>
        <script type= "text/javascript">
        <!--
            alert("Setting Village Information success");
            location = "assocSetupPart1.jsp";
        -->
        </script>
<%
    }
    else
    {
        db.updateVillageInfo(VillID, aName, bAd, cDiv, a, f);
%>				
        <script type= "text/javascript">
        <!--			
            location = "assocVillInfo.jsp";
            alert("Edit Village Information success");
        -->
        </script>
<%
    }
%>
</body>
</html>s