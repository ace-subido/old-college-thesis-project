package thesis;
 
import java.sql.*;
import sun.jdbc.rowset.*;
import java.lang.*;
import java.util.*;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.text.ParseException;
public class Polls
{
    Connection con, con2, con5, con6, cont, conti, col, conw, costo, colver, cc;
    String url, uname, pword, strconnection;

    public Polls()
    {            
        try
        { 
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            strconnection = "jdbc:mysql://localhost/thesis?user=root&password=root";
        }
        catch (Exception e)
        {
            System.out.println("Polls() " + e.getMessage());
        }
    }
    
    public void newPollsSettings(int id, int poll, int nom, int elec, int years, int start)
    {    
        try
        {
            conti = DriverManager.getConnection (strconnection);
            Statement stmt = conti.createStatement();
            String query = "INSERT into pollssettings(id, polldays, nomdays, elecdays, years,start) values("+id+", '"+poll+"', '"+nom+"', '"+elec+"', '"+years+"','"+start+"')";
            stmt.executeUpdate(query);
            stmt.close();
            conti.close();
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
        }
    }
    
    public void updatePollsSettings(int id, int poll, int nom, int elec, int years,int start)
    {
        try
        {
        con = DriverManager.getConnection (strconnection);

        Statement stmt = con.createStatement();
        String query = "Update pollssettings set polldays ='"+poll+"', nomdays='"+nom+"', elecdays='"+elec+"', years='"+years+"',start='"+start+"' WHERE id="+id+"";

        stmt.executeUpdate(query);
        stmt.close();
        con.close();		
        } 
        catch (Exception e)
        {    
            System.out.println("catch: ewan " + e.getMessage());
        }
    }
    
    public CachedRowSet getMaxDays()
    {   
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM pollssettings";
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
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
    
    public int checkExistingPollName(String Pollname)
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM pollstable WHERE Pollname='"+Pollname+"' AND Pollstatus = 'Open' ";
            ResultSet rs = stmt.executeQuery(query);
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            return crset.size();
        } 
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return -1;
        }
    }
    
    public int checkExistingPollName2(int pollid, String Pollname)
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM pollstable WHERE Pollname='"+Pollname+"' AND NOT Pollid='"+pollid+"' ";
            ResultSet rs = stmt.executeQuery(query);
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            return crset.size();
        } 
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return -1;
        }
    }
    
    public int getPollId(String Pollname)
    {    
        int i=0;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT Pollid FROM pollstable WHERE Pollname='"+Pollname+"' AND Pollstatus = 'Open'";
            ResultSet rs = stmt.executeQuery(query);
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();

            while(crset.next())
                i = crset.getInt("Pollid");
            
            return i;
        } 
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public void addPoll(String pollname, String status, java.util.Date sDate, java.util.Date cDate, String desc,String pollphase)
    {        
        java.sql.Timestamp startDate = new java.sql.Timestamp(sDate.getTime()); 
        java.sql.Timestamp closeDate = new java.sql.Timestamp(cDate.getTime()); 
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "INSERT into pollstable (Pollname,Pollstatus,PollSDate,PollCDate,Polldesc,Pollphase) values ('"+pollname+"','"+status+"','"+startDate+"','"+closeDate+"','"+desc+"','"+pollphase+"')";

            stmt.executeUpdate(query);
            System.out.println("ayus");
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());	
        }
    }
    
    public void addPollChoice(int pollid, String pollchoicename)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "INSERT into pollchoices (Pollid, pollchoicename) values ("+pollid+", '"+pollchoicename+"')";
            stmt.executeUpdate(query);
            System.out.println("ayus");
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {    
            System.out.println(e.getMessage());	
        }
    }
    
    public CachedRowSet getPoll()
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM pollstable";
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
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
    
    public CachedRowSet getPollChoices(int Pollid)
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM pollchoices WHERE Pollid="+Pollid+"";
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
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
    
    public CachedRowSet getSpecificPoll(int Pollid)
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM pollstable where Pollid='"+Pollid+"'";
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
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
    
    public void updatePoll(int pollid, String pollname, java.util.Date cDate, String desc, String phase)
    {
        java.sql.Timestamp closeDate = new java.sql.Timestamp(cDate.getTime()); 
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "UPDATE pollstable SET Pollname='"+pollname+"',PollCDate='"+closeDate+"', Polldesc='"+desc+"', Pollphase='"+phase+"' WHERE Pollid='"+pollid+"'";

            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());	
        }
    }
    
    public void updateStatus(int pollid,java.util.Date cDate)
    {
        java.sql.Timestamp closeDate = new java.sql.Timestamp(cDate.getTime()); 
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "UPDATE pollstable SET PollCDate='"+closeDate+"', Pollstatus='Close' WHERE Pollid='"+pollid+"'";

            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());	
        }
    }
    
    public CachedRowSet checkPollStatus(int Pollid)
    {     
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT Pollstatus FROM pollstable WHERE Pollid="+Pollid+"";
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
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
    
    public CachedRowSet getPoll2()
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM pollstable WHERE Pollstatus = 'Open'";
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
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
    
    public int getVoteTable(int pollID, int residentID)
    {             
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM votetable WHERE pollID="+pollID+" AND residentID="+residentID+"";
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();

            return crset.size();
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return -1;
        }
    }
    
    public void addToVoteTable(int residentId, int pollchoiceID, int Pollid)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "INSERT into votetable (residentID, pollchoiceID, pollID) values ("+residentId+", "+pollchoiceID+", "+Pollid+")";

            System.out.println(query);
            stmt.executeUpdate(query);
            System.out.println("sa java nag update");
            stmt.close();
            con.close();
        }
        catch (Exception ex)
        {    
            System.out.println("ayaw po papi" + ex.getMessage());
        }    	
    }
    
    public int getVoteNum(int pollchoiceID)
    {    
        int i=0;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT votenum FROM pollchoices WHERE pollchoicesID='"+pollchoiceID+"' ";
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            while(crset.next())
                i = crset.getInt("votenum");
            return i;
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public void updateVoteNum(int votenum, int pollchoiceID)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "Update pollchoices set votenum= " + votenum + " where pollchoicesID=" + pollchoiceID + "";

            System.out.println(query);
            stmt.executeUpdate(query);
            System.out.println("sa java nag update");
            stmt.close();
            con.close();
        }
        catch (Exception ex)
        {    
            System.out.println("ayaw po papi" + ex.getMessage());
        }    	
    }
    
    public void updateClose(int pollID)
    {
        String expStr = "Close";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
           
            String query = "UPDATE pollstable SET Pollstatus='"+expStr+"' WHERE Pollid='"+pollID+"'";
            stmt.executeUpdate(query);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println("Permits.java method updatePermitFieldDetails " + e.getMessage());
        }
    }
    
    public int getPhase()
    {    
        int phaseno=0;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT phblid FROM lots";
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            while(crset.next())
                phaseno = crset.getInt("phblid");
            return phaseno;
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return -1;
        }
    }
    
    public int getStart()
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT start FROM pollssettings";
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            crset.next();
            return crset.getInt("start");
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return -1;
        }
    }
}