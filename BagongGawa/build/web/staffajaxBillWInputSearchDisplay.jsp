<%-- 
    Document   : getFacReserves
    Created on : Jul 19, 2008, 1:25:02 AM
    Author     : ace-dlsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxSocialGroups.js"></script>
<script type="text/javascript" src="./js/ajaxSearch.js"></script>
<%
    //display the searched resident
        
    SocialGroup sg = new SocialGroup();
       
    String q = request.getParameter("num");
    String po = (String)session.getAttribute("FirstName")+" "+(String)session.getAttribute("LastName");
        
    Vector<ResidentObject> vr = sg.getAllResidentsSuggest();
    String z ="";
        
    for(int b = 0 ; b < vr.size(); b++)
    {
        z = vr.elementAt(b).fname+" "+vr.elementAt(b).lastname;
        if(!(z.equals(po)))
        {
            if(z.equalsIgnoreCase(q))
            {
                response.getWriter().write("<h2>"+z+"</h2>");
                response.getWriter().write("<p>House Address : "+vr.elementAt(b).address);
                response.getWriter().write("<br>Telephone Number : "+vr.elementAt(b).telenumber+"</p>");                
                //button
                response.getWriter().write("<p><a href='processStaffWBillInputSelectRes.jsp?num="+vr.elementAt(b).residentid+"'/>View Account</a></p>");
            }
        }
    }
%>