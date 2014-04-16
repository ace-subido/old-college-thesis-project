 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%
	if(session.getAttribute("uname") == null)
		response.sendRedirect("homepage.jsp");
		
	int phbl = Integer.parseInt(request.getParameter("phbl"));
        int totalFlr = Integer.parseInt(request.getParameter("totalFlr"));
	int x=1;
        Jem jem = new Jem();
        String vType = jem.getVillageType();
        String address="";
        int lotsTotal=0;
        System.out.println("total number of blocks: "+ totalFlr);
        while(x<=totalFlr)
        {
            int lots  = Integer.parseInt(request.getParameter(Integer.toString(x)));
            int theblock =1;
            
            while(theblock<=lots)
            {
                lotsTotal = jem.getTotalLots();
                lotsTotal++;
                if(vType.equals("phase"))
                {
                   address = "lot " + Integer.toString(theblock) + " block " + Integer.toString(x) + " phase " + Integer.toString(phbl);
                }
                else
                {
                    address = "unit " + Integer.toString(theblock) + " floor " + Integer.toString(x) + " building " + Integer.toString(phbl);
                }
                jem.saveNumOfLoUn(x, theblock, phbl, address, lotsTotal);
                theblock++;
            }
            
            x++;
        }
        
        //response.sendRedirect("assocSetupPartResidentialLots2.jsp");
        
%>
<script type= "text/javascript">
			<!--
				
				alert("Saved the number of lots");
				location = "assocSetupPartResidentialLots2.jsp";
			-->
			</script>
</body>
</html>
