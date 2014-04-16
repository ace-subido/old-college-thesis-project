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
         response.getWriter().write("&nbsp;&nbsp;<p><label class='left'><font size='3'><b>Blocks</b> </font></label> type the number of lots for each block</p>");
        else
        response.getWriter().write("&nbsp;&nbsp;<p><label class='left'><font size='3'><b>Floors <b></font></label> type the number of units for each floor</p>");
        
        while(ctv.next())
        {
            //System.out.println(ctv.getString("catName"));
              
                int nCtr=1;
                int lotNum =0;
                while(nCtr<=ctv.getInt("blockflr"))
                {
                    lotNum = jem.getNumOfLotsForBlock(nCtr, blfl);
                    if(vType.equals("phase"))
                        response.getWriter().write("<p><label class='left'>block "+nCtr +"</label> <input type='text' name='"+nCtr+"' class='field' value='"+lotNum+"'></p>");
                    else
                        response.getWriter().write("<p><label class='left'>floor "+nCtr +"</label> <input type='text' name='"+nCtr+"' class='field' value='"+lotNum+"'></p>");
                    
                  // response.getWriter().write("<option value="+ nCtr+ " onclick='getLotRoom("+nCtr+","+blfl+")'>" + nCtr + "</option>");
                   nCtr++;
                }
            response.getWriter().write("<input type='hidden' value='"+ctv.getInt("blockflr")+"' name='totalFlr'>");
        
                
        }
        response.getWriter().write("<input type='submit' class='button2' value='Save'>");
        
    }
     
    else
    {
        response.getWriter().write("<script><!-- document.getElementById('board').write('test'); --></script>");
    }
%>