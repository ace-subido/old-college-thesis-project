package thesis;

import java.sql.*;
import sun.jdbc.rowset.*;
import java.lang.*;
import java.util.*;

public class serviceTemplate
{    
    Connection con, con2;
    String url, uname, pword, strconnection;
     
    public serviceTemplate()
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
     
     public CachedRowSet getServices()
     {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM servicestemplate";
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

    public void addReservationToHandler(int comDiv, int pId)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "INSERT into reservationhandlers (comDivId, rId) values("+comDiv+", "+pId+")";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
        }
    }	
    
    public void addVoteToHandler(int comDiv, int pId)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "INSERT into votehandlers (comDivId, vId) values("+comDiv+", "+pId+")";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
        }
    }	
      
    public void addBulletinToHandler(int comDiv, int pId)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "INSERT into bulletinhandlers (comDivId, bId) values("+comDiv+", "+pId+")";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
        }
    }	
      
    public void addBillingToHandler(int comDiv, int pId)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "INSERT into billinghandlers (comDivId, bId) values("+comDiv+", "+pId+")";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        } catch (Exception e)
        {    
            System.out.println(e.getMessage());
        }
    }	
       
    public void addNewsletterToHandler(int comDiv, int pId)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "INSERT into newsletterhandlers (comDivId, nId) values("+comDiv+", "+pId+")";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
        }
    }	
      
    public void addPaymentToHandler(int comDiv, int pId)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "INSERT into paymenthandlers (comDivId, pId) values("+comDiv+", "+pId+")";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
        }
    }	
     
    public void addEventsToHandler(int comDiv, int pId)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "INSERT into eventhandlers (comDivId, eId) values("+comDiv+", "+pId+")";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
        }
    }	
    //************************************** jimmy boy
    public void insertIntoMonthlyBillExtra(String ename, int amount, int bId, int extra)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "INSERT into monthlybillextraexpenses (expenseName, amount, billBatch, mbee) values('"+ename+"', "+amount+", "+bId+", "+extra+")";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        } 
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
        } 
    }
}