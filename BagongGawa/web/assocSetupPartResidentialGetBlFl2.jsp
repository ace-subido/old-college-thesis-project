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
    
    Jem jem = new Jem();
    CachedRowSet ctv = jem.getPB2(blfl);
     String vType = jem.getVillageType();
   
        
    if(ctv.size() >0)
    {
        if(vType.equals("phase"))
         response.getWriter().write("<p>&nbsp;&nbsp;&nbsp;<font size='3'>Block &nbsp;&nbsp;&nbsp;</font>");
        else
        response.getWriter().write("<p>&nbsp;&nbsp;&nbsp;<font size='3'>Floor &nbsp;&nbsp;&nbsp;</font>");
        
        response.getWriter().write("<select name='blfl' class='combo'>");
                   
        while(ctv.next())
        {
            //System.out.println(ctv.getString("catName"));
              
                int nCtr=1;
                int lotNum =0;
                response.getWriter().write("<option value='0'>Select.. </option>");
                while(nCtr<=ctv.getInt("blockflr"))
                {
                    //lotNum = jem.getNumOfLotsForBlock(nCtr, blfl);
                    //if(vType.equals("phase"))
                        response.getWriter().write("<option value='"+nCtr+"' onclick='getLots("+blfl+", "+nCtr+")'>"+nCtr +"</option>");
                   // else
                        
                    
                  // response.getWriter().write("<option value="+ nCtr+ " onclick='getLotRoom("+nCtr+","+blfl+")'>" + nCtr + "</option>");
                   nCtr++;
                }
            response.getWriter().write("<input type='hidden' value='"+ctv.getInt("blockflr")+"' name='totalFlr'>");
        
                
        }
        response.getWriter().write("</select></p>");
       
        
    }
     
    else
    {
        response.getWriter().write("<script><!-- document.getElementById('board').write('test'); --></script>");
    }
%>