 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*"%>
<html>
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
  <script type="text/javascript" src="./js/jem.js"></script>
  <link rel="icon" type="image/x-icon" href="./img/favicon.ico" />
  <title>Converge - Administrator : Create new Facility Type</title>
  <script type= "text/javascript">
<!--
function boob()
{
 var iDm = document.getElementById('total').value;
 var nCtr=1;
 var i=0;;
 
 while(nCtr<=iDm)
 {
 if(isNaN(document.getElementById(nCtr).value)==1 || document.getElementById(nCtr).value.length == 0)
        {    
            document.getElementById(nCtr+'tag').style.color = "red";
            i++;
            document.getElementById(nCtr).innerHTML=nCtr;
        }
        else
            document.getElementById(nCtr+'tag').style.color = "black";
        
        if(document.getElementById('nCtr').value == 0)
        {    
            document.getElementById(nCtr+'tag').style.color = "red";
            i++;
        }
        else
            document.getElementById(nCtr+'tag').style.color = "black";
        
        nCtr++;
}      
        if (i > 0)
        {
            alert("Check Fields in red.");
            return false;
        }
        else
            return true;
}
-->
</script>
</head>

<body>
<%
		
	serviceTemplate t = new  serviceTemplate();
        Jem j = new Jem();
        String vType = j.getVillageType();
            
        CachedRowSet c = t.getServices();
       CachedRowSet cr = j.getPB();
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
                        Jem j2 = new Jem();
                        CachedRowSet checkresSet = j2.getResidentTable();
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
      <div class="main-content">
        <h1 class="pagetitle">Setting up your Community's physical layout &nbsp; 1 2 3<font color="red"><b> 4 </b></font></h1>
       
        

        <!-- Content unit - One column -->

        <div class="column1-unit">
            <h1 class="side">Community Residential Lots/Units</h1>
            <p> <h3 class="pagetitle">In this step you can setup lot's area or unit's area of your community based on the number of divisions. 
       <br> </h3></p>
       <br>
       <br><br>
       <div class="contactform">
           <form onSubmit="return(boob())" action="processAssocSetupPartResidentialLotsFinale.jsp" method="get">
               <fieldset>
                   
                   <legend> Setup New Residential Lots/Units </legend>
                   <p>
                   &nbsp;&nbsp;<%
                       if(vType.equals("phase"))
                       {
                       %>&nbsp;<font size="3">Phase &nbsp;&nbsp;</font><%
                       }
                       else
                       {
                            %>&nbsp;<font size="3">Building &nbsp;&nbsp;</font><%
                       }
                       %> <select class="combo" name="phbl">
                       <option value="0" selected >Select 
                       <%
                       if(vType.equals("phase"))
                       {
                           %>Phase<%
                       }
                       else
                       {
                            %>Building<%
                       }
                       %></option>
                       <%
                        while(cr.next())
                        {
                            %>
                            <option value="<%=cr.getInt("phasebd")%>" onclick='getBlFl2(<%=cr.getInt("phasebd")%>)'><%=cr.getInt("phasebd")%></option>
                            <%
                        }
                       %>
                   </select>
               </p>
               
               
                   <div id="blockFloor">
                       
                   </div>
               <br><br>
                 
             
             <div id="lotunit">
                 
             </div>
             <div id="lotarea">
                 
             </div>
              <input type='submit' class='button2' value='Save'><br><br>
               </fieldset>
           
               
           </form> 
          
       </div>
         <br><br>
		<hr /><br /><br />
          <input type="submit" class="button2" value="Finish" onClick="window.location.href='associationDash.jsp'">
        <br><br>  
               <br>
          
      
      </div>
    
      </div>
    </div>
      
    <!-- C. FOOTER AREA -->      

    <div class="footer">
      <p>Copyright &copy; 2006 4B1C | All Rights Reserved</p>
      <p class="credits">Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a> | Modified by <a href="#" title="Adaptor Homepage">4B1C</a> | Powered by <a href="#" title="Content Management System">CCMS</a> | <a href="http://validator.w3.org/check?uri=referer" title="Validate XHTML code">W3C XHTML 1.0</a> | <a href="http://jigsaw.w3.org/css-validator/" title="Validate CSS code">W3C CSS 2.0</a></p>
    </div>      
  </div> 
</body>
</html>