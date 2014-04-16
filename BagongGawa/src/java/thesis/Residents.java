package thesis;


import java.sql.*;
import sun.jdbc.rowset.*;

public class Residents
{
    Connection con, con2;
    String url, uname, pword, strconnection;

    public Residents()
    {            
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            strconnection = "jdbc:mysql://localhost/thesis?user=root&password=root";
        }
        catch(Exception e)
        {
            System.out.println("Residents.java constructor " + e.getMessage());
        }
    }
    
    public CachedRowSet getResidents(String asa)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM Resident where Username = '"+asa+"'";
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
            System.out.println("Residents.java method getResidents() " + e.getMessage());
            return null;
        }
    }
    
    public CachedRowSet getResInfo(int lol)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM Resident where ResId = "+lol+"";
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
            return null;
        }
    }
    
    public CachedRowSet getListRes(String crit, String s)
    {
        String search = "%"+s+"%";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "";
            if (s.equals("All"))
                query = "SELECT * FROM Resident ORDER BY LastName";
            else
            {
                if(crit.equals("0"))
                    query = "SELECT * FROM Resident where LastName LIKE '"+search+"' ORDER BY LastName";
                else if (crit.equals("1"))
                    query = "SELECT * FROM Resident where FirstName LIKE '"+search+"' ORDER BY LastName";
                else if (crit.equals("2"))
                    query = "SELECT * FROM Resident where HouseNum LIKE '"+search+"' ORDER BY LastName";
                else if (crit.equals("3"))
                    query = "SELECT * FROM Resident where EmailAdd LIKE '"+search+"' ORDER BY LastName";
            }    
                
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
            return null;
        }
    }
    
    public CachedRowSet getListRes2(String crit, String s)
    {
        String search = "%"+s+"%";
        String stat = "Enabled";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "";
            if (s.equals("All"))
                query = "SELECT * FROM Resident WHERE Status = '"+stat+"' ORDER BY LastName";
            else
            {
                if(crit.equals("0"))
                    query = "SELECT * FROM Resident where LastName LIKE '"+search+"' and Status = '"+stat+"' ORDER BY LastName";
                else if (crit.equals("1"))
                    query = "SELECT * FROM Resident where FirstName LIKE '"+search+"' and Status = '"+stat+"' ORDER BY LastName";
                else if (crit.equals("2"))
                    query = "SELECT * FROM Resident where HouseNum LIKE '"+search+"' and Status = '"+stat+"' ORDER BY LastName";
                else if (crit.equals("3"))
                    query = "SELECT * FROM Resident where EmailAdd LIKE '"+search+"' and Status = '"+stat+"' ORDER BY LastName";
            }    
                
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
            return null;
        }
    }
    
    public CachedRowSet getResDirector()
    {
        String type = "Director";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM director where status = 'Serving'";
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
            return null;
        }
    }
}