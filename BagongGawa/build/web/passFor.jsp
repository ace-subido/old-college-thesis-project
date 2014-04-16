 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="thesis.*, sun.jdbc.rowset.*"%>
<html>
<head>
    <title>Converge Generic Community Association Portal</title>
    <script type= "text/javascript">
    <!--  
        function sendMo()
        {
            document.mailer.action = "http://faustmeister.info/webmailer/Default.aspx";
            document.mailer.method = "POST";
            document.mailer.submit();
            alert("Password sent to your email account");
            location = "homepage.jsp";
        }
    -->    
   </script> 
</head>
<body>
    
<%	
    String username = request.getParameter("n");        
    NewClass nu = new NewClass();
    String pass = nu.getPasswordForRes();
    Unit u = new Unit();
    u.upResPass(username, pass);
    Thesis t = new Thesis();
    CachedRowSet crset = t.getResidents(username);
    if(crset.size() > 0)
    {    
        String bo = "Your temporary Password is: " + pass + "\r\n Please change your password as soon as you login. \r\n";
        while(crset.next())
        {
            String ar = crset.getString("EmailAdd");
%>          
            <form name="mailer" id="mailer">
                <input name="to" id="to" type="hidden" style="width: 300px" value="<%=ar%>" />
                <input name="from" id="from" type="hidden" style="width: 300px" value="tech-support@converge.com.ph" />
                <input name="subject" id="subject" type="hidden" style="width: 450px" value="Your Password for Converge Generic Association Portal" />
                <input name="body" id="body" type="hidden" value="<%=bo%>">
                <br />
            </form> 
            <script type= "text/javascript">
            <!--
                sendMo();
            -->
            </script>
<%
        }
    }
    else
    {
%>
        <script type= "text/javascript">
        <!--  
            alert("No account exists with that Username");
        -->    
        </script> 
<%
    }
    %>
</body>
</html>