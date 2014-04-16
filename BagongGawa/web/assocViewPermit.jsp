
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.Calendar"%>
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
    <link rel="icon" type="image/x-icon" href="./img/favicon.ico" />
    <title>Converge - Administrator</title>
</head>
<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body>
<%
    if(session.getAttribute("uname") == null)
        response.sendRedirect("homepage.jsp");

    serviceTemplate sTemplate = new  serviceTemplate();
          
    CachedRowSet c = sTemplate.getServices();
    String permitID = request.getParameter("permitID");    
    Permits p = new Permits();    
    CachedRowSet checkSet = p.getCheckDetails(permitID);
    CachedRowSet fieldSet = p.getFieldDetails(permitID);
    String permitName = fieldSet.getString("permitName");
%>
    <!-- Main Page Container -->
    <div class="page-container">
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
 
        <!-- B.1 MAIN CONTENT -->
        <div class="main-content">
            <!-- Pagetitle -->            
            <div class="column1-unit">
                <h1 class="block" align="center"><%=permitName%> Permit Details</h1>
                <p>Below are the list of details needed for <b><%=permitName%></b> permit application.</p>
            <%
                if(checkSet.size() != 0 && fieldSet.size() != 0)
                {
                    while(checkSet.next())
                    {
            %>          
                            <table width="536" border="1">
                                <h2><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=permitName%> DESCRIPTION</strong></h2>
                                
                                <div>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="n" id="pfeetag" class="left">Permit Fee:</label> 
                                    <input type="text" id="pfee" name="pfee" disabled class="field" value="<%=fieldSet.getDouble("pfee")%>"></input>
                                </div>
                                <br/>
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
                                        <input type="text" id="field1" name="field1" class="field" value="" disabled></input>
                                    </div>                        
                                </td>
                            </tr>
                    <%
                        }
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
                                         <input type="text" id="field2" name="field2" class="field" value="" disabled></input>
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
                                         <input type="text" id="field3" name="field3" class="field" value="" disabled></input>
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
                                         <input type="text" id="field4" name="field4" class="field" value="" disabled></input>
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
                                        <input type="text" id="field5" name="field5" class="field" value="" disabled></input>
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
                                        <input type="text" id="field6" name="field6" class="field" value="" disabled></input>
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
                                        <input type="text" id="field7" name="field7" class="field" value="" disabled></input>
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
                                        <input type="text" id="field8" name="field8" class="field" value="" disabled></input>
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
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" class="left" id="field9tag"><%=fieldSet.getString("field9")%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                        <input type="text" id="field9" name="field9" class="field" value="" disabled></input>
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
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" class="left" id="field10tag"><%=fieldSet.getString("field10")%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                        <input type="text" id="field10" name="field10" class="field" value="" disabled></input>
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
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="field11tag" class="left"><%=fieldSet.getString("field11")%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <input type="text" id="field11" name="field11" class="field" value="" disabled></input>
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
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="field12tag" class="left"><%=fieldSet.getString("field12")%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <input type="text" id="field12" name="field12" class="field" value="" disabled></input>
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
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="field13tag" class="left"><%=fieldSet.getString("field13")%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <input type="text" id="field13" name="field13" class="field" value="" disabled></input>
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
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" id="field14tag"class="left"><%=fieldSet.getString("field14")%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                         <input type="text" id="field14" name="field14" class="field" value="" disabled></input>
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
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" class="left" id="field15tag"><%=fieldSet.getString("field15")%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                        <input type="text" id="field15" name="field15" class="field" value="" disabled></input>
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
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" class="left" id="field16tag"><%=fieldSet.getString("field16")%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                        <input type="text" id="field16" name="field16" class="field" value="" disabled></input>
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
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" class="left" id="field17tag"><%=fieldSet.getString("field17")%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                        <input type="text" id="field17" name="field17" class="field" value="" disabled></input>
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
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" class="left" id="field18tag"><%=fieldSet.getString("field18")%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                        <input type="text" id="field18" name="field18" class="field" value="" disabled></input>
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
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" class="left" id="field19tag"><%=fieldSet.getString("field19")%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                        <input type="text" id="field19" name="field19" class="field" value="" disabled></input>
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
                            <tr>
                                <td>
                                    <div align="center">
                                        <label for="n" class="left" id="field20tag"><%=fieldSet.getString("field20")%></label> 
                                    </div>            
                                </td>
                                <td>
                                    <div align="center">
                                        <input type="text" id="field20" name="field20" class="field" value="" disabled></input>
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
                    <div>
                        <label for="n" id="rulestag" class="left" style="font-size:10pt"><b>Rules</b></label> 
                    </div>            
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <textarea name="textarea1" id="textarea1" rows="5" cols="47" disabled><%=fieldSet.getString("Rules")%></textarea>
            <%
                    }
                }
            %>
            </div>
        </div>
      
        <!-- C. FOOTER AREA -->
        <div class="footer">
            <p>Copyright &copy; 2006 Your Company | All Rights Reserved</p>
            <p class="credits">Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a> | Modified by <a href="#" title="Adaptor Homepage">4B1C</a> | Powered by <a href="#" title="Content Management System">CCMS</a> | <a href="http://validator.w3.org/check?uri=referer" title="Validate XHTML code">W3C XHTML 1.0</a> | <a href="http://jigsaw.w3.org/css-validator/" title="Validate CSS code">W3C CSS 2.0</a></p>
        </div>      
    </div> 
</body>
</html>