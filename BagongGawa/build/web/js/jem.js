/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function addBulletin()
{   
var xmlHttp;

 var test = document.getElementById("bullCategory");
 var bName = document.getElementById("bName");
 var textArea = document.getElementById("textarea1").value;
 
try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    try
      {
      xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
    catch (e)
      {
      alert("Your browser does not support AJAX!");
      return false;
      }
    }
  }
  xmlHttp.onreadystatechange=function()
    {      
  
    if(xmlHttp.readyState==4)
      {
      document.getElementById("alertLoc").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("alertLoc").innerHTML="<img src=img/ajax-loader.gif/>";
      }
    }
    
    
    
var url="residentAddBulletinPost.jsp";
url=url+"?cat="+test.value+"&bName="+bName.value+"&textArea="+textArea;




xmlHttp.open("GET",url,true);
xmlHttp.send(null);



}
function showBulletCategories()
{   
var xmlHttp;

 
 
try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    try
      {
      xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
    catch (e)
      {
      alert("Your browser does not support AJAX!");
      return false;
      }
    }
  }
    xmlHttp.onreadystatechange=function()
    {      
  
    if(xmlHttp.readyState==4)
      {
      document.getElementById("catDrop").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("catDrop").innerHTML="<img src='img/ajax-loader.gif'>";
      }
    }
    
    
var url="getBullCategories.jsp";




xmlHttp.open("GET",url,true);
xmlHttp.send(null);

}
function getComments()
{   
var xmlHttp;

var bulId = document.getElementById("bId");

 showStatus();
 
try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    try
      {
      xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
    catch (e)
      {
      alert("Your browser does not support AJAX!");
      return false;
      }
    }
  }
    xmlHttp.onreadystatechange=function()
    {      
  
    if(xmlHttp.readyState==4)
      {
      document.getElementById("comments").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("comments").innerHTML="<img src=img/ajax-loader.gif/>";
      }
    }
    
    
var url="residentGetBulletinComments.jsp?bulId="+bulId.value;




xmlHttp.open("GET",url,true);
xmlHttp.send(null);

}
function getMods()
{   
var xmlHttp;

var cat = document.getElementById("cate");

 showStatus();
 
try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    try
      {
      xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
    catch (e)
      {
      alert("Your browser does not support AJAX!");
      return false;
      }
    }
  }
    xmlHttp.onreadystatechange=function()
    {      
  
    if(xmlHttp.readyState==4)
      {
      document.getElementById("list1").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("list1").innerHTML="<img src=img/ajax-loader.gif/>";
      }
    }
    
    
var url="staffGetModerator.jsp?cat="+cat.value;




xmlHttp.open("GET",url,true);
xmlHttp.send(null);

}

function addMod()
{   
var xmlHttp;

 var cat = document.getElementById("cate");
 var text1 = document.getElementById("text1");
 
 
try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    try
      {
      xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
    catch (e)
      {
      alert("Your browser does not support AJAX!");
      return false;
      }
    }
  }
  xmlHttp.onreadystatechange=function()
    {      
  
    if(xmlHttp.readyState==4)
      {
      document.getElementById("list1").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("list1").innerHTML="<img src=img/ajax-loader.gif/>";
      }
    }
    
    
    
var url="staffAddMod.jsp";
url=url+"?cat="+cat.value+"&text1="+text1.value;




xmlHttp.open("GET",url,true);
xmlHttp.send(null);



}

function getBlFl(blFl)
{   
var xmlHttp;


try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    try
      {
      xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
    catch (e)
      {
      alert("Your browser does not support AJAX!");
      return false;
      }
    }
  }
  xmlHttp.onreadystatechange=function()
    {      
  
    if(xmlHttp.readyState==4)
      {
      document.getElementById("blockFloor").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("blockFloor").innerHTML="<img src=img/ajax-loader.gif/>";
      }
    }
    
    
    
var url="assocSetupPartResidentialGetBlFl.jsp";
url=url+"?blfl="+blFl;




xmlHttp.open("GET",url,true);
xmlHttp.send(null);



}

function getLotRoom(blFL, phbl)
{   
var xmlHttp;


try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    try
      {
      xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
    catch (e)
      {
      alert("Your browser does not support AJAX!");
      return false;
      }
    }
  }
  xmlHttp.onreadystatechange=function()
    {      
  
    if(xmlHttp.readyState==4)
      {
      document.getElementById("lotunit").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("lotunit").innerHTML="<img src=img/ajax-loader.gif/>";
      }
    }
    
    
    
var url="assocSetupPartResidentialGetLoUn.jsp";
url=url+"?blfl="+blFl+"&phbl="+phbl;




xmlHttp.open("GET",url,true);
xmlHttp.send(null);



}

function getBlFl2(blFl)
{   
var xmlHttp;
document.getElementById("blockFloor").innerHTML="";
document.getElementById("lotunit").innerHTML="";
document.getElementById("lotarea").innerHTML="";
try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    try
      {
      xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
    catch (e)
      {
      alert("Your browser does not support AJAX!");
      return false;
      }
    }
  }
  xmlHttp.onreadystatechange=function()
    {      
  
    if(xmlHttp.readyState==4)
      {
      document.getElementById("blockFloor").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("blockFloor").innerHTML="<img src=img/ajax-loader.gif/>";
      }
    }
    
    
    
var url="assocSetupPartResidentialGetBlFl2.jsp";
url=url+"?blfl="+blFl;




xmlHttp.open("GET",url,true);
xmlHttp.send(null);



}
function getLots(phbl, blFl)
{   
var xmlHttp;
document.getElementById("lotarea").innerHTML="";

try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    try
      {
      xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
    catch (e)
      {
      alert("Your browser does not support AJAX!");
      return false;
      }
    }
  }
  xmlHttp.onreadystatechange=function()
    {      
  
    if(xmlHttp.readyState==4)
      {
      document.getElementById("lotunit").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("lotunit").innerHTML="<img src=img/ajax-loader.gif/>";
      }
    }
    
    
    
var url="assocSetupPartResidentialGetLoUn2.jsp";
url=url+"?blfl="+blFl+"&phbl="+phbl;




xmlHttp.open("GET",url,true);
xmlHttp.send(null);



}

function getLotAreaText(loun, blfl, phbl)
{   
var xmlHttp;


try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    try
      {
      xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
    catch (e)
      {
      alert("Your browser does not support AJAX!");
      return false;
      }
    }
  }
  xmlHttp.onreadystatechange=function()
    {      
  
    if(xmlHttp.readyState==4)
      {
      document.getElementById("lotarea").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("lotarea").innerHTML="<img src=img/ajax-loader.gif/>";
      }
    }
    
    
    
var url="assocSetupPartResidentialLotArea.jsp";
url=url+"?blfl="+blfl+"&phbl="+phbl+"&loun="+loun;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);



}
function getBlFl3(blFl)
{   
var xmlHttp;
document.getElementById("blockFloor").innerHTML="";
document.getElementById("lotunit").innerHTML="";
document.getElementById("details").innerHTML="";

try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    try
      {
      xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
    catch (e)
      {
      alert("Your browser does not support AJAX!");
      return false;
      }
    }
  }
  xmlHttp.onreadystatechange=function()
    {      
  
    if(xmlHttp.readyState==4)
      {
      document.getElementById("blockFloor").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("blockFloor").innerHTML="<img src=img/ajax-loader.gif/>";
      }
    }
    
    
    
var url="assocSetupPartResidentialGetBlFl3.jsp";
url=url+"?blfl="+blFl;




xmlHttp.open("GET",url,true);
xmlHttp.send(null);



}


function getLots2(phbl, blFl)
{   
var xmlHttp;
document.getElementById("lotunit").innerHTML="";
document.getElementById("details").innerHTML="";

try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    try
      {
      xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
    catch (e)
      {
      alert("Your browser does not support AJAX!");
      return false;
      }
    }
  }
  xmlHttp.onreadystatechange=function()
    {      
  
    if(xmlHttp.readyState==4)
      {
      document.getElementById("lotunit").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("lotunit").innerHTML="<img src=img/ajax-loader.gif/>";
      }
    }
    
    
    
var url="assocSetupPartResidentialGetLoUn3.jsp";
url=url+"?blfl="+blFl+"&phbl="+phbl;




xmlHttp.open("GET",url,true);
xmlHttp.send(null);



}
function getlotDetails(lotnum, phbl, blFl)
{   
var xmlHttp;


try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    try
      {
      xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
    catch (e)
      {
      alert("Your browser does not support AJAX!");
      return false;
      }
    }
  }
  xmlHttp.onreadystatechange=function()
    {      
  
    if(xmlHttp.readyState==4)
      {
      document.getElementById("details").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("details").innerHTML="<img src=img/ajax-loader.gif/>";
      }
    }
    
    
    
var url="staffResidentialGetLotDetails.jsp";
url=url+"?blfl="+blFl+"&phbl="+phbl+"&lotnum="+lotnum;




xmlHttp.open("GET",url,true);
xmlHttp.send(null);



}

//jemuel
function getAllResidents4(test){
    
     var xmlHttp;
var test2 = document.getElementById("name");
    
 document.getElementById("results").innerHTML="";
 
try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    try
      {
      xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
    catch (e)
      {
      alert("Your browser does not support AJAX!");
      return false;
      }
    }
  }
    xmlHttp.onreadystatechange=function()
    {      
  
    if(xmlHttp.readyState==4)
      {
      document.getElementById("results").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("results").innerHTML="<img src=img/ajax-loader.gif/>";
    }
      
    }
        
    var url="staffajaxSuggestSearch4.jsp";
    url=url+"?num="+test2.value;

    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}

//jemuel
function getAllResidents4(test){
    
     var xmlHttp;
var test2 = document.getElementById("name");
var phbl = document.getElementById("phbl").value;
var blfl = document.getElementById("blfl").value;
var lotnum = document.getElementById("lotnum").value;
    
 document.getElementById("results").innerHTML="";
 
try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    try
      {
      xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
    catch (e)
      {
      alert("Your browser does not support AJAX!");
      return false;
      }
    }
  }
    xmlHttp.onreadystatechange=function()
    {      
  
    if(xmlHttp.readyState==4)
      {
      document.getElementById("results").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("results").innerHTML="<img src=img/ajax-loader.gif/>";
    }
      
    }
        
    var url="staffajaxSuggestSearch4.jsp";
    url=url+"?num="+test2.value+"&phbl="+phbl+"&blfl="+blfl+"&lotnum="+lotnum;

    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}

//jemuel
function displayEWAN2(rid, phbl, blfl, lotnum){
    
     var xmlHttp;

  
 
try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    try
      {
      xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
    catch (e)
      {
      alert("Your browser does not support AJAX!");
      return false;
      }
    }
  }
    xmlHttp.onreadystatechange=function()
    {      
  
    if(xmlHttp.readyState==4)
      {
      document.getElementById("results").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("results").innerHTML="<img src=img/ajax-loader.gif/>";
    }
      
    }
        
    var url="staffFillLotResident2.jsp";
    url=url+"?num="+rid+"&phbl="+phbl+"&blfl="+blfl+"&lotnum="+lotnum;

    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}

