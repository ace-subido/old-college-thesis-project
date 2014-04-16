/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



function clearPoll(){
   document.getElementById("pollchoice").innerHTML="";
}


// by ace
function showPoll()
{   
    
var xmlHttp;

 document.getElementById("popo").innerHTML="";
 
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
       
    }
    
    
var url="staffajaxGetPoll.jsp";

xmlHttp.open("GET",url,true);
xmlHttp.send(null);

}

function addPollChoice()
{   
var xmlHttp;

 var test = document.getElementById("pollchoice").value;
 
 
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
    
    
    
var url="staffajaxAddPoll.jsp";
url=url+"?pollchoice="+test;



xmlHttp.open("GET",url,true);
xmlHttp.send(null);

}
function showPollEdit()
{   
    
var xmlHttp;

 document.getElementById("popo").innerHTML="";
 
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
       
    }
    
    
var url="staffajaxGetPollForEdit.jsp";
xmlHttp.open("GET",url,true);
xmlHttp.send(null);

}
function addPollChoiceEdit()
{   
var xmlHttp;

 var test = document.getElementById("pollchoice").value;
 
 
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
    
    
    
var url="staffajaxAddPollForEdit.jsp";
url=url+"?pollchoice="+test;



xmlHttp.open("GET",url,true);
xmlHttp.send(null);

}


