 <%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxgetReserve.js"></script>
<%              
    String cat = request.getParameter("bullCategory");
    String bName=request.getParameter("bName");
    String textArea=request.getParameter("textarea1");
    java.util.Date utilDate = new java.util.Date();
    String user =(String)session.getAttribute("uname");
    ConnectorThesis ct = new ConnectorThesis();
    addFacility af = new addFacility();
    Unit u = new Unit();
    int i = af.getLastBulletinId();
    System.out.println(cat);
    System.out.println(textArea);

    if(i>0)
        u.updateBulletinFromAdminLatest();
    i++;   

    if(ct.checkBulletinTitle(bName)==0)
    {
        ct.addBulletinPost(cat, bName, textArea, i, user, utilDate);
%>
        <p><img src="img/ajax-loader.gif"></p>
        <script type= "text/javascript">
        <!--  
            alert("Posted NEW message to bulleinboard");
            location = 'residentBulletinBoard.jsp';                             
        -->    
        </script>
<%
    }
    else
    {
%>
        <script type= "text/javascript">
        <!-- 
            ("A post with that Title already exists");
        -->    
        </script>
<%
    }
%>