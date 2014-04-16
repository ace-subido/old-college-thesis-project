 <%-- 
    Document   : getFacReserves
    Created on : Jul 19, 2008, 1:25:02 AM
    Author     : ace-dlsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<%        
    Thesis db = new Thesis();
    Vector<ReservationObject> v = db.getReservations2();
    Vector<ReservationObject> v2 = new Vector<ReservationObject>();
    int a = Integer.parseInt(request.getParameter("res"));
    int kilo = Integer.parseInt(request.getParameter("residentid"));

    session.setAttribute("facilityIDreserve", a);

    int th = db.getFacilitiesResFee(a);
    CachedRowSet the = db.getFacility(a);

    session.setAttribute("facilityReschecker", the);

    the.next();
    java.util.Date d1 = the.getTimestamp("OpTime");
    java.util.Date d2 = the.getTimestamp("ClTime");

    Calendar myCalendar = Calendar.getInstance();

    myCalendar.setTime(d1);      

    int ahour = myCalendar.get(Calendar.HOUR);
    int amin = myCalendar.get(Calendar.MINUTE);
    String aminstr, bminstr, aampm = "AM", bampm = "AM";
        
    if(ahour == 0)
        ahour = 12;
    if(amin == 0)
        aminstr = "00";
    else
        aminstr = "30";

    int temp = myCalendar.get(Calendar.AM_PM);

    if(temp == 1)        
        aampm = "PM";

    myCalendar.setTime(d2);

    int bhour = myCalendar.get(Calendar.HOUR);
    int bmin = myCalendar.get(Calendar.MINUTE);

    if(bhour == 0)
        bhour = 12;
    if(bmin == 0)
        bminstr = "00";
    else
        bminstr = "30";

    temp = myCalendar.get(Calendar.AM_PM);

    if(temp == 1)        
        bampm = "PM";

    int b=-1;

        for(int i = 0; i < v.size(); i++)
        {   
            if(v.elementAt(i).facID == a){
                b=i;
                v2.add(v.elementAt(i));
            }
        }

    if(b == -1)
    {            
        response.getWriter().write("<h5>No Reservations for this facility</h5> ");

        response.getWriter().write("<ul><li>Reservation fee  : PHP "+th+".00</li>");
        response.getWriter().write("<li>Reservation Time : From "+ahour+":"+aminstr+" "+aampm+" to "+bhour+":"+bminstr+" "+bampm+" </li>");
        response.getWriter().write("<li>Maximum amount of hours you can reserve this facility : "+the.getInt("hoursperDay")+"</li>");
        response.getWriter().write("<li>Days in advance before you should reserve this facility : "+the.getInt("advDaysRes")+"</li></ul>");
    }
    else
    {           
        response.getWriter().write("<h6>Facility : "+v.elementAt(b).facName+"</h6> ");
        response.getWriter().write("<ul><li>Reservation fee  : PHP "+th+".00</li>");
        response.getWriter().write("<li>Reservation Time : From "+ahour+":"+aminstr+" "+aampm+" to "+bhour+":"+bminstr+" "+bampm+" </li>");
        response.getWriter().write("<li>Maximum amount of hours you can reserve this facility : "+the.getInt("hoursperDay")+"</li>");
        response.getWriter().write("<li>Days in advance before you should reserve this facility : "+the.getInt("advDaysRes")+"</li></ul>");
        response.getWriter().write("<h6>Reservations for Facility "+v.elementAt(b).facName+"</h6><br> ");
                       
        for(int j=0; j < v2.size(); j++)
        {     
            if(v2.elementAt(j).resID == kilo)                                              
               response.getWriter().write("<p><b>Date :"+v2.elementAt(j).frresdatestr+" <br> Time : "+v2.elementAt(j).frreshour+":"+v2.elementAt(j).frresminstr+" "+v2.elementAt(j).frresampm+" to "+v2.elementAt(j).toreshour+":"+v2.elementAt(j).toresminstr+" "+v2.elementAt(j).toresampm+"</b><br><i>This is your reservation</i></p>");                
            else
               response.getWriter().write("<p>Date :"+v2.elementAt(j).frresdatestr+" <br> Time : "+v2.elementAt(j).frreshour+":"+v2.elementAt(j).frresminstr+" "+v2.elementAt(j).frresampm+" to "+v2.elementAt(j).toreshour+":"+v2.elementAt(j).toresminstr+" "+v2.elementAt(j).toresampm+"</p>");                
        }
        session.setAttribute("container", v2);
        session.setAttribute("facilityfee", th);
    }  
%>