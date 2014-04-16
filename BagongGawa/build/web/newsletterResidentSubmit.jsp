<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ page import="thesis.*, sun.jdbc.rowset.*"%>
	<title>Converge Generic Community Association Portal</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
	<%
		Newsletter news = new Newsletter();
		
		String subject = request.getParameter("subjectHead");
		String content = request.getParameter("content");		
                String author = news.getResidentName(Integer.toString((Integer)session.getAttribute("residentId")));
		String status = "pending";
		int id = news.getID();
                news.SubmitNewsletter(author, subject, content, status);
                response.sendRedirect("residentDash.jsp");
	%>
	You have successfully submitted your newsletter.</b>
	Your letter will be subject to the Administrators approval.
</body>
</html>
