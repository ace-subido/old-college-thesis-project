<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.sql.*, java.text.*,java.util.Date"%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
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
</head>

<body>
    Testing Approve Reject
<%
    Enumeration<String> attrNames = request.getParameterNames();
    String name;
    String value;
    Newsletter nl = new Newsletter();
    CachedRowSet crs, crs2;
    System.out.println("Testing");
    
    while(attrNames.hasMoreElements())
    {
        name = attrNames.nextElement();
        System.out.println(name);
        value = (String)request.getParameter(name);
        if(! name.equals("submitNewsletter") && ! value.equals(null))
        {
            
            if(request.getParameter("submitNewsletter").equals("Approve"))
            {
                nl.setApproveReject(Integer.parseInt(name), true);
                crs = nl.getResidentEmails();
                crs2 = nl.getNewsLetter(Integer.parseInt(name));
                crs2.first();
                while(crs.next()){
                    String email = crs.getString("EmailAdd");
                    String subject = crs2.getString("subject");
                    String author = crs2.getString("author");
                    String content = crs2.getString("content");
                    System.out.println(email + "-" + subject + "-" + author + "-" + content);
                %>
             <script type= "text/javascript">
                document.mailer.name = "done";
                document.mailer.id = "done";
            </script>
                <form name="mailer" id="mailer">
                    <input name="to" id="to" type="hidden" style="width: 300px" value="<%=email%>" />
                    <input name="from" id="from" type="hidden" style="width: 300px" value="tech-support@converge.com.ph" />
                    <input name="subject" id="subject" type="hidden" style="width: 450px" value="<%=subject%>" />
                    <input name="author" id="author" type="hidden" style="width: 450px" value="<%=author%>" />
                    <input name="body" id="body" type="hidden" value="<%=content%>">
                    <br />        
                </form>
             <script type= "text/javascript">
                sendMo();
            </script>
            <%}
            }
            else
            {
                nl.setApproveReject(Integer.parseInt(name), false);
            }%>
            
        <%}
        
    }
   response.sendRedirect("assocNewsletterList.jsp");
%>
</body>
    
</html>