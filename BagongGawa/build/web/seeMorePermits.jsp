
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
    <title>Converge - More Permits</title>
</head>
<script language="JavaScript">    
    function unloading()
    {
        opener.location.reload(true);
    }
</script>
<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body onunload="unloading();">
    <!-- Main Page Container -->
    <div class="page-container">
    <%  
        String permType = request.getParameter("permitID");
        String stat = request.getParameter("status");
        Permits p = new Permits();
        CachedRowSet crset3;
        if(!permType.equalsIgnoreCase("All"))
            crset3 = p.getStaffPermitsSearch(permType, stat);
        else
            crset3 = p.getStaffPermitsSearchAll(stat);
        
        String pageno = request.getParameter("page");
        String type = request.getParameter("type");
    %>
    <!-- For alternative headers START PASTE here -->

        <!-- A. HEADER -->      
        <div class="header">
            <!-- A.1 HEADER TOP -->
            <div class="header-top">        
                <!-- Sitelogo and sitename -->
                <a class="sitelogo" href="#" title="Go to Start page"></a>
                <div class="sitename">
                    <h1><a href="homepage.html" title="Go to Start page">CONVERGE</a></h1>
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
            <!-- B.1 MAIN CONTENT -->
            <div class="main-content">

                <div class="column1-unit">
                <h1 class="block" align="center"><%=stat%> Permits</h1>
                <%
                    Residents r = new Residents();
                    
                %>                    
                        <table width="636">   
                        <tr>
                            <th width="94" class="top" scope="col"><div align="center">Resident Name</div></th>
                            <th width="89" class="top" scope="col"><div align="center">Address</div></th>
                            <th width="82" class="top" scope="col"><div align="center">Contact No.</div></th>
                            <th width="82" class="top" scope="col"><div align="center">Permit Type</div></th>
                            <th width="115" class="top" scope="col"><div align="center">Date of Application</div></th>
                            <th width="45" class="top" scope="col"><div align="center">View Details</div></th>
                            <th width="20" class="top" scope="col"><div align="center"></div></th>
                            <th width="20" class="top" scope="col"><div align="center"></div></th>
                        </tr>
                <%                        
                        String id, resID,realMonth;
                        Converter conv = new Converter();
                        java.util.Date appDate;
                        Calendar myCalendar;
                        String left1="", orig1="",right1="";
                        int ctr2=0;
                        while(crset3.next())
                        {
                            if(stat.equalsIgnoreCase("Pending"))
                            {  
                                orig1 = crset3.getString("path");
                                left1 = orig1.substring(0,orig1.indexOf("-"));
                                right1 = orig1.substring(orig1.indexOf("-")+1);
                            }
                            if(left1.equalsIgnoreCase(type) || !stat.equalsIgnoreCase("Pending"))
                                ctr2++;
                        }    
                        crset3.beforeFirst();
                        int size = ctr2,ctr=0;
                        int month,day, year;

                        int counter = 1;
                        
                        int isTwenty = 20;
                        int disp20 = (Integer.parseInt(pageno)-1)*20+1;
                        int numPage = size/20;
                        int rem = size%20;
                    
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
                                <a style="font-size:9pt" href='seeMorePermits.jsp?permitID=<%=permType%>&status=<%=stat%>&page=<%=i%>&type=<%=type%>&More=true'><%=i%></a> 
        <%
                            }
                        }                    
                        String path="", orig="", left="", right="";
                        
                        while(crset3.next())
                        {
                            if(stat.equalsIgnoreCase("Pending"))
                            {  
                            orig = crset3.getString("path");
                            left = orig.substring(0,orig.indexOf("-"));
                            right = orig.substring(orig.indexOf("-")+1);
                            }
                            if(left.equalsIgnoreCase(type) || !stat.equalsIgnoreCase("Pending"))
                            {
                            if (counter > (disp20-1) && isTwenty!=ctr)
                            {
                                ctr++;
                                path = right;
                                appDate = crset3.getTimestamp("field1");
                                myCalendar  = Calendar.getInstance();
                                myCalendar.setTime(appDate);
                                month = myCalendar.get(Calendar.MONTH)+1;
                                day = myCalendar.get(Calendar.DATE);
                                year = myCalendar.get(Calendar.YEAR);

                                realMonth = conv.convMonth(month);
                                id = String.valueOf(crset3.getInt("pID"));
                                String permID = String.valueOf(crset3.getInt("permitID"));
                                String permitID = String.valueOf(permID);

                                CachedRowSet getPermitName = p.getFieldDetails(permitID);
                                String permitName = getPermitName.getString("permitName");

                                resID = String.valueOf(crset3.getInt("resID"));
                                CachedRowSet residentSet =  r.getResInfo(Integer.parseInt(resID));
                                residentSet.next();
                %>
                                <tr>
                                    <td>
                                        <div align="center">
                                            <%=residentSet.getString("lastName")%> , <%=residentSet.getString("firstName")%>
                                        </div>    
                                    </td>
                                    <td>
                                        <div align="center">
                                            <%=residentSet.getString("Address")%>
                                        </div>    
                                    </td>                                            
                                    <td>
                                        <div align="center">
                                            <%=residentSet.getString("HouseNum")%>
                                        </div>    
                                    </td>
                                    <td>
                                        <div align="center">
                                            <%=permitName%>
                                        </div>    
                                    </td>
                                    <td>
                                        <div align="center">
                                            <%=realMonth%>&nbsp;<%=day%>,&nbsp;<%=year%>
                                        </div>    
                                    </td>                                    
                                    <td>
                                        <div align="center">
                                            <a href="viewPermitDetails.jsp?resPermitID=<%=id%>&type=<%=type%>&Back=true&page=<%=pageno%>&status=<%=stat%>&permitID=<%=permType%>">View</a>
                                        </div>    
                                    </td>
                <%
                                if(stat.equalsIgnoreCase("Pending"))
                                {    
                %>
                                    <td>
                                        <div align="center">
                                            <a href="processApprovePermit.jsp?resPermitID=<%=id%>&ptype=<%=permType%>&action=1&status=<%=stat%>&path=<%=path%>&type=<%=type%>&More=true"><img src="icons/check-mark-copy-16x16.png"></a>
                                        </div>    
                                    </td>
                                    <td>
                                        <div align="center">
                                            <a href="rejectPermit.jsp?resPermitID=<%=id%>&ptype=<%=permType%>&action=0&status=<%=stat%>&path=<%=path%>&type=<%=type%>&More=true&page=<%=pageno%>"><img src="icons/x.png"width="14" height="14"></a>
                                        </div>
                                    </td>
                <%
               
                                }
                                else
                                {    
                %>
                                    <td>
                                        <div align="center">-</div>    
                                    </td>
                                    <td>
                                        <div align="center">-</div>
                                    </td>
                  
                <%
                                }
                %>            
                              </tr>                               
            <%
                        }
                        counter++;
                        }
                    }
            %>
                </table> 
            </div>
        </div>                           
        <!-- Content unit - One column -->    
        <div class="footer">
            <p>Copyright &copy; 2006 Your Company | All Rights Reserved</p>
            <p class="credits">	Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a> | Modified by <a href="#" title="Adaptor Homepage">4B1C</a> | Powered by <a href="#" title="Content Management System">CCMS</a> | <a href="http://validator.w3.org/check?uri=referer" title="Validate XHTML code">W3C XHTML 1.0</a> | <a href="http://jigsaw.w3.org/css-validator/" title="Validate CSS code">W3C CSS 2.0</a></p>
        </div>      
    </div>   
</body>
</html>