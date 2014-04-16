 <%-- 
    Document   : processResAddCheck
    Created on : Jul 19, 2008, 4:03:25 AM
    Author     : ace-dlsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%                     
        Thesis db = new Thesis();
        Vector<ReservationObject> v = (Vector<ReservationObject>)session.getAttribute("container");
        ReservationObject restemp = new ReservationObject();
        CachedRowSet er = (CachedRowSet)session.getAttribute("facilityReschecker");
        
        int astr = (Integer)session.getAttribute("residentId");
        int editid = Integer.parseInt(request.getParameter("editid"));
        
        String d = request.getParameter("date");
        
       
        
        restemp.toreshour = Integer.parseInt(request.getParameter("do2"));
        restemp.toresmin = Integer.parseInt(request.getParameter("do3"));
        int toAMPM = Integer.parseInt(request.getParameter("do4"));
        restemp.frreshour = Integer.parseInt(request.getParameter("co2"));
        restemp.frresmin = Integer.parseInt(request.getParameter("co3"));
        int frAMPM = Integer.parseInt(request.getParameter("co4"));
        
        java.util.Date d1 = new java.util.Date();
        java.util.Date d2 = new java.util.Date();
        int sd2 = 0, sd1 = 0, ampm =-1 , bmpm =-1, ahour=-1, amin=-1, bhour=-1, bmin=-1;
        Calendar myCalendar = Calendar.getInstance();
        
        
            d1 = er.getTimestamp("OpTime");
            d2 = er.getTimestamp("ClTime");
            sd1 = er.getInt("advDaysRes");
            sd2 = er.getInt("hoursperDay");
        
        
            myCalendar.setTime(d1);      
        
            ahour = myCalendar.get(Calendar.HOUR);
            amin = myCalendar.get(Calendar.MINUTE);
            bhour = myCalendar.get(Calendar.HOUR);
            bmin = myCalendar.get(Calendar.MINUTE);
            ampm = myCalendar.get(Calendar.AM_PM);
            bmpm = myCalendar.get(Calendar.AM_PM);
            
            if(ampm == 1)
            ahour = ahour + 12; 
       
            if(bmpm == 1)
            bhour = bhour + 12; 
        
        
                
        if(toAMPM == 1)
            restemp.toreshour = restemp.toreshour + 12;
        if(frAMPM == 1)
            restemp.frreshour = restemp.frreshour + 12;
        
        restemp.makeStringtoDate(d);   
        
        int a = 0;
        
        if(restemp.frresdate.compareTo(new java.util.Date())  == -1)
            {
            %>
            <script type= "text/javascript">
			<!--
				
				alert("Invalid Date input : Past Date");
				location = "residentReserveAdd.jsp";
			-->
			</script>
            <%
        }
        
        if(v != null){
        for(int i = 0; i < v.size(); i++){
            
           System.out.println(v.elementAt(i).frresdate.toString());
           if(astr != v.elementAt(i).resID && editid == v.elementAt(i).reservationID){
           if(v.elementAt(i).frresdate.compareTo(restemp.frresdate) == 0){
                a = 1;
           }
           if(v.elementAt(i).toresdate.compareTo(restemp.toresdate) == 0){
                a = 1;
           }           
           if((v.elementAt(i).frresdate.compareTo(restemp.frresdate) > 0) && (v.elementAt(i).toresdate.compareTo(restemp.frresdate) < 0)){
                a = 1;
           }
           }
        }
       
        }
        
        if((ahour - restemp.frreshour < 0 && amin - restemp.frresmin < 0) || (bhour - restemp.toreshour > 0 && bmin - restemp.toresmin < 0)){
            a=2;
        }
        
        if(!(restemp.toreshour - restemp.frreshour <= sd2)){
            a=3;
        }
        
        myCalendar.setTime(new java.util.Date());
       int temper1 = myCalendar.get(Calendar.DAY_OF_YEAR);
         myCalendar.setTime(restemp.frresdate);
       int temper2 = myCalendar.get(Calendar.DAY_OF_YEAR);
        
       
        
        
        if(a==1){%>
            <script type= "text/javascript">
			<!--
				
				alert("Theres already a reservation for that time slot");
				location = "residentReserveEdit.jsp";
			-->
			</script>
            <%
            session.setAttribute("container", null);
        }
        else if(a==2){%>
            <script type= "text/javascript">
			
				
				alert("Chosen time is beyond the daily reservation time for the facility");
				location = "residentReserveEdit.jsp";
			
			</script>
            <%
        }
        else if(a==3){%>
            <script type= "text/javascript">
							
				alert("Exceeded maximum amount of hours you can reserve the facility");
				location = "residentReserveEdit.jsp";
			
			</script>
            <%
        }
      
        else{
            int residentID = (Integer)session.getAttribute("residentId");
            int facilityID = (Integer)session.getAttribute("facilityIDreserve");
            
            db.updRes(restemp.frresdate, restemp.toresdate, residentID, facilityID, editid);
            
            //enter code to add to resident bill
            int lolol = (Integer)session.getAttribute("facilityfee");
            
            %>
            <script type= "text/javascript">
			<!--
				
				alert("Editting Reservation Successful!");
				location = "residentReserve.jsp";
			-->
			</script><%
            
        }
            
               
        
        %>
    </body>
</html>

