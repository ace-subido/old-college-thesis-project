<%-- 
    Document   : getFacReserves
    Created on : Jul 19, 2008, 1:25:02 AM
    Author     : ace-dlsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>

<%
    //display the selected bill batch
          
    int q = Integer.parseInt(request.getParameter("num"));
    
    Billing b = new Billing();
     if(q!=0){
    CachedRowSet tempy3 = b.getAChargesWITHISSUEID(q);    
    CachedRowSet ss = b.getAllAssIssuedBatchWITHID(q);
    ss.next();
    
    java.util.Date yey1 = ss.getTimestamp("sdate");         
    java.util.Date yey2 = ss.getTimestamp("edate");     
    
    double ss2 = ss.getDouble("basecharge");
    
    
    CachedRowSet tempy2 = b.getAllMiscFees(); 
    
    String qwer = b.makeDateToString(ss.getTimestamp("sdate"))+" to "+b.makeDateToString(ss.getTimestamp("edate"));

   
    response.getWriter().write("<p><center><h2>Water Bill Details for the Billing Period of</p><br>"+qwer+"</h2><table>");

         
    response.getWriter().write("<tr><th>Base charge per cubic meter</th><th>P "+ss2+"</th>");
   
    
    
    if(tempy3.size()>0 && tempy3!=null){
        response.getWriter().write("</tr><tr><td class='td2'>Water Bill Charges</td><td class='td2'>Amount</td>");
        while(tempy3.next()){
            response.getWriter().write("<tr>");
            if(tempy3.getString("chargecomptype").equals("FLAT RATE")){
                response.getWriter().write("<td>"+tempy3.getString("chargename")+"</td><td>P "+tempy3.getDouble("chargeamt")+" (Flat Rate)</td>");
            }
            else{
                response.getWriter().write("<td>"+tempy3.getString("chargename")+"</td><td>P "+tempy3.getDouble("chargeamt")+" (Per Cubic Meter)</td>");
            }
            response.getWriter().write("</tr>");
        }        
    }
 
    
        response.getWriter().write("</tr></table></center></p>");
    
}                    
    
%>