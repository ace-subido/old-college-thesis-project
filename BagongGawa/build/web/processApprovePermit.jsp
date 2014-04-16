 
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.sql.*, java.text.*,java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<script type= "text/javascript">
<!--  
    function sendMo()
    {
      document.mailer.action = "http://faustmeister.info/webmailer/Default.aspx";
      document.mailer.method = "POST";
      document.mailer.submit();
      alert("message sent");
    }
-->    
</script> 
<body>
<%
    String resPermitID = request.getParameter("resPermitID");
    String permType = request.getParameter("ptype");
    String action = request.getParameter("action");
    String stat = request.getParameter("status");
    String path = request.getParameter("path");
    String type = request.getParameter("type");
    String more = request.getParameter("More");
    
    String remarks = request.getParameter("textarea1");
    String close = request.getParameter("close");
    
    if (close == null)
        close ="";
    
    Permits db = new Permits();
    
    java.util.Date apprejDate = new java.util.Date();
    Calendar myCalendar = Calendar.getInstance();
    int month = myCalendar.get(Calendar.MONTH)+1;
    int year = myCalendar.get(Calendar.YEAR);
    int day = myCalendar.get(Calendar.DATE);
    Converter conv = new Converter();
    String realMonth = conv.convMonth(month);
    String d2 = realMonth + " " + day + ", " + year;
    String d= year+"-"+month+"-"+day+" "+00+":"+00+":00";;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    apprejDate = sdf.parse(d);
    
    CachedRowSet resPermitDetail = db.getResidentPermitDetail(resPermitID);
    resPermitDetail.next();
    java.util.Date appDate = resPermitDetail.getTimestamp("field1");
    myCalendar.setTime(appDate);
    int month1 = myCalendar.get(Calendar.MONTH)+1;
    int day1 = myCalendar.get(Calendar.DATE);
    int year1 = myCalendar.get(Calendar.YEAR);
    String realMonth1 = conv.convMonth(month1);
    String applicationDate = realMonth1 + " " + day1 + ", " + year1;
    
    CachedRowSet permitDetail = db.getFieldDetails(String.valueOf(resPermitDetail.getInt("permitID")));
    String permitName = permitDetail.getString("PermitName");
    
    Residents r = new Residents();
    CachedRowSet residentSet = r.getResInfo(resPermitDetail.getInt("resID"));
    residentSet.next();
    String email = residentSet.getString("EmailAdd");
       
    String body = "",subject="";
    
    int permitYear = permitDetail.getInt("years");
    int rYear=0;
    String expStr = "", expirationStatus="";
    if(permitYear!=6)
    {    
        rYear = permitYear + year;
        expStr= rYear+"-"+month+"-"+day+" "+00+":"+00+":00";
        expirationStatus="Ongoing";
    }
    else if(permitYear==6)
    {           
        expStr= "2000"+"-"+"01"+"-"+"01"+" "+00+":"+00+":00";
        expirationStatus = "No Expiration";
    }
    
    SimpleDateFormat sdfexp = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    java.util.Date expDate = new java.util.Date();
    expDate = sdfexp.parse(expStr);
    
    if (action.equals("1"))
    {
        if(path.equalsIgnoreCase(""))
        {    
            db.updatePermitStatus("Approved", resPermitID,appDate,apprejDate,"permitApprove",remarks,path,expDate,expirationStatus);
            body = "Your " + permitName + " permit application is Approved \r\n Date of Application: " + applicationDate + "\r\n Date Approved: " + d2;
            subject = permitName + " permit application Approved";
            
            Billing b = new Billing();
            java.util.Date pdate = new java.util.Date();
        //    b.addPermit(resPermitDetail.getInt("resID"), pdate, resPermitDetail.getInt("resID"), residentSet.getString("FirstName")+" "+residentSet.getString("LastName"), residentSet.getInt("FamId"), resPermitDetail.getDouble("pfee"), permitName, residentSet.getInt("LotID"));
        }
        else
            db.updatePermitStatus("Pending", resPermitID,appDate,apprejDate,"pending",remarks,path,expDate,expirationStatus);
    }
    else
    {
        path = "";
        db.updatePermitStatus("Rejected", resPermitID,appDate,apprejDate,"permitReject",remarks,path,expDate,expirationStatus);        
        body = "Your " + permitName + " permit application is Rejected \r\n Date of Application: " + applicationDate + "\r\n Date Rejected: " + d2 + "\r\n Reason: " + remarks;
        subject = permitName + " permit application Rejected";
    }    
%>    
    <form name="mailer" id="mailer">
        <input name="to" id="to" type="hidden" style="width: 300px" value="<%=email%>" />
        <input name="from" id="from" type="hidden" style="width: 300px" value="tech-support@converge.com.ph" />
        <input name="subject" id="subject" type="hidden" style="width: 450px" value="<%=subject%>" />
        <input name="body" id="body" type="hidden" value="<%=body%>">
        <br />        
    </form>
    
<%
    if(close.equals("close") && more.equalsIgnoreCase("false"))
    {
%>
        <script type= "text/javascript">
            alert('You have successfully rejected the permit');
            opener.location.reload(true);
            self.close();
            sendMo();
        </script>
<%
    }
    else if(close.equals("close") && more.equalsIgnoreCase("true"))
    {
%>
        <script type= "text/javascript">
            alert('You have successfully rejected the permit');
            opener.location.reload(true);
            sendMo();
            location = "seeMorePermits.jsp?permitID=All&status=Pending&page=1&type=<%=type%>&More=true";
        </script>
<%
    }        
    else
    {
        if(path.equalsIgnoreCase(""))
        {
            if(type.equalsIgnoreCase("Admin") && more.equalsIgnoreCase("false"))
            {    //sendMo();
%>        
                <script type= "text/javascript">
                    location = "assocPermit.jsp"; 
                    sendMo();
                </script>
<%
            }
            else if(type.equalsIgnoreCase("Admin") && more.equalsIgnoreCase("true"))
            {//sendMo();
%>                
                <script type= "text/javascript">
                    location = "seeMorePermits.jsp?permitID=All&status=Pending&page=1&type=Admin&More=true"; 
                    sendMo();
                </script>
<%                
            }
            else if(type.equalsIgnoreCase("Director") && more.equalsIgnoreCase("false"))
            {    //sendMo();
%>        
                <script type= "text/javascript">
                    location = "directorPermit.jsp"; 
                    sendMo();
                </script>
<%
            }
            else if(type.equalsIgnoreCase("Director") && more.equalsIgnoreCase("true"))
            {//sendMo();
%>                
                <script type= "text/javascript">
                    location = "seeMorePermits.jsp?permitID=All&status=Pending&page=1&type=Director&More=true"; 
                    sendMo();
                </script>
<%                
            }
            else if(type.equalsIgnoreCase("Staff") && more.equalsIgnoreCase("false"))
            {    //sendMo();
%>        
                <script type= "text/javascript">
                    location = "staffPermit.jsp?permitID=<%=permType%>&status=<%=stat%>"; 
                    sendMo();
                </script>
        
<%
            }
            else if(type.equalsIgnoreCase("Staff") && more.equalsIgnoreCase("true"))
            {//sendMo();
%>                
                <script type= "text/javascript">
                    location = "seeMorePermits.jsp?permitID=<%=permType%>&status=<%=stat%>&page=1&type=Staff&More=true"; 
                    sendMo();
                </script>
<%                
            }
        }
        else
        {
            if(type.equalsIgnoreCase("Admin") && more.equalsIgnoreCase("false"))
            {    
%>        
                <script type= "text/javascript">
                    location = "assocPermit.jsp";
                </script>
<%
            }
            else if(type.equalsIgnoreCase("Admin") && more.equalsIgnoreCase("true"))
            {
%>                
                <script type= "text/javascript">
                    location = "seeMorePermits.jsp?permitID=All&status=Pending&page=1&type=Admin&More=true"; 
                </script>
<%                
            }
            else if(type.equalsIgnoreCase("Director") && more.equalsIgnoreCase("false"))
            {    
%>        
                <script type= "text/javascript">
                    location = "directorPermit.jsp";
                </script>
<%
            }
            else if(type.equalsIgnoreCase("Director") && more.equalsIgnoreCase("true"))
            {
%>                
                <script type= "text/javascript">
                    location = "seeMorePermits.jsp?permitID=All&status=Pending&page=1&type=Director&More=true"; 
                </script>
<%                
            }
            else if(type.equalsIgnoreCase("Staff") && more.equalsIgnoreCase("false"))
            {    
%>
                <script type= "text/javascript">
                    location = "staffPermit.jsp?permitID=<%=permType%>&status=<%=stat%>"; 
                </script>
<%
            }
            else if(type.equalsIgnoreCase("Staff") && more.equalsIgnoreCase("true"))
            {
%>                
                <script type= "text/javascript">
                    location = "seeMorePermits.jsp?permitID=<%=permType%>&status=<%=stat%>&page=1&type=Staff&More=true"; 
                </script>
<%                
            }    
        }    
    }
%>
</body>
</html>