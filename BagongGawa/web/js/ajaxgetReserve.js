


function showResReserveHistory()
{   
var id = document.getElementById("as");
var xmlHttp;

document.getElementById("popo").innerHTML="<img src=img/ajax-loader.gif/>"; 

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
      document.getElementById("popo").innerHTML=xmlHttp.responseText;
    }
    else{
          document.getElementById("popo").innerHTML="<img src=img/ajax-loader.gif/>";
    }
    }    
    
var url="getResReserves.jsp";
url=url+"?resid="+id.value;

xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}

function showAllReserveHistory()
{   
var id = document.getElementById("as");
var xmlHttp;

document.getElementById("popo").innerHTML="<img src=img/ajax-loader.gif/>"; 

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
      document.getElementById("popo").innerHTML=xmlHttp.responseText;
    }
    else{
          document.getElementById("popo").innerHTML="<img src=img/ajax-loader.gif/>";
    }
    }    
    
var url="assocGetAllReserves.jsp";
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}

function removehistcontent(){
   document.getElementById("popo").innerHTML="";
}



function showfacility(str)
{   
var xmlHttp;
var id = document.getElementById("as");
 
 if(str.value != "NA"){
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
      document.getElementById("plpl").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("plpl").innerHTML="<img src=img/ajax-loader.gif/>";
      }
    }
    
    
var url="getFacReserves.jsp";
url=url+"?res="+str;
url=url+"&residentid="+str;


xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}
}

// by jemuel
function clearListcat(){
   document.getElementById("listCat").innerHTML="";
}

function showStatus(){
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
      document.getElementById("alertStatus").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("alertStatus").innerHTML="<img src=img/ajax-loader.gif/>";
      }
    }
    
    
var url="assocGetBulletinStatus.jsp";




xmlHttp.open("GET",url,true);
xmlHttp.send(null);

    
}

// by jemuel
function showCategories()
{   
var xmlHttp;

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
      document.getElementById("listCat").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("listCat").innerHTML="<img src=img/ajax-loader.gif/>";
      }
    }
    
    
var url="getBulletinCategories.jsp";




xmlHttp.open("GET",url,true);
xmlHttp.send(null);

}

function addCategories()
{   
var xmlHttp;

 var test = document.getElementById("newCat");
 
 
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
      document.getElementById("listCat").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("listCat").innerHTML="<img src=img/ajax-loader.gif/>";
      }
    }
    
    
    
var url="addBulletinCategories.jsp";
url=url+"?cat="+test.value;



xmlHttp.open("GET",url,true);
xmlHttp.send(null);



}

function saveBulletinStatus()
{
    

      if(document.getElementsByName("radio1")[0].checked || document.getElementsByName("radio1")[1].checked)
      {
          saveBulletinStatus2();
          k=1;
      }
  
 else
  {
      alert("Choose whether yes or no");
  }
  
    
}

function saveBulletinStatus2()
{   
var xmlHttp;



 var test = document.getElementsByName("radio1");
 for (var i=0; i<test.length; i++)  
  {  
    if (test[i].checked) {  
      checked = true; 
      var state = test[i].value; 
      
    }  
   } 
   
       
   
 
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
      document.getElementById("alertStatus").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("alertStatus").innerHTML="<img src=img/ajax-loader.gif/>";
      }
    }
    
    
    
    
var url="processAssocBulletinOne.jsp";
url=url+"?status="+state;



xmlHttp.open("GET",url,true);
xmlHttp.send(null);



}
function showCategories2()
{   
var xmlHttp;

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
      document.getElementById("listCat").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("listCat").innerHTML="<img src=img/ajax-loader.gif/>";
      }
    }
    
    
var url="getBulletinCategories.jsp";




xmlHttp.open("GET",url,true);
xmlHttp.send(null);

}
