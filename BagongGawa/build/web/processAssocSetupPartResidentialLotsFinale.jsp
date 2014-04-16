 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.sql.*, java.text.*,java.util.Date"%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%
    if(session.getAttribute("uname") == null)
        response.sendRedirect("homepage.jsp");

    int phbl= Integer.parseInt(request.getParameter("phbl"));
    int blfl= Integer.parseInt(request.getParameter("blfl"));
    int totalLots= Integer.parseInt(request.getParameter("totalLots"));
    Jem jem = new Jem();
    
    int nCtr=1;
                while(nCtr<=totalLots)
                {
                    int temp = Integer.parseInt(request.getParameter(Integer.toString(nCtr)));
                    jem.SaveLotareas(temp, nCtr, blfl, phbl);
                    nCtr++;
                }
    
    
    
%>
        <script type= "text/javascript">
            <!--
                alert("Saved all the lot areas");
                location = "assocSetupPartResidentialLotsFinale.jsp";                
            -->
        </script>

</body>

</html>