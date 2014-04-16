 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>

<html>
<head>
  <link rel="stylesheet" type="text/css" media="screen,projection,print" href="./css/layout4_setup.css" />
  <link rel="stylesheet" type="text/css" media="screen,projection,print" href="./css/layout4_text.css" />

  <script type="text/javascript" src="./js/ieflickerhack.js"></script>  
  <link rel="icon" type="image/x-icon" href="./img/favicon.ico" />
  <title>Converge Generic Community Association Portal</title>
</head>
<body>
<% 
    for (Object name : Collections.list(session.getAttributeNames()))
    {
        session.removeAttribute((String)name);
    }     
    Thesis db = new Thesis();
    Unit u = new Unit();

    String tet = u.getDivUnit();
    String username = request.getParameter("n");
    String password = request.getParameter("p");

    Account r = new Account();
    CachedRowSet dirSet = r.getAllWaitDirector();
    Polls poll = new Polls();
    int starting = poll.getStart();
    
    Calendar myCalendar = Calendar.getInstance();
    int month = myCalendar.get(Calendar.MONTH)+1;
    int year = myCalendar.get(Calendar.YEAR);
    int day = myCalendar.get(Calendar.DATE);
    if(dirSet!=null){
    while(dirSet.next())
    {
        if(starting<=day)
        {    
            r.updateType(dirSet.getInt("resId"),"Director");
            r.servingDirector(dirSet.getInt("dirId"));
        }   
    }  
    }
    CachedRowSet crset = db.getResidents(request.getParameter("n"));
    session.setAttribute("cset", crset);

    serviceTemplate t = new  serviceTemplate();
    CachedRowSet Service = t.getServices();
                        
    if(crset.size() == 0)
    {
%>
        <div align="center"><h1>Username cannot be found please </h1></div>
	<div align="center"><a href ="homepage.jsp"><h1>Login again</h1></a></div>
<%
    }
    
    while(crset.next())
    {
	String pass = crset.getString("Password");
	String type = crset.getString("UserType");
	String status = crset.getString("Status");
        //String billing = Service.getString("billing");
        //String lot = crset.getString("LotArea");
        //String houses = crset.getString("UnitCount");
                 
        if(password.equals(pass)&& status.equalsIgnoreCase("Enabled"))
	{
            if(type.equals("Resident"))
            {
		session.setAttribute("uname", username);
		session.setAttribute("divunit", tet);
                session.setAttribute("type", type);
                session.setAttribute("FamId", crset.getInt("FamId"));
                session.setAttribute("residentId", crset.getInt("ResId"));     
                session.setAttribute("LastName", crset.getString("LastName"));
                session.setAttribute("FirstName", crset.getString("FirstName"));                                                                                          
                response.sendRedirect("residentDash.jsp");			
            }
            if(type.equals("Director"))
            {
                session.setAttribute("uname", username);
                session.setAttribute("divunit", tet);
                session.setAttribute("type", type);
                session.setAttribute("FamId", crset.getInt("FamId"));
                session.setAttribute("residentId", crset.getInt("ResId"));
                session.setAttribute("LastName", crset.getString("LastName"));
                session.setAttribute("FirstName", crset.getString("FirstName"));
                response.sendRedirect("residentDash.jsp");                      
            }
            if(type.equals("Staff"))
            {
                session.setAttribute("uname", username);
                session.setAttribute("divunit", tet);
                session.setAttribute("type", type);
                session.setAttribute("FamId", crset.getInt("FamId"));
                session.setAttribute("residentId", crset.getInt("ResId"));
                session.setAttribute("LastName", crset.getString("LastName"));
                session.setAttribute("FirstName", crset.getString("FirstName"));
                response.sendRedirect("staffDash.jsp");
            }
            if (type.equals("Administrator"))
            {
                session.setAttribute("uname", username);
                session.setAttribute("divunit", tet);
                session.setAttribute("type", type);
                session.setAttribute("FamId", crset.getInt("FamId"));
                session.setAttribute("residentId", crset.getInt("ResId"));
                session.setAttribute("LastName", crset.getString("LastName"));
                session.setAttribute("FirstName", crset.getString("FirstName"));
                response.sendRedirect("associationDash.jsp");
            }
        }
        else if(status.equalsIgnoreCase("Disabled"))
        {
            session.setAttribute("uname", username);
            session.setAttribute("divunit", tet);
            session.setAttribute("type", type);
            session.setAttribute("FamId", crset.getInt("FamId"));
            session.setAttribute("residentId", crset.getInt("ResId"));
            session.setAttribute("LastName", crset.getString("LastName"));
            session.setAttribute("FirstName", crset.getString("FirstName"));
            response.sendRedirect("residentDashDisabled.jsp");
        }
        else 
        {
%>
            <div align="center"><h1>Incorrect password</h1></div>
            <div align="center"><a href ="homepage.jsp"><h1>login again</h1></a></div>
<%
        }
    }
%> 	
</body>
</html>