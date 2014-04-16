/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



function clearListcat(){
   document.getElementById("listSocCat").innerHTML="";
}


// by ace
function showSocCategories()
{   
    
var xmlHttp;

 document.getElementById("listSocCat").innerHTML="<img src=img/ajax-loader.gif/>";
 
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
      document.getElementById("listSocCat").innerHTML=xmlHttp.responseText;
      }
   
          
      
    }
    
    
var url="assocajaxGetSocCat.jsp";




xmlHttp.open("GET",url,true);
xmlHttp.send(null);

}

function addSocCategories()
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
      document.getElementById("listSocCat").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("listSocCat").innerHTML="<img src=img/ajax-loader.gif/>";
      }
    }
    
    
    
var url="assocajaxAddSocCat.jsp";
url=url+"?cat="+test.value;



xmlHttp.open("GET",url,true);
xmlHttp.send(null);



}



function staffShowAllComSGPet(){
 var xmlHttp;

 document.getElementById("petpets").innerHTML="";
 
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
      document.getElementById("petpets").innerHTML=xmlHttp.responseText;
      }
   
          
      
    }
    
    
var url="staffajaxGetSocPet.jsp";


xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}

function staffFilterbyCat(){
    var test = document.getElementById("catsz2").value;
    
   document.getElementById("petpetleft").innerHTML="";
 
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
      document.getElementById("petpetleft").innerHTML=xmlHttp.responseText;
      }
   
          
      
    }
    
    

var url="staffajaxGetSocPetbyCat.jsp";
url=url+"?num="+test;

xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}

function staffShowAllComSocGroups(){
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
    
    
var url="staffajaxGetSocGrp.jsp";


xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}

function staffFilterbyCatforApp(){
     var test = document.getElementById("catsz3").value;
    
   document.getElementById("petpetright").innerHTML="";
 
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
      document.getElementById("petpetright").innerHTML=xmlHttp.responseText;
      }
   
          
      
    }  

var url="staffajaxGetSocPetAppbyCat.jsp";
url=url+"?num="+test;

xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}

function residentShowCommunityPetitions(){
    var xmlHttp;

 document.getElementById("letlet").innerHTML="";
 
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
      document.getElementById("letlet").innerHTML=xmlHttp.responseText;
      }         
      
    }
        
    var url="residentajaxGetSocPet.jsp";


    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}

function residentFilterbyCat(){
    
     var xmlHttp;
     var test = document.getElementById("batsz2").value;
 document.getElementById("letlet").innerHTML="";
 
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
      document.getElementById("letlet").innerHTML=xmlHttp.responseText;
      }         
      
    }
        
    var url="residentajaxGetSocPetbyCat.jsp";
url=url+"?num="+test;

    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}

function residentShowMyPets(){
    var xmlHttp;

 document.getElementById("letlet").innerHTML="";
 
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
      document.getElementById("letlet").innerHTML=xmlHttp.responseText;
      }         
      
    }
        
    var url="residentajaxGetMyPets.jsp";


    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}

function showCommunitySocialGroups(){
     var xmlHttp;

 document.getElementById("letlet").innerHTML="";
 
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
      document.getElementById("letlet").innerHTML=xmlHttp.responseText;
      }         
      
    }
        
    var url="residentajaxGetSocGrp.jsp";


    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}

