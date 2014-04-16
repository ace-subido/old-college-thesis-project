 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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
    <title>Converge - Staff</title>
</head>

<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body>
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
            <li><a href="associationDash.html">Home</a></li>
          </ul>
          
          <!-- Navigation item -->
        <ul>
            <li><a href="#">Manage Association</a><!--<![endif]-->
              <!--[if lte IE 6]><table><tr><td><![endif]-->
             <ul>
                  <li><a href="staffResidentAccounts.jsp">Resident Accounts</a></li>
                                     
                </ul>
              <!--[if lte IE 6]></td></tr></table></a><![endif]-->
            </li>
          </ul>
          
          <!-- Navigation item -->
         
          <!-- Navigation item -->
          <ul>
            <li><a href="homepage.htm">Logout</a></li>
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
        <!-- Title -->                
        <h1 class="first">Services</h1>            
        <dl class="nav3-grid">
          <dt><a href="#">Permits</a></dt>
          <dt><a href="#">Reservations</a></dt>
          <dt><a href="#">Events Approval</a></dt>          
          <dt><a href="#">Polls or Elections</a></dt>
          <dt><a href="#">Payment Tracking</a></dt>          
          <dt><a href="#">Billings</a></dt>
          <dt><a href="#">Newsletter</a></dt>                   
        </dl>                        
</div>
        

 
      <!-- B.1 MAIN CONTENT -->
      <div class="main-content">
        
        <!-- Pagetitle -->
        <h1 class="pagetitle">Reservations List</h1>

        <!-- Content unit - One column -->
        <!-- Content unit - One column -->
        <h1 class="block">Reservations Details</h1>
        <div class="column1-unit">
          <p>&nbsp; </p>
          <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sort By:  
            <select name="contact_title" id="contact_title" class="combo">
              <option value="choose"> Select... </option>
              <option value="Name">Facilities Name</option>
              <option value="Name">Reserved By</option>
              <option value="Date">Reservation Date</option>
              <option value="Status">Status</option>
            </select> 
          Search: 
          <input type="text" name="contact_firstname" id="contact_firstname" class="field" value="" tabindex="1" />
          <input type="submit" name="submit" id="submit" class="button2" value="Search" tabindex="6" />
          </p>
          <table>
            <tr>
              <th class="top" scope="col">FACILITY NAME</th>
              <th class="top" scope="col">RESERVED BY</th>
              <th class="top" scope="col">RESERVATION DATE</th>
              <th class="top" scope="col">STATUS</th>
            </tr>
            <tr>
              <th scope="row">Basketball Court</th>
              <td>Jemuel Dalino</td>
              <td>July 18, 2008</td>
            <td>Pending</td>
            </tr>
            <tr>
            <th scope="row">Swimming Pool</th>
            <td>Cadence Subido</td>
            <td>July 02, 2008</td>
            <td>Approved</td>
            </tr>
            <tr>
            <th scope="row">Gazebo</th>
            <td>Pao Domingo</td>
            <td>June 30, 2008</td>
            <td>Rejected</td>
            </tr><tr>
            <th scope="row">Conference Room</th>
            <td>Jay-R Tuason</td>
            <td>June 29, 2008</td>
            <td>Approved</td>
          </tr>          </table>
          <p align="center" class="caption">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; View All<br />   
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;-&nbsp;Page 1 of 4 -&gt;</p>
        </div>          
        <hr class="clear-contentunit" />        
                  </div>                            
        <!-- Content unit - One column -->
        
    <div class="footer">
      <p>Copyright &copy; 2006 Your Company | All Rights Reserved</p>
      <p class="credits">	Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a> | Modified by <a href="#" title="Adaptor Homepage">4B1C</a> | Powered by <a href="#" title="Content Management System">CCMS</a> | <a href="http://validator.w3.org/check?uri=referer" title="Validate XHTML code">W3C XHTML 1.0</a> | <a href="http://jigsaw.w3.org/css-validator/" title="Validate CSS code">W3C CSS 2.0</a></p>
    </div>      
  </div> 
  
</body>
</html>



