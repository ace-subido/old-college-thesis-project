package thesis;
 
import java.sql.*;
import sun.jdbc.rowset.*;
import java.lang.*;
import java.util.*;

public class Account
{
    Connection con, con2, con3, con4, con5;
    String url, uname, pword, strconnection;
    
    public Account()
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
    
    public CachedRowSet getResident(int ResId)
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();


            String query = "SELECT * FROM resident WHERE ResId="+ResId+"";
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
    
    public CachedRowSet getLots(int LotId)
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();


            String query = "SELECT * FROM Lots WHERE lid="+LotId+"";
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
    
    public boolean checkusername(String username)
    {
        boolean check = false;
        int size;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM resident WHERE Username = '"+username+"' ";
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            size = crset.size();
            if(size>0)
                check = true;
            else
               check = false;
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
        }
        return check;
    }
    
    public void updateResInfo(String Sex,String HouseNum,String EmailAdd,String Password, String Username,int a)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "Update resident set EmailAdd = '"+EmailAdd+"', Password = '"+Password+"', Username = '"+Username+"', HouseNum = "+HouseNum+", Sex = '"+Sex+"' where ResId=" + a + "";

            stmt.executeUpdate(query);

            stmt.close();
            con.close();
        } 
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
        }
    }
    
    public void addSubAccount(String LastName, String FirstName, int FamId, String Sex, String Address, int LotId, String HouseNum, String EmailAdd, String StatInFam, String UserType, String Password, String Username, String Status)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "INSERT into resident (EmailAdd, StatInFam, FamId, Password, Username, UserType, FirstName, LastName, HouseNum, Address, LotId, Sex, Status) values('"+EmailAdd+"','"+StatInFam+"', "+FamId+", '"+Password+"' ,'"+Username+"', '"+UserType+"', '"+FirstName+"', '"+LastName+"', "+HouseNum+", '"+Address+"', "+LotId+", '"+Sex+"', '"+Status+"')";
             
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
        }
    }
    
    public CachedRowSet getFamilyAccounts(int FamId)
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();


            String query = "SELECT * FROM resident where FamId="+FamId+" ";
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
    
    public CachedRowSet getAllLot()
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();


            String query = "SELECT * FROM lots";
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
    
    public CachedRowSet getResidentAccounts()
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
             
            String query = "SELECT * FROM resident";
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
    
    public void addHeadAccount(String LastName, String FirstName, String Sex, String lotID, String HouseNum, String Address,String EmailAdd, String StatInFam, String UserType, String Password, String Username, String Status)
    {
        int lotid = Integer.parseInt(lotID);
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "INSERT into resident (EmailAdd, StatInFam, Password, Username, UserType, FirstName, LastName, HouseNum,Address, LotID, Sex, Status) values('"+EmailAdd+"', '"+StatInFam+"', '"+Password+"', '"+Username+"', '"+UserType+"', '"+FirstName+"', '"+LastName+"', '"+HouseNum+"', '"+Address+"', '"+lotid+"', '"+Sex+"', '"+Status+"')";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
        }
    }
        
    public void updateLot(String resID, String lotID)
    {
        int rId = Integer.parseInt(resID);
        int lId = Integer.parseInt(lotID);
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "UPDATE lots set rid = '"+rId+"', status='Occupied' WHERE lid = '"+lId+"'";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
        }
    }
    
    public void updateAccountStatus(String newStatus, int ResId)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "Update resident set Status= '" + newStatus + "' where ResId=" + ResId + "";

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
    
    public void updateType(int ResId, String type)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "Update resident set UserType= '"+type+"' where ResId='" + ResId + "'";

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
    
    public int getResId()
    {    
        int id=0;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM resident";
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next())
                id= rs.getInt("ResId");
            rs.close();
            stmt.close();
            con.close();

            return id;
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return -1;
        }
    }
    
    public void addToHeadTable(int ResId)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "INSERT into residenthead (ResId) values ("+ResId+")";

            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
        }
    }
    
    public CachedRowSet getFamId(int RezId)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT FamId FROM residenthead WHERE ResId= "+ RezId +" ";
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
    
    public void addFamId(int FamId, int ResId)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "Update resident set FamId= " + FamId + " where ResId=" + ResId + "";

            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
        }
    }
    
    public void servingDirector(int dirID)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "Update director set status='Serving' where dirId = "+dirID+" ";
            stmt.executeUpdate(query);

            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
        }
    }
    
    public CachedRowSet getAllWaitDirector()
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM director WHERE status= 'Waiting'";
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