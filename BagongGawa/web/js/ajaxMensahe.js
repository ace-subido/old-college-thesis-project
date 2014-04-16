/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function clearMessageList(){
   document.getElementById("mehmeh").innerHTML="";
}
function clearWorkBox(){
   document.getElementById("LOLOL").innerHTML="";
}

function showMessages(idnum){
     var test = idnum;
 
 
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
      document.getElementById("mehmeh").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("mehmeh").innerHTML="<img src=img/ajax-loader.gif/>";
      }
    }
    
    
    
var url="ajaxgetMessages.jsp";
url=url+"?rID="+test;



xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}

function deleteMessage(idnum){
     var test = idnum;
 
 
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
      document.getElementById("mehmeh").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("mehmeh").innerHTML="<img src=img/ajax-loader.gif/>";
      }
    }
    
    
    
var url="ajaxdelMessage.jsp";
url=url+"?mID="+test;



xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}
