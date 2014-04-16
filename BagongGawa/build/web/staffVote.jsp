 
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
  <script type="text/javascript" src="./js/ajaxgetReserve.js"></script>  
  <link rel="icon" type="image/x-icon" href="./img/favicon.ico" />
   <title>Converge - Staff : Polls or Elections</title>
</head>

<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body>
<% 
    serviceTemplate t = new  serviceTemplate();
    CachedRowSet c = t.getServices();
    
    Election e = new Election();
    Polls p = new Polls();
    
    CachedRowSet crset = e.getAllNomination();
    int month=0, day=0, year=0;
    Calendar myCalendar2 = Calendar.getInstance();
    int month2 = myCalendar2.get(Calendar.MONTH)+1;
    int year2 = myCalendar2.get(Calendar.YEAR);
    int day2 = myCalendar2.get(Calendar.DATE);
    
    CachedRowSet voteCount;
    int[] v , v2;
    int i=0;
    int index=-1, index2=-1, index3=-1,max=0;
    boolean inside=false,expired=false;
    while(crset.next())
    {
        java.util.Date closeDate = crset.getTimestamp("NomCDate");
        Calendar myCalendar = Calendar.getInstance();        
        myCalendar.setTime(closeDate);
        month = myCalendar.get(Calendar.MONTH)+1;
        day = myCalendar.get(Calendar.DATE);
        year = myCalendar.get(Calendar.YEAR);
        CachedRowSet nominee = e.getNominees(crset.getInt("NomId"));
        v = new int[nominee.size()];
        v2 = new int[nominee.size()];
        for(int j=0; j<v.length; j++)
        {    
            v[j] = -1;
            v2[j] = -1;
        }
        if(year<year2)
            expired=true;
        else
        {    
            if(month<month2)
                expired=true;
            else
            {
                if(day<day2)
                    expired=true;
            }    
        }
        
        if(expired==true)
        {
            while(nominee.next())
            {    
                voteCount = e.getNomineeVoteCount(nominee.getInt("NomResNom"), nominee.getInt("NomNomId"));
                for(int j=0; j<v.length; j++)
                    if(nominee.getInt("NomResNom")==v[j])
                        inside = true;
                if(inside==false)
                {    
                    v[i] = nominee.getInt("NomResNom");
                    v2[i] = voteCount.size();
                    inside=false;
                    i++;
                }
            }
            index=-1; index2=-1; index3=-1;max=0;
            if(i>0)
            {    
            for(int k=0; k<v.length; k++)
                if(max< v2[k])
                {    
                    index = k;
                    max = v2[k];
                }
            e.addToNomChoices(crset.getByte("NomId"),v[index]);
            }
            max=0;
            if(i>1)
            {
                for(int k=0; k<v.length; k++)
                    if(max< v2[k] && k!=index)
                    {    
                        index2 = k;
                        max = v2[k];
                    }
                e.addToNomChoices(crset.getByte("NomId"),v[index2]);
            }
            max=0;
            if(i>2)
            {
                for(int k=0; k<v.length; k++)
                if(max< v2[k] && k!=index && k!=index2)
                {    
                    index3 = i;
                    max = v2[k];
                }
                e.addToNomChoices(crset.getByte("NomId"),v[index3]);
            }             
            e.updateClose(crset.getInt("NomId"));
            expired=false;
        }    
    }
    
    CachedRowSet crset2 = p.getPoll2();
    
    while(crset2.next())
    {
        java.util.Date closeDate = crset2.getTimestamp("PollCDate");
        Calendar myCalendar = Calendar.getInstance();        
        myCalendar.setTime(closeDate);
        month = myCalendar.get(Calendar.MONTH)+1;
        day = myCalendar.get(Calendar.DATE);
        year = myCalendar.get(Calendar.YEAR);
               
        if(year<year2)
            p.updateClose(crset2.getInt("Pollid"));
        else
        {    
            if(month<month2)
                p.updateClose(crset2.getInt("Pollid"));
            else
            {
                if(day<day2)
                    p.updateClose(crset2.getInt("Pollid"));
            }    
        }
    }
    Election2 elec = new Election2();
    CachedRowSet crset3 = elec.getElection2();
    boolean expired2=false;
    while(crset3.next())
    {
        java.util.Date closeDate = crset3.getTimestamp("ElecCDate");
        Calendar myCalendar = Calendar.getInstance();        
        myCalendar.setTime(closeDate);
        month = myCalendar.get(Calendar.MONTH)+1;
        day = myCalendar.get(Calendar.DATE);
        year = myCalendar.get(Calendar.YEAR);
               
        if(year<year2)
            expired2=true;
        else
        {    
            if(month<month2)
                expired2=true;
            else
            {
                if(day<day2)
                    expired2=true;
            }    
        }
        
        if(expired2==true)
        {
            CachedRowSet winner = elec.getSpecificElection(crset3.getInt("ElecId"));
            int max2=-1,id=0;
            boolean in=true;
            while(winner.next())
            {    
                if(max2<winner.getInt("ElecVoteNum"))
                {    
                    id = winner.getInt("ElecResId");
                    max2=winner.getInt("ElecVoteNum");
                }
            }
            String name="";
            int div=0;
            if(max>0)
            {
                Polls pol = new Polls();
                Residents residents = new Residents();
                CachedRowSet resSet = residents.getResInfo(id);
                resSet.next();
                name = resSet.getString("FirstName") +" "+ resSet.getString("LastName");
                CachedRowSet pSet = pol.getMaxDays();

                pSet.next();
                java.util.Date startDate = new java.util.Date();
                java.util.Date closedDate = new java.util.Date();
                int month3 = myCalendar.get(Calendar.MONTH)+1;
                int year3 = myCalendar.get(Calendar.YEAR);
                int day3 = myCalendar.get(Calendar.DATE);
                String d3= year3+"-"+month3+"-"+day3+" "+00+":"+00+":00";;
                String d4= (year3+pSet.getInt("years"))+"-"+month3+"-"+day3+" "+00+":"+00+":00";;
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                startDate = sdf.parse(d3); 
                closedDate = sdf.parse(d4);

                CachedRowSet aSet = elec.getSpecificElec(crset3.getInt("ElecId"));
                aSet.next();
                CachedRowSet bSet = e.getSpecificNomination(aSet.getInt("ElecNomId"));
                bSet.next();
                div =bSet.getInt("NomDivId");
                e.addDirector(id, div, startDate, closedDate, name);
                elec.updateStatus2(aSet.getInt("ElecNomId"),"Closed");
                Account r = new Account();
                Polls poll = new Polls();
                int starting = poll.getStart();
                int last = e.getLast();
                if(starting<=day)
                {    
                    r.updateType(id,"Director");
                    r.servingDirector(last);
                }   
            }
            elec.updateClose(crset3.getInt("ElecId"));
            elec.updateStatus2(crset3.getInt("ElecNomId"),"Closed");
            expired2=false;
        }    
    }
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
                <!-- Navigation Level 1 -->
                <div class="nav1">
                    <ul>
                        <li><a href="staffDash.jsp" title="Go to Start page">Home</a></li>
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
                        <li><a href="staffDash.jsp">Home</a></li>
                    </ul>
                    <ul>  
                        <li><a href="staffMyAccount.jsp">My Account</a><!--<![endif]-->
                    </ul>    
                    <ul>
                        <li><a href="#">Manage Association</a><!--<![endif]-->
                        <!--[if lte IE 6]><table><tr><td><![endif]-->
                        <ul>
                            <li><a href="staffResidentAccounts.jsp?criteria=0&search=All">Resident Accounts</a></li>
                            <li><a href="staffPhysicalLayout.jsp">Physical Layout</a></li>
                        </ul>
              <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                        </li>
                    </ul>
                    <!-- Navigation item -->
                    <ul>
                        <li><a href="logout.jsp">Logout</a></li>
                    </ul>
                </div>
            </div> 
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
                            <dt><a href="staffPermit.jsp?permitID=All&status=Pending">Permits</a></dt>
<% 
                        }
                        if(c.getString("reservation").equals("Yes"))
                        {    
%> 
                            <dt><a href="staffReserve.jsp">Reservations</a></dt>
<% 
                        }
                        if(c.getString("socialgroups").equals("Yes"))
                        {    
%> 
                            <dt><a href="staffSocMain.jsp">Social Groups</a></dt> 
<% 
                        }
                        if(c.getString("vote").equals("Yes"))
                        {    
%> 
                            <dt><a href="staffVote.jsp">Polls or Elections</a></dt>
<% 
                        }
                        if(c.getString("bulletinBoard").equals("Yes"))
                        {    
%> 
                            <dt><a href="staffBulletinBoard.jsp">Bulletin Board</a></dt>
<% 
                        }
                        if(c.getString("billing").equals("Yes"))
                        {    
%>  
                            <dt><a href="staffBill.jsp">Billing</a></dt>
<% 
                        }
                        if(c.getString("newsletter").equals("Yes"))
                        {    
%> 
                            <dt><a href="staffNewsletter.jsp">Newsletter</a></dt>
<% 
                        }
                    }
                }
%>
                </dl>                            
            </div>
         
            <!-- B.1 MAIN CONTENT -->
            <div class="main-content">
        
            <!-- Pagetitle -->
                <h1 class="pagetitle">Polls and Elections Services</h1>
		<div class="column1-unit">
                    <h1 class="side"><img src="icons/reservation-icon.jpg" alt="Image description" title="Image title" />List of Ongoing Polls and Elections</h1>
                    <h3 class="side">&nbsp;</h3>
                    <p>Welcome staff! As a staff, you are allowed to create, view and manage polls, create election nomination, view and manage nomination, create, and view and manage elections. 
                    <br>
                    <ul>
                        <li> <a href="staffcreatepoll.jsp">Create Poll</a></li>
                        <li> <a href="staffmanagepoll.jsp">View and Manage Polls</a></li>
<%
                            Election2 e2 = new Election2();
                            CachedRowSet allDiv = e.getAllDivisionNames();
                            int id=10,exist4=-1,exist2=-1,exist3=-1,id2=-1;
                            CachedRowSet nomSet;
                            String justClosed="";
                            boolean checker = false;
                            while(allDiv.next())
                            {
                                justClosed="";
                                id=allDiv.getInt("comDivId");
                                
                                exist4 = e.getDivisionExist2(id);
                                exist2 = e.getNominationExist(id);
                                nomSet = e.getSpecificNomination2(id);
                                while(nomSet.next())
                                {    
                                    id2 = nomSet.getInt("NomId");
                                    justClosed = nomSet.getString("JustClosed");
                                }
                                exist3 = e2.getNominationExist(id2);
                                if(exist4==0 && exist2==0 && exist3==0 && !justClosed.equalsIgnoreCase("JustClosed") && !justClosed.equalsIgnoreCase("JustFinished"))
                                    checker=true;
                            }
                            
                            if(checker==true)
                            {    
%>                        
                        <li> <a href="staffcreateelecnom.jsp">Create Election Nomination</a></li>
                        <li> <a href="staffmanagenom.jsp">View and Manage Nomination</a></li>
<%
                            }
                            else
                            {    
%>
                        <li>Create Election Nomination</li> 
                        <li> <a href="staffmanagenom.jsp">View and Manage Nomination</a></li>
<%
                            }
                            
                            if(e2.getNomTableJustClosed()>0)
                            {    
%>
                        <li> <a href="staffcreateelec.jsp">Create Election</a></li>
                        <li> <a href="staffmanageelec.jsp">View and Manage Elections</a></li>
<%
                            }
                            else
                            {    
%>
                        <li>Create Election</li>
                        <li> <a href="staffmanageelec.jsp">View and Manage Elections</a></li>
<%
                            }
%>
                    </ul>
                    </p>       
                </div>
                <hr class="clear-contentunit" />
                <div class="column1-unit">
                <hr class="clear-contentunit" />
                    <div class="column1-unit" id="popo"></div> 
                </div>
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