  <%-- 
    Document   : getFacReserves
    Created on : Jul 19, 2008, 1:25:02 AM
    Author     : ace-dlsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxgetReserve.js"></script>
<script type="text/javascript" src="./js/jem.js"></script>
<%
    int blfl = Integer.parseInt(request.getParameter("blfl"));
    int phbl = Integer.parseInt(request.getParameter("phbl"));
    
    Jem jem = new Jem();
    int ctv = jem.getPB3(blfl);
     String vType = jem.getVillageType();
   int temp=0;
       
    
        if(vType.equals("phase"))
         response.getWriter().write("<p><label class='left'><b>Lot</b> </label>");
        else
        response.getWriter().write("<p><label class='left'><b>Unit</b> </label>");
        
        
            int lotNum =0;
            lotNum = jem.getNumOfLotsForBlock(blfl, phbl);
           
            //System.out.println(ctv.getString("catName"));
            
            response.getWriter().write("<select name='lotnum'>");
            if(vType.equals("phase"))
                    response.getWriter().write("<option value='0'>Select Room.. </option>");
               else
                response.getWriter().write("<option value='0'>Select Unit.. </option>");
                
                   
                int nCtr=1;
                while(nCtr<=lotNum)
                {
                     //temp= jem.getLotArea(nCtr, blfl, phbl);
                   response.getWriter().write("<option value ='"+nCtr+"' onclick='getlotDetails("+nCtr+", "+blfl+", "+phbl+")'>" + nCtr + "</option>");
                    //if(vType.equals("phase"))
                     //response.getWriter().write("<p><label class='left'>Lot "+nCtr+"</label> <input type='text' name='"+nCtr+"' value='"+temp+"'></p>");
                   // else
                      //  response.getWriter().write("<p><label class='left'>Unit "+nCtr+"</label> <input type='text' name='"+nCtr+"' value='"+temp+"'></p>");
                    
                   nCtr++;
                }
                response.getWriter().write("</select></p>");
                 response.getWriter().write("<input type='hidden' name='totalLots' value='"+lotNum+"'>");
         
        
       
    
%>