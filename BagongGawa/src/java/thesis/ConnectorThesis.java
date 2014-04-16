package thesis;

import java.sql.*;
import sun.jdbc.rowset.*;
import java.lang.*;
import java.util.*;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.text.ParseException;
public class ConnectorThesis
{
    Connection con, con2, con5, con6, cont, conti, col, conw, costo, colver, cc;
    String url, uname, pword, strconnection;

    public ConnectorThesis()
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
    
    public int getY()
    {
        return 1;	
    }

    public Vector<String> getFacilityType()
    {
        String b = "unavailable";
        Vector<String> v = new Vector<String>();

        try
        {
            con = DriverManager.getConnection(strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM FacilityType";

            ResultSet rs = stmt.executeQuery(query);		     

            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();

            while(crset.next())
            {
                if(crset.getString("Availability").equals(b))
                {
                    System.out.println("*");
                }
                else
                {
                    v.add(crset.getString("TypeName"));
                }
            }
            return v;
        } 
        catch (Exception e)
        {
            System.out.println("catch: ewan " + e.getMessage());
            return null;
        }
    }
    
    public Vector<String> getComManDiv()
    {
        Vector<String> v = new Vector<String>();
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM ComManDiv";
            ResultSet rs = stmt.executeQuery(query);		     
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            if(crset.size()>0)
            {
                while(crset.next())
                {
                    v.add(crset.getString("ComDivisionName"));
                }
            }
            return v;
        } 
        catch (Exception e)
        {    
            System.out.println("catch: ewan " + e.getMessage());
            return null;
        }
    }
public CachedRowSet getFacilityType2()
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM FacilityType";
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

    public void editType(int is, String type, String o)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);

            Statement stmt = con.createStatement();
            String query = "Update FacilityType set TypeName ='"+type+"', Availability ='"+o+"' where TypeId = "+is+"";

            stmt.executeUpdate(query);
            stmt.close();
            con.close();		
        } 
        catch (Exception e)
        {    
            System.out.println("catch: ewan " + e.getMessage());
        }
    }
    
    public Vector<String> getFacilityColName()
    {
        Vector<String> v = new Vector<String>();
        try
        {
            con = DriverManager.getConnection (strconnection);

            Statement stmt = con.createStatement();

            String query = "SELECT * FROM Facility";

            ResultSet rs = stmt.executeQuery(query);
            ResultSetMetaData md = rs.getMetaData();
            int col = md.getColumnCount();
            System.out.println(col);

            for (int k = 1; k<= col; k++)
            {
                v.add(md.getColumnName(k)); 
            }
            rs.close();
            stmt.close();
            con.close();
            return v;
        } 
        catch (Exception e)
        {    
            System.out.println("catch: ewan " + e.getMessage());
            return null;
        }
    }
     
    public void addFieldFac(String n, String d)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "ALTER TABLE Facility ADD "+n+" "+d;
            stmt.executeUpdate(query);
            System.out.println("nag alter table");
            stmt.close();
            con.close();
        } 
        catch (Exception e)
        {    
            System.out.println("hindi nag alter " + e.getMessage());
        }
    }
    
    public int getFacId(String a)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            int b=0;
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM FacilityType where TypeName = '"+a+"'";
            ResultSet rs = stmt.executeQuery(query);
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            while(crset.next())
            {
                b = crset.getInt("TypeId");
                System.out.println("nasa getfacID");
            }		    
            return b;
        } 
        catch (Exception e)
        {    
            System.out.println("catch: ewan " + e.getMessage());
            return 0;
        }
    }
     
    public int ifFacTypeExists(String tempname)
    {
        int b = 2;
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
    
    public void updateRes(int resID)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "Update Resident set UserType ='Director' where ResId = "+resID+"";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        } 
        catch (Exception e)
        {    
            System.out.println("catch: ewan " + e.getMessage());
        }
    }
    
    public CachedRowSet getReservations1()
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM ReservationTable";
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
    
    public void addRes()
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            //  java.util.Date utilDate = new java.util.Date();

            /* formatter = new SimpleDateFormat("yyyy/MM/dd");
            String date = "2003/01/10";
            java.util.Date utilDate = null;
            try {
            utilDate = formatter.parse(date);
            } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            }
            //  System.out.println(utilDate.toString());*/
            java.util.Date utilDate = new java.util.Date();
            java.sql.Timestamp sqldatetime = new java.sql.Timestamp(utilDate.getTime());
            System.out.println(sqldatetime.toString());

            int a = 4;
            String query = "INSERT into reservationtable (FrResDate, ToResDate, ResidentID, FacilityID) values('"+sqldatetime+"', '"+sqldatetime+"', "+a+", "+a+")";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        } catch (Exception e)
        {    
            System.out.println(e.getMessage());
        } 
    }    
   
    public int getComManDiv2()
    {
        int j= 0;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM ComManDiv where available = 'available'";
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            if(crset.size() > 0)
            j=1;
            return j;
        }
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
            return j;
        }
    }   
     
    public Vector<String> getComManDivVUnavail()
    {
        Vector<String> v = new Vector<String>();
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM ComManDiv where available = 'available'";
            ResultSet rs = stmt.executeQuery(query);		     
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            if(crset.size()>0)
            {
                while(crset.next())
                {
                    v.add(crset.getString("ComDivisionName"));
                }
            }
            return v;
        } 
        catch (Exception e)
        {
            System.out.println("catch: ewan " + e.getMessage());
            return null;
        }
    }
     
    public void updateRes2(int resID)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "Update Resident set UserType ='Resident' where ResId = "+resID+"";

            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        } 
        catch (Exception e)
        {    
            System.out.println("catch: ewan " + e.getMessage());
        }
    }
      
    public CachedRowSet getComManDivCachedUnAvail()
    {
        int j= 0;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM ComManDiv where available = 'unavailable'";
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
      
      //gawa ace
    public CachedRowSet getFacilitySettings(int a)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM facility where FacilityId = "+a;
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
      //gawa ni ace
    public void updateFacilitySetting(int c, int amthours, int amtdays, java.util.Date a, java.util.Date b)
    {
        try
        {
            java.sql.Timestamp ts1 = new java.sql.Timestamp(b.getTime());
            java.sql.Timestamp ts2 = new java.sql.Timestamp(a.getTime());

            con = DriverManager.getConnection (strconnection);

            Statement stmt = con.createStatement();
            String query = "Update Facility set OpTime='"+ts1+"', ClTime='"+ts2+"', advDaysRes="+amtdays+", hoursperDay="+amthours+" where FacilityId = "+c+"";

            stmt.executeUpdate(query);
            stmt.close();
            con.close();	
        } 
        catch (Exception e)
        {    
            System.out.println("catch: ewan " + e.getMessage());
        }
    }

   //jem  
    public CachedRowSet getBulletinCat()
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM bulletincategory";
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
      //jem
      public void addBulletinCat(String category)
     {    
         try
         {
             con5 = DriverManager.getConnection (strconnection);
             Statement stmt = con5.createStatement();
           
             
             String query = "INSERT into bulletincategory (catName) values('"+category+"')";
             stmt.executeUpdate(query);
	
	     
		stmt.close();
		con5.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                
           }
     }
     //jem 
    public int checkBulletinCat(String cat)
    {    
        int lol=0; 
        try
        {
            con6 = DriverManager.getConnection (strconnection);
            Statement stmt = con6.createStatement();
            String query = "SELECT * FROM bulletincategory where catName= '"+cat+"'";
            ResultSet rs = stmt.executeQuery(query);
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con6.close();
            if(crset.size()>0)
            {
                lol=1;
            }
            return lol;
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return 1;
        }
    } 
    //jem
    public void delBulletinCat(String category)
    {    
        try
        {
            con5 = DriverManager.getConnection (strconnection);
            Statement stmt = con5.createStatement();
            String query = "DELETE from bulletincategory where catName='"+category+"'";
            stmt.executeUpdate(query);
            stmt.close();
            con5.close();
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
        }
    }
    public int checkBulletinStatus()
     {    
        int lol=0; 
        try
         {
             cont = DriverManager.getConnection (strconnection);
             Statement stmt = cont.createStatement();
           
             
             String query = "SELECT * FROM bulletinapproved";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		cont.close();
             if(crset.size()>0)
             {
                 lol=1;
             }
             return lol;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return 1;
           }
     } 
    
    public String getBulletinStatus()
     {    
        String temp="a"; 
        try
         {
             cont = DriverManager.getConnection (strconnection);
             Statement stmt = cont.createStatement();
           
             
             String query = "SELECT * FROM bulletinapproved";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		cont.close();
             while(crset.next())
             {
                 temp = crset.getString("status");
             }
             return temp;
         } catch (Exception e)
           {            		
           	System.out.println("getBulletinStatus "+e.getMessage());
                return null;
           }
     }
    
    
    public void addBulletinStatus(String category)
     {    
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             int i=1;
           
             
             String query = "INSERT into bulletinapproved(status) values('"+category+"')";
             stmt.executeUpdate(query);
	
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                
           }
     }
    
    
    public void updateBulletinStatus(String category)
     {    
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
             int rof = 1;
             
             String query = "UPDATE bulletinapproved set status='"+category+"' where appid = 1";
             stmt.executeUpdate(query);
             System.out.println(category);
	
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
     }
    public int checkBulletinTitle(String bName)
     {    
        int lol=0; 
        try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM bulletinboard where bulletinTitle= '"+bName+"'";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
             if(crset.size()>0)
             {
                 lol=1;
             }
             return lol;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return 1;
           }
     } 
    public void addBulletinPost(String category, String bName, String bContent, int i, String user, java.util.Date bulletinDate)
     {    
        java.sql.Timestamp ts = new java.sql.Timestamp(bulletinDate.getTime());
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
           
             
             String query = "INSERT into bulletinboard(bulletinId, bulletinContent, poster, status, bulletinTitle, bulletinDate, category, locked) values("+i+", '"+bContent+"', '"+user+"', 'Latest', '"+bName+"', '"+ts+"', '"+category+"', 'No')";
             stmt.executeUpdate(query);
	
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                
           }
     }
    public CachedRowSet getBulletinPosts(String cat)
     {    
         try
         {
             con = DriverManager.getConnection (strconnection);
             Statement stmt = con.createStatement();
           
             
             String query = "SELECT * FROM bulletinboard where category = '"+cat+"'";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con.close();

             return crset;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
     }
    public int checkBulletinBoardCat(String cat)
     {    
        int lol=0; 
        try
         {
             col = DriverManager.getConnection (strconnection);
             Statement stmt = col.createStatement();
           
             
             String query = "SELECT * FROM bulletinboard where category= '"+cat+"'";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		col.close();
                if(crset.size()>0)
                {
             lol=crset.size();
                }
                
             
             return lol;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return lol;
           }
     } 
    public CachedRowSet getBulletinMessage(String title, String cat)
     {    
         try
         {
             con = DriverManager.getConnection (strconnection);
             Statement stmt = con.createStatement();
           
             
             String query = "SELECT * FROM bulletinboard where category = '"+cat+"' AND bulletinTitle = '"+title+"'";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con.close();

             return crset;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
     }
    public void addCommentPost(String bulletinId, String poster, String comment, java.util.Date bulletinDate, int i)
     {    
        java.sql.Timestamp ts = new java.sql.Timestamp(bulletinDate.getTime());
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
           
             
             String query = "INSERT into comments(parentBulletId, poster, commentContent, commentDate, commentid) values('"+bulletinId+"', '"+poster+"', '"+comment+"', '"+ts+"', "+i+")";
             stmt.executeUpdate(query);
	
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                
           }
     }
    public CachedRowSet getBulletinComments(int bulId)
     {    
         try
         {
             conw = DriverManager.getConnection (strconnection);
             Statement stmt = conw.createStatement();
           
             
             String query = "SELECT * FROM comments where parentBulletId = "+bulId+"";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		conw.close();

             return crset;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
     }
    public void editResidentPost(int bulId, String post, String bName)
     {
     
     	try
        {
        	
        	 con = DriverManager.getConnection (strconnection);

             Statement stmt = con.createStatement();
             String query = "Update bulletinboard set bulletinContent ='"+post+"', bulletinTitle ='"+bName+"' where bulletinId = "+bulId+"";
             
             stmt.executeUpdate(query);
             stmt.close();
             con.close();		
			
         } 
         catch (Exception e)
           {    
             System.out.println("catch: ewan " + e.getMessage());
 
           }
     }
    public CachedRowSet getBulletinPostBasedOnParent(int bulId)
     {    
         try
         {
             costo = DriverManager.getConnection (strconnection);
             Statement stmt = costo.createStatement();
           
             
             String query = "SELECT * FROM bulletinboard where bulletinId = "+bulId+"";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		costo.close();

             return crset;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
     }
    public void editResidentComment(int bulId, String post)
     {
     
     	try
        {
        	
        	 con = DriverManager.getConnection (strconnection);

             Statement stmt = con.createStatement();
             String query = "Update comments set commentContent ='"+post+"' where commentid = "+bulId+"";
             
             stmt.executeUpdate(query);
             stmt.close();
             con.close();		
			
         } 
         catch (Exception e)
           {    
             System.out.println("catch: ewan " + e.getMessage());
 
           }
     }
     //jem
    public void delResidentComment(int category)
     {    
         try
         {
             con5 = DriverManager.getConnection (strconnection);
             Statement stmt = con5.createStatement();
           
             
             String query = "DELETE from comments where commentid="+category+"";
             stmt.executeUpdate(query);
	
	     
		stmt.close();
		con5.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                
           }
     }
    //jem
    public void delResidentPost(int category)
     {    
         try
         {
             con5 = DriverManager.getConnection (strconnection);
             Statement stmt = con5.createStatement();
           
             
             String query = "DELETE from bulletinboard where bulletinId="+category+"";
             stmt.executeUpdate(query);
	
	     
		stmt.close();
		con5.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                
           }
     }
    public void delResidentAllComments(int category)
     {    
         try
         {
             colver = DriverManager.getConnection (strconnection);
             Statement stmt = colver.createStatement();
           
             
             String query = "DELETE from comments where parentBulletId="+category+"";
             stmt.executeUpdate(query);
	
	     
		stmt.close();
		colver.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                
           }
     }
    public void lockThread(int bulId)
     {
     
     	try
        {
        	
        	 con = DriverManager.getConnection (strconnection);

             Statement stmt = con.createStatement();
             String query = "Update bulletinboard set locked ='Yes' where bulletinId="+bulId+"";
             
             stmt.executeUpdate(query);
             stmt.close();
             con.close();		
			
         } 
         catch (Exception e)
           {    
             System.out.println("catch: ewan " + e.getMessage());
 
           }
     }
    public CachedRowSet getModerator(String cat)
     {    
         try
         {
             costo = DriverManager.getConnection (strconnection);
             Statement stmt = costo.createStatement();
           
             
             String query = "SELECT * FROM moderators where category = '"+cat+"'";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		costo.close();

             return crset;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
     }
    
    public int getModerator2(String cat, String username)
     {    
        int b=0; 
        try
         {
             costo = DriverManager.getConnection (strconnection);
             Statement stmt = costo.createStatement();
           
             
             String query = "SELECT * FROM moderators where category = '"+cat+"' AND username = '"+username+"'";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		costo.close();
                if(crset.size()>0)
                {
                    b=1;
                }

             return b;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return b;
           }
     }
    public void addModerator(String category, String text1)
    {    
        try
        {
            conti = DriverManager.getConnection (strconnection);
            Statement stmt = conti.createStatement();
            int i=1;
            String query = "INSERT into moderators(category, username) values('"+category+"', '"+text1+"')";
            stmt.executeUpdate(query);
            stmt.close();
            conti.close();
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
        }
    }
    
    public void delModerator(String category, String username)
    {    
        try
        {
            colver = DriverManager.getConnection (strconnection);
            Statement stmt = colver.createStatement();
            String query = "DELETE from moderators where category='"+category+"' and username='"+username+"'";
            stmt.executeUpdate(query);
            stmt.close();
            colver.close();
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
        }
    }
    
    public boolean checkIfMod(String username, String category)
    {    
        boolean test = false; 
        try
        {
            cc = DriverManager.getConnection (strconnection);
            Statement stmt = cc.createStatement();
            String query = "SELECT * FROM moderators where category='"+category+"' AND username='"+username+"'";
            ResultSet rs = stmt.executeQuery(query);
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            cc.close();
            if(crset.size()>0)
            {
                test=true;
            }
            return test;
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return test;
        }
    } 
    
    public boolean dirDoesntExist(int resId, String charge)
    {    
        boolean test = true; 
        try
        {
            cc = DriverManager.getConnection (strconnection);
            Statement stmt = cc.createStatement();
            String query = "SELECT * FROM director where resId="+resId+" AND chargeOf='"+charge+"'";
            ResultSet rs = stmt.executeQuery(query);
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            cc.close();
            if(crset.size()>0)
            {
                test=false;
            }
            return test;
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return test;
        }
    } 
    
    public void newPollsSettings(int id, String cat, int cat2)
    {    
        try
        {
            conti = DriverManager.getConnection (strconnection);
            Statement stmt = conti.createStatement();
            int i=1;
            String query = "INSERT into pollssettings(id, upload, days) values("+id+", '"+cat+"', "+cat2+")";
            stmt.executeUpdate(query);
            stmt.close();
            conti.close();
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
        }
    }
    
    public CachedRowSet checkPollsSettings()
    {
        try
        {
            costo = DriverManager.getConnection (strconnection);
            Statement stmt = costo.createStatement();
            String query = "SELECT * FROM pollssettings";
            ResultSet rs = stmt.executeQuery(query);
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            costo.close();
            return crset;
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    public void updatePollsSettings(int id, String cat, int cat2)
    {
        try
        {
        con = DriverManager.getConnection (strconnection);

        Statement stmt = con.createStatement();
        String query = "Update pollssettings set upload ='"+cat+"', days = "+cat2+" where id="+id+"";

        stmt.executeUpdate(query);
        stmt.close();
        con.close();		
        } 
        catch (Exception e)
        {    
            System.out.println("catch: ewan " + e.getMessage());
        }
    }
}