 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

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
  <title>Converge - Administrator : Community Services</title>
  <style type="text/css">
<!--
.style2 {color: #000000}
-->
  </style>
  <script type= "text/javascript">
<!--
function check()
{
	var i = 0;
        if(document.choiceList.permitCheckBox.checked)
        {
            document.choiceList.permitCheckBox.value = 'Yes';
            i++;
        }
        else
        {
            document.choiceList.permitCheckBox.checked = true;
            document.choiceList.permitCheckBox.value = 'Nope';
        }
           
        if(document.choiceList.reservationCheckBox2.checked)
        {
            document.choiceList.reservationCheckBox2.value = 'Yes';
            i++;
        }
        else
        {
            document.choiceList.reservationCheckBox2.checked = true;
            document.choiceList.reservationCheckBox2.value = 'Nope';
        }
           
        if(document.choiceList.voteCheckBox3.checked)
        {
             document.choiceList.voteCheckBox3.value = 'Yes';
            i++;
        }
        else
        {
            document.choiceList.voteCheckBox3.checked = true;
            document.choiceList.voteCheckBox3.value = 'Nope';
        }
        
        
          
        if(document.choiceList.bulletinCheckBox5.checked)
        {
            document.choiceList.bulletinCheckBox5.value = 'Yes';
            i++;
        }
        else
        {
            document.choiceList.bulletinCheckBox5.checked = true;
            document.choiceList.bulletinCheckBox5.value = 'Nope';
        }
           
        if(document.choiceList.billingCheckBox7.checked)
        {
           document.choiceList.billingCheckBox7.value = 'Yes';
            i++;
        }
        else
        {
            document.choiceList.billingCheckBox7.checked = true;
            document.choiceList.billingCheckBox7.value = 'Nope';
        }
           
        if(document.choiceList.newsletterCheckBox6.checked)
        {
           document.choiceList.newsletterCheckBox6.value = 'Yes';
            i++;
        }
        else
        {
            document.choiceList.newsletterCheckBox6.checked = true;
            document.choiceList.newsletterCheckBox6.value = 'Nope';
        }
           
	if(document.choiceList.socgrpCheckBox4.checked)
        {
           document.choiceList.socgrpCheckBox4.value = 'Yes';
            i++;
        }
        else
        {
            document.choiceList.socgrpCheckBox4.checked = true;
            document.choiceList.socgrpCheckBox4.value = 'Nope';
        }
           
        
        if(i>0)
            return (true);
        else
        {
            alert("Choose from the options");
            return (false);
        }
            
		
}

function check2()
{
	var i = 0;
        if(document.choiceList2.permitCheckBox.checked)
        {
            document.choiceList2.permitCheckBox.value = 'Yes';
            i++;
        }
        else
        {
            document.choiceList2.permitCheckBox.checked = true;
            document.choiceList2.permitCheckBox.value = 'Nope';
        }
           
        if(document.choiceList2.reservationCheckBox2.checked)
        {
            document.choiceList2.reservationCheckBox2.value = 'Yes';
            i++;
        }
        else
        {
            document.choiceList2.reservationCheckBox2.checked = true;
            document.choiceList2.reservationCheckBox2.value = 'Nope';
        }
           
        if(document.choiceList2.voteCheckBox3.checked)
        {
             document.choiceList2.voteCheckBox3.value = 'Yes';
            i++;
        }
        else
        {
            document.choiceList2.voteCheckBox3.checked = true;
            document.choiceList2.voteCheckBox3.value = 'Nope';
        }
        
        
          
        if(document.choiceList2.bulletinCheckBox5.checked)
        {
            document.choiceList2.bulletinCheckBox5.value = 'Yes';
            i++;
        }
        else
        {
            document.choiceList2.bulletinCheckBox5.checked = true;
            document.choiceList2.bulletinCheckBox5.value = 'Nope';
        }
           
        if(document.choiceList2.billingCheckBox7.checked)
        {
           document.choiceList2.billingCheckBox7.value = 'Yes';
            i++;
        }
        else
        {
            document.choiceList2.billingCheckBox7.checked = true;
            document.choiceList2.billingCheckBox7.value = 'Nope';
        }
           
        if(document.choiceList2.newsletterCheckBox6.checked)
        {
           document.choiceList2.newsletterCheckBox6.value = 'Yes';
            i++;
        }
        else
        {
            document.choiceList2.newsletterCheckBox6.checked = true;
            document.choiceList2.newsletterCheckBox6.value = 'Nope';
        }
           
	if(document.choiceList2.socgrpCheckBox4.checked)
        {
           document.choiceList2.socgrpCheckBox4.value = 'Yes';
            i++;
        }
        else
        {
            document.choiceList2.socgrpCheckBox4.checked = true;
            document.choiceList2.socgrpCheckBox4.value = 'Nope';
        }
           
        
        if(i>0)
            return (true);
        else
        {
            alert("Choose from the options");
            return (false);
        }
            
		
}
</script>
</head>

<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body>
<%            
    serviceTemplate t = new serviceTemplate();        
    CachedRowSet c = t.getServices();
Unit u = new Unit();
    addFacility ADDFAC = new addFacility();
    CachedRowSet vilinfo = u.getVillageInfo();
    CachedRowSet facSet = ADDFAC.getAllFacility();
%>
    <!-- Main Page Container -->
    <div class="page-container">
        <div class="header">
            <!-- A.1 HEADER TOP -->
            <div class="header-top">
                <!-- Sitelogo and sitename -->
                <a class="sitelogo" href="#" title="Go to Start page"></a>
                <div class="sitename">
                    <h1><a href="associationDash.jsp" title="Go to Start page">CONVERGE</a></h1>
                    <h2>Generic Community Association Portal</h2>
                </div>
                
                <!-- Navigation Level 1 -->
                <div class="nav1">
                    <ul>
                        <li><a href="associationDash.jsp" title="Go to Start page">Home</a></li>
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
                        <li><a href="associationDash.jsp">Home</a></li>
                    </ul>
                    <ul>  
                        <li><a href="assocMyAccount.jsp">My Account</a><!--<![endif]-->
                    </ul>
                    <!-- Navigation item -->
                    <ul>
                        <li><a href="#">Manage Association</a><!--<![endif]-->
              <!--[if lte IE 6]><table><tr><td><![endif]-->
                            <ul>
<%
                        Thesis db = new Thesis();
                        CachedRowSet checkdiectorset = db.getDirectors7();
                        
                        if(checkdiectorset.size()>0)
                        {
%>
                                <li><a href="assocDirectorMain.jsp?criteria=0&search=All">Board of Directors or Officers</a></li>
<%
                        }
                        if(facSet.size()>0)
                        {    
%>                        
                                <li><a href="assocFacilities.jsp">Facilities</a></li>
<%
                        }    
                        if(vilinfo.size()>0)
                        {    
%>                 
                                <li><a href="assocVillInfo.jsp">Village Information</a></li>
<%
                        }
                        if(c.size()>0)
                        {    
%>                                        
                                <li><a href="assocServices.jsp">Association Services</a></li> 
<%
                        }
                        Jem j = new Jem();
                        CachedRowSet checkresSet = j.getResidentTable();
                        if(checkresSet.size()>0)
                        {    
%>                                
                                <li><a href="assocResidentAccounts.jsp?criteria=0&search=All">Residents and Accounts</a></li>
<%
                        }
%>                                
                            </ul>
                            <!--[if lte IE 6]></td></tr></table></a><![endif]-->
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
            <!-- B.1 MAIN NAVIGATION -->
            <div class="main-navigation">
                <!-- Navigation Level 3 -->
                <div class="round-border-topright"></div>
                <Br />  
                    <!-- Title -->                
                <h1 class="first">Community Services</h1>            
                <dl class="nav3-grid">
<%               
                if(c.size() >0)
                {
                    while(c.next())
                    {
                        if(c.getString("permit").equals("Yes"))
                        {    
%>
                            <dt><a href="assocPermit.jsp">Permits</a></dt>
<% 
                        }
                        if(c.getString("reservation").equals("Yes"))
                        {    
%>
                            <dt><a href="assocReservationList.jsp">Reservations</a></dt>
<% 
                        }
                        if(c.getString("socialgroups").equals("Yes"))
                        {    
%>
                            <dt><a href="assocSocGroup.jsp">Social Groups</a></dt> 
<% 
                        }
                        if(c.getString("vote").equals("Yes"))
                        {    
%>
                            <dt><a href="assocPolls.jsp">Polls or Elections</a></dt>
<% 
                        }
                        if(c.getString("bulletinBoard").equals("Yes"))
                        {    
%>
                            <dt><a href="assocBulletinBoard.jsp">Bulletin Board</a></dt>
<% 
                        }
                        if(c.getString("billing").equals("Yes"))
                        {    
%> 
                            <dt><a href="assocBill.jsp">Billing</a></dt>
<% 
                        }
                        if(c.getString("newsletter").equals("Yes"))
                        {    
%>
                            <dt><a href="assocNewsletter.jsp">Newsletter</a></dt>
<% 
                        }
                    }
                }
%>
                </dl>                 
            </div>
 
            <!-- B.1 MAIN CONTENT -->
            <!-- Pagetitle -->
            <div class="main-content">
                <!-- Pagetitle -->
                <h1 class="pagetitle">Setting up your Community</h1>
                <div class="column1-unit">
                    <h1 class="side"><img src="icons/facilities_icon.jpg" width="150" alt="Image description" title="Image title" />Community Services</h1>
                    <h3 class="side">&nbsp;</h3>
                    <p>You can choose from the services of Converge that your community can use. </p>
                </div> 
          
                <div class="contactform">
                    <p>To assign divisions who will handle which service go to:<br>
                        <font color="red">Manage Associations</font> -> <font color="red">Association Services</font> -> Under <i>Division that will handle </i> click <font color="red">Edit Details</font>.
                    </p>
                </div>
                <br>
                <p></p>
<%          
                if(c.size() == 0)
                {
%>
                    <form name="choiceList" onSubmit="return(check())" method="get" action="processAssocServicesForSetupPart4.jsp">
                        <table width="536" border="1">
                            <tr>
                                <th width="81" scope="col"><div align="center">Perform this service</div></th>
                                <th width="205" scope="col"><div align="center">Service name</div></th>
                            </tr>
                            <tr>
                                <td>
                                    <div align="center">
                                        <input name="permitCheckBox" type="checkbox" id="permitCheckBox" value="Nope" />
                                    </div>
                                </td>
                                <td><div align="center">Permits</div></td>
                            </tr>
                            <tr>
                                <td>
                                    <div align="center">
                                        <input name="reservationCheckBox2" type="checkbox" id="reservationCheckBox2" value="Nope" />
                                    </div>
                                </td>
                                <td><div align="center">Reservations</div></td>
                            </tr>
                            <tr>
                                <td>
                                    <div align="center">
                                        <input name="voteCheckBox3" type="checkbox" id="voteCheckBox3" value="Nope" />
                                    </div>
                                </td>
                                <td><div align="center">Elections or Polls</div></td>
                            </tr>
                            <tr>
                                <td>
                                    <div align="center">
                                        <input name="bulletinCheckBox5" type="checkbox" id="bulletinCheckBox5" value="Nope" />
                                    </div>
                                </td>
                                <td><div align="center">Bulletin Board</div></td>
                            </tr>
                            <tr>
                                <td>
                                    <div align="center">
                                        <input name="billingCheckBox7" type="checkbox" id="billingCheckBox7" value="Nope" />
                                    </div>
                                </td>
                                <td>
                                    <div align="center">Billing</div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div align="center">
                                        <input name="newsletterCheckBox6" type="checkbox" id="newsletterCheckBox6" value="Nope" />
                                    </div>
                                </td>
                                <td><div align="center">Newsletter</div></td>
                            </tr>
                            <tr>
                                <td>
                                    <div align="center">
                                        <input name="eventsCheckBox4" type="checkbox" id="socgrpCheckBox4" value="Nope" />
                                    </div>
                                </td>
                                <td><div align="center">Social Groups</div></td>
                            </tr>
                        </table>
                        <label class="left"></label><br /><br />
                        <input type="submit" class="button" value="Save" />
                    </form>
<%
                }
                else
                {
                    c.previous();
%>
                    <form name="choiceList2" onSubmit="return(check2())" method="get" action="processUpdateServiceTemplate2.jsp">
                    <table width="536" border="1">
                        <tr>
                            <th width="81" scope="col"><div align="center">Perform this service</div></th>
                            <th width="205" scope="col"><div align="center">Service name</div></th>
                        </tr>
                        <tr>
                            <td>
                                <div align="center">
                                    <input name="permitCheckBox" type="checkbox" id="permitCheckBox" value="Nope"
<%              
                                    if(c.getString("permit").equals("Yes"))
                                    {    
%> 
                                        checked
<% 
                                    }
%>
                                        />
                                </div>
                            </td>
                            <td><div align="center">Permits</div></td>
                        </tr>
                        <tr>
                            <td>
                                <div align="center">
                                    <input name="reservationCheckBox2" type="checkbox" id="reservationCheckBox2" value="Nope" 
<%
                                    if(c.getString("reservation").equals("Yes"))
                                    {    
%> 
                                        checked
<% 
                                    }
%>
                                        />
                                </div>
                            </td>
                            <td><div align="center">Reservations</div></td>
                        </tr>
                        <tr>
                            <td>
                                <div align="center">
                                    <input name="voteCheckBox3" type="checkbox" id="voteCheckBox3" value="Nope"
<%
                                    if(c.getString("vote").equals("Yes"))
                                    {    
%> 
                                        checked
<% 
                                    }
%>
                                        />
                                </div>
                            </td>
                            <td><div align="center">Elections or Polls</div></td>
                        </tr>
                        <tr>
                            <td>
                                <div align="center">
                                    <input name="bulletinCheckBox5" type="checkbox" id="bulletinCheckBox5" value="Nope" 
<%
                                    if(c.getString("bulletinBoard").equals("Yes"))
                                    {    
%> 
                                        checked
<% 
                                    }
%>
                                        />
                                </div>
                            </td>
                            <td><div align="center">Bulletin Board</div></td>
                        </tr>
                        <tr>
                            <td>
                                <div align="center">
                                    <input name="billingCheckBox7" type="checkbox" id="billingCheckBox7" value="Nope" 
<%
                                    if(c.getString("billing").equals("Yes"))
                                    {    
%> 
                                        checked
<% 
                                    }
%>
                                        />
                                </div>
                            </td>
                            <td><div align="center">Billing</div></td>
                        </tr>
                        <tr>
                            <td>
                                <div align="center">
                                    <input name="newsletterCheckBox6" type="checkbox" id="newsletterCheckBox6" value="Nope" 
<%
                                    if(c.getString("newsletter").equals("Yes"))
                                    {    
%> 
                                        checked
<% 
                                    }
%>
                                        />
                                </div>
                            </td>
                            <td><div align="center">Newsletter</div></td>
                        </tr>
                        <tr>
                            <td>
                                <div align="center">
                                    <input name="eventsCheckBox4" type="checkbox" id="socgrpCheckBox4" value="Nope" 
<%
                                    if(c.getString("socialgroups").equals("Yes"))
                                    {    
%> 
                                        checked
<% 
                                    }
%>
                                        />
                                </div>
                            </td>
                            <td><div align="center">Social Groups</div></td>
                        </tr>
                    </table>
                    <label class="left"></label><br /><br />
                    <input type="submit" class="button" value="Save" />
                </form>
<% 
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