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
		
	int id = Integer.parseInt(request.getParameter("id"));
	System.out.println(id);
	String a = request.getParameter("r");
	System.out.println(a);
	String type = request.getParameter("type");
	System.out.println(type);
	
	
	ConnectorThesis db = new ConnectorThesis();
	Thesis bum = new Thesis();
	boolean tut = bum.checkAvailable(request.getParameter("type"));
	
	if(tut)
	{
		db.editType(id, type, a);
		response.sendRedirect("assocCreateFacType.jsp");
	}
	else
	{
		%>
				
			<script type= "text/javascript">
			<!--
				
				alert("There's an available facility that uses that facility type, can't process the request");
				location = "assocCreateFacType.jsp";
			-->
			</script>
			<%	
	
	}
	
	
%>

</body>
</html>
