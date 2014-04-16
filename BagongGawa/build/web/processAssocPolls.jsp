 <%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<script type="text/javascript" src="./js/ajaxgetReserve.js"></script>
<%                     
    int polls = Integer.parseInt(request.getParameter("polls"));
    int nom = Integer.parseInt(request.getParameter("nom"));
    int elec = Integer.parseInt(request.getParameter("elec"));
    int years = Integer.parseInt(request.getParameter("years"));
    int start = Integer.parseInt(request.getParameter("start"));
    String stat = request.getParameter("stat");
    String stat2 = request.getParameter("hiddenstat");
        
    Polls ct = new Polls();        
    int id = 1;
    if(stat2.equalsIgnoreCase("Setup"))
    {
        ct.newPollsSettings(id, polls, nom, elec,years,start);
        Account r = new Account();
        CachedRowSet dirSet = r.getAllWaitDirector();
        Polls poll = new Polls();
        int starting = poll.getStart();

        Calendar myCalendar = Calendar.getInstance();
        int month = myCalendar.get(Calendar.MONTH)+1;
        int year = myCalendar.get(Calendar.YEAR);
        int day = myCalendar.get(Calendar.DATE);
        while(dirSet.next())
        {
            if(starting<=day)
            {    
                r.updateType(dirSet.getInt("resId"),"Director");
                r.servingDirector(dirSet.getInt("dirId"));
            }   
        }  
%>
        <script type= "text/javascript">
        <!--  
            alert("Setting saved");
            location = "assocSetupPart3a.jsp?criteria=0&search=All";
        -->    
        </script> 
<%        
    }
    else
    {    
        if(stat.equals("new"))
        {
            ct.newPollsSettings(id, polls, nom, elec,years,start);
            Account r = new Account();
            CachedRowSet dirSet = r.getAllWaitDirector();
            Polls poll = new Polls();
            int starting = poll.getStart();

            Calendar myCalendar = Calendar.getInstance();
            int month = myCalendar.get(Calendar.MONTH)+1;
            int year = myCalendar.get(Calendar.YEAR);
            int day = myCalendar.get(Calendar.DATE);
            while(dirSet.next())
            {
                if(starting<=day)
                {    
                    r.updateType(dirSet.getInt("resId"),"Director");
                    r.servingDirector(dirSet.getInt("dirId"));
                }   
            }  
%>
        <script type= "text/javascript">
        <!--  
            alert("Setting saved");
            location = "assocPolls.jsp";
        -->    
        </script> 
<%
        }
        else
        {      
            ct.updatePollsSettings(id, polls, nom, elec,years,start);
            Account r = new Account();
            CachedRowSet dirSet = r.getAllWaitDirector();
            Polls poll = new Polls();
            int starting = poll.getStart();

            Calendar myCalendar = Calendar.getInstance();
            int month = myCalendar.get(Calendar.MONTH)+1;
            int year = myCalendar.get(Calendar.YEAR);
            int day = myCalendar.get(Calendar.DATE);
            while(dirSet.next())
            {
                if(starting<=day)
                {    
                    r.updateType(dirSet.getInt("resId"),"Director");
                    r.servingDirector(dirSet.getInt("dirId"));
                }   
            }  
%>
            <script type= "text/javascript">
            <!--  
                alert("Setting Saved");
                location = "assocPolls.jsp";
            -->    
            </script>  
<%           
        }
    }
%>