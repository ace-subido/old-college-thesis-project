<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
<%
        
        Billing blg = new Billing();
       
        String q = request.getParameter("num");
        String po = (String)session.getAttribute("uname");
        
        Vector<ResidentObject> vr = new Vector<ResidentObject>();
        Vector<Integer> v2v = blg.getUnPaidResidents();
        
       for(int oo=0; oo<v2v.size();oo++)
       {   int tempp = 0;
            tempp = v2v.elementAt(oo);
           
            for(int pp=0; pp<v2v.size();pp++){
                if(pp!=oo){
                    if(tempp == v2v.elementAt(pp)){
                        v2v.removeElementAt(pp);
                    }
                }
            }
         
        }
        
        
        for(int x=0; x<v2v.size();x++)
        {
            vr.add(blg.getResidentObject(v2v.elementAt(x)));
        }
        
        String a = "";
        String z = "";
        String y = "";
        
        if(q.length() != 0)
        {
            for(int b = 0; b < vr.size(); b++)
            {
                int x = -1;

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
                            y = y +"<br>"+z;
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