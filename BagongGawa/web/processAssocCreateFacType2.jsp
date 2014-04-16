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
		
		String t = request.getParameter("name");
		String lol = request.getParameter("totalType");
		
	Thesis db2 = new Thesis();
	addFacility keps = new addFacility();
	int f = keps.ifTypeExists(t);
	
	if (f != 1)
	{
		db2.addFacType(t, "available", Integer.parseInt(lol));
		response.sendRedirect("assocSetupPart1a.jsp");
	}
	else
	{
	%>
		<script type= "text/javascript">
			<!--
				
				alert("That facility type already exists");
				location = "assocSetupPart1a.jsp";
			-->
		</script>
	<%
	}
%>

</body>
</html>
