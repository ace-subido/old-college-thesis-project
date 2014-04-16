package thesis;

import java.sql.*;
import sun.jdbc.rowset.*;
import java.lang.*;
import java.util.*;

public class Unit
{
    Connection con, con2;
    String url, uname, pword, strconnection;

    public Unit()
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
    
    public String getDivUnit()
    {
        try
        {
            String div="p";
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM VillageInfo";
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            while(crset.next())
            {
                div = crset.getString("DivisionUnit");
            }
            return div;
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    public CachedRowSet getVillageInfo()
    {         
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM villageinfo";
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

    public int getTotalCom()
    {
        try
        {
            int p = 0;
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM ComManDiv";
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            p = crset.size();

            return p;
        }
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
            return 0;
        }
    }
      
    public void upD(String nameDiv, int divId, String stat)
    {
        try
        {
            System.out.println("nasa edittype.java");
            con = DriverManager.getConnection (strconnection);

            Statement stmt = con.createStatement();
            String query = "Update commandiv set comDivisionName ='"+nameDiv+"', status='"+stat+"' where comDivId = "+divId+" ";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();		
        } 
        catch (Exception e)
        { 
            System.out.println("catch: ewan " + e.getMessage());
        }
    }
      
    public int getTotalDir()
    {
        try
        {
            int p = 0;
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM director";
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            //p = crset.size();
            while(crset.next())
            {
                p = crset.getInt("dirId");
            }

            return p;
        }
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
            return 0;
        }
    }
      
    public String getCharge(String charge)
    {         
        String c = "";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM director where chargeOf = '"+charge+"' ";
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            while(crset.next())
            {
                c = crset.getString("DirName");
            }
            return c;
        } 
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
            return c;
        }
    }  
      
    public void upResPass(String user, String pass)
    {
        try
        {
            System.out.println("nasa edittype.java");
            con = DriverManager.getConnection (strconnection);

            Statement stmt = con.createStatement();
            String query = "Update Resident set Password ='"+pass+"' where Username = '"+user+"' ";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();		
        } 
        catch (Exception e)
        { 
            System.out.println("catch: ewan " + e.getMessage());
        }
    }
     
    public int checkDirComManDiv(int resId)
    {
        int i =0;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM ComManDiv where resId = "+resId+"";
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            if(crset.size() > 0)
            i=1;

            return i;
        }
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public void updateBulletinFromAdminLatest()
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "UPDATE bulletinboard set status = 'Old' where status = 'Latest'";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {    
            System.out.println("nag error pow" + e.getMessage());
        }
    } 
}