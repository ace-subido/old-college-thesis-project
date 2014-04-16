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
   
        
    if(ctv.size() >0)
    {
        if(vType.equals("phase"))
         response.getWriter().write("&nbsp;&nbsp;<font size='3'>Block &nbsp;&nbsp;</font>&nbsp;&nbsp;<select class = 'combo' id='blflr'>");
        else
        response.getWriter().write("&nbsp;&nbsp;<font size='3'>Floor &nbsp;&nbsp;</font><select class = 'combo' id='blflr'>");
        
        while(ctv.next())
        {
            //System.out.println(ctv.getString("catName"));
            response.getWriter().write("<option value='0'>Select... </option>");
                   
                int nCtr=1;
                while(nCtr<=ctv.getInt("blockflr"))
                {
                   response.getWriter().write("<option value="+ nCtr+ " onclick='getLotRoom("+nCtr+")'>" + nCtr + "</option>");
                   nCtr++;
                }
         }
        response.getWriter().write("</select>");
    }
    else
    {
        response.getWriter().write("<script><!-- document.getElementById('board').write('test'); --></script>");
    }
%>