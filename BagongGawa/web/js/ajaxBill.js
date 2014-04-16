function removeAll(){
     
 document.getElementById("PKOL").innerHTML="";
 
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
      document.getElementById("PKOL").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("PKOL").innerHTML="<img src=img/ajax-loader.gif/>";
      }
    }
   
    
    
var url="assocajaxRemoveAllABDown.jsp";


xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}

function removeAll2(){
     
 document.getElementById("PKOL2").innerHTML="";
 
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
      document.getElementById("PKOL2").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("PKOL2").innerHTML="<img src=img/ajax-loader.gif/>";
      }
    }    
    
var url="assocajaxRemoveAllPenaltyDue.jsp";


xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}

function removeAll3(){
     
 document.getElementById("PKOL3").innerHTML="";
 
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
      document.getElementById("PKOL3").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("PKOL3").innerHTML="<img src=img/ajax-loader.gif/>";
      }
    }    
    
var url="assocajaxRemoveAllWCharge.jsp";


xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}

function removeAll4(){
     
 document.getElementById("PKOL4").innerHTML="";
 
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
      document.getElementById("PKOL4").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("PKOL4").innerHTML="<img src=img/ajax-loader.gif/>";
      }
    }    
    
var url="assocajaxRemoveAllECharge.jsp";


xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}

function getResidentPenaltyFee(test){
    
     var xmlHttp;
var test2 = document.getElementById("text1");
    
 document.getElementById("rodList").innerHTML="";
 
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
      document.getElementById("rodList").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("rodList").innerHTML="<img src=img/ajax-loader.gif/>";
    }
      
    }
        
    var url="staffajaxBillPSearchResidents.jsp";
    url=url+"?num="+test;

    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}

function displayPenaltyFeeResident(){
    
     var xmlHttp;
     var test = document.getElementById("text1").value;
    
 document.getElementById("list1").innerHTML="";
 
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
      
    }
        
    var url="staffajaxBillPSearchDisplay.jsp";
    url=url+"?num="+test;

    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}

function getResidentAClear(test){
    
     var xmlHttp;
var test2 = document.getElementById("text2");
    
 document.getElementById("rodList2").innerHTML="";
 
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
      document.getElementById("rodList2").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("rodList2").innerHTML="<img src=img/ajax-loader.gif/>";
    }
      
    }
        
    var url="staffajaxBillClearSearchResidents.jsp";
    url=url+"?num="+test;

    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}

function displayAClearResident(){
    
     var xmlHttp;
     var test = document.getElementById("text2").value;
    
 document.getElementById("list2").innerHTML="";
 
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
      document.getElementById("list2").innerHTML=xmlHttp.responseText;
      }         
      
    }
        
    var url="staffajaxBillClearSearchDisplay.jsp";
    url=url+"?num="+test;

    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}


function getResidentWClear(test){
    
     var xmlHttp;
var test2 = document.getElementById("text2");
    
 document.getElementById("rodList2").innerHTML="";
 
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
      document.getElementById("rodList2").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("rodList2").innerHTML="<img src=img/ajax-loader.gif/>";
    }
      
    }
        
    var url="staffajaxBillWClearSearchResidents.jsp";
    url=url+"?num="+test;

    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}

function displayWClearResident(){
    
     var xmlHttp;
     var test = document.getElementById("text2").value;
    
 document.getElementById("list2").innerHTML="";
 
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
      document.getElementById("list2").innerHTML=xmlHttp.responseText;
      }         
      
    }
        
    var url="staffajaxBillWClearSearchDisplay.jsp";
    url=url+"?num="+test;

    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}

function getResidentWInput(test){
    
     var xmlHttp;
var test2 = document.getElementById("text2");
    
 document.getElementById("rodList2").innerHTML="";
 
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
      document.getElementById("rodList2").innerHTML=xmlHttp.responseText;
      }
      else{
          document.getElementById("rodList2").innerHTML="<img src=img/ajax-loader.gif/>";
    }
      
    }
        
    var url="staffajaxBillWInputSearchResidents.jsp";
    url=url+"?num="+test;

    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}

function displayWInputResident(){
    
     var xmlHttp;
     var test = document.getElementById("text2").value;
    
 document.getElementById("list2").innerHTML="";
 
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
      document.getElementById("list2").innerHTML=xmlHttp.responseText;
      }         
      
    }
        
    var url="staffajaxBillWInputSearchDisplay.jsp";
    url=url+"?num="+test;

    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}

function showAssocBillBatch(test){
       var xmlHttp;
     
    
 document.getElementById("PKOL2").innerHTML="";
 
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
   if(xmlHttp.readyState==0){
           document.getElementById("PKOL2").innerHTML="<img src=img/ajax-loader.gif/>";
   }
   if(xmlHttp.readyState==2){
           document.getElementById("PKOL2").innerHTML="<img src=img/ajax-loader.gif/>";
   }
    if(xmlHttp.readyState==4)
      {
      document.getElementById("PKOL2").innerHTML=xmlHttp.responseText;
      }         
      
    }
        
    var url="staffajaxBillADisplayBatchDet.jsp";
    url=url+"?num="+test;

    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}


function showWaterBillBatch(test){
       var xmlHttp;
     
    
 document.getElementById("PKOL2").innerHTML="";
 
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
      document.getElementById("PKOL2").innerHTML=xmlHttp.responseText;
      }         
      
    }
        
    var url="staffajaxBillWDisplayBatchDet.jsp";
    url=url+"?num="+test;

    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}


function showMiscFees(test){
       var xmlHttp;
     
    
 document.getElementById("PKOL2").innerHTML="";
 
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
   if(xmlHttp.readyState==0){
           document.getElementById("PKOL2").innerHTML="<img src=img/ajax-loader.gif/>";
   }
   if(xmlHttp.readyState==2){
           document.getElementById("PKOL2").innerHTML="<img src=img/ajax-loader.gif/>";
   }
    if(xmlHttp.readyState==4)
      {
      document.getElementById("PKOL2").innerHTML=xmlHttp.responseText;
      }         
      
    }
        
    var url="staffajaxBillADisplayMisc.jsp";
    url=url+"?num="+test;

    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}

