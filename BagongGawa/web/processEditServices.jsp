 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>

<%
    serviceTemplate st = new serviceTemplate();
    truncateHandlers th = new truncateHandlers();
    String[] check = request.getParameterValues("list");
    String ctr = request.getParameter("ctr");
    String service = request.getParameter("service");
    String[] comDivId = request.getParameterValues("comDivId");
    
    int count = Integer.parseInt(ctr);
    int i =0;
    if(service.equals("Permits"))
    {
        String p = "permithandlers";
        th.truncate(p);
    }
    if(service.equals("Reservations"))
    {
        String p = "reservationhandlers";
        th.truncate(p);
    }
    if(service.equals("Elections or Polls"))
    {
        String p = "votehandlers";
        th.truncate(p);
    }
    if(service.equals("Bulletin Board"))
    {
        String p = "bulletinhandlers";
        th.truncate(p);
    }
    if(service.equals("Billing"))
    {
        String p = "billinghandlers";
        th.truncate(p);
    }
    if(service.equals("Newsletter"))
    {
        String p = "newsletterhandlers";
        th.truncate(p);
    }
    if(service.equals("Payment Tracking"))
    {
        String p = "paymenthandlers";
        th.truncate(p);
    }
    if(service.equals("Events"))
    {
        String p = "eventhandlers";
        th.truncate(p);
    }
    
    while(i<count)
    {
        if(service.equals("Permits"))
        {
            
            /*if(check[i].equals("Yes"))
            {
                st.addPermitToHandler(Integer.parseInt(comDivId[i]), i);
             
            }*/
           
            
        }
        if(service.equals("Reservations"))
        {
            if(check[i].equals("Yes"))
            {
                st.addReservationToHandler(Integer.parseInt(comDivId[i]), i);
             
            }
        }
        if(service.equals("Elections or Polls"))
        {
            if(check[i].equals("Yes"))
            {
                st.addVoteToHandler(Integer.parseInt(comDivId[i]), i);
             
            }
        }
        if(service.equals("Bulletin Board"))
        {
            if(check[i].equals("Yes"))
            {
                st.addBulletinToHandler(Integer.parseInt(comDivId[i]), i);
             
            }
        }
        if(service.equals("Billing"))
        {
            if(check[i].equals("Yes"))
            {
                st.addBillingToHandler(Integer.parseInt(comDivId[i]), i);
             
            }
        }
        if(service.equals("Newsletter"))
        {
            if(check[i].equals("Yes"))
            {
                st.addNewsletterToHandler(Integer.parseInt(comDivId[i]), i);
             
            }
        }
        if(service.equals("Payment Tracking"))
        {
            if(check[i].equals("Yes"))
            {
                st.addPaymentToHandler(Integer.parseInt(comDivId[i]), i);
             
            }
        }
        if(service.equals("Events"))
        {
            if(check[i].equals("Yes"))
            {
                st.addEventsToHandler(Integer.parseInt(comDivId[i]), i);
             
            }
        }
        i++;
        
    }
    response.sendRedirect("assocServices.jsp");
%>