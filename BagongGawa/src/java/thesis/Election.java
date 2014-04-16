package thesis;

import java.sql.*;
import sun.jdbc.rowset.*;
import java.lang.*;
import java.util.*;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.text.ParseException;

public class Election
{
    Connection con, con2, con5, con6, cont, conti, col, conw, costo, colver, cc;
    String url, uname, pword, strconnection;

    public Election()
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
    
    public CachedRowSet getAllDivisionNames()
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM commandiv WHERE available='available'";
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
    
    public CachedRowSet getDivisionName2(int id)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM commandiv WHERE available='available' AND comDivId='"+id+"'";
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
    
    public CachedRowSet getDivisionExist()
    {
        String stat = "Serving";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM director WHERE status ='"+stat+"' OR status='Waiting'";
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
    
    public int getDivisionExist2(int divid)
    {
        String stat = "Serving";
        String stat2 = "Waiting";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM director WHERE chargeOf='"+divid+"' and (status ='"+stat+"' OR status='"+stat2+"')";
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
    
    public CachedRowSet getDivisionExis3(int resid)
    {
        String stat = "Serving";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM director WHERE dirId='"+resid+"' and status ='"+stat+"'";
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
    
    public CachedRowSet getDirectorExistWaiting(int resid)
    {
        String stat = "Waiting";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM director WHERE resId='"+resid+"' and status ='"+stat+"'";
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
    
    public String getDivisionExisTest(int resid)
    {
        String stat = "Serving";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM director WHERE dirId='"+resid+"' and status ='"+stat+"'";
            ResultSet rs = stmt.executeQuery(query);
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            return query;
        } 
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return e.getMessage();
        }
    }
    
    public int checkExistingNomName(String Nomname)
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM nominationtable WHERE NomName='"+Nomname+"' AND NomStatus = 'Open' ";
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
    
    public void addNomination(String nomname, String status, java.util.Date sDate, java.util.Date cDate, String desc, int divID)
    {        
        java.sql.Timestamp startDate = new java.sql.Timestamp(sDate.getTime()); 
        java.sql.Timestamp closeDate = new java.sql.Timestamp(cDate.getTime()); 
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "INSERT into nominationtable (NomName,NomDesc,NomSDate,NomCDate,NomStatus,NomDivId) values ('"+nomname+"','"+desc+"','"+startDate+"','"+closeDate+"','"+status+"','"+divID+"')";

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
    
    public void addDirector(int res, int div, java.util.Date sDate, java.util.Date cDate, String name)
    {        
        java.sql.Timestamp startDate = new java.sql.Timestamp(sDate.getTime()); 
        java.sql.Timestamp closeDate = new java.sql.Timestamp(cDate.getTime()); 
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "INSERT into director (chargeOf,DirName,resId,start,end) values ('"+div+"','"+name+"','"+res+"','"+startDate+"','"+closeDate+"')";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());	
        }
    }
    
    public int getNominationExist(int id)
    {
        String stat = "Open";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM nominationtable WHERE NomStatus ='"+stat+"' AND NomDivId='"+id+"'";
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
    
    public CachedRowSet getAllNomination()
    {
        String stat = "Open";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM nominationtable WHERE NomStatus ='"+stat+"'";
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
    
    public CachedRowSet getAllNomination2()
    {
        String stat = "Close";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM nominationtable WHERE NomStatus ='"+stat+"'";
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
    
    public CachedRowSet getSpecificNomination(int id)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM nominationtable WHERE NomId='"+id+"'";
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
    
    public CachedRowSet getSpecificNomination2(int id)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM nominationtable WHERE NomDivId='"+id+"'";
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
    
    public void updateNom(int nomid, String nomname, java.util.Date cDate, String desc)
    {
        java.sql.Timestamp closeDate = new java.sql.Timestamp(cDate.getTime()); 
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "UPDATE nominationtable SET NomName='"+nomname+"', NomDesc='"+desc+"',NomCDate='"+closeDate+"' WHERE NomId='"+nomid+"'";

            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());	
        }
    }
     
    public void updateStatus(int nomid,java.util.Date cDate)
    {
        java.sql.Timestamp closeDate = new java.sql.Timestamp(cDate.getTime()); 
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "UPDATE nominationtable SET NomCDate='"+closeDate+"', NomStatus='Close' WHERE NomId='"+nomid+"'";

            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());	
        }
    }
    
    public CachedRowSet getAllNominationTable()
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM nominationtable";
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
    
    public int getVoteTable(int nomID, int residentID)
    {             
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM nomivote WHERE NomNomID='"+nomID+"' AND NomResId="+residentID+"";
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
    
    public void addToVoteTable(int residentId, int NomresID, int nomid)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "INSERT into nomivote (NomResId, NomResNom, NomNomId) values ("+residentId+", "+NomresID+", "+nomid+")";

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
    
    public void updateClose(int nomID)
    {
        String expStr = "Close";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
           
            String query = "UPDATE nominationtable SET NomStatus='"+expStr+"', JustClosed='JustClosed' WHERE NomId='"+nomID+"'";
            stmt.executeUpdate(query);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println("Permits.java method updatePermitFieldDetails " + e.getMessage());
        }
    }
    
    public void updateJustClose(int nomID)
    {
        String expStr = "Close";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
           
            String query = "UPDATE nominationtable SET JustClosed='InElection' WHERE NomId='"+nomID+"'";
            stmt.executeUpdate(query);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println("Permits.java method updatePermitFieldDetails " + e.getMessage());
        }
    }
    
    public CachedRowSet getNominees(int nomID)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
           
            String query = "SELECT * FROM nomivote WHERE NomNomId='"+nomID+"'";
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
            System.out.println("Permits.java method updatePermitFieldDetails " + e.getMessage());
            return null;
        }
    }       
    
    public CachedRowSet getNomineeVoteCount(int resID, int nomID)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
           
            String query = "SELECT * FROM nomivote WHERE NomResNom='"+resID+"' AND NomNomId = '"+nomID+"'";
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
            System.out.println("Permits.java method updatePermitFieldDetails " + e.getMessage());
            return null;
        }
    }
    
    public int exist(int nomid,int resid)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * from nomchoices WHERE NomNomId = '"+nomid+"' AND NomResId = '"+resid+"'";
            ResultSet rs = stmt.executeQuery(query);
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            return crset.size();
            
        }
        catch (Exception ex)
        {    
            System.out.println("ayaw po papi" + ex.getMessage());
            return -1;
        }    	
    }        
    
    public void addToNomChoices(int nomid, int resId)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "INSERT into nomchoices (NomNomId, NomResId, NomVoteNum) values ("+nomid+", '"+resId+"','0')";

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
    
    public int getLast()
    {
        int last=0;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * from director";
            ResultSet rs = stmt.executeQuery(query);
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            
            while(crset.next())
                last = crset.getInt("dirId");
            return last;
        }
        catch (Exception ex)
        {    
            System.out.println("ayaw po papi" + ex.getMessage());
            return -1;
        }    	
    }
    
    public CachedRowSet ExistingResidentELection(int resid)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * from elecchoices WHERE ElecResId = '"+resid+"'";
            ResultSet rs = stmt.executeQuery(query);
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            return crset;
        }
        catch (Exception ex)
        {    
            System.out.println("ayaw po papi" + ex.getMessage());
            return null;
        }    	
    }
}