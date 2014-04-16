 <%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxSocialGroups.js"></script>
<%
    int a = (Integer)session.getAttribute("residentId");
      
    SocialGroup sg = new SocialGroup();            
        
    CachedRowSet ctv = sg.getMyPetRequests(); 
        
    Vector<Integer> v = sg.getResidentPetInvites(a);
        
    String petdate;   

    if(ctv.size()>0)
    {   
        response.getWriter().write("<div class='column2-unit-left'>");                       

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
                response.getWriter().write("<p>&nbsp;&nbsp;"+ctv.getString("SGDetails")+"</p>");
                response.getWriter().write("<p>&nbsp;&nbsp;<a href='processResidentJoinSocPetition.jsp?sgid="+ctv.getInt("SGID")+"'>Join Petition</a> | <a href='residentPetitionMainPage.jsp?sgid="+ctv.getInt("SGID")+"'>View Details</a></p>");
                response.getWriter().write("</div>");
            }                                    
        }
        response.getWriter().write("</div>");
    } 
    else
    {
        response.getWriter().write("<div class='column2-unit-left'><h1>My Petitions for Approval</h1>");             
        response.getWriter().write("<hr class='clear-contentunit'/>");          
        response.getWriter().write("<p><font color='red'>You have no Petitions!</font></p>");
        response.getWriter().write("</div>");
    }   
%>  