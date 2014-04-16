 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
<%
    System.out.println("SDF!V");
    int a = Integer.parseInt(request.getParameter("resid"));
    Thesis db = new Thesis();
    Vector<ReservationObject> v2 = db.getReservations3(a);
    Vector<ReservationObject> v = new Vector<ReservationObject>();
                    
    int b=-1;
          
    for(int i = 0; i < v2.size(); i++)
    {   
        if(v2.elementAt(i).resID == a){
            b=i;
            v.add(v2.elementAt(i));
        }
    }
        
    if(b == -1)
    {
        response.getWriter().write("<h1>No Reservation History</h1>");
    }
    else
    {
        response.getWriter().write("<h1>Reservation History</h1>");

        for(int j=0; j < v.size(); j++)
        {
            if(v.elementAt(j).printed == 0)
            {
                response.getWriter().write("<p><b>"+v.elementAt(j).frresdatestr+"</b><br>");
                response.getWriter().write("Reserved the "+v.elementAt(j).facName+" is reserved from "+v.elementAt(j).frreshour+":"+v.elementAt(j).frresminstr+" "+v.elementAt(j).frresampm+" to "+v.elementAt(j).toreshour+":"+v.elementAt(j).toresminstr+" "+v.elementAt(j).toresampm+"<br>");
                if(v.elementAt(j).resstatus == "cancelled")
                    response.getWriter().write("<i>Cancelled</i><br>");

                for(int k = 0; k < v.size(); k++)
                {                 
                    if(v.elementAt(j).difference == v.elementAt(k).difference && v.elementAt(j).reservationID != v.elementAt(k).reservationID)
                    {             
                        response.getWriter().write("Reserved the "+v.elementAt(k).facName+" is reserved from "+v.elementAt(k).frreshour+":"+v.elementAt(k).frresminstr+" "+v.elementAt(k).frresampm+" to "+v.elementAt(k).toreshour+":"+v.elementAt(k).toresminstr+" "+v.elementAt(k).toresampm+"<br>");
                        if(v.elementAt(k).resstatus == "cancelled")
                            response.getWriter().write("<i>Cancelled</i><br>");
                  
                        v.elementAt(j).printed = 1;
                        v.elementAt(k).printed = 1;                                         
                    }             
                }   
            }
       }
    response.getWriter().write("<p><a href='javascript:removehistcontent()'>Close</a></p>");   
    }  
%>