
function setResident(a){
    document.getElementById("newRes").value = a;
}

function getResidents(test){
    
     var xmlHttp;
    
 document.getElementById("suggest").innerHTML="";
 
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
      document.getElementById("suggest").innerHTML=xmlHttp.responseText;
      }         
      
    }
        
    var url="residentajaxSuggestSearch.jsp";
    url=url+"?num="+test;

    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}

function displayResident(){
    
     var xmlHttp;
     var test = document.getElementById("newRes").value;
    
 document.getElementById("suggest").innerHTML="";
 
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
      document.getElementById("jiankang2").innerHTML=xmlHttp.responseText;
      }         
      
    }
        
    var url="residentajaxSearchDisplay.jsp";
    url=url+"?num="+test;

    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}
//jemuel
function getAllResidents(test){
    
     var xmlHttp;
var test2 = document.getElementById("text1");
    
 document.getElementById("modList").innerHTML="";
 
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
      document.getElementById("modList").innerHTML=xmlHttp.responseText;
      }         
      
    }
        
    var url="staffajaxSuggestSearch.jsp";
    url=url+"?num="+test;

    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}

//ace
function displayResident2(){
    
     var xmlHttp;
     var test = document.getElementById("newRes").value;
    
 document.getElementById("suggest").innerHTML="";
 
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
      document.getElementById("jiankang2").innerHTML=xmlHttp.responseText;
      }         
      
    }
        
    var url="residentajaxSearchDisplay2.jsp";
    url=url+"?num="+test;

    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}

function getAllResidents2(test){
    
     var xmlHttp;
var test2 = document.getElementById("text1");
    
 document.getElementById("modList").innerHTML="";
 
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
      document.getElementById("modList").innerHTML=xmlHttp.responseText;
      }         
      
    }
        
    var url="staffajaxSuggestSearch2.jsp";
    url=url+"?num="+test2.value;

    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}

//jemuel
function displayEWAN(test){
    
     var xmlHttp;
   
 document.getElementById("searchres").innerHTML="";
 
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
      document.getElementById("searchres").innerHTML=xmlHttp.responseText;
      }         
      
    }
        
    var url="assocResidentView.jsp";
    url=url+"?num="+test;

    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}
//jemuel
function confirm(test){
    
     var xmlHttp;
   
 document.getElementById("searchres").innerHTML="";
 
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
      document.getElementById("searchres").innerHTML=xmlHttp.responseText;
      }         
      
    }
        
    var url="assocResidentToDirector.jsp";
    url=url+"?num="+test;

    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}
//jemuel
function getAllResidents3(test){
    
     var xmlHttp;
var test2 = document.getElementById("text1");
    
 document.getElementById("modList").innerHTML="";
 
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
      document.getElementById("modList").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("modList").innerHTML="<img src=img/ajax-loader.gif/>";
    }
      
    }
        
    var url="staffajaxSuggestSearch3.jsp";
    url=url+"?num="+test2.value;

    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}
//jemuel
function displayEWAN2(test){
    
     var xmlHttp;
   
 document.getElementById("searchres").innerHTML="";
 
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
      document.getElementById("searchres").innerHTML=xmlHttp.responseText;
      }         
      
    }
        
    var url="assocResidentView2.jsp";
    url=url+"?num="+test;

    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}
