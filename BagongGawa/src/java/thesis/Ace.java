package thesis;

import java.sql.*;
import sun.jdbc.rowset.*;
import java.lang.*;
import java.util.*;

public class Ace
{
     Connection con, con2;
     String url, uname, pword, strconnection;

     public Ace()
     {            
        try
        { 
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            strconnection = "jdbc:mysql://localhost/thesis?user=root&password=root";
        }
        catch (Exception e)
        {
            System.out.println("Resident() " + e.getMessage());
        }
    }  
     
     public void sendMessage(String lp, int b, int c, String d, String e, String f)
     {    
        try
        {
            con2 = DriverManager.getConnection (strconnection);
            Statement stmt = con2.createStatement();

            java.util.Date dt = new java.util.Date();
            java.sql.Timestamp ts1 = new java.sql.Timestamp(dt.getTime());

            String query = "INSERT into messages (content, fromID, toID, fromName, toName, MTitle, MDate) values('"+lp+"', "+b+", "+c+", '"+d+"', '"+e+"', '"+f+"', '"+ts1+"')";
            stmt.executeUpdate(query);

            stmt.close();
            con2.close();
        }
        catch (Exception em)
        {            		
            System.out.println(em.getMessage());
        }
     }
     
     public CachedRowSet retrieveUserMessages(int a)
    {
        try
        {
            CachedRowSet crset = new CachedRowSet();
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM messages where toID = "+a+"";
            ResultSet rs = stmt.executeQuery(query);

            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            return crset;
        } 
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return null;
        }
    }
     
    public String makeDateToString(java.util.Date frresdate)
    {
        Calendar myCalendar = Calendar.getInstance();
        int tempinta, frresyear, frresday, frresmonth;

        myCalendar.setTime(frresdate);
        frresyear = myCalendar.get(Calendar.YEAR);
        frresday = myCalendar.get(Calendar.DAY_OF_MONTH);


        tempinta = myCalendar.get(Calendar.DAY_OF_WEEK);
        frresmonth = myCalendar.get(Calendar.MONTH);

        String temp = "January";
        String demp = "Sunday";

        if(frresmonth == 1)
        temp = "February";
        if(frresmonth == 2)
        temp = "March";
        if(frresmonth == 3)
        temp = "April";
        if(frresmonth == 4)
        temp = "May";
        if(frresmonth == 5)
        temp = "June";
        if(frresmonth == 6)
        temp = "July";
        if(frresmonth == 7)
        temp = "August";
        if(frresmonth == 8)
        temp = "September";
        if(frresmonth == 9)
        temp = "October";
        if(frresmonth == 10)
        temp = "November";
        if(frresmonth == 11)
        temp = "December";


        if(tempinta == 2)
        demp = "Monday";
        else if(tempinta == 3)
        demp = "Tuesday";
        else if(tempinta == 4)
        demp = "Wednesday";
        else if(tempinta == 5)
        demp = "Thursday";
        else if(tempinta == 6)
        demp = "Friday";
        else if(tempinta == 7)
        demp = "Saturday";


        String frresdatestr ="";
        frresdatestr = demp+" - "+temp+" "+frresday+", "+frresyear;

        return frresdatestr;
    }
      
    public String makeTimetoString(java.util.Date frresdate)
    {          
        Calendar myCalendar = Calendar.getInstance();

        int frreshour, frresmin;
        String frresminstr = "", frresampm = "";

        myCalendar.setTime(frresdate);
        frreshour = myCalendar.get(Calendar.HOUR);
        frresmin = myCalendar.get(Calendar.MINUTE);

        if(frreshour == 0)
        frreshour = 12;
        if(frresmin == 0)
        frresminstr = "00";
        else
        frresminstr = "30";

        int temp = myCalendar.get(Calendar.AM_PM);

        if(temp == 1)        
        frresampm = "PM";

        String a = frreshour+" : "+frresminstr+" "+frresampm;

        return a;
    }
    
    public CachedRowSet getMessageDet(int a)
    {
        try
        {
            CachedRowSet crset = new CachedRowSet();
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM messages where messageId = "+a+"";
            ResultSet rs = stmt.executeQuery(query);

            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();

            crset.size();
            return crset;
        } 
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    public void deleteMessage(int a)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "DELETE FROM messages where messageId = "+a+"";
            stmt.executeUpdate(query);


            stmt.close();
            con2.close();
        } 
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
        }
    }
}