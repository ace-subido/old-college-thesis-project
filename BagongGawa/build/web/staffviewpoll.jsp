
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<!--  Version: Multiflex-3 Update-4 / Layout-4             -->
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
    <script type="text/javascript" src="./js/calendar3.js"></script>  
    <link rel="icon" type="image/x-icon" href="./img/favicon.ico" />
    <title>Converge - Staff : Polls or Elections</title>
    <style type="text/css">

.ds_box {
	background-color: #FFF;
	border: 1px solid #000;
	position: absolute;        
	z-index: 32767;
}

.ds_tbl {
	background-color: #FFF;
}

.ds_head {
	background-color: #333;
	color: #FFF;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 13px;
	font-weight: bold;
	text-align: center;
	letter-spacing: 2px;
}

.ds_subhead {
	background-color: #CCC;
	color: #000;
	font-size: 12px;
	font-weight: bold;
	text-align: center;
	font-family: Arial, Helvetica, sans-serif;
	width: 32px;
}

.ds_cell {
	background-color: #EEE;
	color: #000;
	font-size: 13px;
	text-align: center;
	font-family: Arial, Helvetica, sans-serif;
	padding: 5px;
	cursor: pointer;
}

.ds_cell:hover {
	background-color: #F3F3F3;
} /* This hover code won't work for IE */

</style>
 <script type="text/javascript" src="./js/ajaxPollPao.js"></script> 
</head>
<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->
<body>
<% 
    int Pollid = Integer.parseInt(request.getParameter("pollid"));
    serviceTemplate t = new  serviceTemplate();
    CachedRowSet c = t.getServices();
    Polls p = new Polls();
    CachedRowSet poll = p.getSpecificPoll(Pollid);
    poll.next();
%>  
    <!-- Main Page Container -->
    <div class="page-container">

        <!-- For alternative headers START PASTE here -->
        <!-- A. HEADER -->      
        <div class="header">
      
            <!-- A.1 HEADER TOP -->
            <div class="header-top">
        
                <!-- Sitelogo and sitename -->
                <a class="sitelogo" href="staffDash.jsp" title="Go to Start page"></a>
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
          
                <!-- Pagetitle -->
                
                <div class="column1-unit"></div>
                
                <div class="column1-unit">
                    <table width="536" border="1">
                        <tr>
                            <td>
                                <div align="center">
                                    <label for="vill_name" class="left" id="polltag">Poll Name:</label> 
                                </div>
                            </td>    
                            <td>
                                <div align="center">
                                    <label><%=poll.getString("Pollname")%></label>
                                </div>
                            </td>
                        </tr>    
                        <tr>
                            <td>
                                <div align="center">
                                    <label class="left" id="polldesctag">Poll Description:</label>
                                </div>
                            </td>    
                            <td>
                                <div align="center">    
                                    <label><%=poll.getString("Polldesc")%></label>
                                </div>
                            </td>    
                        </tr>
<%
                                java.util.Date startDate = poll.getTimestamp("PollSDate");
                                java.util.Date closeDate = poll.getTimestamp("PollCDate");
                                Calendar myCalendar = Calendar.getInstance();

                                myCalendar.setTime(startDate);
                                int month = myCalendar.get(Calendar.MONTH)+1;
                                int day = myCalendar.get(Calendar.DATE);
                                int year = myCalendar.get(Calendar.YEAR);

                                myCalendar.setTime(closeDate);
                                int month2 = myCalendar.get(Calendar.MONTH)+1;
                                int day2 = myCalendar.get(Calendar.DATE);
                                int year2 = myCalendar.get(Calendar.YEAR);

                                Converter conv = new Converter();
                                String realMonth=conv.convMonth(month), realMonth2=conv.convMonth(month2);
%>                        
                        <tr>
                            <td>
                                <div align="center">
                                    <label>Start Date:</label>
                                 </div>
                            </td>    
                            <td>
                                <div align="center">    
                                    <label><%=realMonth%>&nbsp;<%=day%>,&nbsp;<%=year%></label>
                                </div>
                            </td>            
                        </tr>    
                        <tr>
                            <td>
                                <div align="center">
                                    <label>Close Date:</label>
                                 </div>
                            </td>    
                            <td>
                                <div align="center">    
                                    <label><%=realMonth2%>&nbsp;<%=day2%>,&nbsp;<%=year2%></label>
                                </div>
                            </td>            
                        </tr>
                        <tr>
                            <td>
                                <div align="center">
                                    <label class="left" id="choicestag">Poll Choice:</label>
                                </div>
                            </td>    
                            <td>
                                <div align="center">        
                                    <label>
<%
                    Polls db = new Polls();
                    CachedRowSet p2 = db.getPollChoices(Pollid);
                    while(p2.next())
                    {
%>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* <%=p2.getString("pollchoicename")%> - <%=p2.getInt("votenum")%>
                        <br>
<%
                    }
%>
                                    </label>    
                                </div>
                            </td>
                        </tr>
                        <br/>                               
                    </table>
                </div>
        </div>
        <!-- C. FOOTER AREA -->      

        <div class="footer">
            <p>Copyright &copy; 2008 4B1C Group | All Rights Reserved</p>
            <p class="credits">Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a> | Modified by <a href="#" title="Adaptor Homepage">4B1C Group</a> | Powered by <a href="#" title="Content Management System">CCMS</a> | <a href="http://validator.w3.org/check?uri=referer" title="Validate XHTML code">W3C XHTML 1.0</a> | <a href="http://jigsaw.w3.org/css-validator/" title="Validate CSS code">W3C CSS 2.0</a></p>
        </div>    
    </div> 
</body>
</html>