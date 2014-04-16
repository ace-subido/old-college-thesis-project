package thesis;

import java.sql.*;
import sun.jdbc.rowset.*;
import java.lang.*;
import java.util.*;

public class FacId
{
    Connection con, con2;
    String url, uname, pword, strconnection;

    public FacId()
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
    
    public int getTotalFac()
    {
        try
        {
            int i=0;
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM Facility";
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();

            crset.last();
            i=crset.getInt("FacilityId")+1;
            return i;
        } 
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
            return 0;
        }
    }
     
    public int getTotalType()
    {
        try
        {
            int i=0;
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM FacilityType";
            ResultSet rs = stmt.executeQuery(query);
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            i = crset.size();
            return i;
        }
        catch (Exception e)
        {    
            System.out.println("nag error pow" + e.getMessage());
            return 0;
        }
    }
     
    public void delDirector(int dirID)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "Update director set status='not' where dirId = "+dirID+" ";
            stmt.executeUpdate(query);

            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
        }
    }
     
    public void addBulletinAdmin(String bname, String bcontent, String post, int i, java.util.Date bulletinDate)
    {
        java.sql.Timestamp ts = new java.sql.Timestamp(bulletinDate.getTime());
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "INSERT into bulletinboard (bulletinId, bulletinContent, poster, status, bulletinTitle, bulletinDate) values("+i+", '"+bcontent+"', '"+post+"', 'Latest', '"+bname+"', '"+ts+"')";

            stmt.executeUpdate(query);

            stmt.close();
            con.close();
        }
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
        }
    }
     
    public CachedRowSet getBulletinFromAdminLatest()
    {
        try
        {     
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM bulletinboard where status = 'Latest'";
            ResultSet rs = stmt.executeQuery(query);
	
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            if(crset.size() > 0)
            {
                return crset;
            }
            else
            {
                return null;
            }
        } 
        catch (Exception e)
        {  		
            System.out.println("nag error pow" + e.getMessage());
            return null;
        }
    }
     
    public void ServicesTemplate(String permit, String reservation, String vote, String bulletin, String billing, String newsletter, String socialgroups)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "INSERT into servicestemplate (permit, reservation, vote, bulletinBoard, billing, newsletter, socialgroups) values('"+permit+"', '"+reservation+"', '"+vote+"', '"+bulletin+"', '"+billing+"', '"+newsletter+"', '"+socialgroups+"')";

            stmt.executeUpdate(query);

            stmt.close();
            con.close();
        }
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
        }
    }	
       
    public void updateServicesTemplate(String permit, String reservation, String vote, String bulletin, String billing, String newsletter, String socialgroups)
    {
        int o=1;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "Update servicestemplate set permit = '" +permit+ "' , reservation = '"+reservation+ "', vote='"+vote+"', bulletinBoard='"+bulletin+"', billing='"+billing+"', newsletter='"+newsletter+"', socialgroups='"+socialgroups+"' where Sid ="+o+"";
            System.out.println ("QUERY" + query);
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        { 
            System.out.println(e.getMessage());
        }
    }
    
    public void BillTemplate(String estate, String water, String garbage, String salary, String security, String staff)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "INSERT into billingtemplate (realEstate, water, garbage, salary, addForStaff) values('"+estate+"', '"+water+"', '"+garbage+"', '"+salary+"', '"+security+"', '"+staff+"')";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        } catch (Exception e)
        {    
            System.out.println(e.getMessage());
        }
    }	

    public CachedRowSet getBilling()
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM billingtemplate";
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
     
    public void updateBillTemplate(String real, String water, String garbage, String salary, String security, String staff)
    {
        int o=1;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "Update billingtemplate set realEstate = '" +real+ "' , water = '"+water+ "', garbage='"+garbage+"', salary='"+salary+"', security='"+security+"', addForStaff='"+staff+"' where Bid ="+o+"";
            System.out.println ("QUERY" + query);
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