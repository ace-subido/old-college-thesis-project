
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
    <script type="text/javascript" src="./js/ajaxBill.js"></script>
    <script type="text/javascript" src="./js/ajaxChecker.js"></script>
   
    <link rel="icon" type="image/x-icon" href="./img/favicon.ico" />
    <title>Converge - Administrator : Community Services</title>
    <style type="text/css">
        <!--
        .style2 {color: #000000}
        -->
    </style>
<script type= "text/javascript">
    <!--
        function checky()
        {       
            var y = document.ass2.shiz44;
            var z = document.ass2.shiz33;
                
            if (y.value == "")
            {
                alert("Put in a penalty fee name");
                return (false);
            }
            if (z.style.backgroundColor == "red")
            {
                alert("Invalid Number Input!");
                return (false);
            }
        }
      
        function checky7()
        {
            var y = document.ass5.fosho;
            
            if (y.style.backgroundColor == "red"){
                alert("Invalid number input!");
                return (false);
            }
            
        }
        
        function checky6()
        {
            var y = document.ass.hihi;
            var z = document.ass.lolol;
            var a = document.ass.katsz4;
            
            if (y.style.backgroundColor == "red" ){
                alert("Invalid number input!");
                return (false);
            }
            if (y.value > 30 ){
                alert("The number is too high, only select a day in the month!");
                return (false);
            }
            if (z.style.backgroundColor == "red"){
                alert("Invalid number input!");
                return (false);
            }
            if (z.value > 30){
                alert("The number is too high, only select a day in the month!");
                return (false);
            }
            if (a.value == '0'){
                alert("Association Dues : Select unit of measure!");
                return (false);
            }
            
        }
        
     function checky5()
        {
            var y = document.ass54.shiz2;
            var s = document.ass54.shiz3;
            
            
            if (y.style.backgroundColor == "red"){
                alert("Invalid number input!");
                return (false);
            }
            if (s.value == '0'){
                alert("Association Dues Charges : Please select the type of measurement for the sub-amount");
                return (false);
            }
             if (y.value == ""){
                alert("Association Dues Charges : Please input the amount");
                return (false);
            }
            
            
        }
        
        function checky10()
        {
            var y = document.rbass2.bhiz33;
            var z = document.rbass2.bhiz44;
            
            
            if (y.style.backgroundColor == "red"){
                alert("Invalid number input!");
                return (false);
            }
            if (z.value == ""){
                alert("Please put in a fee name");
                return (false);
            }
            
            
        }
        function checky11()
        {
            var y = document.zbass2.rhiz33;
            var z = document.zbass2.rhiz44;
            
            
            if (y.style.backgroundColor == "red"){
                alert("Invalid number input!");
                return (false);
            }
             if (z.value == ""){
                alert("Please put in a fee name");
                return (false);
            }
            
            
            
        }
       
        
        
    -->
    </script>
</head>

<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body>
<%
   serviceTemplate t = new serviceTemplate();
   FacId f = new FacId();
   
    CachedRowSet c = t.getServices();
%>
    
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
                        <li><a href="associationDash.jsp">Home</a></li>
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
                                <li><a href="assocResidentMain.jsp">Residents and Accounts</a></li>                                  
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
                <h1 class="first">Service Settings</h1>            
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
        <%
        Billing b = new Billing();
        
        
        CachedRowSet br = b.getBillingSetting();
        br.next();
        
        String measure = br.getString("aduemeasureunit");
        String penny = b.getPenaltySettings();
        int temp1 = b.getCutDateSetting();
        int temp2 = b.getDelDateSetting();
        double temp3 = b.getAssociationDueSetting();
        
        CachedRowSet br2 = b.getAssocBDowns();
        CachedRowSet br3 = b.getPenaltyDuesSettings();
        CachedRowSet br4 = b.getWaterCharges();
        CachedRowSet br5 = b.getElecCharges();
        
        %>
                <!-- Pagetitle -->
                <h1 class="pagetitle">Billing Settings</h1>
	        <hr class="clear-contentunit" />
                <h1 class="block">Association Dues Settings</h1> 
                <p>You can set here the association dues per square meter, either by sub-totalling it from broken down fees or just giving input on the due as a whole. Use decimal points, the numbers will be rounded down to 2 decimal points.
                You can also set here the cut-off dates and the amount of days</p>  
                <div class="contactform">
                        <form name="ass" onsubmit="return(checky6())" action="processAssocBillDateSettings.jsp" method="get">
                            <fieldset>
                                <p> <label for="vill_name" class="left"> What day in the month will be the monthly billing period? </label>                                                        
                                &nbsp;&nbsp;<input type="text" name="lolol" id="lolol" onkeyup="data_changeinteger(this)" class="field" value="<%=temp1%>"/> </p>
                                <p> <label for="vill_name" class="left"> How many days from the cut-off date should be the payment due date? </label>                                                        
                                &nbsp;&nbsp;<input type="text" name="hihi" id="hihi" onkeyup="data_changeinteger(this)" class="field" value="<%=temp2%>"/> </p>
                                <p> <label for="vill_name" class="left"> What unit of measure will you use to measure association dues? </label>                                                
                                &nbsp;&nbsp;<select name='katsz4' id='katsz4' class='combo'>
                                 <%if(measure.equals("HOUSEUNIT")){%>   
                                    <option value='0'> Select... </option>
                                    <option selected value="HOUSEUNIT"> Per House/Unit </option>                                               
                                    <option value="SQM"> Per Square Meter </option>                                               
                                    <%}else if(measure.equals("SQM")){
                        %>
                         <option value='0'> Select... </option>
                                    <option value="HOUSEUNIT"> Per House/Unit </option>                                               
                                    <option selected value="SQM"> Per Square Meter </option>                                               
                        <%}else{
                        %>
                                    <option value='0'> Select... </option>
                                    <option value="HOUSEUNIT"> Per House/Unit </option>                                               
                                    <option value="SQM"> Per Square Meter </option>                                               
                                <%}%>            
                                </select></p>
                                <p> <input type="submit" name="sub" value="Save" align="center" class="button2"></p>
                            </fieldset>
                        </form>
                        
                        <%if(!(measure.equals(""))){%>
                        <form name="ass5" onsubmit="return(checky7())" action="processAssocBillSaveAssocDSQMSetting.jsp" method="get">
                            <fieldset>
                                <p> 
                                <%if(measure.equals("HOUSEUNIT")){ %>
                                <label for="vill_name" class="left">Base Association Due Per House/Unit </label>                        
                                <%}else{ %>
                                <label for="vill_name" class="left">Base Association Due Per Square Meter </label>                                  
                                <%}%>
                                
                                &nbsp;&nbsp;<input type="text" name="fosho" onkeyup="data_changedouble(this)" id="fosho" class="field" value="<%=temp3%>"/></p>
                                
                            <p>  <input type="submit" name="sub" value="Save" align="center" class="button2"/>  </p>
                            </fieldset>
                        </form>
                        <p>Association Sub charges are sub-charges that are recurring per month. You can also choose here whether the charge is to be computed as flat rate or per square meter.</p>
                        <form name="ass54" onsubmit="return(checky5())" action="processAssocAddSubTAssocDues.jsp" method="get">
                            <fieldset>
                                <p> <label for="vill_name" class="left"> Sub-total Name : </label>                                                        
                                &nbsp;&nbsp;<input type="text" name="shiz" id="shiz" class="field" value=""/>
                                <p> <label for="vill_name" class="left"> Fee Amount : </label>                                                        
                                &nbsp;&nbsp;<input type="text" name="shiz2" id="shiz2" onkeyup="data_changedouble(this)" class="field" value=""/>
                                <p> <label for="vill_name" class="left"> Computation : </label>                                                        
                                &nbsp;&nbsp;<select name='shiz3' id='shiz3' class='combo'>
                                    <option value='0'> Select... </option>
                                    <option selected value="FLAT RATE"> Flat Rate </option>                                               
                                    <option value="PER SQM"> Per Square Meter </option>     
                                </select></p>
                                <p> <input type="submit" name="sub" value="Add a Sub-total" align="center" class="button2"/>
                                    <input type="button" name="sub" value="Clear All" align="center" class="button2" onclick='removeAll()'/>
                                    </p>
                            </fieldset>
                        </form>
                        <br>
                         <p>Miscallenous bills are one instance charges only and not recurring, usually used to bill the community for charges that includes new infrastructure in the community.
                         If this is enabled the staff can add miscallenous bills that will be charged in the association dues bills for that month.</p>  
                         <br>
                        <center><table width="536">
                            <tr>
                                <th><center><b>Miscalleneous Billing</b></center></th>
                                
                                  <%if(br.getString("miscalleneous").equals("Enabled")){%>
                                     <td class="td2"><center>Enabled</center></td>
                                <td><center><a href="processAssocBillPenaltyEnable.jsp?batsz3=D">Disable</a></center></td>
                             
                                      <%}else{ %>  <td><center><a href="processAssocBillPenaltyEnable.jsp?batsz3=E">Enable</a></center></td>
                                <td class="td2"><center>Disabled</center></td>
                          
                                <%}%>
                                
                            </tr>                            
                    </table></center><br>
                        <div id="PKOL" name="PKOL">
                    <%if(br2.size() > 0){%>    
                    <center><h2>Association Dues Breakdown</h2><table>
                                <tr>
                                        <th width="100" scope="col"><center>Fee Name</center></th>
                                         <th width="100" scope="col"><center>Amount</center></th>                                                 
                                         <th width="100" scope="col"><center>Computation</center></th>                                                       
                                         <th width="100" scope="col"><center></center></th>                                                       
                                </tr>
                    <%while(br2.next()){  %>
                                        <tr>
                                         <td><%=br2.getString("subtotalName")%></td>
                                         <%double dragon = b.roundTwoDecimals(br2.getDouble("subtotalamount"));%>
                                         <td><%=dragon%></td>
                                         <td><%=br2.getString("subtotaltype")%></td>
                                         <td><a href="processAssocBillRemoveABDown.jsp?subid=<%=br2.getInt("subid")%>">Remove</a></td>                                                
                                        </tr>
                    <%}%>                            
                    </table></center>
                    <%}%>
                </div>
                    
                        <%}%>
                        
               </div>
                
               <h1 class="block">Water Settings</h1> 
               <p>If your homeowner's association has it's own water source that provides for the homeowner's, you can set the water bill settings right here.
               Use decimal points, the amount will be rounded down to 2 decimal points.</p>  
                <center>    <table width="536">
                            <tr>
                                <th><center><b>Water Billing</b></center></th>
                                
                                  <%if(br.getString("water").equals("No")){%>
                                  <td><center><a href="processAssocWaterYESNOSetting.jsp?ans=Yes">Enable</a></center></td>
                                <td class="td2"><center>Disabled</center></td>
                                <%}else{ %>
                                <td class="td2"><center>Enabled</center></td>
                                <td><center><a href="processAssocWaterYESNOSetting.jsp?ans=No">Disable</a></center></td>
                                <%}%>
                                
                            </tr>                            
                        </table>
                        </center>
               <%if(br.getString("water").equals("Yes")){%>
                              
               <div class="contactform">                 
                 <form name="rbass" action="processAssocWaterSettings.jsp" method="get">
                       <fieldset>
                            <p> <label for="vill_name" class="left"> What day in the month will be the monthly billing period? </label>                                                        
                                &nbsp;&nbsp;<input type="text" name="watercutdate" id="watercutdate" onkeyup="data_changeinteger(this)" class="field" value="<%=br.getInt("wcutdate")%>"/> </p>
                                <p> <label for="vill_name" class="left"> How many days from the cut-off date should be the payment due date? </label>                                                        
                                &nbsp;&nbsp;<input type="text" name="waterpaydate" id="waterpaydate" onkeyup="data_changeinteger(this)" class="field" value="<%=br.getInt("wduedate")%>"/> </p>
                                <p> <label for="vill_name" class="left"> Water Fee per cubic meter </label>                                                
                                &nbsp;&nbsp;<input type="text" name="wfee" id="wfee" onkeyup="data_changedouble(this)" class="field" value="<%=br.getDouble("waterpercube")%>"/> </p>
                                <p><input type="submit" name="sub" value="Save" align="center" class="button2"></p>
                       </fieldset>
                   </form>
                    <form name="rbass2" onSubmit="return(checky10())" action="processAssocWaterAdd.jsp" method="get">
                            <fieldset><legend>WATER CHARGES</legend>                                
                            
                                <p> <label for="vill_name" class="left"> Charge Name : </label>                                                        
                                &nbsp;&nbsp;<input type="text" name="bhiz44" id="bhiz44" class="field" value=""/>
                                <p> <label for="vill_name" class="left"> Fee Amount : </label>                                                        
                                &nbsp;&nbsp;<input type="text" name="bhiz33" id="bhiz33" onkeyup="data_changedouble(this)" class="field" value=""/>
                                 <p> <label for="vill_name" class="left"> Computation : </label>                                                        
                                &nbsp;&nbsp;<select name='bhiz22' id='bhiz22' class='combo'>
                                    <option value='0'> Select... </option>
                                    <option selected value="FLAT"> Flat Rate </option>                                               
                                    <option value="CUBEM"> Per Cubic Meter </option>     
                                </select></p>
                                <p> <input type="submit" name="sub" value="Add a Sub-total" align="center" class="button2"/>
                                    <input type="button" name="sub" value="Clear All" align="center" class="button2" onclick='removeAll3()'/>
                                    </p>                    
                                
                            </fieldset>
                        </form>                   
               </div>
               <div id="PKOL3" name="PKOL3">
                    <%if(br4.size() > 0){%>    
                    <center><h2>Water Charges Breakdown</h2><table>
                                <tr>
                                        <th width="100" scope="col"><center>Fee Name</center></th>
                                         <th width="100" scope="col"><center>Amount</center></th>                                                       
                                         <th width="100" scope="col"><center>Computation</center></th>                                                       
                                         <th width="100" scope="col"><center></center></th>                                                       
                                </tr>
                    <%while(br4.next()){  %>
                                        <tr>
                                         <td><%=br4.getString("wname")%></td>
                                         <%double dragon3 = b.roundTwoDecimals(br4.getDouble("wfee"));%>
                                         <td><%=dragon3%></td>
                                         <td><%=br4.getString("wfeecomptype")%></td>
                                         <td><a href="processAssocBillRemoveWCharge.jsp?subid=<%=br4.getInt("bid")%>">Remove</a></td>                                                
                                        </tr>
                    <%}%>                            
                    </table></center>
                    <%}%>
                </div>
                    
                        <%}%>
               
               
               <h1 class="block">Electricity Settings</h1> 
               <p>If your homeowner's association has it's own electricity source that provides for the homeowner's, you can set the electric bill settings right here.
               Use decimal points, the amount will be rounded down to 2 decimal points.</p>
               
                <center>    <table width="536">
                            <tr>
                                <th><center><b>Electricity Billing</b></center></th>
                                
                                  <%if(br.getString("elec").equals("No")){%>
                                  <td><center><a href="processAssocElecYESNOSetting.jsp?ans=Yes">Enable</a></center></td>
                                <td class="td2"><center>Disabled</center></td>
                                <%}else{ %>
                                <td class="td2"><center>Enabled</center></td>
                                <td><center><a href="processAssocElecYESNOSetting.jsp?ans=No">Disable</a></center></td>
                                <%}%>
                                
                            </tr>                            
                        </table>
                        </center>
                        
               <%if(br.getString("elec").equals("Yes")){
                   %>
               <div class="contactform">
                   <form name="zbass" action="processAssocElecSettings.jsp" method="get">
                       <fieldset>
                            <p> <label for="vill_name" class="left"> What day in the month will be the monthly billing period? </label>                                                        
                                &nbsp;&nbsp;<input type="text" name="eleccutdate" id="eleccutdate" onkeyup="data_changeinteger(this)" class="field" value="<%=br.getInt("ecutdate")%>"/> </p>
                                <p> <label for="vill_name" class="left"> How many days from the cut-off date should be the payment due date? </label>                                                        
                                &nbsp;&nbsp;<input type="text" name="elecpaydate" id="elecpaydate" onkeyup="data_changeinteger(this)" class="field" value="<%=br.getInt("eduedate")%>"/> </p>
                                <p> <label for="vill_name" class="left"> Electric Fee per kilowatt hour </label>                                                
                                &nbsp;&nbsp;<input type="text" name="efee" id="efee" onkeyup="data_changedouble(this)" class="field" value="<%=br.getDouble("elecperkwh")%>"/> </p>
                                <p><input type="submit" name="sub" value="Save" align="center" class="button2"></p>
                       </fieldset>
                   </form>
                     <form name="zbass2" onSubmit="return(checky11())" action="processAssocElecAdd.jsp" method="get">
                            <fieldset><legend>ELECTRICITY CHARGES</legend>                                
                            
                                <p> <label for="vill_name" class="left"> Charge Name : </label>                                                        
                                &nbsp;&nbsp;<input type="text" name="rhiz44" id="rhiz44" class="field" value=""/>
                                <p> <label for="vill_name" class="left"> Fee Amount : </label>                                                        
                                &nbsp;&nbsp;<input type="text" name="rhiz33" id="rhiz33" onkeyup="data_changedouble(this)" class="field" value=""/>
                                  &nbsp;&nbsp;<select name='rhiz22' id='rhiz22' class='combo'>
                                    <option value='0'> Select... </option>
                                    <option selected value="FLAT"> Flat Rate </option>                                               
                                    <option value="PERKWH"> Per Kilowatt Hour </option>     
                                </select></p>
                                <p> <input type="submit" name="sub" value="Add a Sub-total" align="center" class="button2"/>
                                    <input type="button" name="sub" value="Clear All" align="center" class="button2" onclick='removeAll4()'/>
                                    </p>                    
                                
                            </fieldset>
                        </form>
               </div>
               <div id="PKOL4" name="PKOL4">
                    <%if(br5.size() > 0){%>    
                    <center><h2>Electricity Charges Breakdown</h2><table>
                                <tr>
                                        <th width="100" scope="col"><center>Fee Name</center></th>
                                         <th width="100" scope="col"><center>Amount</center></th>                                                       
                                       <th width="100" scope="col"><center>Computation</center></th>                                                       
                                         <th width="100" scope="col"><center></center></th>                                                       
                                </tr>
                    <%while(br5.next()){  %>
                                        <tr>
                                         <td><%=br5.getString("elecName")%></td>
                                         <%double dragon4 = b.roundTwoDecimals(br5.getDouble("elecFee"));%>
                                         <td><%=dragon4%></td>
                                         <td><%=br5.getString("efeecomputetype")%></td>
                                         <td><a href="processAssocBillRemoveElecCharge.jsp?subid=<%=br5.getInt("bid")%>">Remove</a></td>                                                
                                        </tr>
                    <%}%>                            
                    </table></center>
                    <%}%>
                </div>
               
               <%}%>
               
               <h1 class="block">Penalty Dues Settings</h1> 
               <p>You can set here if the staff is enabled to add penalty fees to resident bills. The fees will be issued along with the association dues.</p>  
               <center>    <table width="536">
                            <tr>
                                <th><center><b>Penalty Billing</b></center></th>
                                
                                  <%if(br.getString("penalty").equals("Enabled")){%>
                                  <td class="td2"><center>Enabled</center></td>
                                <td><center><a href="processAssocBillPenaltyEnable.jsp?batsz4=D">Disable</a></center></td>
                              
                                <%}else{ %><td><center><a href="processAssocBillPenaltyEnable.jsp?batsz4=E">Enable</a></center></td>
                                <td class="td2"><center>Disabled</center></td>
                                  <%}%>
                                
                            </tr>                            
                        </table>
                        
                        </center>
                <%if(br.getString("penalty").equals("Enabled")){
                   %>
               <div class="contactform">
                        <form name="ass2" onSubmit="return(checky())" action="processAssocPenaltyAdd.jsp" method="get">
                            <fieldset><legend>PENALTY DUES</legend>                                
                               
                                <p> <label for="vill_name" class="left"> Computation : </label>                                                        
                                &nbsp;&nbsp;<select name='jhiz2' id='jhiz2' class='combo'>
                                    <option value="FLAT"> Flat Rate </option>
                                    <option selected value="PERCENT"> Percentage </option>                                                                                   
                                </select></p>
                                <p> <label for="vill_name" class="left"> Sub-total Name : </label>                                                        
                                &nbsp;&nbsp;<input type="text" name="shiz44" id="shiz44" class="field" value=""/>
                                <p> <label for="vill_name" class="left"> Fee Amount/Percentage : </label>                                                        
                                &nbsp;&nbsp;<input type="text" name="shiz33" id="shiz33" onkeyup="data_changedouble(this)" class="field" value=""/>
                                <p> <input type="submit" name="sub" value="Add a Sub-total" align="center" class="button2"/>
                                    <input type="button" name="sub" value="Clear All" align="center" class="button2" onclick='removeAll2()'/>
                                    </p>                    
                                
                            </fieldset>
                        </form>
               </div>  
               <div id="PKOL2" name="PKOL2">
                    <%if(br3.size() > 0){%>    
                    <center><h2>Penalty Dues</h2><table>
                                <tr>
                                 
                                    <th width="80" scope="col"><center>Computation</center></th>
                                        <th width="80" scope="col"><center>Fee Name</center></th>
                                        <th width="80" scope="col"><center>Amount</center></th>                                          
                                        <th width="80" scope="col"><center></center></th>                                                       
                                </tr>
                    <%while(br3.next()){  %>
                                        <tr>
                                          
                                            <td><%=br3.getString("penaltymeasure")%></td>
                                         <td><%=br3.getString("penaltyname")%></td>
                                         <%double dragon2 = b.roundTwoDecimals(br3.getDouble("penaltyamt"));%>
                                         <td><%=dragon2%></td>
                                         <td><a href="processAssocBillRemovePenalty.jsp?bid=<%=br3.getInt("bid")%>">Remove</a></td>                                                
                                        </tr>
                    <%}%>                            
                    </table></center>
                    <%}%>
               </div>
                 <%}%>       
            <!-- Content unit - Two columns -->
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

