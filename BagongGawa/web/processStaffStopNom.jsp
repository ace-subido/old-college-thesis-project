  <%@page  import="thesis.*, sun.jdbc.rowset.*, java.util.*, java.text.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<script type= "text/javascript">
    var isCheck = confirm("Are you sure you want to close this nomination?");
    var go;
    if (isCheck)
    {    
<%
        int nomid = Integer.parseInt(request.getParameter("nomid"));
        java.util.Date closeDate = new java.util.Date();
        Calendar myCalendar = Calendar.getInstance();
        int month = myCalendar.get(Calendar.MONTH)+1;
        int year = myCalendar.get(Calendar.YEAR);
        int day = myCalendar.get(Calendar.DATE);
        String d= year+"-"+month+"-"+day+" "+00+":"+00+":00";;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        closeDate = sdf.parse(d); 
        Election e = new Election();
        e.updateStatus(nomid,closeDate);
        e.updateClose(nomid);
        
        CachedRowSet nominee = e.getNominees(nomid);
        int i=0,index=-1, index2=-1, index3=-1,max=0;;
        int[] v , v2;
        CachedRowSet voteCount;
        boolean inside=false;
        v = new int[nominee.size()];
        v2 = new int[nominee.size()];
        for(int j=0; j<v.length; j++)
        {    
            v[j] = -1;
            v2[j] = -1;
        }
        while(nominee.next())
        {    
            voteCount = e.getNomineeVoteCount(nominee.getInt("NomResNom"), nominee.getInt("NomNomId"));
            for(int j=0; j<v.length; j++)
                if(nominee.getInt("NomResNom")==v[j])
                    inside = true;
            if(inside==false)
            {    
                v[i] = nominee.getInt("NomResNom");
                v2[i] = voteCount.size();
                inside=false;
                i++;
            }
        }
        index=-1; index2=-1; index3=-1;max=0;
        if(i>0)
        {    
        for(int k=0; k<v.length; k++)
            if(max< v2[k])
            {    
                index = k;
                max = v2[k];
            }
        e.addToNomChoices(nomid,v[index]);
        }
        max=0;
        if(i>1)
        {
            for(int k=0; k<v.length; k++)
                if(max< v2[k] && k!=index)
                {    
                    index2 = k;
                    max = v2[k];
                }
            e.addToNomChoices(nomid,v[index2]);
        }
        max=0;
        if(i>2)
        {
            for(int k=0; k<v.length; k++)
            if(max< v2[k] && k!=index && k!=index2)
            {    
                index3 = i;
                max = v2[k];
            }
            e.addToNomChoices(nomid,v[index3]);
        }
%>      
        location= "staffmanagenom.jsp";     
    }          
    else 
        history.back();
</script>      
</body>
</html>