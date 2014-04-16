 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
<html>
    <head>
        <script type="text/javascript" src="./js/ajaxSearch.js"></script>
    </head>
    <body>
        
    </body>
</html>
<%
    SocialGroup sg = new SocialGroup();

    String q = request.getParameter("num");
    String po = (String)session.getAttribute("uname");

    Vector<ResidentObject> vr = sg.getAllResidentsSuggest();

    String a = "";
    String z = "";
    String y = "";

    if(q.length() != 0)
    {
        for(int b = 0; b < vr.size(); b++)
        {
            int x = -1;
            
            z = vr.elementAt(b).fname + " " + vr.elementAt(b).lastname;
            int jem = vr.elementAt(b).residentid;
            
            x = z.indexOf(q);
            
            if(!(z.equals(po)))
            {
                if(q.length()==1)
                {
                    a = z;
                    a = a.toLowerCase();
                    System.out.println(a);
                    if(a.charAt(0)==q.charAt(0))
                    {
                        x = 0;
                    }              
                }
                if(x!=-1)
                {
                    if(y=="")
                    {
                        y = "<center><p>&nbsp;<a onclick='displayEWAN("+jem+")'/>"+z+"</a></center>";
                    }
                    else
                    {
                        y = y +"<center>&nbsp;<p><a onclick='displayEWAN("+jem+")'/>"+z+"</a></p></center>";
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