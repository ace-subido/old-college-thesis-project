
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.Calendar, java.util.*"%>
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
  
  <script type="text/javascript" src="./js/pao.js"></script>
  
   <title>Converge - Administrator</title>
</head>

<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body>
  <% 
         serviceTemplate t = new  serviceTemplate();
       
        CachedRowSet c = t.getServices();
        /**
        FacId f = new FacId();
           CachedRowSet crset = f.getBilling();
          addFacility mb = new addFacility();
        if(session.getAttribute("billbatch") == null)
       {
        int billbatch = mb.getMonthlyBillValuesBatch();
         billbatch++;
         Vector<String> vname = new Vector<String>();
         session.setAttribute("vname", vname);
         Vector<Integer> vamount = new Vector<Integer>();
         session.setAttribute("vamount", vamount);
        session.setAttribute("billbatch", billbatch);  
       }*/
          
          Pao pao = new Pao();
          CachedRowSet coco = pao.getVillageInfo();
          
         Jem j = new Jem();
          String vType = j.getVillageType();
          
          //CachedRowSet cr1 = j.getPB();
          
          Pao p = new Pao();
     
  %> 
  <script type= "text/javascript">
      function checkForm()
        {       
            var a = document.form1.LastName;
            var b = document.form1.FirstName;
            var c = document.form1.EmailAdd;

            if (a.value == "" || b.value=="" || c.value=="")
            {
                alert("Please fill in the fields with the necessary information");
                return (false);
            }
           
        }
  </script>  

    <!-- Main Page Container -->
    <div class="page-container">
        <div class="header">
            <!-- A.1 HEADER TOP -->
            <div class="header-top">
                <!-- Sitelogo and sitename -->
                <a class="sitelogo" href="#" title="Go to Start page"></a>
                <div class="sitename">
                    <h1><a href="homepage.html" title="Go to Start page">CONVERGE</a></h1>
                    <h2>Generic Community Association Portal</h2>
                </div>
                
                <!-- Navigation Level 1 -->
                <div class="nav1">
                    <ul>
                        <li><a href="#" title="Go to Start page">Home</a></li>
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
                                <li><a href="assocDirectorMain.jsp">Board of Directors or Officers</a></li>
                                <li><a href="assocFacilities.jsp">Facilities</a></li>                  
                                <li><a href="assocVillInfo.jsp">Village Information</a></li>
                                <li><a href="assocServices.jsp">Association Services</a></li> 
                                <li><a href="assocResidentAccounts.jsp">Residents and Accounts</a></li>                                  
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
      <div class="column1-unit">
          <h1 align="center" class="side">Add Resident Account</h1>
        <h3 class="side"></h3>
          <br><hr />
          
          <div class="column1-unit">
              <div class="contactform">
             <form name="form1" method="get" onSubmit="return(checkForm())" action="processAssocSetupResidentsManual.jsp">
              <fieldset>
              <legend>RESIDENT DETAILS</legend>
                  
                  <label class="left">Last Name	</label>
   	                <p>
   	                  <input type="text" name="LastName" id="LastName" value="" />
   	                  <br>
              </p>
             
   	                <label class="left">First Name	</label>
   	                <p>
   	                  <input type="text" name="FirstName" id="FirstName" value="" />
   	                  <br>
              </p>
                        
   	                <label class="left">Email Address	</label>
   	                <p>
   	                  	<input type="text" name="EmailAdd" id="EmailAdd" value="" />
                  	  <br>
              </p>
              <fieldset><legend>Resident Address</legend>
   	               <p>
                    <%
                       if(vType.equals("phase"))
                       {
                       %><label class="left">Phase</label><%
                       }
                       else
                       {
                            %><label class="left">Building</label><%
                       }
                       %> <select class="combo" name="phbl">
                       <option value="0" selected >Select 
                       <%
                       if(vType.equals("phase"))
                       {
                           %>Phase...<%
                       }
                       else
                       {
                            %>Building...<%
                       }
                       %></option>
                       <%
                        while(coco.next())
                        {
                            int nctr=1;
                            while(nctr<=coco.getInt("Division"))
                           {
                            %>
                            <option value="<%=nctr%>" name="<%=nctr%>" onclick='getBlFl4(<%=nctr%>)'> <%=nctr%></option>
                            <%
                            nctr++;
                          }
                        }
                       %>
                   </select>
               </p>
                <div id="blockFloor">
                       
                   </div>
               <br>
                 
             
             <div id="lotunit">
                 
             </div>
             <br>
             </fieldset>
   	                <p>
   	                  <input type="submit" name="Submit" class="button2" value="Submit"/>
   	                  <br />
   	                  
   	                  <br />
              </p>
              </fieldset>
          </form>
              </div>
              
          </div>
          
          
        </div>  
        </div>        
        <hr class="clear-contentunit" />
	
    </div>
      
    <!-- C. FOOTER AREA -->      

    <div class="footer">
      <p>Copyright &copy; 2008 4B1C Group | All Rights Reserved</p>
      <p class="credits">Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a> | Modified by <a href="#" title="Adaptor Homepage">4B1C Group</a> | Powered by <a href="#" title="Content Management System">CCMS</a> | <a href="http://validator.w3.org/check?uri=referer" title="Validate XHTML code">W3C XHTML 1.0</a> | <a href="http://jigsaw.w3.org/css-validator/" title="Validate CSS code">W3C CSS 2.0</a></p>
    </div>    
  </div> 
  
</body>
</html>



