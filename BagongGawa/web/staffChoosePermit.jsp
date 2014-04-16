
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
    <%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>

<!--  Version: Multiflex-3 Update-4 / Layout-2             -->
<!--  Date:    December 11, 2006                           -->
<!--  Author:  Wolfgang                                    -->
<!--  License: Fully open source without restrictions.     -->
<!--           Please keep footer credits with a link to   -->
<!--           Wolfgang (www.1-2-3-4.info). Thank you!     -->

<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="3600" />
    <meta name="revisit-after" content="2 days" />
    <meta name="robots" content="index,follow" />
    <meta name="publisher" content="Your publisher infos here ..." />
    <meta name="copyright" content="Your copyright infos here ..." />
    <meta name="author" content="Design: Wolfgang (www.1-2-3-4.info) / Modified: Your Name" />
    <meta name="distribution" content="global" />
    <meta name="description" content="Your page description here ..." />
    <meta name="keywords" content="Your keywords, keywords, keywords, here ..." />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="./css/layout2_setup.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="./css/layout2_text.css" />
    <script type="text/javascript" src="./js/ieflickerhack.js"></script>  
    <link rel="icon" type="image/x-icon" href="./img/favicon.ico" />
    <title>Converge - Staff</title>
</head>
<script language="JavaScript">
    function proc()
    {
        var pType = document.getElementById("permitType").value;
        var res = document.getElementById("hid").value;
        if(pType != -1)
        {    
            opener.location.href = "staffAddResidentPermit.jsp?residentID=" +res+ "&permitId=" + pType;
            self.close();
        }
    }
</script>
<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body>
    <%  
        String residentID = request.getParameter("residentID");
        Permits p = new Permits();
    %>
    <input type=hidden name = "hid" id="hid" value="<%=residentID%>">
        <!-- B.1 MAIN CONTENT -->
            <div align="center"><h1>Choose Permit Type</h1></div>
                <div align="center">
                    <br />
                    <label>Permit Type</label>
                    <select id="permitType">
                        <option value="-1" selected="selected">Select..    </option>
                    <%
                        CachedRowSet crset = p.getPermit();
                        String id="", pType="";
                        if(crset.size()>0)
                        {
                            while(crset.next())
                            {
                                id = crset.getString("pId");
                                pType = crset.getString("permitName");
                    %>
                                <option value=<%=id%>><%=pType%></option>
                    <%
                            }
                        }
                    %>

                    </select>
                    <input type ="submit" value="Go" name="submit" align="center" onclick="proc()">
                </div>
                <br />
</body>
</html>