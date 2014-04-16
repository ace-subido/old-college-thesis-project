 <%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxSocialGroups.js"></script>
<%
    int a = (Integer)session.getAttribute("residentId");
         
    SocialGroup sg = new SocialGroup();            
        
    CachedRowSet ctv = sg.getSocialGroups();   
        
    Vector<Integer> v = sg.getResidentMembers(a);
        
    String petdate;   

    if(ctv.size()>0)
    {
        response.getWriter().write("<div class='column1-unit'><h1>Social Groups</h1>");            
                                            
        while(ctv.next())
        { 
            int x = 0;
            for(int l=0; v.size() > l; l++)
            {
                x = v.elementAt(l);
                if(ctv.getInt("SGID")==x)
                {
                    x=ctv.getInt("SGID");
                     l = v.size();
                }
            }                   
            if(x==0 || x!=ctv.getInt("SGID"))
            { 
                petdate = sg.makePetDateToString(ctv.getTimestamp("SGStartDate"));                 
                response.getWriter().write("<hr class='clear-contentunit'/>");          
                response.getWriter().write("<div onmouseover=style.backgroundColor='#F6FFDE'; onmouseout=style.backgroundColor='#FFFFFF';>");          
                response.getWriter().write("<h2>&nbsp;&nbsp;"+ctv.getString("SGName")+"</h2><br>");
                response.getWriter().write("<h3>&nbsp;&nbsp;Requested by : "+ctv.getString("SGRHNme")+"</h3>");
                response.getWriter().write("<h3>&nbsp;&nbsp;Date : "+petdate+"</h3>");
                response.getWriter().write("<h3>&nbsp;&nbsp;Category : "+ctv.getString("SGCategory")+"</h3>");
                response.getWriter().write("<h3>&nbsp;&nbsp;Group Type : "+ctv.getString("SGMemSet")+"</h3>");
                response.getWriter().write("<p>&nbsp;&nbsp;"+ctv.getString("SGDetails")+"</p>");
                response.getWriter().write("<p>&nbsp;&nbsp;<a href='residentSocialGroupMainPage.jsp?sgid="+ctv.getInt("SGID")+"'>View Group Page</a> | <a href='staffCloseSocGroup.jsp?sgid="+ctv.getInt("SGID")+"'>Close this Group</a></p>");
                response.getWriter().write("</div>");
            }                                    
        }
        response.getWriter().write("</div>");
    }
    else
    {
        response.getWriter().write("<div class='column1-unit'><h1>Social Groups Petitions</h1>");            
                                        
        
        response.getWriter().write("<hr class='clear-contentunit'/>");          
        response.getWriter().write("<p><font color='red'> No Community Petitions!</font></p>");
        response.getWriter().write("</div>");
    }     
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