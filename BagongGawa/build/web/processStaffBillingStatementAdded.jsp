 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.Calendar, java.util.*"%>

<% 
    
     int billbatch = (Integer)session.getAttribute("billbatch");
       String expName = request.getParameter("expName");
    int amount = Integer.parseInt(request.getParameter("amount"));
    
    Vector<String> vname = (Vector<String>)session.getAttribute("vname");
    vname.add(expName);
     session.setAttribute("vname", vname);
     Vector<Integer> vamount = (Vector<Integer>)session.getAttribute("vamount");
    vamount.add(amount); 
     session.setAttribute("vamount", vamount);
       
    response.sendRedirect("staffBillingStatement.jsp");
 
%>
