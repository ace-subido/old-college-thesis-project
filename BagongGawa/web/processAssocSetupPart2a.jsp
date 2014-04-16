 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <meta http-equiv="cache-control" content="no-cache" />
  <meta http-equiv="expires" content="3600" />
  <meta name="revisit-after" content="2 days" />
  <meta name="robots" content="index,follow" />
  <meta name="publisher" content="Your publisher infos here ..." />
  <meta name="copyright" content="Your copyright infos here ..." />
  <meta name="author" content="Design: Wolfgang (www.1-2-3-4.info) / Modified: Your Name" />
  <meta name="distribution" content="global" />
  <meta name="description" content="Your page description here ..." />
  <meta name="keywords" content="Your keywords, keywords, keywords, here ..." />
  <link rel="stylesheet" type="text/css" media="screen,projection,print" href="./css/layout4_setup.css" />
  <link rel="stylesheet" type="text/css" media="screen,projection,print" href="./css/layout4_text.css" />
 <script type="text/javascript" src="./js/ieflickerhack.js"></script>  
  <link rel="icon" type="image/x-icon" href="./img/favicon.ico" />
  <title>Converge - Administrator : Community Facilities</title></head>

<body>
<%	
	if(session.getAttribute("uname") == null)
		response.sendRedirect("homepage.jsp");
	
	
	
	String formT = request.getParameter("formType");
	String name = request.getParameter("n");
	String location = request.getParameter("l");
	String type = request.getParameter("t");
	String reservation = request.getParameter("r");
	String capacity = request.getParameter("c");
	String area = request.getParameter("a");
	String resFee = request.getParameter("rf") == null? "0" : request.getParameter("rf");
	String av = request.getParameter("av");
	

	Thesis db1 = new Thesis();

	
	
	if (formT.equals("new"))
	{
		addFacility bom = new addFacility();
		String lol = request.getParameter("totalFac");
		System.out.print(lol);
		int f = db1.ifFacExists(name);
                
                int temp =Integer.parseInt(lol);
                temp++;
		
		if(f != 1)
		{
		bom.addFac(reservation, name, Integer.parseInt(capacity), type, Integer.parseInt(area), location, Integer.parseInt(resFee),  Integer.parseInt(lol), "available");
                if(Integer.parseInt(resFee)>0)
                    response.sendRedirect("assocFacReserveSettings2.jsp?tit="+temp);
                else
                    response.sendRedirect("assocSetupPart2.jsp");
		}
		else{

		%>
				
			<script type= "text/javascript">
			<!--
				
				alert("That facility already exists");
				location = "assocSetupPart2a.jsp?facility=0";
			-->
			</script>
			<%
		
			
		
		}
	}
	
	if(formT.equals("old"))
	{
		Thesis db = new Thesis();
		String temp = request.getParameter("id");
		String dick = request.getParameter("lok");
		String cum = request.getParameter("n");
		if(dick.equals(cum))
		{
			System.out.println(dick + "tite");
			System.out.println(cum);
			db.updateFacility(reservation, name, Integer.parseInt(capacity), type, Integer.parseInt(area), location, Integer.parseInt(resFee), Integer.parseInt(temp), av);
			response.sendRedirect("assocSetupPart2a.jsp?facility="+temp+"");
		}
		else if(db1.ifFacExists(cum) == 1){
		%>
			<form name="bra1" method="get">
				<input type="hidden" value="<%=temp%>" name="tew">
			</form>	
			<script type= "text/javascript">
			<!--
				var wtf = document.bra1.tew.value;
				alert("That facility already exists");
				location = "assocSetupPart2a.jsp?facility=" + wtf;
			-->
			</script>
			<%
		
		}
		else{
                db.updateFacility(reservation, name, Integer.parseInt(capacity), type, Integer.parseInt(area), location, Integer.parseInt(resFee), Integer.parseInt(temp), av);
			response.sendRedirect("assocSetupPart2a.jsp?facility="+temp+"");
                }
	}
	
%>


</body>
</html>