 <%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxSocialGroup.js"></script>
<%
    String name = request.getParameter("num");
    SocialGroup sg = new SocialGroup();
            
    CachedRowSet ctv = sg.getStaffFAppPetbyCat(name);
    CachedRowSet crset = sg.getSocGCat();
        
    String petdate;   
        
    if(ctv.size() >0)
    {
        response.getWriter().write("<div id='petpetright' class='column2-unit-right'><h1>Petitions for Directors Approval</h1>");
        response.getWriter().write("<p>List by Category : <select name='catsz3' id='catsz3' class='combo'><option value='0'> Select... </option>");
             
        while(crset.next())
        {
            response.getWriter().write("<option value='"+crset.getString("scatName")+"'> "+crset.getString("scatName")+" </option>");                       
        }                                   
        response.getWriter().write("</select>&nbsp;&nbsp;<input type='button' value='Filter' onclick='staffFilterbyCatforApp()'/></p>");                                           

        while(ctv.next())
        {
            petdate = sg.makePetDateToString(ctv.getTimestamp("SGStartDate")); 
            response.getWriter().write("<hr class='clear-contentunit2'/>");          
            response.getWriter().write("<div onmouseover=style.backgroundColor='#F6FFDE'; onmouseout=style.backgroundColor='#FFFFFF';>");          
            response.getWriter().write("<h2>&nbsp;&nbsp;"+ctv.getString("SGName")+"</h2><br>");
            response.getWriter().write("<h3>&nbsp;&nbsp;Requested by : "+ctv.getString("SGRHNme")+"</h3>");
            response.getWriter().write("<h3>&nbsp;&nbsp;Date : "+petdate+"</h3>");
            response.getWriter().write("<h3>&nbsp;&nbsp;Category : "+ctv.getString("SGCategory")+"</h3>");
            response.getWriter().write("<p>&nbsp;&nbsp;"+ctv.getString("SGDetails")+"</p>");
            response.getWriter().write("<p>&nbsp;&nbsp;<a href='staffPetitionMainPage.jsp?sgid="+ctv.getInt("SGID")+"'>View Details</a> | <a href='staffRemovePetitionGroup.jsp?sgid="+ctv.getInt("SGID")+"'>Remove Petition</a></p>");
            response.getWriter().write("</div>");
        }
        response.getWriter().write("</div>");
    }
    else
    {
        response.getWriter().write("<div id='petpetright' class='column2-unit-right'><h1>Petitions for Directors Approval</h1>");
        response.getWriter().write("<p>List by Category : <select name='catsz3' id='catsz3' class='combo'><option value='0'> Select... </option>");
             
        while(crset.next())
        {
            response.getWriter().write("<option value='"+crset.getString("scatName")+"'> "+crset.getString("scatName")+" </option>");                       
        }                                   
        response.getWriter().write("</select>&nbsp;&nbsp;<input type='button' value='Filter' onclick='staffFilterbyCatforApp()'/></p>");                                           
        response.getWriter().write("<p><font color='red'> No Petition Requests for that Category!</font></p>");
        response.getWriter().write("</div>");
    }
        
       // CachedRowSet ctv2 = sg.getStaffAppPet();
        
       /*
         <div class="column2-unit-left">
          <h1>Heading h1</h1>                            
          <h2>Heading h3</h2>
          <p>Lorem ipsum dolor sit amet, consectetuer <a href="#">adipiscing elit</a>, sed diam nonummy nibh euismod tincidunt ut laoreet dolore <a href="#">magna aliquam</a> erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip.</p>
          <h1>Heading h1</h1>                            
          <h2>Heading h3</h2>
        <p>Lorem ipsum dolor sit amet, consectetuer <a href="#">adipiscing elit</a>, sed diam nonummy nibh euismod tincidunt ut laoreet dolore <a href="#">magna aliquam</a> erat volutpat. Ut wisi enim ad minim veniam.</p>
        </div>
        <div class="column2-unit-right">
          <h1>Heading h1</h1>                            
          <h3>Heading h3</h3>

          <p>Lorem ipsum dolor sit amet, consectetuer <a href="#">adipiscing elit</a>, sed diam nonummy nibh euismod.</p>
          <h1>Heading h1</h1>                            
          <h3>Heading h3</h3>
          <p>Lorem ipsum dolor sit amet, consectetuer <a href="#">adipiscing elit</a>, sed diam nonummy nibh euismod.</p>
          <h1>Heading h1</h1>                            
          <h3>Heading h3</h3>

          <p>Lorem ipsum dolor sit amet, consectetuer <a href="#">adipiscing elit</a>, sed diam nonummy nibh euismod.</p>
        </div>

        */         
%>       