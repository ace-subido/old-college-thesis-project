 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.Calendar, java.util.*"%>

<% 
    int totComMeter = Integer.parseInt(request.getParameter("totComMeter"));
    int totMaynilad = Integer.parseInt(request.getParameter("totMaynilad"));
    int masterTax = Integer.parseInt(request.getParameter("masterTax"));
    int garbage = Integer.parseInt(request.getParameter("garbage"));
    int security = Integer.parseInt(request.getParameter("security"));
    int salary = Integer.parseInt(request.getParameter("salary"));
    Vector<String> vname = (Vector<String>)session.getAttribute("vname");
    Vector<Integer> vamount = (Vector<Integer>)session.getAttribute("vamount");
    addFacility m = new addFacility();
    serviceTemplate st = new serviceTemplate();
    
    int extra = m.getMonthlyBillValuesBatchExtra();
    int bId = (Integer)session.getAttribute("billbatch");
    
    if(vname.size() != 0 && vamount.size() != 0)
    {
        for(int q=0; q<vname.size(); q++)
	{
           String temp = vname.get(q);
           String temp2 = vamount.get(q).toString();
           
           st.insertIntoMonthlyBillExtra(temp, Integer.parseInt(temp2), bId, extra);
        }
    }
      
        monthlyBillValues jk = new monthlyBillValues();
        jk.insertIntoMonthlyBillValues(totComMeter, totMaynilad, masterTax, garbage, security, salary, bId);
    response.sendRedirect("staffBill.jsp");
 
%>
