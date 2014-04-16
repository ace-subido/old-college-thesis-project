package thesis;

import java.sql.*;
import sun.jdbc.rowset.*;
import java.lang.*;
import java.util.*;

public class addFacility
{
    Connection con;
    String url, uname, pword, strconnection;
    static PreparedStatement pstmt;

    public addFacility()
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
    
    public int getTotalBulletin()
    {
        int b=0;
     	try
        {
            con = DriverManager.getConnection (strconnection);       	 
            Statement stmt = con.createStatement();
			 
            String query = "SELECT * FROM bulletinboard";
             
            ResultSet rs = stmt.executeQuery(query);
             
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();

            if(crset.size() > 0)
            {
                while(crset.next())
                {
                    b++;
                }
            }		    

            return b;
        } 
        catch (Exception e)
        {    
            System.out.println("catch: ewan " + e.getMessage());
            return b;
        }  
    }
    
    public CachedRowSet ifTypeExists2(String tempname)
    {
     	try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
			 
            String query = "SELECT * FROM ComManDiv where comDivisionName = '"+tempname+"'";
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
            System.out.println("catch: ewan " + e.getMessage());
            return null;
        }    	
    }
     
    public void addFac (String allowRes, String faciName, int capacity, String type, int landArea, String location, int resFee, int lol, String av)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            lol++;
            stmt.executeUpdate("INSERT into Facility (AllowRes, FaciName, Capacity, Type, LandArea, ReservationFee, FacilityId, Location, Availability) values ('"+allowRes+"', '"+faciName+"', "+capacity+", '"+type+"', "+landArea+", "+resFee+", "+lol+", '"+location+"', '"+av+"')");
            System.out.print("after query");
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {    
            System.out.println("nag error" + e.getMessage());
        }
    }
     
    public int ifTypeExists(String tempname)
    {
        int b=2;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM FacilityType where TypeName = '"+tempname+"'";
            ResultSet rs = stmt.executeQuery(query);
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();

            while(crset.next())
            {
                b = 1;				 
            }		    
            return b;
        } 
        catch (Exception e)
        {    
            System.out.println("catch: ewan " + e.getMessage());
            return b;
        }    	
    }
     
    public boolean addComManDiv(String divName)
    {
        boolean f = false;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "INSERT into ComManDiv (comDivisionName,available) values('"+divName+"', 'available')";

            stmt.executeUpdate(query);

            stmt.close();
            con.close();
            f = true;
        } 
        catch (Exception e)
        {
            System.out.println(e.getMessage());
            return false;
        } 
        return f;
    }
    
    public void updateComManDiv(int divID, String name)
    {
        try
        {    
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "Update commandiv set comDivisionName = '"+name+"', available = 'available' where comDivId = '"+divID+"' ";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();		
        } 
        catch (Exception e)
        {    
            System.out.println("catch: ewan " + e.getMessage());
        }
    }
     
    public void updateCom(int resID, String c)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);

            Statement stmt = con.createStatement();
            String query = "Update ComManDiv set resId = "+resID+", available = 'unavailable' where comDivisionName = '"+c+"' ";

            stmt.executeUpdate(query);
            stmt.close();
            con.close();		
        } 
        catch (Exception e)
        {    
            System.out.println("catch: ewan " + e.getMessage());
        }
    }
    
    public void updateComDel(String c)
    {
        int res = 0;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "Update ComManDiv set resId = "+res+", available = 'available' where comDivisionName = '"+c+"' ";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();		
        } 
        catch (Exception e)
        {    
            System.out.println("catch: ewan " + e.getMessage());
        }
    }

    public void upDateDir(int dirID, int month, int year)
    {
        try
        {    
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "Update director set termMonth = "+month+", termYear = "+year+" where dirId = '"+dirID+"' ";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();		
        } 
        catch (Exception e)
        {    
            System.out.println("catch: ewan " + e.getMessage());
        }
    }
     
  //jemuel ******************
    public int getMonthlyBillValuesBatch()
    {
        int b=0;
        try
        {
            con = DriverManager.getConnection (strconnection);       	 
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM monthlybillvalues";
            ResultSet rs = stmt.executeQuery(query);
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();

            if(crset.size() > 0)
            {
                while(crset.next())
                {
                    b++;
                }
            }		    

            return b;
        } 
        catch (Exception e)
        {    
            System.out.println("catch: ewan " + e.getMessage());
            return b;
        } 
    }
       //jemuel ******************
    public int getMonthlyBillValuesBatchExtra()
    {
        int b=0;

        try
        {
            con = DriverManager.getConnection (strconnection);       	 

            Statement stmt = con.createStatement();

            String query = "SELECT * FROM monthlybillextraexpenses";

            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();

            if(crset.size() > 0)
            {
                while(crset.next())
                {
                    b++;
                }
            }		    
            return b;
        } 
        catch (Exception e)
        {    
            System.out.println("catch: ewan " + e.getMessage());
            return b;
        } 
    }
      
      /**** Jemuel*/
    public int getTotalComment()
    {
        int b=0;
        try
        {
            con = DriverManager.getConnection (strconnection);       	 
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM comments";

            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();

            if(crset.size() > 0)
            {
                while(crset.next())
                {
                    b++;
                }
            }		    
            return b;
        } 
        catch (Exception e)
        {    
            System.out.println("catch: ewan " + e.getMessage());
            return b;
        }    	
    }
      /**** Jemuel*/
    public int getLastCommentId()
    {
        int b=0;
        try
        {
            con = DriverManager.getConnection (strconnection);       	 
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM comments";
            ResultSet rs = stmt.executeQuery(query);
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            if(crset.size() > 0)
            {
                while(crset.next())
                {
                    b=crset.getInt("commentid");
                }
            }		    
            return b;
        } 
        catch (Exception e)
        {    
            System.out.println("catch: ewan " + e.getMessage());
            return b;
        }    	
    }
      /**** Jemuel*/
    public int getLastBulletinId()
    {
        int b=0;
        try
        {
            con = DriverManager.getConnection (strconnection);       	 
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM bulletinboard";
            ResultSet rs = stmt.executeQuery(query);
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();

            if(crset.size() > 0)
            {
                while(crset.next())
                {
                    b=crset.getInt("bulletinId");
                }
            }		    
            return b;
        } 
        catch (Exception e)
        {    
            System.out.println("catch: ewan " + e.getMessage());
            return b;
        }    	
    }
    
    public CachedRowSet getAllFacility()
    {         
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM facility";
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