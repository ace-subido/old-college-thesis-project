
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.lang.Character.Subset.*"%>
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
  <link rel="stylesheet" type="text/css" media="screen,projection,print" href="../css/layout2_setup.css" />
  <link rel="stylesheet" type="text/css" media="screen,projection,print" href="../css/layout2_text.css" />
  <script type="text/javascript" src="./js/ieflickerhack.js"></script>  
  <link rel="icon" type="image/x-icon" href="./img/favicon.ico" />
  <title>Converge - Administrator : BulletinBoard</title>
</head>

<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body>
<%	
	if(session.getAttribute("uname") == null)

		response.sendRedirect("homepage.jsp");
            FacId fi = new FacId();
	 CachedRowSet crset = fi.getBulletinFromAdminLatest();
         String content = "";
         while(crset.next())
         {
         content = crset.getString("bulletinContent");
         }
        	
%>
<form name="as">
    <input type="hidden" name="con" value="<%=content%>">
</form>
<script type="text/javascript">
           <!--
            var co = document.as.con.value;
            co = co.trim();
            co = co.replace(chr(10), " ");
            co = co.replace(chr(13), " ");
            co = co.replace(chr(145), chr(39));
            co = co.replace(chr(146), chr(39));
            document.as.con.value = co;
            alert(document.as.con.value);
          -->  
         </script>

  <!-- Main Page Container -->
  <div class="page-container">

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
            <li><a href="../associationDash.jsp">Home</a></li>
          </ul>
          
          <!-- Navigation item -->
          <ul>
            <li><a href="#">Manage Association</a><!--<![endif]-->
              <!--[if lte IE 6]><table><tr><td><![endif]-->
                <ul>
                  <li><a href="../assocDirectorMain.jsp">Create/Edit Directors or Officers</a></li>
                  <li><a href="../assocFacilities.jsp">Create/Edit Facilities</a></li>
                  <li><a href="../assocRuleFees.jsp">View Rules & Regulations</a></li>
                  <li><a href="../assocVillInfo.jsp">View/Edit Village information</a></li>
                  <li><a href="../assocServices.jsp">Association Services</a></li> 
                                                    
                </ul>
              <!--[if lte IE 6]></td></tr></table></a><![endif]-->
            </li>
          </ul>   
          
                 

          <!-- Navigation item -->
          <ul>
            <li><a href="#">Manage Residents<!--[if IE 7]><!--></a><!--<![endif]-->
              <!--[if lte IE 6]><table><tr><td><![endif]-->
                <ul>
                  <li><a href="header2.html">View Social Groups</a></li>
                  <li><a href="header2.html">View Residents</a></li>
                  <li><a href="header2.html">View Complaints and Suggestions</a></li>
                  <li><a href="header2.html">Bills</a></li>                 
                </ul>
              <!--[if lte IE 6]></td></tr></table></a><![endif]-->
            </li>
          </ul>
          
          <!-- Navigation item -->
         
          <!-- Navigation item -->
          <ul>
            <li><a href="../logout.jsp">Logout</a></li>
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

 <br>
    <!-- B. MAIN -->
    <div class="main">
         <!-- B.1 MAIN NAVIGATION -->
      <div class="main-navigation">

        <!-- Navigation Level 3 -->
        <div class="round-border-topright"></div>
        <h1 class="first">Tools</h1>

        <!-- Navigation with grid style -->
        <dl class="nav3-grid">
          <dt><a href="#">Mailbox</a></dt>
 	       <dd><a href="assocInbox.html">Inbox (90)</a></dd>
            <dd><a href="assocOutbox.html">Outbox</a></dd>
          <dt><a href="#">Announcements & News</a></dt>
           <dt><a href="examples/testEditor.jsp">Bulletin Board</a></dt>
          <dt><a href="#">Notifications</a></dt>

        </dl>                      <Br /><Br />  

        <!-- Title -->                
        <h1 class="first">Services</h1>            
        <dl class="nav3-grid">
          <dt><a href="#">Permits</a></dt>
          <dt><a href="#">Events Approval</a></dt>
          <dt><a href="#">Reservations</a></dt>
          <dt><a href="#">Polls or Elections</a></dt>

        </dl>                        
		</div>
                
                
                <div align="center">&nbsp; &nbsp;&nbsp;<h2><font color="#666666">Bulletinboard Broadcast</font></h2></div>

      
              
                <div align="center">
        <br><br>
       <form method="get" name="test" action="../processTestEditor.jsp">
           <label>Title of Message: </label><input type="text" name="bName" value="" width="10px"><br><br>
            <!-- Include the Free Rich Text Editor Runtime -->
         <script src="../js/richtext.js" type="text/javascript" language="javascript"></script>
          <!-- Include the Free Rich Text Editor Variables Page -->
          <script src="../js/config.js" type="text/javascript" language="javascript"></script>
          <!-- Initialise the editor -->
          <script type="text/javascript">
           <!--
            initRTE('Place your text here');
          -->  
         </script><br><br>
         <div align="center"><input type="submit" value="Post to Bulletin Board">&nbsp;</div>
        </form>
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


