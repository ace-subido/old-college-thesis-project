/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package thesis;

import java.sql.*;
import sun.jdbc.rowset.*;
import java.lang.*;
import java.util.*;

/**
 *
 * @author Jose Dalino
 */
public class Jem {
    
     Connection con, con2, conti, con23, conu, contis, conoha, casuy;
     String url, uname, pword, strconnection;
     
     public Jem ()
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

     public String getVillageType()
    {
         String type = "";
        try
        {
            CachedRowSet crset = new CachedRowSet();
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM villageinfo";
            ResultSet rs = stmt.executeQuery(query);

            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            while(crset.next())
            {
                type = crset.getString("DivisionUnit");
            }
            return type;
        } 
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return null;
        }
    }
     public void saveNumOfBloFlo(int pb, int bf)
    {    
        try
        {
            conti = DriverManager.getConnection (strconnection);
            Statement stmt = conti.createStatement();
            int i=1;
            String query = "INSERT into blocks(phasebd, blockflr) values("+pb+", "+bf+")";
            stmt.executeUpdate(query);
            stmt.close();
            conti.close();
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
        }
    }
     
     public CachedRowSet getPB()
    {
        
        try
        {
            CachedRowSet crset = new CachedRowSet();
            con2 = DriverManager.getConnection (strconnection);
            Statement stmt = con2.createStatement();

            String query = "SELECT * FROM blocks";
            ResultSet rs = stmt.executeQuery(query);

            crset.populate(rs);
            rs.close();
            stmt.close();
            con2.close();
            
            return crset;
        } 
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return null;
        }
    }
     public CachedRowSet getPB2(int phasebl)
    {
        
        try
        {
            CachedRowSet crset = new CachedRowSet();
            con23 = DriverManager.getConnection (strconnection);
            Statement stmt = con23.createStatement();

            String query = "SELECT * FROM blocks where phasebd = "+phasebl+"";
            ResultSet rs = stmt.executeQuery(query);

            crset.populate(rs);
            rs.close();
            stmt.close();
            con23.close();
            
            return crset;
        } 
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return null;
        }
    }
     
     public void saveNumOfLoUn(int theblock, int lots, int phbl, String address, int lid)
    {    
        try
        {
            conti = DriverManager.getConnection (strconnection);
            Statement stmt = conti.createStatement();
            int i=1;
            String query = "INSERT into lots(phblid, blflid, lotNum, address, lid) values("+phbl+", "+theblock+", "+lots+", '"+address+"', "+lid+")";
            stmt.executeUpdate(query);
            stmt.close();
            conti.close();
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
        }
    }
     public void addPhBl(int phbl)
    {    
        try
        {
            conti = DriverManager.getConnection (strconnection);
            Statement stmt = conti.createStatement();
            int i=1;
            String query = "Update VillageInfo set Division = "+phbl+" where ID = '0'";
            stmt.executeUpdate(query);
            stmt.close();
            conti.close();
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
        }
    }
     
     public int getLotsTotalPhBl()
    {
        int temp =1;
        try
        {
            CachedRowSet crset = new CachedRowSet();
            con23 = DriverManager.getConnection (strconnection);
            Statement stmt = con23.createStatement();

            String query = "SELECT * FROM lots";
            ResultSet rs = stmt.executeQuery(query);

            crset.populate(rs);
            rs.close();
            stmt.close();
            con23.close();
            if(crset.size()>0)
            {
                while(crset.next())
                {
                    temp=crset.getInt("phblid");
                }
            }
            
            return temp;
        } 
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
      public int getTotalLots()
    {
        int temp =0;
        try
        {
            CachedRowSet crset = new CachedRowSet();
            con23 = DriverManager.getConnection (strconnection);
            Statement stmt = con23.createStatement();

            String query = "SELECT * FROM lots";
            ResultSet rs = stmt.executeQuery(query);

            crset.populate(rs);
            rs.close();
            stmt.close();
            con23.close();
            if(crset.size()>0)
            {
                while(crset.next())
                {
                    temp++;
                }
            }
            
            return temp;
        } 
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
      public int getNumOfLotsForBlock(int block, int phase)
    {
        int temp =0;
        try
        {
            CachedRowSet crset = new CachedRowSet();
            conu = DriverManager.getConnection (strconnection);
            Statement stmt = conu.createStatement();

            String query = "SELECT * FROM lots where blflid ="+block+" and phblid ="+phase+"";
            ResultSet rs = stmt.executeQuery(query);

            crset.populate(rs);
            rs.close();
            stmt.close();
            conu.close();
            if(crset.size()>0)
            {
                while(crset.next())
                {
                    temp++;
                }
            }
            
            return temp;
        } 
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return 0;
        }
    }
    public int getLotArea(int lot, int block, int phase)
    {
        int temp =0;
        try
        {
            CachedRowSet crset = new CachedRowSet();
            conu = DriverManager.getConnection (strconnection);
            Statement stmt = conu.createStatement();

            String query = "SELECT * FROM lots where blflid ="+block+" and phblid ="+phase+" and lotNum="+lot+"";
            ResultSet rs = stmt.executeQuery(query);

            crset.populate(rs);
            rs.close();
            stmt.close();
            conu.close();
            if(crset.size()>0)
            {
                while(crset.next())
                {
                    temp=crset.getInt("lotarea");
                }
            }
            
            return temp;
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return 0;
        }
    }
    public void SaveLotareas(int area, int lots, int block, int phase)
    {    
        try
        {
            conti = DriverManager.getConnection (strconnection);
            Statement stmt = conti.createStatement();
            int i=1;
            String query = "UPDATE lots set lotarea = "+area+" where lotNum="+lots+" and blflid="+block+" and phblid="+phase+"";
            stmt.executeUpdate(query);
            stmt.close();
            conti.close();
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
        }
    }
    
    public int getLotId(int lot, int block, int phase)
    {
        int temp =0;
        try
        {
            CachedRowSet crset = new CachedRowSet();
            conu = DriverManager.getConnection (strconnection);
            Statement stmt = conu.createStatement();

            String query = "SELECT * FROM lots where blflid ="+block+" and phblid ="+phase+" and lotNum="+lot+"";
            ResultSet rs = stmt.executeQuery(query);

            crset.populate(rs);
            rs.close();
            stmt.close();
            conu.close();
            if(crset.size()>0)
            {
                while(crset.next())
                {
                    temp=crset.getInt("lid");
                }
            }
            
            return temp;
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return 0;
        }
    }
    public int getPB3(int phasebl)
    {
        int totalbl=0;
        int temp=0;
        try
        {
            CachedRowSet crset = new CachedRowSet();
            con23 = DriverManager.getConnection (strconnection);
            Statement stmt = con23.createStatement();

            String query = "SELECT * FROM lots where phblid = "+phasebl+"";
            ResultSet rs = stmt.executeQuery(query);

            crset.populate(rs);
            rs.close();
            stmt.close();
            con23.close();
            
             while(crset.next())
              {
                   if(crset.getInt("blflid")==temp)
                   {
                       
                   }
                   else
                   {
                       totalbl++;
                       temp = crset.getInt("blflid");
                   }
              }
             
             
             
            
            
            return temp;
        } 
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return 0;
        }
    }
    public CachedRowSet getResidentTable()
    {
        try
        {
            CachedRowSet crset = new CachedRowSet();
            con23 = DriverManager.getConnection (strconnection);
            Statement stmt = con23.createStatement();

            String query = "SELECT * FROM resident";
            ResultSet rs = stmt.executeQuery(query);
            crset.populate(rs);
            rs.close();
            stmt.close();
            con23.close();
            return crset;
        } 
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return null;
        }
    }
public CachedRowSet getLotDetails(int lot, int block, int phase)
    {
       
        try
        {
            CachedRowSet crset = new CachedRowSet();
            conu = DriverManager.getConnection (strconnection);
            Statement stmt = conu.createStatement();

            String query = "SELECT * FROM lots where blflid ="+block+" and phblid ="+phase+" and lotNum="+lot+"";
            ResultSet rs = stmt.executeQuery(query);

            crset.populate(rs);
            rs.close();
            stmt.close();
            conu.close();
            
            
            return crset;
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return null;
        }
    }
   public void updateResidentTablelots(int rid)
    {    
       int o = 0; 
       try
        {
            conti = DriverManager.getConnection (strconnection);
            Statement stmt = conti.createStatement();
            int i=1;
            String query = "Update resident set Address = ' ', LotID ="+o+" where ResId = "+rid+"";
            stmt.executeUpdate(query);
            stmt.close();
            conti.close();
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
        }
    } 
   
   
   public void removeFromResidentHead(int rid)
    {
       
        try
        {
            CachedRowSet crset = new CachedRowSet();
            conu = DriverManager.getConnection (strconnection);
            Statement stmt = conu.createStatement();

            String query = "Delete from residenthead where ResId="+rid+"";
            stmt.executeUpdate(query);

           
            stmt.close();
            conu.close();
            
            
            
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
           
        }
    }
   
   public void clearLotsTable(int rid)
    {    
        try
        {
            contis = DriverManager.getConnection (strconnection);
            Statement stmt = contis.createStatement();
            int i=1;
            String query = "UPDATE lots set status='unoccupied', rid = '0' where rid = "+rid+"";
            stmt.executeUpdate(query);
            stmt.close();
            contis.close();
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
        }
    }
   public void updateLot(int rid, int lid)
    {    
        try
        {
            contis = DriverManager.getConnection (strconnection);
            Statement stmt = contis.createStatement();
            int i=1;
            String query = "UPDATE lots set status='Occupied', rid = "+rid+" where lid = "+lid+"";
            stmt.executeUpdate(query);
            stmt.close();
            contis.close();
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
        }
    }
   
   public void updateResidents(int rid, String address, int lotID)
    {    
        try
        {
            contis = DriverManager.getConnection (strconnection);
            Statement stmt = contis.createStatement();
            int i=1;
            String query = "UPDATE resident set address='"+address+"', lotID = "+lotID+" where ResId = "+rid+"";
            stmt.executeUpdate(query);
            stmt.close();
            contis.close();
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
        }
    }
    public Vector<ResidentObject> getAllResidentsSuggest(){
          
         Vector<ResidentObject> v = new Vector<ResidentObject>();
         try
         {
             con = DriverManager.getConnection (strconnection);
             Statement stmt = con.createStatement();

             String query = "SELECT * FROM resident where UserType = 'Resident' OR UserType= 'Director'";
             ResultSet rs = stmt.executeQuery(query);

             CachedRowSet crset = new CachedRowSet();
             crset.populate(rs);
             rs.close();
             stmt.close();
             con.close();      
             
             
             while(crset.next()){
                 ResidentObject temp = new ResidentObject();
                 temp.fname = crset.getString("FirstName");
                 temp.lastname = crset.getString("LastName");
                 temp.residentid = crset.getInt("ResId");  
                 temp.address = crset.getString("Address");
                 temp.telenumber = crset.getString("HouseNum");
                 temp.username=crset.getString("Username");
                 temp.lotid=crset.getInt("LotID");
                 v.add(temp);
             }
             
             return v;
         }
        catch (Exception e)
           {    
           System.out.println(e.getMessage());
                return null;
           }
     
     }
    public int getTotalType() {
        try {
            int i = 0;
            conoha = DriverManager.getConnection(strconnection);
            Statement stmt = conoha.createStatement();
            String query = "SELECT * FROM FacilityType";
            ResultSet rs = stmt.executeQuery(query);
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            conoha.close();
            i = crset.size();
            return i;
        } catch (Exception e) {
            System.out.println("nag error pow" + e.getMessage());
            return 0;
        }
    }
    
    public int getTotalFac()
    {
        try
        {
            int i=0;
            casuy = DriverManager.getConnection (strconnection);
            Statement stmt = casuy.createStatement();

            String query = "SELECT * FROM Facility";
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            casuy.close();

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
    
}
