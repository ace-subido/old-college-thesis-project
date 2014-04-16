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
    String ss3 = ss.getString("ameasure");
    
    CachedRowSet tempy2 = b.getAllMiscFees(); 
    
    String qwer = b.makeDateToString(ss.getTimestamp("sdate"))+" to "+b.makeDateToString(ss.getTimestamp("edate"));

   
    response.getWriter().write("<p><center><h2>Association Dues Details for the Billing Period of</p><br>"+qwer+"</h2><table>");

    if(ss3.equals("SQM")){               
    response.getWriter().write("<tr><th>Base charge per square meter</th><th>P "+ss2+"</th>");
    }else{
        response.getWriter().write("<tr><th>Base charge per house</th><th>P "+ss2+"</th>");
    }
    
    if(tempy3.size()>0 && tempy3!=null){
        response.getWriter().write("</tr><tr><td class='td2'>Association Charges</td><td class='td2'>Association Amount</td>");
        while(tempy3.next()){
            response.getWriter().write("<tr>");
            if(tempy3.getString("chargecomptype").equals("FLAT RATE")){
                response.getWriter().write("<td>"+tempy3.getString("chargename")+"</td><td>P "+tempy3.getDouble("chargeamt")+" (Flat Rate)</td>");
            }
            else{
                response.getWriter().write("<td>"+tempy3.getString("chargename")+"</td><td>P "+tempy3.getDouble("chargeamt")+" (Per Square Meter)</td>");
            }
            response.getWriter().write("</tr>");
        }        
    }
 
    
    if(tempy2.size()>0 && tempy2!=null){
        
        response.getWriter().write("</tr><tr><td class='td2'>Miscallenous Fees</td><td class='td2'>Fee Amount</td>");
        while(tempy2.next()){
            
              java.util.Date ewan = tempy2.getTimestamp("dDate");
              if(ewan.compareTo(yey1) > 0 && ewan.compareTo(yey2) < 0){ 
        
                if(tempy2.getString("type").equals("Misc Com")){
                  response.getWriter().write("</tr><tr><td>"+tempy2.getString("dueName")+"</td><td>"+tempy2.getDouble("feeamt")+" (Community Fee)</td>");  
                }
                else{
                    response.getWriter().write("</tr><tr><td>"+tempy2.getString("dueName")+"</td><td>"+tempy2.getDouble("feeamt")+" (Per Resident)</td>");  
                }
                  
                  
              }
        }                   
   }
        response.getWriter().write("</tr></table></center></p>");
    
}                    
    
%>