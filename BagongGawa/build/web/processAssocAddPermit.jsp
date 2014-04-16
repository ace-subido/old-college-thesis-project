 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.sql.*, java.text.*,java.util.Date"%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%
    if(session.getAttribute("uname") == null)
        response.sendRedirect("homepage.jsp");

    String permitname= request.getParameter("name");
    String pfee = request.getParameter("pfee");
    String rfee = request.getParameter("rfee");
    int tempID = Integer.parseInt(request.getParameter("tempID"));
    String field2= request.getParameter("field2");
    String field3= request.getParameter("field3");
    String field4= request.getParameter("field4");
    String field5= request.getParameter("field5");
    String field6= request.getParameter("field6");
    String field7= request.getParameter("field7");
    String field8= request.getParameter("field8");
    String field9= request.getParameter("field9");
    String field10= request.getParameter("field10");
    String field11= request.getParameter("field11");
    String field12= request.getParameter("field12");
    String field13= request.getParameter("field13");
    String field14= request.getParameter("field14");
    String field15= request.getParameter("field15");
    String field16= request.getParameter("field16");
    String field17= request.getParameter("field17");
    String field18= request.getParameter("field18");
    String field19= request.getParameter("field19");
    String field20= request.getParameter("field20");
    String rules= request.getParameter("textarea1");
    String check1="",check2="",check3="",check4="",check5="",check6="",check7="",check8="",check9="",check10="";
    String check11="",check12="",check13="",check14="",check15="",check16="",check17="",check18="",check19="",check20="";
    if(tempID==0)
    {    
        check1= request.getParameter("check1");
        check2= request.getParameter("check2");
        check3= request.getParameter("check3");
        check4= request.getParameter("check4");
        check5= request.getParameter("check5");
        check6= request.getParameter("check6");
        check7= request.getParameter("check7");
        check8= request.getParameter("check8");
        check9= request.getParameter("check9");
        check10= request.getParameter("check10");
        check11= request.getParameter("check11");
        check12= request.getParameter("check12");
        check13= request.getParameter("check13");
        check14= request.getParameter("check14");
        check15= request.getParameter("check15");
        check16= request.getParameter("check16");
        check17= request.getParameter("check17");
        check18= request.getParameter("check18");
        check19= request.getParameter("check19");
        check20= request.getParameter("check20");
    }
    else if(tempID==1)
    {    
        check1= "on";
        check2= "on";
        check3= "on";
        check4= "on";
        check5= "on";
        check6= "on";
        check7= "on";
        check8= request.getParameter("check8");
        check9= request.getParameter("check9");
        check10= request.getParameter("check10");
        check11= request.getParameter("check11");
        check12= request.getParameter("check12");
        check13= request.getParameter("check13");
        check14= request.getParameter("check14");
        check15= request.getParameter("check15");
        check16= request.getParameter("check16");
        check17= request.getParameter("check17");
        check18= request.getParameter("check18");
        check19= request.getParameter("check19");
        check20= request.getParameter("check20");
    }
    else if(tempID==2)
    {
        check1= "on";
        check2= "on";
        check3= "on";
        check4= "on";
        check5= "on";
        check6= "on";
        check7= "on";
        check8= "on";
        check9= "on";
        check10= "on";
        check11= "on";
        check12= request.getParameter("check12");
        check13= request.getParameter("check13");
        check14= request.getParameter("check14");
        check15= request.getParameter("check15");
        check16= request.getParameter("check16");
        check17= request.getParameter("check17");
        check18= request.getParameter("check18");
        check19= request.getParameter("check19");
        check20= request.getParameter("check20");
    }
    else if(tempID==3)
    {
        check1= "on";
        check2= "on";
        check3= "on";
        check4= "on";
        check5= "on";
        check6= "on";
        check7= "on";
        check8= "on";
        check9= "on";
        check10= "on";
        check11= "on";
        check12= "on";
        check13= "on";
        check14= "on";
        check15= request.getParameter("check15");
        check16= request.getParameter("check16");
        check17= request.getParameter("check17");
        check18= request.getParameter("check18");
        check19= request.getParameter("check19");
        check20= request.getParameter("check20");
    } 
    String path= request.getParameter("path");
    String path1= request.getParameter("path1");
    String path2= request.getParameter("path2");
    String realPath = "";
    if(path1.equalsIgnoreCase("Select"))
        realPath = path+"-";
    else if(!path1.equalsIgnoreCase("Select") && path2.equalsIgnoreCase("Select"))
        realPath = path+"-"+path1+"-";
    else if (!path.equalsIgnoreCase("Select") && !path1.equalsIgnoreCase("Select") && !path2.equalsIgnoreCase("Select"))
        realPath = path+"-"+path1+"-"+path2+"-";
    String years= request.getParameter("years");
    
    Permits p = new Permits();
    boolean check = p.checkIsExisting(permitname);
    boolean checkExisting2 = p.checkIsExisting2(permitname);

    if(checkExisting2==false)
    {    
        p.AddPermitFields(permitname, "Date of Application", field2, field3, field4, field5, field6, field7, field8, field9, field10, field11, field12, field13, field14, field15, field16, field17, field18, field19, field20,check,rules,realPath,pfee,Integer.parseInt(years),rfee);
        p.AddPermit(permitname, check1, check2,check3, check4, check5, check6, check7, check8, check9, check10, check11, check12, check13, check14, check15, check16, check17, check18, check19, check20,check);
    }
%>
</body>
<%
    if(checkExisting2==false)
    {    
%>
        <script type= "text/javascript">
            <!--
                alert("Adding of permit successful");
                location = "assocPermit.jsp";                
            -->
        </script>
<%
    }
    else if (checkExisting2==true)
    {    
%>
        <script type= "text/javascript">
            <!--
                alert("Permit Name already exist");
                history.back();                
            -->
        </script>
<%
    }
%>        
</html>