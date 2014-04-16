package thesis;

import java.sql.*;
import sun.jdbc.rowset.*;
import java.lang.*;
import java.util.*;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.text.ParseException;

public class Election2
{
    Connection con, con2, con5, con6, cont, conti, col, conw, costo, colver, cc;
    String url, uname, pword, strconnection;

    public Election2()
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
    
    public CachedRowSet getNomForElec()
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM nomchoices";
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
    
    public CachedRowSet getNomName(int id)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM nominationtable where NomId='"+id+"'";
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
    
    public int getNominationExist(int id)
    {
        String stat = "Open";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM electable WHERE ElecStatus ='"+stat+"' AND ElecNomId='"+id+"'";
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
    
    public int checkExistingNomName(String Nomname)
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM electable WHERE ElecName='"+Nomname+"' AND ElecStatus = 'Open' ";
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
    
    public void addElection(String nomname, String status, java.util.Date sDate, java.util.Date cDate, String desc, int iD)
    {        
        java.sql.Timestamp startDate = new java.sql.Timestamp(sDate.getTime()); 
        java.sql.Timestamp closeDate = new java.sql.Timestamp(cDate.getTime()); 
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "INSERT into electable (ElecName,ElecSDate,ElecCDate,ElecStatus,ElecDesc,ElecNomId) values ('"+nomname+"','"+startDate+"','"+closeDate+"','"+status+"','"+desc+"','"+iD+"')";

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
    
    public CachedRowSet getElection()
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM electable";
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
    
    public CachedRowSet getElection2()
    {    
        String stat = "Open";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM electable WHERE ElecStatus = '"+stat+"'";
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
    
    public CachedRowSet getSpecificElec(int Elecid)
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM electable where ElecId='"+Elecid+"'";
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
    
    public CachedRowSet getElecChoices2(int Elecid)
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM elecchoices WHERE ElecEId="+Elecid+"";
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
    
    public CachedRowSet getElecChoices(int Elecid)
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM nomchoices WHERE NomNomId="+Elecid+"";
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
    
    public int checkExistingElecName2(int pollid, String Pollname)
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM electable WHERE ElecName='"+Pollname+"' AND NOT ElecId='"+pollid+"'";
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
    
    public void updateElec(int pollid, String pollname, java.util.Date cDate, String desc)
    {
        java.sql.Timestamp closeDate = new java.sql.Timestamp(cDate.getTime()); 
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "UPDATE electable SET ElecName='"+pollname+"',ElecCDate='"+closeDate+"', ElecDesc='"+desc+"' WHERE ElecId='"+pollid+"'";

            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());	
        }
    }
    
    public void updateStatus(int elecid,java.util.Date cDate)
    {
        java.sql.Timestamp closeDate = new java.sql.Timestamp(cDate.getTime()); 
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "UPDATE electable SET ElecCDate='"+closeDate+"', ElecStatus='Close' WHERE ElecId='"+elecid+"'";

            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());	
        }
    }
    
    public void updateStatus2(int elecid,String stat)
    {
        
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "UPDATE nominationtable SET JustClosed='"+stat+"' WHERE NomId='"+elecid+"'";

            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());	
        }
    }
    
    public void updateClose(int pollID)
    {
        String expStr = "Close";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
           
            String query = "UPDATE electable SET ElecStatus='"+expStr+"' WHERE ElecId='"+pollID+"'";
            stmt.executeUpdate(query);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println("Permits.java method updatePermitFieldDetails " + e.getMessage());
        }
    }
    
    public CachedRowSet getAllElection()
    {
        String stat = "Open";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM electable WHERE ElecStatus ='"+stat+"'";
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
    
    public int getVoteTable(int ElecID, int residentID)
    {             
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM elecvote WHERE ElecID="+ElecID+" AND residentID="+residentID+"";
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
    
    public void addToNomChoices(int nomid, int resId)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "INSERT into elecchoices (ElecEId, ElecResId, ElecVoteNum) values ("+nomid+", '"+resId+"','0')";

            System.out.println(query);
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception ex)
        {    
            System.out.println("ayaw po papi" + ex.getMessage());
        }    	
    }
    
    public void addToVoteTable(int residentId, int elecchoiceID, int Elecid)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "INSERT into elecvote (residentID, nomChoice, ElecId) values ("+residentId+", "+elecchoiceID+", "+Elecid+")";

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
    
    public int getVoteNum(int elecchoiceID)
    {    
        int i=0;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT ElecVoteNum FROM elecchoices WHERE ElecCId='"+elecchoiceID+"' ";
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            while(crset.next())
                i = crset.getInt("ElecVoteNum");
            return i;
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public void updateVoteNum(int votenum, int elecchoiceID)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "Update elecchoices set ElecVoteNum= " + votenum + " where ElecCID=" + elecchoiceID + "";

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
    
    public int getNomTableJustClosed()
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM nominationtable WHERE JustClosed='JustClosed'";
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
    
    public CachedRowSet getNomTableJustClosed2()
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM nominationtable WHERE JustClosed='JustClosed'";
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
    
    public CachedRowSet getSpecificElection(int elecid)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM elecchoices WHERE ElecEId ='"+elecid+"'";
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
}