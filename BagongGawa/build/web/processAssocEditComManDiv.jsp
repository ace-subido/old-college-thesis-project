 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
<%
   if(session.getAttribute("uname") == null)
		response.sendRedirect("homepage.jsp");
   
    String nameDiv = request.getParameter("type");
    String nameDiv2 = request.getParameter("idtemp");
    String stat = request.getParameter("avail");
    addFacility addD = new addFacility();
    Unit updateD = new Unit();
    Thesis t = new Thesis();
    
    int b = t.getDivId(nameDiv2);
    
    if(nameDiv.equals(nameDiv2))
    {
        updateD.upD(nameDiv, b,stat);
%>
        
        <script>
        <!--
            	
            alert("Updated the Community Management division name");
            location = "assocVillInfo.jsp";
        -->
        </script>
<%
    }
    else if(addD.ifTypeExists2(nameDiv) == 2)
    {
        updateD.upD(nameDiv, b,stat);
%>
        <script>
        <!--
            		
            alert("Updated the Community Management division name");
            location = "assocVillInfo.jsp";
        -->
        </script>
<%
    }
    else
    {
%>
        <script>
        <!--
				
            alert("That Community Management Division already exists");
            history.back();
        -->
        </script>
<%
    }
%>
