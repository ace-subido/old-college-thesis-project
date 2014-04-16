<%-- 
    Document   : getFacReserves
    Created on : Jul 19, 2008, 1:25:02 AM
    Author     : ace-dlsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>

<%
    //display the selected miscallenous fees


    int q = Integer.parseInt(request.getParameter("num"));
   
    if(q == -1){
         Billing b = new Billing();
            java.util.Date yey1 = (java.util.Date)session.getAttribute("ABPrdStart");         
            java.util.Date yey2 = (java.util.Date)session.getAttribute("ABPrdEnd");

        String ppp = b.makeDateToString(yey1);
        String lll = b.makeDateToString(yey2);
        
          CachedRowSet tempy2 = b.getAllMiscFees(); 
          
          

            if(tempy2.size()>0){
                response.getWriter().write("<p><center><h2>Miscallenous Dues for the Billing Period of</p><br>"+ppp+" to "+lll+"</h2><table>");
                response.getWriter().write("<tr><th>Charge Name</th><th>Amount</th><th>");
                   while(tempy2.next()){
                   java.util.Date ewan = tempy2.getTimestamp("dDate");
                   if(ewan.compareTo(yey1) > 0 && ewan.compareTo(yey2) < 0){ 
                       if(tempy2.getString("type").equals("Misc Com")){
                           response.getWriter().write("</tr><tr><td> "+tempy2.getString("dueName")+"</td><td>P "+tempy2.getDouble("feeamt")+" (Community Fee)</td><td><a href='processStaffRemoveMiscDue.jsp?num="+tempy2.getInt("bid")+"'>Remove this fee</a></td>");  
                       }
                       else{
                           response.getWriter().write("</tr><tr><td> "+tempy2.getString("dueName")+"</td><td>P "+tempy2.getDouble("feeamt")+" (Community Fee)</td><td><a href='processStaffRemoveMiscDue.jsp?num="+tempy2.getInt("bid")+"'>Remove this fee</a></td>");  
                       }
                    }
                   }    
                response.getWriter().write("</tr></table></center></p>");                              
              }   
                
    }   
    else if(q!=0){      
    
   
    
         Billing b = new Billing();
         
          CachedRowSet ss = b.getAllAssIssuedBatchWITHID(q);
            ss.next();
        java.util.Date yey1 = ss.getTimestamp("sdate");         
        java.util.Date yey2 = ss.getTimestamp("edate");     

        String ppp = b.makeDateToString(yey1);
        String lll = b.makeDateToString(yey2);
        
          CachedRowSet tempy2 = b.getAllMiscFees(); 
          
          

            if(tempy2.size()>0){
                response.getWriter().write("<p><center><h2>Miscallenous Dues for the Billing Period of</p><br>"+ppp+" to "+lll+"</h2><table>");
                response.getWriter().write("<tr><th>Charge Name</th><th>Amount</th>");
                   while(tempy2.next()){
                   java.util.Date ewan = tempy2.getTimestamp("dDate");
                   if(ewan.compareTo(yey1) > 0 && ewan.compareTo(yey2) < 0){ 
                       if(tempy2.getString("type").equals("Misc Com")){
                           response.getWriter().write("</tr><tr><td> "+tempy2.getString("dueName")+"</td><td>P "+tempy2.getDouble("feeamt")+" (Community Fee)</td>");  
                        }
                        else{
                            response.getWriter().write("</tr><tr><td> "+tempy2.getString("dueName")+"</td><td>P "+tempy2.getDouble("feeamt")+" (Per Resident)</td>");  
                        }
                    }
                   }    
                response.getWriter().write("</tr></table></center></p>");                              
              }   
    }
else{
        response.getWriter().write("");                              
}                    
                
    
%>