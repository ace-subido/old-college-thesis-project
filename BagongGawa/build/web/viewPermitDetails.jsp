
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
    <title>Converge - View Details</title>
</head>

<style type="text/css">
    <!--
    .style2 {color: #000000}
    -->
</style>

<script type= "text/javascript">
    function unloading()
    {
        opener.location.reload(true);
    }
    
    function onBack()
    {
        var pageno = document.getElementById("page").value;
        var type = document.getElementById("type").value;
        location = "residentSeeMorePermits.jsp?page="+pageno+"&type="+type;
    }
    
    function onRenew()
    {
        var permID = document.getElementById("residentperm").value;
        location = "residentPermitRenew.jsp?resPermitID="+permID;
    }
    
    function NORenew()
    {
        var isCheck = confirm("Are you sure you don't want to renew this permit?");
        
        var go;
        if (isCheck)
            go = true;
        else
            go=false;
        if(go==true)
        {
            var permID = document.getElementById("residentperm").value;
            location = "processResNoRenew.jsp?resPermitID="+permID;   
        }    
    }
    
    function onBack2()
    {
        var pageno = document.getElementById("page").value;
        var type = document.getElementById("type").value;
        var permID = document.getElementById("permID").value;
        var stat = document.getElementById("stat").value;
        
        window.location.href = "seeMorePermits.jsp?permitID=" +permID+ "&status="+stat+"&page=" + pageno +"&type="+type+"&More=true";
    }
</script>

<body>
    <div class="page-container">    
    <%	
        if(session.getAttribute("uname") == null)
            response.sendRedirect("homepage.jsp");
        Permits p = new Permits();
        CachedRowSet resPermitDetail = p.getResidentPermitDetail(request.getParameter("resPermitID"));
        resPermitDetail.next();
        
        String permid = String.valueOf(resPermitDetail.getInt("permitID"));
        String pageno = request.getParameter("page");
        CachedRowSet getPermitName = p.getFieldDetails(String.valueOf(permid));
        String permitName = getPermitName.getString("permitName");
        String Back = request.getParameter("Back");
        String type = request.getParameter("type");
        String status = request.getParameter("status");
        String permitID = request.getParameter("permitID");
        if(request.getParameter("type").equalsIgnoreCase("Resident") || request.getParameter("type").equalsIgnoreCase("Director"))
        {    
            java.util.Date appD = resPermitDetail.getTimestamp("field1");
            java.util.Date rejD = resPermitDetail.getTimestamp("permitReject");
            java.util.Date approveD = resPermitDetail.getTimestamp("permitApprove");
            if(!resPermitDetail.getString("Status").equalsIgnoreCase("Pending"))
                p.changedView(Integer.parseInt(request.getParameter("resPermitID")),appD,rejD,approveD);
    %>
            <script type="text/javascript">
                unloading();
            </script>
    <%
        }
    %>
    <!-- For alternative headers START PASTE here -->
    <input type="hidden" id="page" name="page" value=<%=pageno%>>
    <input type="hidden" id="type" name="type" value=<%=type%>>
    <input type="hidden" id="permID" name="permID" value=<%=permitID%>>
    <input type="hidden" id="stat" name="stat" value=<%=status%>>
    <input type="hidden" id="back" name="back" value=<%=Back%>>
    
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
            <form name="permit" onsubmit="return (checkForm())" action ="processResAddPermit.jsp" method="get">
                <table width="536" border="1">
                    <h2 align="center"><strong><%=permitName%> Permit Description</strong></h2>           
                    <h1 class="block" align="center"><%=permitName%> Permit Details</h1>
                    <%
                        java.util.Date appDate = resPermitDetail.getTimestamp("field1");
                        java.util.Date approveDate = resPermitDetail.getTimestamp("permitApprove");
                        java.util.Date rejectDate = resPermitDetail.getTimestamp("permitReject");
                        java.util.Date exDate = resPermitDetail.getTimestamp("years");
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
                                                
                        myCalendar.setTime(exDate);

                        int month4 = myCalendar.get(Calendar.MONTH)+1;
                        int day4 = myCalendar.get(Calendar.DATE);
                        int year4 = myCalendar.get(Calendar.YEAR);
                        
                        Converter conv = new Converter();
                        String realMonth=conv.convMonth(month), realMonth2=conv.convMonth(month2), realMonth3=conv.convMonth(month3), realMonth4=conv.convMonth(month4);
                        String orig="", left="", right="", stat=resPermitDetail.getString("Status");
                        
                        Residents r = new Residents();
                        CachedRowSet cset = r.getResInfo(Integer.parseInt(resPermitDetail.getString("resID")));
                        cset.next();
                     %>
                        <tr>
                            <td>
                                <div align="center">
                                    <label for="n" class="left"><b>Permit Number</b></label> 
                                </div>            
                            </td>
                            <td>
                                <div align="center">
                                     <label><b><%=resPermitDetail.getInt("pID")%></b></label>
                                </div>            
                            </td>
                        </tr>
                        <input type="hidden" id="residentperm" name="residentperm" value=<%=resPermitDetail.getInt("pID")%>>
                        <tr>
                            <td>
                                <div align="center">
                                    <label for="n" id="fullnametag" class="left">Name</label> 
                                </div>            
                            </td>
                            <td>
                                <div align="center">
                                     <label name="fullname" id="fullname"><%=cset.getString("lastName")%>,&nbsp;<%=cset.getString("firstName")%></label>
                                </div>            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div align="center">
                                    <label for="n" id="phonetag" class="left">House Number</label> 
                                </div>            
                            </td>
                            <td>
                                <div align="center">
                                     <label name="phone" id="phone"><%=cset.getString("HouseNum")%></label>
                                </div>            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div align="center">
                                    <label for="n" id="phonetag" class="left">Email Address</label> 
                                </div>            
                            </td>
                            <td>
                                <div align="center">
                                     <label name="phone" id="phone"><%=cset.getString("EmailAdd")%></label>
                                </div>            
                            </td>
                        </tr>
                    </table>    
                    <table width="536" border="1">    
                    <%
                        if (!resPermitDetail.getString("field1").equalsIgnoreCase(""))
                        { 
                    %>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="field1tag" class="left">Date of Application</label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="field1" id="field1"><%=realMonth%>&nbsp;<%=day%>,&nbsp;<%=year%></label>
                                    </div>            
                                </td>
                            </tr>
                    <%
                        }
                        if(resPermitDetail.getString("expiration").equalsIgnoreCase("Ongoing"))
                        {
                    %>   
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="exptag" class="left">Expiration Date</label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="exp" id="exp"><%=realMonth4%>&nbsp;<%=day4%>,&nbsp;<%=year4%></label>
                                    </div>            
                                </td>
                            </tr>
                    <%
                        }
                        else if (!resPermitDetail.getString("expiration").equalsIgnoreCase("none"))
                        {
                    %>   
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="exptag" class="left">Expiration Date</label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="exp" id="exp"><%=resPermitDetail.getString("expiration")%></label>
                                    </div>            
                                </td>
                            </tr>
                    <%
                        }    
                    %>
                        <tr>
                            <td>
                                <div align="center">
                                    <label for="n" id="pfeetag" class="left">Permit Fee</label> 
                                </div>            
                            </td>
                            <td>
                                <div align="center">
                                     <label name="pfee" id="pfee"><%=resPermitDetail.getDouble("pfee")%></label>
                                </div>            
                            </td>
                        </tr>
                    <%
                        if (!resPermitDetail.getString("field2").equalsIgnoreCase(""))
                        {
                            orig = resPermitDetail.getString("field2");
                            left = orig.substring(0,orig.indexOf("-"));
                            right = orig.substring(orig.indexOf("-")+1);                                
                    %>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="field2tag" class="left"><%=left%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="field2" id="field2"><%=right%></label>
                                    </div>            
                                </td>
                            </tr>
                    <%
                        }
                        if (!resPermitDetail.getString("field3").equalsIgnoreCase(""))
                        {
                            orig = resPermitDetail.getString("field3");
                            left = orig.substring(0,orig.indexOf("-"));
                            right = orig.substring(orig.indexOf("-")+1);                                
                    %>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="field3tag" class="left"><%=left%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="field3" id="field3"><%=right%></label>
                                    </div>            
                                </td>
                            </tr>
                    <%
                        }
                        if (!resPermitDetail.getString("field4").equalsIgnoreCase(""))
                        {
                            orig = resPermitDetail.getString("field4");
                            left = orig.substring(0,orig.indexOf("-"));
                            right = orig.substring(orig.indexOf("-")+1);                                
                    %>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="field4tag" class="left"><%=left%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="field4" id="field4"><%=right%></label>
                                    </div>            
                                </td>
                            </tr>
                    <%
                        }
                        if (!resPermitDetail.getString("field5").equalsIgnoreCase(""))
                        {
                            orig = resPermitDetail.getString("field5");
                            left = orig.substring(0,orig.indexOf("-"));
                            right = orig.substring(orig.indexOf("-")+1);                                
                    %>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="field5tag" class="left"><%=left%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="field5" id="field5"><%=right%></label>
                                    </div>            
                                </td>
                            </tr>
                    <%
                        }
                        if (!resPermitDetail.getString("field6").equalsIgnoreCase(""))
                        {
                            orig = resPermitDetail.getString("field6");
                            left = orig.substring(0,orig.indexOf("-"));
                            right = orig.substring(orig.indexOf("-")+1);                                
                    %>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="field6tag" class="left"><%=left%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="field6" id="field6"><%=right%></label>
                                    </div>            
                                </td>
                            </tr>
                    <%
                        }
                        if (!resPermitDetail.getString("field7").equalsIgnoreCase(""))
                        {
                            orig = resPermitDetail.getString("field7");
                            left = orig.substring(0,orig.indexOf("-"));
                            right = orig.substring(orig.indexOf("-")+1);                                
                    %>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="field7tag" class="left"><%=left%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="field7" id="field7"><%=right%></label>
                                    </div>            
                                </td>
                            </tr>
                    <%
                        }
                        if (!resPermitDetail.getString("field8").equalsIgnoreCase(""))
                        {
                            orig = resPermitDetail.getString("field8");
                            left = orig.substring(0,orig.indexOf("-"));
                            right = orig.substring(orig.indexOf("-")+1);                                
                    %>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="field8tag" class="left"><%=left%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="field8" id="field8"><%=right%></label>
                                    </div>            
                                </td>
                            </tr>
                    <%
                        }
                        if (!resPermitDetail.getString("field9").equalsIgnoreCase(""))
                        {
                            orig = resPermitDetail.getString("field9");
                            left = orig.substring(0,orig.indexOf("-"));
                            right = orig.substring(orig.indexOf("-")+1);                                
                    %>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="field9tag" class="left"><%=left%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="field9" id="field9"><%=right%></label>
                                    </div>            
                                </td>
                            </tr>
                    <%
                        }
                        if (!resPermitDetail.getString("field10").equalsIgnoreCase(""))
                        {
                            orig = resPermitDetail.getString("field10");
                            left = orig.substring(0,orig.indexOf("-"));
                            right = orig.substring(orig.indexOf("-")+1);                                
                    %>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="field10tag" class="left"><%=left%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="field10" id="field10"><%=right%></label>
                                    </div>            
                                </td>
                            </tr>
                    <%
                        }
                        if (!resPermitDetail.getString("field11").equalsIgnoreCase(""))
                        {
                            orig = resPermitDetail.getString("field11");
                            left = orig.substring(0,orig.indexOf("-"));
                            right = orig.substring(orig.indexOf("-")+1);                                
                    %>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="field11tag" class="left"><%=left%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="field11" id="field11"><%=right%></label>
                                    </div>            
                                </td>
                            </tr>
                    <%
                        }
                        if (!resPermitDetail.getString("field12").equalsIgnoreCase(""))
                        {
                            orig = resPermitDetail.getString("field12");
                            left = orig.substring(0,orig.indexOf("-"));
                            right = orig.substring(orig.indexOf("-")+1);                                
                    %>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="field12tag" class="left"><%=left%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="field12" id="field12"><%=right%></label>
                                    </div>            
                                </td>
                            </tr>
                    <%
                        }
                        if (!resPermitDetail.getString("field13").equalsIgnoreCase(""))
                        {
                            orig = resPermitDetail.getString("field13");
                            left = orig.substring(0,orig.indexOf("-"));
                            right = orig.substring(orig.indexOf("-")+1);                                
                    %>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="field13tag" class="left"><%=left%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="field13" id="field13"><%=right%></label>
                                    </div>            
                                </td>
                            </tr>
                    <%
                        }
                        if (!resPermitDetail.getString("field14").equalsIgnoreCase(""))
                        {
                            orig = resPermitDetail.getString("field14");
                            left = orig.substring(0,orig.indexOf("-"));
                            right = orig.substring(orig.indexOf("-")+1);                                
                    %>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="field14tag" class="left"><%=left%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="field14" id="field14"><%=right%></label>
                                    </div>            
                                </td>
                            </tr>
                    <%
                        }
                        if (!resPermitDetail.getString("field15").equalsIgnoreCase(""))
                        {
                            orig = resPermitDetail.getString("field15");
                            left = orig.substring(0,orig.indexOf("-"));
                            right = orig.substring(orig.indexOf("-")+1);                                
                    %>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="field15tag" class="left"><%=left%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="field15" id="field15"><%=right%></label>
                                    </div>            
                                </td>
                            </tr>
                    <%
                        }
                        if (!resPermitDetail.getString("field16").equalsIgnoreCase(""))
                        {
                            orig = resPermitDetail.getString("field16");
                            left = orig.substring(0,orig.indexOf("-"));
                            right = orig.substring(orig.indexOf("-")+1);                                
                    %>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="field16tag" class="left"><%=left%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="field16" id="field16"><%=right%></label>
                                    </div>            
                                </td>
                            </tr>
                    <%
                        }
                        if (!resPermitDetail.getString("field17").equalsIgnoreCase(""))
                        {
                            orig = resPermitDetail.getString("field17");
                            left = orig.substring(0,orig.indexOf("-"));
                            right = orig.substring(orig.indexOf("-")+1);                                
                    %>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="field17tag" class="left"><%=left%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="field17" id="field17"><%=right%></label>
                                    </div>            
                                </td>
                            </tr>
                    <%
                        }
                        if (!resPermitDetail.getString("field18").equalsIgnoreCase(""))
                        {
                            orig = resPermitDetail.getString("field18");
                            left = orig.substring(0,orig.indexOf("-"));
                            right = orig.substring(orig.indexOf("-")+1);                                
                    %>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="field18tag" class="left"><%=left%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="field18" id="field18"><%=right%></label>
                                    </div>            
                                </td>
                            </tr>
                    <%
                        }
                        if (!resPermitDetail.getString("field19").equalsIgnoreCase(""))
                        {
                            orig = resPermitDetail.getString("field19");
                            left = orig.substring(0,orig.indexOf("-"));
                            right = orig.substring(orig.indexOf("-")+1);                                
                    %>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="field19tag" class="left"><%=left%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="field19" id="field19"><%=right%></label>
                                    </div>            
                                </td>
                            </tr>
                    <%
                        }
                        if (!resPermitDetail.getString("field20").equalsIgnoreCase(""))
                        {
                            orig = resPermitDetail.getString("field20");
                            left = orig.substring(0,orig.indexOf("-"));
                            right = orig.substring(orig.indexOf("-")+1);                                
                    %>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="field20tag" class="left"><%=left%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="field20" id="field20"><%=right%></label>
                                    </div>            
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="Statustag" class="left">Status</label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="Status" id="Status"><%=stat%></label>
                                    </div>            
                                </td>
                            </tr>
                    <%
                        }
                        if (stat.equalsIgnoreCase("Approved"))
                        {
                    %>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="permitApprovetag" class="left">Date of Approval</label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="permitApprove" id="permitApprove"><%=realMonth2%>&nbsp;<%=day2%>,&nbsp;<%=year2%></label>
                                    </div>            
                                </td>
                            </tr>
                    <%
                        }
                        else
                        {    
                            if (stat.equalsIgnoreCase("Rejected"))
                            {    
                    %>
                                <tr>
                                    <td>
                                        <div align="center">
                                            <label for="n" id="permitApprovetag" class="left">Date of Rejection</label> 
                                        </div>            
                                    </td>
                                    <td>
                                        <div align="center">
                                             <label name="permitApprove" id="permitApprove"><%=realMonth3%>&nbsp;<%=day3%>,&nbsp;<%=year3%></label>
                                        </div>            
                                    </td>
                                </tr>
                    <%
                            }
                        }
                    %>
                    </table>
                   
                    <%
                        String remarks = resPermitDetail.getString("remark");
                        if(remarks == null)
                            remarks = "";
                    
                        if (stat.equalsIgnoreCase("Rejected"))
                        {
                    %>
                            <div>
                                <label for="n" id="remarkstag" class="left" style="font-size:10pt"><b>Remarks</b></label> 
                            </div>            
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <textarea name="textarea1" id="textarea1" rows="5" cols="47" disabled><%=remarks%></textarea>
                    <%
                        }
                    %>        
                        <p>
                            <div align=center>
                                <input type = button value="Print" onClick="window.print()"></input>
                    <%
                            String expStat = resPermitDetail.getString("expiration");
                            if((request.getParameter("type").equalsIgnoreCase("Resident") || request.getParameter("type").equalsIgnoreCase("Director")) && expStat.equalsIgnoreCase("Expired") && stat.equalsIgnoreCase("Approved"))
                            {
                    %>                                    
                                <input type = button value="I Will Renew" onClick="javascript:onRenew();"></input>
                                <input type = button value="I Will Not Renew" onClick="javascript:NORenew();"></input>
                    <%
                            }
                        if(Back.equalsIgnoreCase("true") && request.getParameter("permitID").equalsIgnoreCase("none"))
                        {    
                    %>   
                                <input type = button value="Back" onClick="javascript:onBack();"></input>         
                    <%
                        }
                        else if (Back.equalsIgnoreCase("true") && !request.getParameter("type").equalsIgnoreCase("Resident"))
                        {    
                    %>   
                                <input type = button value="Back" onClick="javascript:onBack2();"></input>         
                    <%
                        }
                    %>
                            </div>
                        </p>
                </form>
            </div>
        </div>
    
        <div class="footer">
            <p>Copyright &copy; 2006 Your Company | All Rights Reserved</p>
            <p class="credits">Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a> | Modified by <a href="#" title="Adaptor Homepage">Your Name</a> | Powered by <a href="#" title="Content Management System">Your CMS</a> | <a href="http://validator.w3.org/check?uri=referer" title="Validate XHTML code">W3C XHTML 1.0</a> | <a href="http://jigsaw.w3.org/css-validator/" title="Validate CSS code">W3C CSS 2.0</a></p>
        </div>
    </div>
</body>
</html>