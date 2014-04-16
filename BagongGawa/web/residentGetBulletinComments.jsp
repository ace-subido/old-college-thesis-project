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
    String bulId = request.getParameter("bulId");
       
    ConnectorThesis ct = new ConnectorThesis();
    int bullid = Integer.parseInt(bulId);
    CachedRowSet ctv = ct.getBulletinComments(bullid);
    CachedRowSet cr = ct.getBulletinPostBasedOnParent(bullid);
    cr.next();
    if(ctv.size() >0)
    {
        while(ctv.next())
        {
            String link = "residentBulletinEditComment.jsp?content="+ctv.getString("commentContent")+"&commentid="+ctv.getString("commentid")+"&title="+cr.getString("bulletinTitle")+"&cat="+cr.getString("category");
            String del = "residentBulletinDeleteComment.jsp?commentid="+ctv.getString("commentid")+"&title="+cr.getString("bulletinTitle")+"&cat="+cr.getString("category");
            response.getWriter().write("<p><div class='subcontent-unit-border'><div class='round-border-topleft'></div><div class='round-border-topright'></div><h1 align='center'><b>"+ctv.getString("poster")+"</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;wrote on :"+ctv.getString("commentDate")+" </h1><br><p>"+ctv.getString("commentContent")+" </p></div></p>"); 
            if(ctv.getString("poster").equals((String)session.getAttribute("uname")))
            {
                if(!cr.getString("locked").equals("Yes"))
                {
                    response.getWriter().write("<a href='"+link+"'>edit</a>");
                    response.getWriter().write("<a href='"+del+"'>delete</a>");
                }
                System.out.println(ctv.getString("commentContent"));
                System.out.println(ctv.getString("parentBulletId"));
                System.out.println(cr.getString("bulletinTitle"));
                System.out.println(cr.getString("category"));
            }
        }
    }   
%>