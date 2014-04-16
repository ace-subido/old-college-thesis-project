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
    
    System.out.println("nasa assocgetblfl3 na");
    
    Jem jem = new Jem();
    //jem.getPB3(blfl);
    int totalBl = jem.getPB3(blfl);
     String vType = jem.getVillageType();
   
        if(vType.equals("phase"))
         response.getWriter().write("<p><label class='left'><b>Block</b> </label>");
        else
        response.getWriter().write("<p><label class='left'><b>Floor</b> </label>");
        
    
            //System.out.println(ctv.getString("catName"));
              response.getWriter().write("<select name='blfl'>");
                int nCtr=1;
                int lotNum =0;
                if(vType.equals("phase"))
                    response.getWriter().write("<option value='0'>Select Block.. </option>");
                else
                    response.getWriter().write("<option value='0'>Select Floor.. </option>");
                
                    
                while(nCtr<=totalBl)
                {
                    //lotNum = jem.getNumOfLotsForBlock(nCtr, blfl);
                    //if(vType.equals("phase"))
                        response.getWriter().write("<option value='"+nCtr+"' onclick='getLots2("+blfl+", "+nCtr+")'>"+nCtr +"</option>");
                   // else
                        
                    
                  // response.getWriter().write("<option value="+ nCtr+ " onclick='getLotRoom("+nCtr+","+blfl+")'>" + nCtr + "</option>");
                   nCtr++;
                }
            response.getWriter().write("<input type='hidden' value='"+totalBl+"' name='totalFlr'>");
            response.getWriter().write("</select></p>");
                
        
    
%>