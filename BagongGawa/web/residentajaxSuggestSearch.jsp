 <%-- 
    Document   : getFacReserves
    Created on : Jul 19, 2008, 1:25:02 AM
    Author     : ace-dlsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxSocialGroup.js"></script>
<script type="text/javascript" src="./js/ajaxSearch.js"></script>
<%        
    //displays the suggested
        
    SocialGroup sg = new SocialGroup();
       
    String q = request.getParameter("num");
    String po = (String)session.getAttribute("FirstName")+" "+(String)session.getAttribute("LastName");
        
    Vector<ResidentObject> vr = sg.getAllResidentsSuggest();
        
    String a = "";
    String z = "";
    String y = "";
        
    if(q.length() != 0)
    {
        for(int b = 0; b < vr.size(); b++)
        {
            int x = -1;
            int j = -1;
            z = vr.elementAt(b).fname+" "+vr.elementAt(b).lastname;
            x = z.indexOf(q);
            
            if(!(z.equals(po)))
            {
                if(q.length()==1)
                {
                    a = z;
                    a = a.toLowerCase();
                
                    if(a.charAt(0)==q.charAt(0))
                    {
                        x = 0;
                    }              
                }
                if(x!=-1)
                {
                    if(y=="")
                    {
                        y = "<p>"+z;
                    }
                    else
                    {
                        y = y +", "+z;
                    }
                }
            }
        }
    }
    if(y=="")
    {
        response.getWriter().write("<p>There are no suggestions</p>");
    }
    else
    {
        // response.getWriter().write("<div style='width:300px; height:150px; overflow:auto'>");
        response.getWriter().write(y);
        //response.getWriter().write("</div>");
    }   
%>