
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
<script type= "text/javascript">
    function clr()
    {
        document.getElementById('field1tag').style.color="rgb(80,80,80)";
        if(document.getElementById('field2hidden').value.length > 0)
        {
            document.getElementById('field2').value="";
            document.getElementById('field2tag').style.color="rgb(80,80,80)";
            document.getElementById('field2').style.border = "solid 1px rgb(200,200,200)";
            document.getElementById('field2').style.background = "white";
        }    
            
        if(document.getElementById('field3hidden').value.length > 0)
        {
            document.getElementById('field3').value="";
            document.getElementById('field3tag').style.color="rgb(80,80,80)";
            document.getElementById('field3').style.border = "solid 1px rgb(200,200,200)";
            document.getElementById('field3').style.background = "white";
        }
            
        if(document.getElementById('field4hidden').value.length > 0)
        {
            document.getElementById('field4').value="";
            document.getElementById('field4tag').style.color="rgb(80,80,80)";
            document.getElementById('field4').style.border = "solid 1px rgb(200,200,200)";
            document.getElementById('field4').style.background = "white";
        }
            
        if(document.getElementById('field5hidden').value.length > 0)
        {
            document.getElementById('field5').value="";
            document.getElementById('field5tag').style.color="rgb(80,80,80)";
            document.getElementById('field5').style.border = "solid 1px rgb(200,200,200)";
            document.getElementById('field5').style.background = "white";
        }
            
        if(document.getElementById('field6hidden').value.length > 0)
        {
            document.getElementById('field6').value="";
            document.getElementById('field6tag').style.color="rgb(80,80,80)";
            document.getElementById('field6').style.border = "solid 1px rgb(200,200,200)";
            document.getElementById('field6').style.background = "white";
        }
            
        if(document.getElementById('field7hidden').value.length > 0)
        {
            document.getElementById('field7').value="";
            document.getElementById('field7tag').style.color="rgb(80,80,80)";
            document.getElementById('field7').style.border = "solid 1px rgb(200,200,200)";
            document.getElementById('field7').style.background = "white";
        }
            
        if(document.getElementById('field8hidden').value.length > 0)
        {
            document.getElementById('field8').value="";
            document.getElementById('field8tag').style.color="rgb(80,80,80)";
            document.getElementById('field8').style.border = "solid 1px rgb(200,200,200)";
            document.getElementById('field8').style.background = "white";
        }
        
        if(document.getElementById('field9hidden').value.length > 0)
        {
            document.getElementById('field9').value="";
            document.getElementById('field9tag').style.color="rgb(80,80,80)";
            document.getElementById('field9').style.border = "solid 1px rgb(200,200,200)";
            document.getElementById('field9').style.background = "white";
        }
        
        if(document.getElementById('field10hidden').value.length > 0)
        {
            document.getElementById('field10').value="";
            document.getElementById('field10tag').style.color="rgb(80,80,80)";
            document.getElementById('field10').style.border = "solid 1px rgb(200,200,200)";
            document.getElementById('field10').style.background = "white";
        }        
       
        if(document.getElementById('field11hidden').value.length > 0)
        {
            document.getElementById('field11').value="";
            document.getElementById('field11tag').style.color="rgb(80,80,80)";
            document.getElementById('field11').style.border = "solid 1px rgb(200,200,200)";
            document.getElementById('field11').style.background = "white";
        }
        if(document.getElementById('field12hidden').value.length > 0)
        {
            document.getElementById('field12').value="";
            document.getElementById('field12tag').style.color="rgb(80,80,80)";
            document.getElementById('field12').style.border = "solid 1px rgb(200,200,200)";
            document.getElementById('field12').style.background = "white";
        }
        if(document.getElementById('field13hidden').value.length > 0)
        {
            document.getElementById('field13').value="";
            document.getElementById('field13tag').style.color="rgb(80,80,80)";
            document.getElementById('field13').style.border = "solid 1px rgb(200,200,200)";
            document.getElementById('field13').style.background = "white";
        }
        if(document.getElementById('field14hidden').value.length > 0)
        {
            document.getElementById('field14').value="";
            document.getElementById('field14tag').style.color="rgb(80,80,80)";
            document.getElementById('field14').style.border = "solid 1px rgb(200,200,200)";
            document.getElementById('field14').style.background = "white";
        }
        if(document.getElementById('field15hidden').value.length > 0)
        {
            document.getElementById('field15').value="";
            document.getElementById('field15tag').style.color="rgb(80,80,80)";
            document.getElementById('field15').style.border = "solid 1px rgb(200,200,200)";
            document.getElementById('field15').style.background = "white";
        }
        if(document.getElementById('field16hidden').value.length > 0)
        {
            document.getElementById('field16').value="";
            document.getElementById('field16tag').style.color="rgb(80,80,80)";
            document.getElementById('field16').style.border = "solid 1px rgb(200,200,200)";
            document.getElementById('field16').style.background = "white";
        }
        if(document.getElementById('field17hidden').value.length > 0)
        {
            document.getElementById('field17').value="";
            document.getElementById('field17tag').style.color="rgb(80,80,80)";
            document.getElementById('field17').style.border = "solid 1px rgb(200,200,200)";
            document.getElementById('field17').style.background = "white";
        }
        if(document.getElementById('field18hidden').value.length > 0)
        {
            document.getElementById('field18').value="";
            document.getElementById('field18tag').style.color="rgb(80,80,80)";
            document.getElementById('field18').style.border = "solid 1px rgb(200,200,200)";
            document.getElementById('field18').style.background = "white";
        }
        if(document.getElementById('field19hidden').value.length > 0)
        {
            document.getElementById('field19').value="";
            document.getElementById('field19tag').style.color="rgb(80,80,80)";
            document.getElementById('field19').style.border = "solid 1px rgb(200,200,200)";
            document.getElementById('field19').style.background = "white";
        }
        if(document.getElementById('field20hidden').value.length > 0)
        {
            document.getElementById('field20').value="";
            document.getElementById('field20tag').style.color="rgb(80,80,80)";
            document.getElementById('field20').style.border = "solid 1px rgb(200,200,200)";
            document.getElementById('field20').style.background = "white";
        }
    }
    function checkForm()
    {
        var i = 0;
        if(document.getElementById('field2hidden').value.length > 0)
        {
            if(document.getElementById('field2').value.length == 0)
            {    
                document.getElementById('field2tag').style.color = "red";
                i++;
            }
            else
                document.getElementById('field2tag').style.color = "rgb(80,80,80)";
        }
        
        if(document.getElementById('field3hidden').value.length > 0)
        {
            if(document.getElementById('field3').value.length == 0)
            {    
                document.getElementById('field3tag').style.color = "red";
                i++;
            }
            else
                document.getElementById('field3tag').style.color = "rgb(80,80,80)";
        }
        
        if(document.getElementById('field4hidden').value.length > 0)
        {
            if(document.getElementById('field4').value.length == 0)
            {    
                document.getElementById('field4tag').style.color = "red";
                i++;
            }
            else
                document.getElementById('field4tag').style.color = "rgb(80,80,80)";
        }
        
        if(document.getElementById('field5hidden').value.length > 0)
        {
            if(document.getElementById('field5').value.length == 0)
            {    
                document.getElementById('field5tag').style.color = "red";
                i++;
            }
            else
                document.getElementById('field5tag').style.color = "rgb(80,80,80)";
        }
        
        if(document.getElementById('field6hidden').value.length > 0)
        {
            if(document.getElementById('field6').value.length == 0)
            {    
                document.getElementById('field6tag').style.color = "red";
                i++;
            }
            else
                document.getElementById('field6tag').style.color = "rgb(80,80,80)";
        }

        if(document.getElementById('field7hidden').value.length > 0)
        {
            if(document.getElementById('field7').value.length == 0)
            {    
                document.getElementById('field7tag').style.color = "red";
                i++;
            }
            else
                document.getElementById('field7tag').style.color = "rgb(80,80,80)";
        }
        
        if(document.getElementById('field8hidden').value.length > 0)
        {
            if(document.getElementById('field8').value.length == 0)
            {    
                document.getElementById('field8tag').style.color = "red";
                i++;
            }
            else
                document.getElementById('field8tag').style.color = "rgb(80,80,80)";
        }
        if(document.getElementById('field9hidden').value.length > 0)
        {
            if(document.getElementById('field9').value.length == 0)
            {    
                document.getElementById('field9tag').style.color = "red";
                i++;
            }
            else
                document.getElementById('field9tag').style.color = "rgb(80,80,80)";
        }
        
        if(document.getElementById('field10hidden').value.length > 0)
        {
            if(document.getElementById('field10').value.length == 0)
            {    
                document.getElementById('field10tag').style.color = "red";
                i++;
            }
            else
                document.getElementById('field10tag').style.color = "rgb(80,80,80)";
        }
        
        if(document.getElementById('field11hidden').value.length > 0)
        {
            if(document.getElementById('field11').value.length == 0)
            {    
                document.getElementById('field11tag').style.color = "red";
                i++;
            }
            else
                document.getElementById('field11tag').style.color = "rgb(80,80,80)";
        }
        
        if(document.getElementById('field12hidden').value.length > 0)
        {
            if(document.getElementById('field12').value.length == 0)
            {    
                document.getElementById('field12tag').style.color = "red";
                i++;
            }
            else
                document.getElementById('field12tag').style.color = "rgb(80,80,80)";
        }
        
        if(document.getElementById('field13hidden').value.length > 0)
        {
            if(document.getElementById('field13').value.length == 0)
            {    
                document.getElementById('field13tag').style.color = "red";
                i++;
            }
            else
                document.getElementById('field13tag').style.color = "rgb(80,80,80)";
        }

        if(document.getElementById('field14hidden').value.length > 0)
        {
            if(document.getElementById('field14').value.length == 0)
            {    
                document.getElementById('field14tag').style.color = "red";
                i++;
            }
            else
                document.getElementById('field14tag').style.color = "rgb(80,80,80)";
        }
        
        if(document.getElementById('field15hidden').value.length > 0)
        {
            if(document.getElementById('field15').value.length == 0)
            {    
                document.getElementById('field15tag').style.color = "red";
                i++;
            }
            else
                document.getElementById('field15tag').style.color = "rgb(80,80,80)";
        }
        if(document.getElementById('field16hidden').value.length > 0)
        {
            if(document.getElementById('field16').value.length == 0)
            {    
                document.getElementById('field16tag').style.color = "red";
                i++;
            }
            else
                document.getElementById('field16tag').style.color = "rgb(80,80,80)";
        }
        
        if(document.getElementById('field17hidden').value.length > 0)
        {
            if(document.getElementById('field17').value.length == 0)
            {    
                document.getElementById('field17tag').style.color = "red";
                i++;
            }
            else
                document.getElementById('field17tag').style.color = "rgb(80,80,80)";
        }
        
        if(document.getElementById('field18hidden').value.length > 0)
        {
            if(document.getElementById('field18').value.length == 0)
            {    
                document.getElementById('field18tag').style.color = "red";
                i++;
            }
            else
                document.getElementById('field18tag').style.color = "rgb(80,80,80)";
        }

        if(document.getElementById('field19hidden').value.length > 0)
        {
            if(document.getElementById('field19').value.length == 0)
            {    
                document.getElementById('field19tag').style.color = "red";
                i++;
            }
            else
                document.getElementById('field19tag').style.color = "rgb(80,80,80)";
        }
        
        if(document.getElementById('field20hidden').value.length > 0)
        {
            if(document.getElementById('field20').value.length == 0)
            {    
                document.getElementById('field20tag').style.color = "red";
                i++;
            }
            else
                document.getElementById('field20tag').style.color = "rgb(80,80,80)";
        }
        if (i > 0)
        {
            alert("Check Fields in red.");
            return false;
        }
        else
            return true;        
    }  
</script>
<body>
<%	
    if(session.getAttribute("uname") == null)
        response.sendRedirect("homepage.jsp");

    int resID = Integer.parseInt(request.getParameter("residentID"));

    String permitID = request.getParameter("permitID");
    session.setAttribute("permitID", permitID);
    Permits p = new Permits();
    Residents r = new Residents();

    CachedRowSet checkSet = p.getCheckDetails(permitID);
    CachedRowSet fieldSet = p.getFieldDetails(permitID);
    String permitName = fieldSet.getString("permitName");
    serviceTemplate t = new  serviceTemplate();        
    CachedRowSet c = t.getServices();
    CachedRowSet residentDB = r.getResInfo(resID);
    residentDB.next();
    checkSet.next();
    int last = p.getLastPermitId();
%>
    <!-- For alternative headers START PASTE here -->
    <!-- Main Page Container -->
    <div class="page-container">
        <!-- A. HEADER -->      
        <div class="header">

            <!-- A.1 HEADER TOP -->
            <div class="header-top">

                <!-- Sitelogo and sitename -->
                <a class="sitelogo" href="#" title="Go to Start page"></a>
                <div class="sitename">
                    <h1><a href="#" title="Go to Start page">CONVERGE</a></h1>
                    <h2>Generic Community Association Portal</h2>
                </div>

                <!-- Navigation Level 1 -->
                <div class="nav1">
                    <ul>
                        <li><a href="residentDash.jsp" title="Go to Start page">Home</a></li>
                        <li><a href="#" title="Get to know who we are">About</a></li>
                        <li><a href="#" title="Get in touch with us">Contact</a></li>																		
                        <li><a href="#" title="Get an overview of website">Sitemap</a></li>
                    </ul>
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

            <!-- A.3 HEADER BOTTOM -->
            <div class="header-bottom">
                <!-- Navigation Level 2 (Drop-down menus) -->
                <div class="nav2">
                <!-- Navigation item -->
                    <ul>
                        <li><a href="residentDash.jsp">Home</a></li>
                    </ul>
                    <ul>
                        <li><a href="residentMessageBox.jsp">Mailbox</a></li>
                    </ul>
                    <ul>  
                        <li><a href="#">My Account</a><!--<![endif]-->
                            <ul>
                                <li><a href="resMyAccount.jsp">Account Information</a></li>
                                <li><a href="resAddSub.jsp">Add Sub-Account</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul>
                        <li><a href="logout.jsp">Logout</a></li>
                    </ul>
                </div>
            </div>    

            <!-- A.4 HEADER BREADCRUMBS -->

            <!-- Breadcrumbs -->
            <div class="header-breadcrumbs">
                <ul>
                    <li><a href="#">Tahanan Village</a></li>
                </ul>
            </div>
        </div>

        <!-- For alternative headers END PASTE here -->

        <!-- B. MAIN -->
        <div class="main">
            <div class="main-navigation">
                <!-- Navigation Level 3 -->
                <div class="round-border-topright"></div><br><br>
                <h1 class="first">Community Services</h1>
                <!-- Navigation with grid style -->
                <dl class="nav3-grid">
<%
                Permits p2 = new Permits();
                String orig, left="", right="";
                int rID = (Integer)session.getAttribute("residentId");
                String resID2 = String.valueOf(rID);
                CachedRowSet resPermits = p2.getResidentPermits(resID2);
                String type  = (String)session.getAttribute("type");
                int exp = p2.getResidentExpiration(rID);
                if(c.size() >0)
                {
                    while(c.next())
                    {
                        if(c.getString("permit").equals("Yes"))
                        {
                            if (resPermits.size() > 0)
                            {
                                orig = p2.getResidentViewCount(rID);
                                left = orig.substring(0,orig.indexOf("-"));
                                right = orig.substring(orig.indexOf("-")+1);
                                if(Integer.parseInt(left)!=0 && Integer.parseInt(right)!=0 && exp!=0)
                                {
%>
                                    <dt><a href="residentPermits.jsp">Permits <br> (<%=left%>)Approved (<%=right%>)Rejected <br> (<%=exp%>)Expired</a></dt>
<%
                                }
                                else if(Integer.parseInt(left)!=0 && Integer.parseInt(right)==0 && exp==0)
                                {    
%>
                                    <dt><a href="residentPermits.jsp">Permits <br> (<%=left%>)Approved</a></dt>                                
<%
                                }
                                else if(Integer.parseInt(left)!=0 && Integer.parseInt(right)==0 && exp!=0)
                                {    
%>
                                    <dt><a href="residentPermits.jsp">Permits <br> (<%=left%>)Approved (<%=exp%>)Expired</a></dt>                                
<%
                                }
                                else if(Integer.parseInt(left)==0 && Integer.parseInt(right)!=0 && exp==0)
                                {    
%>
                                    <dt><a href="residentPermits.jsp">Permits <br> (<%=right%>)Rejected</a></dt>                                
<%
                                }
                                else if(Integer.parseInt(left)==0 && Integer.parseInt(right)!=0 && exp!=0)
                                {    
%>
                                    <dt><a href="residentPermits.jsp">Permits <br> (<%=right%>)Rejected (<%=exp%>)Expired</a></dt>                                
<%
                                }
                                else if(Integer.parseInt(left)==0 && Integer.parseInt(right)==0 && exp!=0)
                                {    
%>
                                    <dt><a href="residentPermits.jsp">Permits <br> (<%=exp%>)Expired</a></dt>                                
<%
                                }
                                else if(Integer.parseInt(left)==0 && Integer.parseInt(right)==0)
                                {
%>
                                    <dt><a href="residentPermits.jsp">Permits</a></dt>
<%                        
                                }    
                            }
                            else
                            {    
%>
                                <dt><a href="residentPermits.jsp">Permits</a></dt>
<% 
                            }
                        }
                        if(type.equalsIgnoreCase("Director"))
                        {
%>                
                            <dt><a href="directorPermit.jsp">Permits to be Approved</a></dt>
<%          
                        }
                        if(c.getString("reservation").equals("Yes"))
                        {    
%> 
                            <dt><a href="residentReserve.jsp">Reservations</a></dt>
<% 
                        }
                        if(c.getString("socialgroups").equals("Yes"))
                        {    
%> 
                            <dt><a href="residentSocMain.jsp">Social Groups</a></dt> 
<% 
                        }
                        if(c.getString("vote").equals("Yes"))
                        {    
%> 
                            <dt><a href="residentPolls.jsp">Polls or Elections</a></dt>
<% 
                        }
                        if(c.getString("bulletinBoard").equals("Yes"))
                        {    
%> 
                            <dt><a href="residentBulletinBoard.jsp">Bulletin Board</a></dt>
<% 
                        }
                        if(c.getString("billing").equals("Yes"))
                        {    
%>  
                            <dt><a href="residentBill.jsp">Billing</a></dt>
<% 
                        }
                        if(c.getString("newsletter").equals("Yes"))
                        {    
%>  
                            <dt><a href="residentNewsletter.jsp">Newsletter</a></dt>
<%    
                        }
                    }
                }
%>     
                </dl><Br /><Br />  

            <!-- Title --> 
            </div>
            <div class="main-content">
                <div class="column1-unit">
                    <h1 class="block" align="center"><%=permitName%> Permit Details</h1>
                    <%
                        Calendar myCalendar = Calendar.getInstance();

                        int month = myCalendar.get(Calendar.MONTH)+1;
                        int year = myCalendar.get(Calendar.YEAR);
                        int day = myCalendar.get(Calendar.DATE);
                        Converter conv = new Converter();
                        String realMonth = conv.convMonth(month);
                    %>
                    <form onsubmit="return (checkForm())" action ="processResAddPermit.jsp?type=Resident" method="get">
                        <table width="536" border="1">
                            <h2 align="center"><strong><%=permitName%> Permit Description</strong></h2>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" class="left"><b>Permit Number</b></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label><b><%=last%></b></label>
                                    </div>            
                                </td>
                            </tr>
                            <div>
                                <label for="n" id="rulestag" class="left" style="font-size:10pt"><b>Rules</b></label> 
                            </div>            
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <textarea name="textarea1" wrap="soft" id="textarea1" rows="5" cols="47" readonly><%=fieldSet.getString("Rules")%></textarea>
                            <p></p>
                                       
                        <%
                            if (checkSet.getString("field1").equalsIgnoreCase("Yes") || checkSet.getString("field1").equalsIgnoreCase("On"))
                            { 
                        %>
                                <tr>
                                    <td>
                                        <div align="center">
                                            <label for="n" id="field1tag" class="left"><%=fieldSet.getString("field1")%></label> 
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
                        %>
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="pfeetag" class="left">Permit Fee</label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <label name="pfee" id="pfee"><%=fieldSet.getDouble("pfee")%></label>
                                    </div>            
                                </td>
                            </tr>
                        <%
                            if (checkSet.getString("field2").equalsIgnoreCase("Yes") || checkSet.getString("field2").equalsIgnoreCase("On"))
                            {
                        %>
                                <input type="hidden" id="field2hidden" name="field2hidden" class="field" value="Yes"></input>
                                <tr>
                                    <td>
                                        <div align="center">
                                            <label for="n" id="field2tag" class="left"><%=fieldSet.getString("field2")%></label> 
                                        </div>            
                                    </td>
                                    <td>
                                        <div align="center">
                                             <input type="text" id="field2" name="field2" class="field" value=""></input>
                                        </div>            
                                    </td>
                                </tr>
                         <%
                            }
                            else
                            {    
                         %>
                                <input type="hidden" id="field2hidden" name="field2hidden" class="field" value=""></input>
                         <%
                            }
                            if (checkSet.getString("field3").equalsIgnoreCase("Yes") || checkSet.getString("field3").equalsIgnoreCase("On"))
                            { 
                         %>
                                <input type="hidden" id="field3hidden" name="field3hidden" class="field" value="Yes"></input>
                                <tr>
                                    <td>
                                        <div align="center">
                                            <label for="n" id="field3tag" class="left"><%=fieldSet.getString("field3")%></label> 
                                        </div>            
                                    </td>
                                    <td>
                                        <div align="center">
                                             <input type="text" id="field3" name="field3" class="field" value=""></input>
                                        </div>            
                                    </td>  
                                </tr>
                         <%
                            }
                            else
                            {    
                         %>
                                <input type="hidden" id="field3hidden" name="field3hidden" class="field" value=""></input>
                         <%
                            }
                            if (checkSet.getString("field4").equalsIgnoreCase("Yes") || checkSet.getString("field4").equalsIgnoreCase("On"))
                            { 
                         %>     
                                <input type="hidden" id="field4hidden" name="field4hidden" class="field" value="Yes"></input>
                                <tr>
                                    <td>
                                        <div align="center">
                                            <label for="n" id="field4tag"class="left"><%=fieldSet.getString("field4")%></label> 
                                        </div>            
                                    </td>
                                    <td>
                                        <div align="center">
                                             <input type="text" id="field4" name="field4" class="field" value=""></input>
                                        </div>                       
                                    </td> 
                                </tr>
                        <%
                            }
                            else
                            {    
                         %>
                                <input type="hidden" id="field4hidden" name="field4hidden" class="field" value=""></input>
                         <%
                            }
                            if (checkSet.getString("field5").equalsIgnoreCase("Yes") || checkSet.getString("field5").equalsIgnoreCase("On"))
                            { 
                        %>    
                                <input type="hidden" id="field5hidden" name="field5hidden" class="field" value="Yes"></input>
                                <tr>
                                    <td>
                                        <div align="center">
                                            <label for="n" class="left" id="field5tag"><%=fieldSet.getString("field5")%></label> 
                                        </div>            
                                    </td>
                                    <td>
                                        <div align="center">
                                            <input type="text" id="field5" name="field5" class="field" value=""></input>
                                        </div>            
                                    </td>                                            
                                </tr>
                        <%
                            }
                            else
                            {    
                         %>
                                <input type="hidden" id="field5hidden" name="field5hidden" class="field" value=""></input>
                         <%
                            }
                            if (checkSet.getString("field6").equalsIgnoreCase("Yes") || checkSet.getString("field6").equalsIgnoreCase("On"))
                            { 
                        %>    
                                <input type="hidden" id="field6hidden" name="field6hidden" class="field" value="Yes"></input>
                                <tr>
                                    <td>
                                        <div align="center">
                                            <label for="n" class="left" id="field6tag"><%=fieldSet.getString("field6")%></label> 
                                        </div>            
                                    </td>
                                    <td>
                                        <div align="center">
                                            <input type="text" id="field6" name="field6" class="field" value=""></input>
                                        </div>            
                                    </td>                                            
                                </tr>
                        <%
                            }
                            else
                            {    
                         %>
                                <input type="hidden" id="field6hidden" name="field6hidden" class="field" value=""></input>
                         <%
                            }
                            if (checkSet.getString("field7").equalsIgnoreCase("Yes") || checkSet.getString("field7").equalsIgnoreCase("On"))
                            { 
                        %>    
                                <input type="hidden" id="field7hidden" name="field7hidden" class="field" value="Yes"></input>
                                <tr>
                                    <td>
                                        <div align="center">
                                            <label for="n" class="left" id="field7tag"><%=fieldSet.getString("field7")%></label> 
                                        </div>            
                                    </td>
                                    <td>
                                        <div align="center">
                                            <input type="text" id="field7" name="field7" class="field" value=""></input>
                                        </div>            
                                    </td>                                            
                                </tr>
                        <%
                            }
                            else
                            {    
                         %>
                                <input type="hidden" id="field7hidden" name="field7hidden" class="field" value=""></input>
                         <%
                            }
                            if (checkSet.getString("field8").equalsIgnoreCase("Yes") || checkSet.getString("field8").equalsIgnoreCase("On"))
                            { 
                        %>
                                <input type="hidden" id="field8hidden" name="field8hidden" class="field" value="Yes"></input>
                                <tr>
                                    <td>
                                        <div align="center">
                                            <label for="n" class="left" id="field8tag"><%=fieldSet.getString("field8")%></label> 
                                        </div>            
                                    </td>
                                    <td>
                                        <div align="center">
                                            <input type="text" id="field8" name="field8" class="field" value=""></input>
                                        </div>            
                                    </td>                                            
                                </tr>
                        <%
                            }
                            else
                            {    
                        %>
                                <input type="hidden" id="field8hidden" name="field8hidden" class="field" value=""></input>
                        <%
                            }
                            if (checkSet.getString("field9").equalsIgnoreCase("Yes") || checkSet.getString("field9").equalsIgnoreCase("On"))
                            { 
                        %>
                                <input type="hidden" id="field9hidden" name="field8hidden" class="field" value="Yes"></input>
                                <tr>
                                    <td>
                                        <div align="center">
                                            <label for="n" class="left" id="field9tag"><%=fieldSet.getString("field9")%></label> 
                                        </div>            
                                    </td>
                                    <td>
                                        <div align="center">
                                            <input type="text" id="field9" name="field9" class="field" value=""></input>
                                        </div>            
                                    </td>                                            
                                </tr>
                        <%
                            }
                            else
                            {    
                        %>
                                <input type="hidden" id="field9hidden" name="field9hidden" class="field" value=""></input>
                        <%
                            }
                            if (checkSet.getString("field10").equalsIgnoreCase("Yes") || checkSet.getString("field10").equalsIgnoreCase("On"))
                            { 
                        %>
                                <input type="hidden" id="field10hidden" name="field8hidden" class="field" value="Yes"></input>
                                <tr>
                                    <td>
                                        <div align="center">
                                            <label for="n" class="left" id="field10tag"><%=fieldSet.getString("field10")%></label> 
                                        </div>            
                                    </td>
                                    <td>
                                        <div align="center">
                                            <input type="text" id="field10" name="field10" class="field" value=""></input>
                                        </div>            
                                    </td>                                            
                                </tr>
                        <%
                            }
                            else
                            {    
                        %>
                                <input type="hidden" id="field10hidden" name="field10hidden" class="field" value=""></input>
                        <%
                            }
                            if (checkSet.getString("field11").equalsIgnoreCase("Yes") || checkSet.getString("field11").equalsIgnoreCase("On"))
                            { 
                        %>
                                <input type="hidden" id="field11hidden" name="field8hidden" class="field" value="Yes"></input>
                                <tr>
                                    <td>
                                        <div align="center">
                                            <label for="n" id="field11tag" class="left"><%=fieldSet.getString("field11")%></label> 
                                        </div>            
                                    </td>
                                    <td>
                                        <div align="center">
                                             <input type="text" id="field11" name="field11" class="field" value=""></input>
                                        </div>            
                                    </td>
                                </tr>
                        <%
                            }
                            else
                            {    
                        %>
                                <input type="hidden" id="field11hidden" name="field11hidden" class="field" value=""></input>
                        <%
                            }
                            if (checkSet.getString("field12").equalsIgnoreCase("Yes") || checkSet.getString("field12").equalsIgnoreCase("On"))
                            { 
                        %>
                                <input type="hidden" id="field12hidden" name="field8hidden" class="field" value="Yes"></input>
                                <tr>
                                    <td>
                                        <div align="center">
                                            <label for="n" id="field12tag" class="left"><%=fieldSet.getString("field12")%></label> 
                                        </div>            
                                    </td>
                                    <td>
                                        <div align="center">
                                             <input type="text" id="field12" name="field12" class="field" value=""></input>
                                        </div>            
                                    </td>
                                </tr>
                        <%
                            }
                            else
                            {    
                        %>
                                <input type="hidden" id="field12hidden" name="field12hidden" class="field" value=""></input>
                        <%
                            }
                            if (checkSet.getString("field13").equalsIgnoreCase("Yes") || checkSet.getString("field13").equalsIgnoreCase("On"))
                            { 
                         %>
                                <input type="hidden" id="field13hidden" name="field8hidden" class="field" value="Yes"></input>
                                <tr>
                                    <td>
                                        <div align="center">
                                            <label for="n" id="field13tag" class="left"><%=fieldSet.getString("field13")%></label> 
                                        </div>            
                                    </td>
                                    <td>
                                        <div align="center">
                                             <input type="text" id="field13" name="field13" class="field" value=""></input>
                                        </div>            
                                    </td>  
                                </tr>
                        <%
                            }
                            else
                            {    
                        %>
                                <input type="hidden" id="field13hidden" name="field13hidden" class="field" value=""></input>
                        <%
                            }
                            if (checkSet.getString("field14").equalsIgnoreCase("Yes") || checkSet.getString("field14").equalsIgnoreCase("On"))
                            { 
                        %>
                                <input type="hidden" id="field14hidden" name="field8hidden" class="field" value="Yes"></input>
                                <tr>
                                    <td>
                                        <div align="center">
                                            <label for="n" id="field14tag"class="left"><%=fieldSet.getString("field14")%></label> 
                                        </div>            
                                    </td>
                                    <td>
                                        <div align="center">
                                             <input type="text" id="field14" name="field14" class="field" value=""></input>
                                        </div>                       
                                    </td> 
                                </tr>
                        <%
                            }
                            else
                            {    
                        %>
                                <input type="hidden" id="field14hidden" name="field14hidden" class="field" value=""></input>
                        <%
                            }
                            if (checkSet.getString("field15").equalsIgnoreCase("Yes") || checkSet.getString("field15").equalsIgnoreCase("On"))
                            { 
                        %>
                                <input type="hidden" id="field15hidden" name="field8hidden" class="field" value="Yes"></input>
                                <tr>
                                    <td>
                                        <div align="center">
                                            <label for="n" class="left" id="field15tag"><%=fieldSet.getString("field15")%></label> 
                                        </div>            
                                    </td>
                                    <td>
                                        <div align="center">
                                            <input type="text" id="field15" name="field15" class="field" value=""></input>
                                        </div>            
                                    </td>                                            
                                </tr>
                        <%
                            }
                            else
                            {    
                        %>
                                <input type="hidden" id="field15hidden" name="field15hidden" class="field" value=""></input>
                        <%
                            }
                            if (checkSet.getString("field16").equalsIgnoreCase("Yes") || checkSet.getString("field16").equalsIgnoreCase("On"))
                            { 
                        %>
                                <input type="hidden" id="field16hidden" name="field8hidden" class="field" value="Yes"></input>
                                <tr>
                                    <td>
                                        <div align="center">
                                            <label for="n" class="left" id="field16tag"><%=fieldSet.getString("field16")%></label> 
                                        </div>            
                                    </td>
                                    <td>
                                        <div align="center">
                                            <input type="text" id="field16" name="field16" class="field" value=""></input>
                                        </div>            
                                    </td>                                            
                                </tr>
                        <%
                            }
                            else
                            {    
                        %>
                                <input type="hidden" id="field16hidden" name="field16hidden" class="field" value=""></input>
                        <%
                            }
                            if (checkSet.getString("field17").equalsIgnoreCase("Yes") || checkSet.getString("field17").equalsIgnoreCase("On"))
                            {
                        %>
                                <input type="hidden" id="field17hidden" name="field8hidden" class="field" value="Yes"></input>
                                <tr>
                                    <td>
                                        <div align="center">
                                            <label for="n" class="left" id="field17tag"><%=fieldSet.getString("field17")%></label> 
                                        </div>            
                                    </td>
                                    <td>
                                        <div align="center">
                                            <input type="text" id="field17" name="field17" class="field" value=""></input>
                                        </div>            
                                    </td>                                            
                                </tr>
                        <%
                            }
                            else
                            {    
                        %>
                                <input type="hidden" id="field17hidden" name="field17hidden" class="field" value=""></input>
                        <%
                            }
                            if (checkSet.getString("field18").equalsIgnoreCase("Yes") || checkSet.getString("field18").equalsIgnoreCase("On"))
                            { 
                        %>
                                <input type="hidden" id="field18hidden" name="field8hidden" class="field" value="Yes"></input>
                                <tr>
                                    <td>
                                        <div align="center">
                                            <label for="n" class="left" id="field18tag"><%=fieldSet.getString("field18")%></label> 
                                        </div>            
                                    </td>
                                    <td>
                                        <div align="center">
                                            <input type="text" id="field18" name="field18" class="field" value=""></input>
                                        </div>            
                                    </td>                                            
                                </tr>
                        <%
                            }
                            else
                            {    
                        %>
                                <input type="hidden" id="field18hidden" name="field18hidden" class="field" value=""></input>
                        <%
                            }
                            if (checkSet.getString("field19").equalsIgnoreCase("Yes") || checkSet.getString("field19").equalsIgnoreCase("On"))
                            { 
                        %>
                                <input type="hidden" id="field19hidden" name="field8hidden" class="field" value="Yes"></input>
                                <tr>
                                    <td>
                                        <div align="center">
                                            <label for="n" class="left" id="field19tag"><%=fieldSet.getString("field19")%></label> 
                                        </div>            
                                    </td>
                                    <td>
                                        <div align="center">
                                            <input type="text" id="field19" name="field19" class="field" value=""></input>
                                        </div>            
                                    </td>                                            
                                </tr>
                        <%
                            }
                            else
                            {    
                        %>
                                <input type="hidden" id="field19hidden" name="field19hidden" class="field" value=""></input>
                        <%
                            }
                            if (checkSet.getString("field20").equalsIgnoreCase("Yes") || checkSet.getString("field20").equalsIgnoreCase("On"))
                            {
                        %>
                                <input type="hidden" id="field20hidden" name="field8hidden" class="field" value="Yes"></input>
                                <tr>
                                    <td>
                                        <div align="center">
                                            <label for="n" class="left" id="field20tag"><%=fieldSet.getString("field20")%></label> 
                                        </div>            
                                    </td>
                                    <td>
                                        <div align="center">
                                            <input type="text" id="field20" name="field20" class="field" value=""></input>
                                        </div>            
                                    </td>                                            
                                </tr>
                        <%
                            }
                            else
                            {    
                        %>
                                <input type="hidden" id="field20hidden" name="field20hidden" class="field" value=""></input>
                        <%
                            }
                        %>    

                        </table>
                        <p></p>
                        <input type="hidden" id="type" name="type" value="Resident">
                        <div align="center">
                            <input type = submit value="Submit"></input>
                            <input type="button" value="Clear" onClick="clr();">
                        </div>
                    </form>
                </div>
            </div>
    </div>
    
    <div class="footer">
        <p>Copyright &copy; 2006 Your Company | All Rights Reserved</p>
        <p class="credits">Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a> | Modified by <a href="#" title="Adaptor Homepage">Your Name</a> | Powered by <a href="#" title="Content Management System">Your CMS</a> | <a href="http://validator.w3.org/check?uri=referer" title="Validate XHTML code">W3C XHTML 1.0</a> | <a href="http://jigsaw.w3.org/css-validator/" title="Validate CSS code">W3C CSS 2.0</a></p>
    </div> 
    
    </div>
    </body>
</html>