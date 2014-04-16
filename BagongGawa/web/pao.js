/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function getBlFl4(phbd)
{   
var xmlHttp;
document.getElementById("blockFloor").innerHTML="";

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
    
    
    
var url="assocAddResBlFlDropDown.jsp";
url=url+"?phbd="+phbd;

xmlHttp.open("GET",url,true);
xmlHttp.send(null);

}
function getLotNum(blflid)
{   
var xmlHttp;
document.getElementById("lotunit").innerHTML="";

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
    
    
    
var url="assocAddResLtRmDropDown.jsp";
url=url+"?blflid="+blflid;

xmlHttp.open("GET",url,true);
xmlHttp.send(null);

}