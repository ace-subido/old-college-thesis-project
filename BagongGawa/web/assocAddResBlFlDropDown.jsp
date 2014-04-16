<%-- 
    Document   : assocAddResBlFlDropDown
    Created on : Nov 30, 2008, 10:57:45 PM
    Author     : od0902
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxgetReserve.js"></script>
<script type="text/javascript" src="./js/jem.js"></script>
<script type="text/javascript" src="./js/pao.js"></script>
<%
    int phbd = Integer.parseInt(request.getParameter("phbd"));
    
    Pao p = new Pao();
    Jem jem = new Jem();
    
    CachedRowSet ctv1 = p.getBlFl(phbd);
    
    String vType = jem.getVillageType();
    
    System.out.println("HOYYYYYY");
    
    if(ctv1.size() > 0)
    {
        if(vType.equals("phase"))
            response.getWriter().write("<label class='left'>Block</label>");
        else
            response.getWriter().write("<label class='left'>Floor</label>");
        
            response.getWriter().write("<select name='blfl' class='combo'>");
            response.getWriter().write("<option value='0'>Select...</option>");
        while(ctv1.next())
        {     
                 
                  int blflid = ctv1.getInt("blflid"); 
                    
                  response.getWriter().write("<option value='"+blflid+"' name='"+blflid+"' onclick='getLotNum("+blflid+")'> "+blflid+"</option>"); 
    
             
        }
             response.getWriter().write("</select>");
    }
     
    else
    {
        response.getWriter().write("<script><!-- document.getElementById('board').write('test'); --></script>");
    }
%>
