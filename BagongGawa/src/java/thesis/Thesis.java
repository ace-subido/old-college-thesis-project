package thesis;

import java.sql.*;
import sun.jdbc.rowset.*;
import java.lang.*;
import java.util.*;

public class Thesis
{
    Connection con, con2, cosy;
    String url, uname, pword, strconnection;

    public Thesis()
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
    
    public CachedRowSet getResidents(String asa)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM Resident where Username = '"+asa+"' ";
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
            System.out.println("tae" + e.getMessage());
            return null;
        }
    }
    
    public void setVillageInfo(String a, String b, String c, int d, String f)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "INSERT into VillageInfo (Division, DivisionUnit, NameOfAssoc, AddressAssoc, ComType) values("+d+", '"+c+"', '"+a+"', '"+b+"', '"+f+"')";

            stmt.executeUpdate(query);
            System.out.println("ayus");

            stmt.close();
            con.close();
        }
        catch (Exception ex)
        {
            System.out.println(ex.getMessage());
        }
    }
    
    public void updateVillageInfo(int id, String a, String b, String c, int d, String f)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "Update VillageInfo set NameOfAssoc='"+a+"', AddressAssoc = '"+b+"', ComType='"+f+"' where ID = "+id+"";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception ex)
        {    
            System.out.println("ayaw po papi" + ex.getMessage());
        }    	
    }
    
    public CachedRowSet getFacilities()
    {
        try
        {
            con = DriverManager.getConnection(strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM Facility";
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
            System.out.println("sdfasdf918273");
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            System.out.println("sdfasdf");
            return crset;
        } 
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    public CachedRowSet getDirectors7()
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM director where status='Serving'";
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
    
    public int getDivId(String temp)
    {
        int h = 0;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM commandiv where comDivisionName = '"+temp+"' ";
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            while(crset.next())
            {
                h = crset.getInt("comDivId");
            }
            return h;
        }
        catch(Exception e)
        {    
            System.out.println("tae" + e.getMessage());
            return 0;
        }      
    }
     
    public CachedRowSet getResInfo(int lol)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM Resident where ResId = "+lol+" ";
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
            System.out.println("tae" + e.getMessage());
            return null;
        }
    }
     
    public CachedRowSet getFacility(int asa)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM Facility where FacilityId = "+asa+" ";
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
        
    public CachedRowSet getRes(String fn, String ln)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM Resident where FirstName = '"+fn+"' and LastName = '"+ln+"'";
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

    public CachedRowSet getDirectors()
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM Resident where UserType = 'Director'";
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
    
    public int getVillageInfoDivision()
    {
        int i =0;
        try
        {
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
                i = Integer.parseInt(crset.getString("Division"));
            }
            return i;
        } 
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public void updateFacility(String allowRes, String faciName, int capacity, String type, int landArea, String location, int resFee, int id, String av)
    {     
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "update Facility set AllowRes='"+allowRes+"', FaciName = '"+faciName+"', Capacity="+capacity+", Availability = '"+av+"', Type='"+type+"', LandArea="+landArea+", Location='"+location+"', ReservationFee="+resFee+" where FacilityId = "+id+"";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        } 
        catch (Exception e)
        {    
            System.out.println("ayaw po papi" + e.getMessage());
        }
    }

public String getSelected()
{

String temp = "Selected";
return temp;

}
    public void addFacType(String type, String av, int rofl)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "INSERT into FacilityType (TypeName, Availability, TypeId) values('"+type+"', '"+av+"', "+rofl+")";
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

    public boolean checkAvailable(String type)
    {
        try
        {
            System.out.println("nasa checkavailable()");
            System.out.println(type);
            System.out.println("sira");
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "select * from Facility where Type = '"+type+"' and Availability = 'available'";

            ResultSet rs = stmt.executeQuery(query);
            System.out.println("nag execute ung query");
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);

            if(crset.size()>0)
            {
                return false;
            }
            return true;
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
            return false;	
        }
    }
     
    public int ifFacExists(String tempname)
    {
        int b=2;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM Facility where FaciName = '"+tempname+"'";
            ResultSet rs = stmt.executeQuery(query);
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();

            if(crset.size() > 0)
            {
                System.out.println("may kaparehas");
                return 1;
            }		    
            else		
                return b;
        } 
        catch (Exception e)
        {    
            System.out.println("catch: ewan " + e.getMessage());
            return b;
        }    	
    }
     
    public boolean addDirector(String charge, int month, int year, int totalDir, int resID, String first, String last)
    {
        boolean h = false;
        String n = first + ' ' + last;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "INSERT into director (chargeOf, termMonth, termYear, DirName, dirId, resId) values('"+charge+"', "+month+", "+year+",  '"+n+"', "+totalDir+", "+resID+")";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
            h= true;
            return h;
        }
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
            return h;
        }
    }	
    public CachedRowSet getComManDiv()
    {
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
     
    public String getFacilityName(int a)
    { 
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM Facility where FacilityId = "+a+"";
            ResultSet rs = stmt.executeQuery(query);
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            String temp;

            while(crset.next())
            {
                temp = crset.getString("FaciName");
                return temp;
            }
            return null;
        } 
        catch (Exception e)
        {    
            System.out.println("catch: ewan " + e.getMessage());
            return null;
        }    
    }
    
    public String getResidentName(int a)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM Resident where ResId = "+a+"";
            ResultSet rs = stmt.executeQuery(query);
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            String temp;

            while(crset.next())
            {
                temp = crset.getString("FirstName")+" "+crset.getString("LastName");
                return temp;
            }
            return null; 
        } 
        catch (Exception e)
        {    
            System.out.println("catch: ewan " + e.getMessage());
            return null;
        }    
    }
     
    public CachedRowSet getDirectors2(int resId)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM director where resId = "+resId+"";
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
     
    public Vector<String> getDirectors3()
    {
        Vector<String> v = new Vector<String>();

        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM director";
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
                    v.add(crset.getString("DirName"));
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
     
    public CachedRowSet getResidentBothName(String ln, String fn)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM Resident where LastName = '"+ln+"' and FirstName '"+fn+"' ";
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
        
    public CachedRowSet getResidentOnlyLastName(String ln)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM Resident where LastName = '"+ln+"' ";
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
    
    public CachedRowSet getResidentOnlyFirstName(String fn)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM Resident where FirstName '"+fn+"' ";
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
       
    public CachedRowSet getAllResidents()
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM Resident where UserType = 'Resident'";
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
     
    public void updateResContactDetails(int resID, int contactNum, String email)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "Update Resident set CellNum = " + contactNum + " , EmailAdd = '" +email+ "' where ResId =" + resID + "";
            System.out.println ("QUERY" + query);
            //= "INSERT into Resident (CellNum, EmailAdd) values ('" + contactNum+"', '" + email + "')";
            // "FacilityType (TypeName, Availability, TypeId) values('"+type+"', '"+av+"', "+rofl+")";

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
       //HETO ACE
    public Vector<ReservationObject> getReservations2()
    {
        Vector<ReservationObject> v = new Vector<ReservationObject>();
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM ReservationTable WHERE Status = 'ongoing'";
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();            

            //Filters reservations
            java.util.Date utilDate = new java.util.Date();
            Calendar myCalendar = Calendar.getInstance();

            myCalendar.setTime(utilDate);
            int a = myCalendar.get(Calendar.DAY_OF_MONTH);          

            while(crset.next())
            {
                ReservationObject temp = new ReservationObject();

                temp.facID = crset.getInt("FacilityID");
                temp.facName = this.getFacilityName(temp.facID);
                temp.frresdate = crset.getTimestamp("FrResDate");
                temp.toresdate = crset.getTimestamp("ToResDate");
                temp.reservationID = crset.getInt("ReservationID");
                temp.resID = crset.getInt("ResidentID");
                temp.resName = this.getResidentName(temp.resID);
                temp.makeDatetoString();
                temp.makeTimetoString();

                if((temp.frresday - a >= 0) || (temp.frresdate.compareTo(utilDate) >= 0))     
                {  
                    temp.difference = temp.frresday - a;
                    temp.printed = 0;      
                    v.add(temp); 
                }
            }

            //sorts reservations from earliest to latest
            Vector<ReservationObject> newHand = new Vector<ReservationObject>();

            while (v.size() > 0)
            {
                int pos = 0;  // Position of minimal card.
                ReservationObject c = v.elementAt(0);  // Minimal card seen so far.
                for (int i = 1; i < v.size(); i++)
                {
                    ReservationObject c1 = v.elementAt(i);
                    if ( c1.difference < c.difference )
                    {
                        pos = i;
                        c = c1;
                    }
                }
                v.removeElementAt(pos);
                newHand.addElement(c);
            }

            v = newHand;

            System.out.println(v.size());
            return v;
        }
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
            return null;
        }
    }
     //gawa ko ace 
    public Vector<ReservationObject> getReservations3(int za)
    {
        Vector<ReservationObject> v = new Vector<ReservationObject>();
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM ReservationTable WHERE ResidentID = "+za;
            ResultSet rs = stmt.executeQuery(query);
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();            
            //Filters reservations
            java.util.Date utilDate = new java.util.Date();
            Calendar myCalendar = Calendar.getInstance();
            myCalendar.setTime(utilDate);
            int a = myCalendar.get(Calendar.DAY_OF_MONTH);          
            System.out.println(query);

            while(crset.next())
            {
                ReservationObject temp = new ReservationObject();

                temp.facID = crset.getInt("FacilityID");
                temp.facName = this.getFacilityName(temp.facID);
                temp.frresdate = crset.getTimestamp("FrResDate");
                temp.toresdate = crset.getTimestamp("ToResDate");
                temp.reservationID = crset.getInt("ReservationID");
                temp.resID = crset.getInt("ResidentID");
                temp.resName = this.getResidentName(temp.resID);
                temp.makeDatetoString();
                temp.makeTimetoString();
                temp.printed = 0;    
                temp.difference = temp.frresday - a;                           
                v.add(temp); 
            }
            System.out.println(query+"asdfasdf");

            //sorts reservations from earliest to latest
            Vector<ReservationObject> newHand = new Vector<ReservationObject>();

            while (v.size() > 0)
            {
                int pos = 0;  // Position of minimal card.
                ReservationObject c = v.elementAt(0);  // Minimal card seen so far.
                for (int i = 1; i < v.size(); i++)
                {
                    ReservationObject c1 = v.elementAt(i);
                    if ( c1.difference < c.difference )
                    {
                        pos = i;
                        c = c1;
                    }
                }
                v.removeElementAt(pos);
                newHand.addElement(c);
            }
            v = newHand;
            return v;
        }
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
            return null;
        }
    }
     //gawa ko ace 
    public void cancelReservation(int a)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "Update reservationtable set Status='cancelled' WHERE ReservationID="+a+"";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception ex)
        {    
            System.out.println("ayaw po papi" + ex.getMessage());
        }    	
    }
     
     //gawa ko to - ace
    public CachedRowSet getFacilities2()
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM Facility WHERE Availability = 'available'";
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
     //gawa ko to - ace
    public int getFacilitiesResFee(int b)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT ReservationFee FROM Facility WHERE FacilityId = "+b;
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            int temp=0; 
            while(crset.next())
            {
                temp = crset.getInt("ReservationFee");
            }
            return temp;
        } 
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
            return 0;
        }
    }
     //
    public void cancelReservationResident(int a, int b)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "Update reservationtable set Status='cancelled' WHERE ResidentID="+b+" AND ReservationID="+a+"";
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
     
     //gawa ace
    public void addRes(java.util.Date from, java.util.Date to, int rID, int fID)
    {
        try
        {
            java.sql.Timestamp ts1 = new java.sql.Timestamp(from.getTime());
            java.sql.Timestamp ts2 = new java.sql.Timestamp(to.getTime());
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "INSERT into reservationtable (FrResDate, ToResDate, ResidentID, FacilityID, Status) values('"+ts1+"', '"+ts2+"', "+rID+", "+fID+", 'ongoing')";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch(Exception ex)
        {
            System.out.println("ayaw po papi" + ex.getMessage());
        }
    }
     
     //gawa ace
    public void updRes(java.util.Date from, java.util.Date to, int rID, int fID, int reserve)
    {
        try
        {
            java.sql.Timestamp ts1 = new java.sql.Timestamp(from.getTime());
            java.sql.Timestamp ts2 = new java.sql.Timestamp(to.getTime());
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "Update reservationtable set FrResDate = '"+ts1+"', ToResDate = '"+ts2+"', ResidentID = "+rID+", FacilityID ="+fID+", Status='ongoing' WHERE ReservationID = "+reserve;
            stmt.executeUpdate(query);
            stmt.close();
            con.close();         
        }
        catch(Exception ex)
        {
            System.out.println("ayaw po papi" + ex.getMessage());
        }
    }
     //gawa ace
    public Vector<ReservationObject> getAllReservations()
    {
        Vector<ReservationObject> v = new Vector<ReservationObject>();
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

            //Filters reservations
            java.util.Date utilDate = new java.util.Date();
            Calendar myCalendar = Calendar.getInstance();

            myCalendar.setTime(utilDate);
            int a = myCalendar.get(Calendar.DAY_OF_MONTH);          
            
            while(crset.next())
            {
                ReservationObject temp = new ReservationObject();
                temp.facID = crset.getInt("FacilityID");
                temp.facName = this.getFacilityName(temp.facID);
                temp.frresdate = crset.getTimestamp("FrResDate");
                temp.toresdate = crset.getTimestamp("ToResDate");
                temp.reservationID = crset.getInt("ReservationID");
                temp.resID = crset.getInt("ResidentID");
                temp.resName = this.getResidentName(temp.resID);
                temp.makeDatetoString();
                temp.makeTimetoString();
                temp.difference = temp.frresday - a;
                temp.printed = 0;      
                v.add(temp); 
            }
            //sorts reservations from earliest to latest
            Vector<ReservationObject> newHand = new Vector<ReservationObject>();
            while (v.size() > 0) 
            {
                int pos = 0;  // Position of minimal card.
                ReservationObject c = v.elementAt(0);  // Minimal card seen so far.
                for (int i = 1; i < v.size(); i++)
                {
                    ReservationObject c1 = v.elementAt(i);
                    if ( c1.difference < c.difference )
                    {
                        pos = i;
                        c = c1;
                    }
                }
                v.removeElementAt(pos);
                newHand.addElement(c);
            }
            v = newHand;
            System.out.println(v.size());
            return v;
        }
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
            return null;
        }
    }
    //jemuel
    public CachedRowSet getDirectors4(int resId, int chargeOf)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM director where resId = "+resId+" AND chargeOf = '"+chargeOf+"' and status='serving'";
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
    public CachedRowSet getDirectors7(int resId, int chargeOf)
    {
        try
        {
            con = DriverManager.getConnection(strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM director";
            ResultSet rs = stmt.executeQuery(query);
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            if(crset.size()>0)
            {          
                System.out.println("returned directors");
                 return crset;
            }
            else
            {
                System.out.println("nothing");
                return null;
            }
            
           
        } 
        catch (Exception e)
        {    
            System.out.println(e.getMessage() + "error director7");
            return null;
        }
    }
    
    
    public CachedRowSet getDirectors99()
    {
        try
        {
            cosy = DriverManager.getConnection (strconnection);
            Statement stmt = cosy.createStatement();

            String query = "SELECT * FROM director";
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            cosy.close();

            return crset;
        }
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
            return null;
        }
    } 
    
    
    
}