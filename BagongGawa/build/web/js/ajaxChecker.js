function data_changedouble(field)
{
          var check = true;
          var value = field.value; //get characters
         
          //check that all characters are digits, ., -, or ""
          for(var i=0;i < field.value.length; ++i)
          {
               var new_key = value.charAt(i); //cycle through characters
               if(new_key != "."){
                if(((new_key < "0") || (new_key > "9")) && 
                    !(new_key == ""))
                {
                    check = false;
                    break;
                }
               
               }
               
          }
          //apply appropriate colour based on value
          if(!check)
          {
               field.style.backgroundColor = "red";
               
          }
          else
          {
               field.style.backgroundColor = "white";
               
          }
}

function data_changeinteger(field)
{
          var check = true;
          var value = field.value; //get characters
         
          //check that all characters are digits, ., -, or ""
          for(var i=0;i < field.value.length; ++i)
          {
               var new_key = value.charAt(i); //cycle through characters
               
                if(((new_key < "0") || (new_key > "9")) && 
                    !(new_key == ""))
                {
                    check = false;
                    break;
                }
               
               
          }
          //apply appropriate colour based on value
          if(!check)
          {
               field.style.backgroundColor = "red";
               
          }
          else
          {
               field.style.backgroundColor = "white";
               
          }
}