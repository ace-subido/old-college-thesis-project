
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<!--  Version: Multiflex-3 Update-4 / Layout-4             -->
<!--  Date:    December 11, 2006                           -->
<!--  Author:  Wolfgang                                    -->
<!--  License: Fully open source without restrictions.     -->
<!--           Please keep footer credits with a link to   -->
<!--           Wolfgang (www.1-2-3-4.info). Thank you!     -->
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
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
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="./css/layout4_setup.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="./css/layout4_text.css" />
    <script type="text/javascript" src="./js/ieflickerhack.js"></script>  
    <link rel="icon" type="image/x-icon" href="./img/favicon.ico" />
    <title>Converge - Resident</title>
    <style type="text/css">
    <!--
    .style2 {color: #000000}
    -->
    </style>
</head>
<script language="javascript" type="text/javascript">
    var newwindow;
    function poptastic(url)
    {
        newwindow=window.open(url,'name','height=700,width=1000,location=yes,scrollbars=yes');
        if (window.focus)
            {newwindow.focus()}
    }
</script>
<body>
    <div class="page-container">    
    <%
        if(session.getAttribute("uname") == null)
            response.sendRedirect("homepage.jsp");
                
        Permits p = new Permits();

        int rID = (Integer)session.getAttribute("residentId");
        CachedRowSet resPermits = p.getResidentPermits(String.valueOf(rID));
        
        String pageno = request.getParameter("page");
        String type = request.getParameter("type");
    %>
    <!-- For alternative headers START PASTE here -->

    <!-- A. HEADER -->      
    <div class="header">
      
        <!-- A.1 HEADER TOP -->
        <div class="header-top">        
            <!-- Sitelogo and sitename -->
            <a class="sitelogo" href=# title="Go to Start page"></a>
            <div class="sitename">
                <h1><a href=# title="Go to Start page">CONVERGE</a></h1>
                <h2>Generic Community Association Portal</h2>
            </div>
        </div>
      
        <!-- A.2 HEADER MIDDLE -->
        <div class="header-middle">
            <!-- Site message -->
            <div class="sitemessage">
                <h1>FAST &bull; EASY &bull; CUSTOMIZABLE</h1>
                <h2>CONVERGE is here, an online community portal dedicated to serve village associations</h2>
            </div>        
        </div>
    </div>

    <!-- For alternative headers END PASTE here -->
    <!-- B. MAIN -->
    
    <div class="main-content">
        <div class="column1-unit">
                <table width="800" border="1">
                    <tr>
                        <th width="150" scope="col"><div align="center">Permit Type</div></th>
                        <th width="150" scope="col"><div align="center">Date of Application</div></th>                                    
                        <th width="100" scope="col"><div align="center">Status</div></th>
                        <th width="160" scope="col"><div align="center">Date of Approval/Rejection</div></th>
                        <th width="100" scope="col"><div align="center">&nbsp;&nbsp;View</div></th>
                    </tr>
        <%
                    int counter = 1, ctr=0;
                    int size = resPermits.size();
                    int isTwenty = 10;
                    int disp20 = (Integer.parseInt(pageno)-1)*10+1;
                    int numPage = size/10;
                    int rem = size%10;
                    
                    if(rem!=0)
                        numPage++;
                    
                    if (numPage > 1)
                    {
        %>
                        <p></p>
                        <label style="font-size:8pt"><b>Page</b></label>
        <%                   
                        for (int i = 1; i <= numPage; i++)
                        {    
        %>
                            <a style="font-size:9pt" href='residentSeeMorePermits.jsp?page=<%=i%>&type=<%=type%>'><%=i%></a> 
        <%
                        }
                    }
                    CachedRowSet getPermitName;
                    
                    while (resPermits.next())
                    {
                        if (counter > (disp20-1) && isTwenty!=ctr)
                        {
                            ctr++;
                            java.util.Date appDate = resPermits.getTimestamp("field1");
                            java.util.Date approveDate = resPermits.getTimestamp("permitApprove");
                            java.util.Date rejectDate = resPermits.getTimestamp("permitReject");
                            Calendar myCalendar = Calendar.getInstance();

                            myCalendar.setTime(appDate);

                            int month = myCalendar.get(Calendar.MONTH)+1;
                            int day = myCalendar.get(Calendar.DATE);
                            int year = myCalendar.get(Calendar.YEAR);

                            myCalendar.setTime(approveDate);

                            int month2 = myCalendar.get(Calendar.MONTH)+1;
                            int day2 = myCalendar.get(Calendar.DATE);
                            int year2 = myCalendar.get(Calendar.YEAR);

                            myCalendar.setTime(rejectDate);

                            int month3 = myCalendar.get(Calendar.MONTH)+1;
                            int day3 = myCalendar.get(Calendar.DATE);
                            int year3 = myCalendar.get(Calendar.YEAR);

                            boolean approve = false, reject = false;
                            Converter conv = new Converter();
                            String realMonth=conv.convMonth(month), realMonth2=conv.convMonth(month2), realMonth3=conv.convMonth(month3);
                            String resPermitID = resPermits.getString("pID");
                            getPermitName = p.getFieldDetails(String.valueOf(resPermits.getInt("permitID")));
                            String permitName = getPermitName.getString("permitName");
                            String stat = resPermits.getString("Status");
                            if(stat.equalsIgnoreCase("Approved"))
                                approve = true;

                            if(stat.equalsIgnoreCase("Rejected"))
                                reject = true;
                            
                            String expStat = resPermits.getString("expiration");
            %>
                        <tr>
                            <td>
                                    <div align="center">
            <% 
                                        if(resPermits.getString("view").equalsIgnoreCase("false") && !resPermits.getString("Status").equalsIgnoreCase("Pending"))
                                        {
                                            if(expStat.equalsIgnoreCase("Expired") && stat.equalsIgnoreCase("Approved"))
                                            {    
            %>
                                            <font color="red">
                                            <b><%=permitName%></b>
                                            </font>
            <%
                                            }
                                            else
                                            {    
            %>
                                            <b><%=permitName%></b>
            <%
                                            }
                                        }
                                        else if(resPermits.getString("view").equalsIgnoreCase("true") && !resPermits.getString("Status").equalsIgnoreCase("Pending"))
                                        {
                                            if(expStat.equalsIgnoreCase("Expired") && stat.equalsIgnoreCase("Approved"))
                                            {    
            %>
                                            <font color="red">  
                                            <%=permitName%>
                                            </font>
            <%
                                            }
                                            else
                                            {    
            %>
                                            <%=permitName%>
            <%
                                            }
                                        }
                                        else if(resPermits.getString("view").equalsIgnoreCase("false") && resPermits.getString("Status").equalsIgnoreCase("Pending"))
                                        {
            %>
                                            <%=permitName%>
            <%
                                        }
                                        else if(resPermits.getString("view").equalsIgnoreCase("true") && resPermits.getString("Status").equalsIgnoreCase("Pending"))
                                        {      
            %>
                                            <%=permitName%>
            <%
                                        }
            %>
                                    </div>
                            </td>
                            <td>
                                <div align="center">
                                    <%=realMonth%>&nbsp;<%=day%>,&nbsp;<%=year%>
                                </div>
                            </td>                                    
                            <td>
                                <div align="center">
                                    <%=stat%>
                                </div>
                            </td>
                            <td>
                                <div align="center">
            <%
                                    if(approve==true && reject == false)
                                    {    
            %>                            
                                        <%=realMonth2%>&nbsp;<%=day2%>,&nbsp;<%=year2%>
            <%                            
                                    }
                                    else if(approve == false && reject==false)
                                    {
            %>
                                        -
            <%                            
                                    }
                                    else if(approve == false && reject==true)
                                    {    
            %>                            
                                        <%=realMonth3%>&nbsp;<%=day3%>,&nbsp;<%=year3%>
            <%                            
                                    }
            %>
                                </div>
                            </td>
                            <td>
                                <div align="center">
                                    <a href="viewPermitDetails.jsp?resPermitID=<%=resPermitID%>&type=<%=type%>&Back=true&page=<%=pageno%>&status=<%=stat%>&permitID=none">View</a>
                                </div>
                            </td>
                        </tr>                                
            <%
                        }
                        counter++;
                    }
            %>
                </table>
            </div>
        </div>
    
        <div class="footer">
            <p>Copyright &copy; 2006 Your Company | All Rights Reserved</p>
            <p class="credits">Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a> | Modified by <a href="#" title="Adaptor Homepage">Your Name</a> | Powered by <a href="#" title="Content Management System">Your CMS</a> | <a href="http://validator.w3.org/check?uri=referer" title="Validate XHTML code">W3C XHTML 1.0</a> | <a href="http://jigsaw.w3.org/css-validator/" title="Validate CSS code">W3C CSS 2.0</a></p>
        </div>
    </div>
</body>
</html>