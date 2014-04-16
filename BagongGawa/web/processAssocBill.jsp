 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>

<%
    String estate = request.getParameter("estateCheckBox");
    String water = request.getParameter("waterCheckBox");
    String garbage = request.getParameter("garbageCheckBox");
    String security = request.getParameter("securityCheckBox");
    String salary = request.getParameter("salaryCheckBox");
    String addStaff = request.getParameter("addForStaff");
    FacId fi = new FacId();
    fi.BillTemplate(estate, water, garbage, salary, security, addStaff);
    
    
    response.sendRedirect("assocBill.jsp");
%>


