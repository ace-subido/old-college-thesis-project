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
		
	int total = Integer.parseInt(request.getParameter("total"));
	int x=1;
        Jem jem = new Jem();
        
        while(x<=total)
        {
            int blocks  = Integer.parseInt(request.getParameter(Integer.toString(x)));
            jem.saveNumOfBloFlo(x, blocks);
            x++;
        }
        
        response.sendRedirect("assocSetupPartResidentialLots2.jsp");
        
%>

</body>
</html>
