 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>

<%	
    if(session.getAttribute("uname") == null)
        response.sendRedirect("homepage.jsp");
		
    String divName = request.getParameter("dv");
    addFacility addD = new addFacility();
    CachedRowSet checkSet = addD.ifTypeExists2(divName);
    if(checkSet.size()<=0)
    {
        if(addD.addComManDiv(divName))
        {
%>
            <script>
            <!--				
                alert("New Community Management Division added");
                location = "assocCreateComManDiv.jsp";
            -->
            </script>
<%
        }
        else
        {
%>
            <script>
            <!--
                alert("Unable to add new Community Management Division");
                location = "assocCreateComManDiv.jsp";
            -->
            </script>
<%
        }
    }
    else
    {
        checkSet.next();
        if(!checkSet.getString("available").equalsIgnoreCase("available"))
        {
            addD.updateComManDiv(checkSet.getInt("comDivId"),divName);
%>
            <script>
            <!--				
                alert("New Community Management Division Added");
                location = "assocCreateComManDiv.jsp";
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
    }
%>