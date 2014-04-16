<%-- 
    Document   : assocAddResLtRmDropDown
    Created on : Dec 1, 2008, 1:08:11 AM
    Author     : od0902
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxgetReserve.js"></script>
<script type="text/javascript" src="./js/jem.js"></script>
<script type="text/javascript" src="./js/pao.js"></script>
<%
    int blflid = Integer.parseInt(request.getParameter("blflid"));
    
    Pao p = new Pao();
    Jem jem = new Jem();
    
    CachedRowSet ctv1 = p.getlotNum(blflid);
    
    String vType = jem.getVillageType();
    
    System.out.println("imissbadit");
    
    if(ctv1.size() > 0)
    {
        if(vType.equals("phase"))
            response.getWriter().write("<label class='left'>Lot</label>");
        else
            response.getWriter().write("<label class='left'>Room</label>");

            response.getWriter().write("<select name='ltrm' class='combo'>");
            response.getWriter().write("<option value='0'>Select...</option>");
        while(ctv1.next())
        {     
                 
                  int lotNum = ctv1.getInt("lotNum"); 
                    
                  response.getWriter().write("<option value='"+lotNum+"' name='"+lotNum+"'>"+lotNum+"</option>"); 
    
             
        }
             response.getWriter().write("</select>");
    }
     
    else
    {
        response.getWriter().write("<script><!-- document.getElementById('board').write('test'); --></script>");
    }
%>