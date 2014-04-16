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
    CachedRowSet ctv = jem.getPB2(blfl);
     String vType = jem.getVillageType();
   int temp=0;
        
    if(ctv.size() >0)
    {
        if(vType.equals("phase"))
         response.getWriter().write("<p><label class='left'><b>Lots</b> </label>type the total square meters for each lot</p>");
        else
        response.getWriter().write("<p><label class='left'><b>Units</b> </label>type the total square meters for each unit</p>");
        
        while(ctv.next())
        {
            int lotNum =0;
            lotNum = jem.getNumOfLotsForBlock(blfl, phbl);
            //System.out.println(ctv.getString("catName"));
            
                   
                int nCtr=1;
                while(nCtr<=lotNum)
                {
                     temp= jem.getLotArea(nCtr, blfl, phbl);
                   //response.getWriter().write("<option name ='"+nCtr+"' onclick='getLotAreaText("+nCtr+", "+blfl+", "+phbl+")'>" + nCtr + "</option>");
                    if(vType.equals("phase"))
                     response.getWriter().write("<p><label class='left'>Lot "+nCtr+"</label> <input type='text' name='"+nCtr+"' value='"+temp+"'></p>");
                    else
                        response.getWriter().write("<p><label class='left'>Unit "+nCtr+"</label> <input type='text' name='"+nCtr+"' value='"+temp+"'></p>");
                    
                   nCtr++;
                }
                response.getWriter().write("<input type='hidden' name='totalLots' value='"+lotNum+"'>");
         }
        
        
    }
    else
    {
        response.getWriter().write("<script><!-- document.getElementById('board').write('test'); --></script>");
    }
%>