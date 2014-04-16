package thesis;

import java.sql.*;
import sun.jdbc.rowset.*;
import java.lang.*;
import java.util.*;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.text.ParseException;

//ace
public class SocialGroup
{
     Connection con, con2, con5, con6, cont, conti;
     String url, uname, pword, strconnection;

     public SocialGroup()
     {            
      try { 
             Class.forName("com.mysql.jdbc.Driver").newInstance();

             strconnection = "jdbc:mysql://localhost/thesis?user=root&password=root";

            
         } catch (Exception e)
            {    System.out.println("Resident() " + e.getMessage());
            }
     }
     //ace
      public CachedRowSet getSocGCat()
     {    
         try
         {
             con = DriverManager.getConnection (strconnection);
             Statement stmt = con.createStatement();
           
             
             String query = "SELECT * FROM socgrpcategory";
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
      //ace
      public void addSocGCat(String category)
     {    
         try
         {
             con5 = DriverManager.getConnection (strconnection);
             Statement stmt = con5.createStatement();
           
             
             String query = "INSERT into socgrpcategory (scatName) values('"+category+"')";
             stmt.executeUpdate(query);
	
	     
		stmt.close();
		con5.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                
           }
     }
     //ace
    public int checkSocGCat(String cat)
     {    
        int lol=0; 
        try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM socgrpcategory where scatName= '"+cat+"'";
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
    //ace
    public void delSocGCat(String category)
     {    
         try
         {
             con5 = DriverManager.getConnection (strconnection);
             Statement stmt = con5.createStatement();
           
             
             String query = "DELETE from socgrpcategory where scatName='"+category+"'";
             stmt.executeUpdate(query);
	
	     
		stmt.close();
		con5.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                
           }
     }
    //ace
    public int getSocGNumP()
     {    
        int lol=0; 
        try
         {
             cont = DriverManager.getConnection (strconnection);
             Statement stmt = cont.createStatement();
           
             
             String query = "SELECT * FROM socgrpservicesettings";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		cont.close();
           
                while(crset.next())
                {
                    lol = crset.getInt("numppl");
                }
             return lol;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return 0;
           }
     } 
    public int getSocGNumP2()
     {    
        int lol=0; 
        try
         {
             cont = DriverManager.getConnection (strconnection);
             Statement stmt = cont.createStatement();
           
             
             String query = "SELECT * FROM socgrpservicesettings";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		cont.close();
           
                while(crset.next())
                {
                    lol = crset.getInt("inviteppl");
                }
             return lol;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return 0;
           }
     } 
    
    //ace
   
    
    //ace
    public void updateSocGNumP(int category)
     {    
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
        
             String query = "UPDATE socgrpservicesettings set numppl="+category+" where GID = 1";
             stmt.executeUpdate(query);
             System.out.println(category);
	
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
     }
    
     public void updateSocGDirApp(String category)
     {    
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
        
             String query = "UPDATE socgrpservicesettings set dapprove='"+category+"' where GID = 1";
             stmt.executeUpdate(query);
             System.out.println(category);
	
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
     }
    
    public void updateSocGNumPetInv(int category)
     {    
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
             
             String query = "UPDATE socgrpservicesettings set inviteppl="+category+" where GID = 1";
             stmt.executeUpdate(query);
             System.out.println(category);
	
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
     }
    
    public int addSocGPetition(String category, String name, String details, int a, String namename)            
    {
        
        if(checkSocGroupUnique(name) == 1){
            return 1;
        }
        else{     
        
         try
         { 
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                      
             java.util.Date dt = new java.util.Date();
             java.sql.Timestamp ts1 = new java.sql.Timestamp(dt.getTime());
             
             String query = "INSERT into socgrp(SGName, SGCategory, SGResidentHeadID, SGStatus, SGStartDate, SGDetails, SGRHNme) values('"+name+"', '"+category+"', "+a+", 'Pending Petition - Invites', '"+ts1+"', '"+details+"', '"+namename+"')";
             stmt.executeUpdate(query);
	
	     
		stmt.close();
		conti.close();
        return 0;
            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                
           }
         return 0;
    }}
    
    public int checkSocGroupUnique(String name){
        
        int lol=0; 
        try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM socgrp where SGName= '"+name+"'";
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
    
   public CachedRowSet getStaffPendPet(){
            
        
        try
         {
             CachedRowSet crset = new CachedRowSet();
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM socgrp where SGStatus = 'Pending Petition'";
             ResultSet rs = stmt.executeQuery(query);
		     
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
                        
             return crset;
         } 
        catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
    }
 
   
    public int getSocGrpIDwithRID(int a){
        int b=0;
        
        try
         {
             CachedRowSet crset = new CachedRowSet();
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM socgrp where SGStatus = 'Pending Petition' OR SGStatus = 'Pending Petition - Invites' AND SGResidentHeadID = "+a+"";
             ResultSet rs = stmt.executeQuery(query);
		     
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
                
                if(crset.size() > 0){
                while(crset.next()){
                    b = crset.getInt("SGID");
                    }
                }
             return b;
         } 
        catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return b;
           }
       
        
    }
    
    public CachedRowSet getStaffPendPetbyCat(String n){
        
        try
         {
             CachedRowSet crset = new CachedRowSet();
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM socgrp where SGStatus = 'Pending Petition' and SGCategory= '"+n+"' ";
             ResultSet rs = stmt.executeQuery(query);
		     
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
                        
             return crset;
         } 
        catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
    }
    
    public void addResidentPetTable(int a, String namename){
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                      
             int b = getSocGrpIDwithRID(a);
             
             String query = "INSERT into socgrppetitions(SocGroupID, ResidentID, ResidentNme) values("+b+", "+a+", '"+namename+"')";
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
           }
    }  
   
    public String makePetDateToString(java.util.Date frresdate){
        
        
        Calendar myCalendar = Calendar.getInstance();
        int tempinta, frresyear, frresday, frresmonth;
        
        myCalendar.setTime(frresdate);
        frresyear = myCalendar.get(Calendar.YEAR);
        frresday = myCalendar.get(Calendar.DAY_OF_MONTH);
           
        
        tempinta = myCalendar.get(Calendar.DAY_OF_WEEK);
        frresmonth = myCalendar.get(Calendar.MONTH);
        
        String temp = "January";
        String demp = "Sunday";
        
        if(frresmonth == 1)
            temp = "February";
        if(frresmonth == 2)
            temp = "March";
        if(frresmonth == 3)
            temp = "April";
        if(frresmonth == 4)
            temp = "May";
        if(frresmonth == 5)
            temp = "June";
        if(frresmonth == 6)
            temp = "July";
        if(frresmonth == 7)
            temp = "August";
        if(frresmonth == 8)
            temp = "September";
        if(frresmonth == 9)
            temp = "October";
        if(frresmonth == 10)
            temp = "November";
        if(frresmonth == 11)
            temp = "December";
                   
        
        if(tempinta == 2)
            demp = "Monday";
        else if(tempinta == 3)
            demp = "Tuesday";
        else if(tempinta == 4)
            demp = "Wednesday";
        else if(tempinta == 5)
            demp = "Thursday";
        else if(tempinta == 6)
            demp = "Friday";
        else if(tempinta == 7)
            demp = "Saturday";
        
            
        String frresdatestr ="";
        frresdatestr = demp+" - "+temp+" "+frresday+", "+frresyear;
        
        return frresdatestr;
    }
    
    public CachedRowSet getStaffPetforApp(){
        
         try
         {
             CachedRowSet crset = new CachedRowSet();
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             String query = "SELECT * FROM socgrp where SGStatus = 'Petition for Approval' OR SGStatus = 'Director enable : Petition for Approval'";
             ResultSet rs = stmt.executeQuery(query);
		     
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
                        
             return crset;
         } 
        catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
    }
    
    public CachedRowSet getStaffFAppPetbyCat(String n){
        
        try
         {
             CachedRowSet crset = new CachedRowSet();
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM socgrp where SGStatus = 'Petition for Approval' OR SGStatus = 'Director enable : Petition for Approval' and SGCategory = '"+n+"'";
             ResultSet rs = stmt.executeQuery(query);
		     
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
                        
             return crset;
         } 
        catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
    }
       
    public void approveSocPetition(int name){
       
        try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                      
             
             String query = "UPDATE socgrp set SGStatus = 'Petition for Approval' where SGID = "+name+"";
             stmt.executeUpdate(query);
                  
		stmt.close();
		conti.close();
           
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
    }
    
    public Vector<Integer> getResidentPet(int num){
         try
         {
             CachedRowSet crset = new CachedRowSet();
             con = DriverManager.getConnection (strconnection);
             Statement stmt = con.createStatement();
           
             String query = "SELECT * FROM socgrppetitions where ResidentID = "+num+"";
             ResultSet rs = stmt.executeQuery(query);
		     
		crset.populate(rs);
		rs.close();
		stmt.close();
		con.close();
                
                  Vector<Integer> v = new Vector<Integer>();
                  
                  if(crset.size() > 0){
                    while(crset.next()){
                        v.add(crset.getInt("SocGroupID"));                         
                    }
                  }
                  v.trimToSize();
             return v;
         } 
        catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
    }
    
    public CachedRowSet getResidentCommunityPetitions(){
         try
         {
             CachedRowSet crset = new CachedRowSet();
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
              String query = "SELECT * FROM socgrp where SGStatus = 'Petition for Approval' OR SGStatus = 'Director enable : Petition for Approval'";
              ResultSet rs = stmt.executeQuery(query);
		     
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();  
                   
                               
             return crset;
         } 
        catch (Exception e)
           {            	 	
           	System.out.println("OMG "+e.getMessage());
                return null;
           }
    }
    
     public void addResidentPetTable2(int a, int b, String namename){
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                                
             
             String query = "INSERT into socgrppetitions(SocGroupID, ResidentID, ResidentNme) values("+a+", "+b+", '"+namename+"')";
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
           }
    }  
     
    public int getTotalPet(int a){
        int l = 0;
        
        try
         {
             CachedRowSet crset = new CachedRowSet();
             con = DriverManager.getConnection (strconnection);
             Statement stmt = con.createStatement();
           
             String query = "SELECT * FROM socgrppetitions where SocGroupID = "+a+"";
             ResultSet rs = stmt.executeQuery(query);
		     
		crset.populate(rs);
		rs.close();
		stmt.close();
		con.close();
                
                l = crset.size();
                  
             return l;
         } 
        catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return l;
           }
    }
    
    public CachedRowSet getAllPetitioners(int sgid){
        try
         {
             CachedRowSet crset = new CachedRowSet();
             con = DriverManager.getConnection (strconnection);
             Statement stmt = con.createStatement();
           
             String query = "SELECT * FROM socgrppetitions where SocGroupID = "+sgid+"";
             ResultSet rs = stmt.executeQuery(query);
		     
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
    
     public void updatePetitionStatus(int a){
           try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                      
             
             String query = "UPDATE socgrp set SGStatus = 'Director enable : Petition for Approval' where SGID = "+a+"";
             stmt.executeUpdate(query);
             
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
     }
     
     public void updatePetitionStatus2(int a){
           try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                      
             
             String query = "UPDATE socgrp set SGStatus = 'Pending Petition' where SGID = "+a+"";
             stmt.executeUpdate(query);
             
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
     }
     public CachedRowSet getSGWithID(int aze){
         
         try
         {
             CachedRowSet crset = new CachedRowSet();
             con = DriverManager.getConnection (strconnection);
             Statement stmt = con.createStatement();
           
             String query = "SELECT * FROM socgrp where SGID = "+aze+" AND SGStatus = 'Pending Petition'";
             ResultSet rs = stmt.executeQuery(query);
		     
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
     
     public void removepetitionrequest(int a){
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                      
             
             String query = "DELETE FROM socgrp where SGID = "+a+"";
             stmt.executeUpdate(query);
             
	     
		stmt.close();
		conti.close();

             this.removepetitionsfrompettable(a);
                
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
     }
     
     public void removepetitionsfrompettable(int z){
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                      
             
             String query = "DELETE FROM socgrppetitions where SocGroupID = "+z+"";
             stmt.executeUpdate(query);
             
	     
		stmt.close();
		conti.close();

                
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
     }
     
     public CachedRowSet getSGPetDisplay(int aze){
         
         try
         {
             CachedRowSet crset = new CachedRowSet();
             con = DriverManager.getConnection (strconnection);
             Statement stmt = con.createStatement();
           
             String query = "SELECT * FROM socgrp where SGID = "+aze+"";
             ResultSet rs = stmt.executeQuery(query);
		     
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
     
     public void sendResidentInvites(ResidentObject r, int a){
          try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                                
             
             String query = "INSERT into socgrppetitioninvite(socID, resID, nme, status) values("+a+", "+r.residentid+", '"+r.fname+" "+r.lastname+"', 'No')";
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
           }
     } 
     
     public CachedRowSet getMyPetRequests(){
        try
         {
             CachedRowSet crset = new CachedRowSet();
             con2 = DriverManager.getConnection (strconnection);
             Statement stmt = con2.createStatement();
           
             String query = "SELECT * FROM socgrp where SGStatus = 'Pending Petition - Invites' OR SGStatus = 'Pending Petition' OR SGStatus = 'Petition for Approval' OR SGStatus = 'Director enabled : Petition for Approval'";
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
     
     public Vector<Integer> getResidentPetInvites(int num){
         try
         {
             CachedRowSet crset = new CachedRowSet();
             con5 = DriverManager.getConnection (strconnection);
             Statement stmt = con5.createStatement();
           
             String query = "SELECT * FROM socgrppetitioninvite where resID = "+num+" AND status = 'Yes'";
             ResultSet rs = stmt.executeQuery(query);
		     
		crset.populate(rs);
		rs.close();
		stmt.close();
		con5.close();
                
                  Vector<Integer> v = new Vector<Integer>();
                  
                  if(crset.size() > 0){
                    while (crset.next()){
                        v.add(crset.getInt("socID"));                         
                    }
                  }
                  v.trimToSize();
             return v;
         } 
        catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
    }
    
    public void removeResidentPetTable2(int a, int b){
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                                
             
             String query = "DELETE FROM socgrppetitions where ResidentID = "+b+" AND SocGroupID = "+a+"";
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
           }
    }  
    public void sendResidentInvitestoHead(ResidentObject ro, int a){
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                                
             
             String query = "INSERT into socgrppetitioninvite(socID, resID, nme, status) values("+a+", "+ro.residentid+", '"+ro.fname+" "+ro.lastname+"', 'Yes')";
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
           }
    }
    
    public CachedRowSet getRIDInvites(int a){
        
         try
         {
             CachedRowSet crset = new CachedRowSet();
             con2 = DriverManager.getConnection (strconnection);
             Statement stmt = con2.createStatement();
           
             String query = "SELECT * FROM socgrppetitioninvite where resID = "+a+" AND status = 'No'";
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
    public void acceptGroupInvite(int a){
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                                
             
             String query = "UPDATE socgrppetitioninvite set status = 'Yes' where invID = "+a;
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
           }
    }
    
    public void declineGroupInvite(int a){
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                                
                           
             
             String query = "DELETE FROM socgrppetitioninvite where invID = "+a+"";
             stmt.executeUpdate(query);
             
	     
		stmt.close();
		conti.close();
            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
           }
    }
    
     public void deleteGroupInvite(int a, int b){
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                                
                           
             
             String query = "DELETE FROM socgrppetitioninvite where resID = "+a+" AND socID = "+b;
             stmt.executeUpdate(query);
             
	     
		stmt.close();
		conti.close();
            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
           }
    }
    
    public CachedRowSet getAllPetitionInvitesforSG(int a){
        try
         {
             CachedRowSet crset = new CachedRowSet();
             con2 = DriverManager.getConnection (strconnection);
             Statement stmt = con2.createStatement();
           
             String query = "SELECT * FROM socgrppetitioninvite where socID = "+a;
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
    
     public CachedRowSet getAllPetitionInvitesforSGYES(int a){
        try
         {
             CachedRowSet crset = new CachedRowSet();
             con2 = DriverManager.getConnection (strconnection);
             Statement stmt = con2.createStatement();
           
             String query = "SELECT * FROM socgrppetitioninvite where socID = "+a+" and status = 'Yes'";
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
     
     public CachedRowSet getAllPetitionInvitesforSGNO(int a){
        try
         {
             CachedRowSet crset = new CachedRowSet();
             con2 = DriverManager.getConnection (strconnection);
             Statement stmt = con2.createStatement();
           
             String query = "SELECT * FROM socgrppetitioninvite where socID = "+a+" and status = 'No'";
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
     
     public void setInitSGDirectorApp(int a, String b){
          try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                                
             
             String query = "INSERT into socgrpdirapp(resID, dirName, socpath, socsim) values("+a+", '"+b+"', 0, 'No')";
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
           }
     }
     
     public CachedRowSet getSGDirectorApp(){
          try
         {
             CachedRowSet crset = new CachedRowSet();
             con2 = DriverManager.getConnection (strconnection);
             Statement stmt = con2.createStatement();
           
             String query = "SELECT * FROM socgrpdirapp";
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
     
     public CachedRowSet getSGDirectorAppWithID(int a){
          try
         {
             CachedRowSet crset = new CachedRowSet();
             con2 = DriverManager.getConnection (strconnection);
             Statement stmt = con2.createStatement();
           
             String query = "SELECT * FROM socgrpdirapp where resID = "+a;
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
     
     public String getChargeWITHDir(int a)
     {
        try
        {
            CachedRowSet crset = new CachedRowSet();
            con2 = DriverManager.getConnection (strconnection);
            Statement stmt = con2.createStatement();

            String query = "SELECT * FROM director where resId = "+a+" AND status='Serving'";
            ResultSet rs = stmt.executeQuery(query);
		     
            crset.populate(rs);
            rs.close();
            stmt.close();
            con2.close();                
               
            String aasdf="";
                
            while(crset.next())
            {
                if(aasdf.equals(""))
                {
                    aasdf = String.valueOf(crset.getInt("chargeOf"));
                }
                else
                {
                    aasdf = aasdf+", "+crset.getInt("chargeOf");
                }
            }
            return aasdf;
         } 
        catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }  
     }
     
     public String getSocGDApp()
     {
          try
         {
             CachedRowSet crset = new CachedRowSet();
             con2 = DriverManager.getConnection (strconnection);
             Statement stmt = con2.createStatement();
           
             String query = "SELECT * FROM socgrpservicesettings";
             ResultSet rs = stmt.executeQuery(query);
		     
		crset.populate(rs);
		rs.close();
		stmt.close();
		con2.close();                
               
                crset.next();
                
                String ewan;
                
                ewan = crset.getString("dapprove");
                
                if(ewan.equals("")){
                    ewan = "asdf";
                }
                
                return ewan;              
             
         } 
        catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }  
     }
     
     public void setDirYesSocSIM(int aa){
     try
     {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                                
             
             String query = "UPDATE socgrpdirapp set socsim = 'Yes' where resID = "+aa;
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

            
      } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
           }
     }
     
     public void setDirNoSocSIM(int aa){
     try
     {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                                
             
             String query = "UPDATE socgrpdirapp set socsim = 'No' where resID = "+aa;
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

            
      } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
           }
     }
     
     
     
     public CachedRowSet getSGDirectorAppSim(){
          try
         {
             CachedRowSet crset = new CachedRowSet();
             con2 = DriverManager.getConnection (strconnection);
             Statement stmt = con2.createStatement();
           
             String query = "SELECT * FROM socgrpdirapp where socsim = 'Yes'";
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
     
      public CachedRowSet getSGDirectorAppChainFrost(){
          try
         {
             CachedRowSet crset = new CachedRowSet();
             con2 = DriverManager.getConnection (strconnection);
             Statement stmt = con2.createStatement();
           
             String query = "SELECT * FROM socgrpdirapp where NOT = 0";
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

     public void setSGForDirApp(int rid, String dname, int aa, int socp){
     try
     {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                                
             
             String query = "INSERT into socgrpforapp(resID, dirName, socID, status, socpath) values("+rid+", '"+dname+"', "+aa+", 'No', "+socp+")";
             stmt.executeUpdate(query);
	
	     
		stmt.close();
		conti.close();

            
      } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
           }
     }
     
     public CachedRowSet getSGsForDirectorApps(){
        
        try
         {
             CachedRowSet crset = new CachedRowSet();
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM socgrp where SGStatus = 'Director enable : Petition for Approval'";
             ResultSet rs = stmt.executeQuery(query);
		     
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
                        
             return crset;
         } 
        catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
    }
     
    public CachedRowSet getSGsForDirectorApps2(int a){
        
     try
     {
             CachedRowSet crset = new CachedRowSet();
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM socgrpforapp where resID = "+a+" AND status = 'No'";
             ResultSet rs = stmt.executeQuery(query);
		     
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
                        
             return crset;
         } 
        catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
    }
     
    public CachedRowSet getSGsForDirectorApps3(int a){
        
     try
     {
             CachedRowSet crset = new CachedRowSet();
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM socgrpforapp where resID = "+a+" AND status = 'Yes'";
             ResultSet rs = stmt.executeQuery(query);
		     
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
                        
             return crset;
         } 
        catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
    }
    
    public void dirApproveSG(int a, int b){
           try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                      
             
             String query = "UPDATE socgrpforapp set status = 'Yes' where socID = "+b+" AND resID = "+a;
             stmt.executeUpdate(query);
             
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
    }
    
    public int checkNoDirApps(int a){
        
     try
     {
             CachedRowSet crset = new CachedRowSet();
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM socgrpforapp where socID = "+a;
             ResultSet rs = stmt.executeQuery(query);
		     
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
             int aa = 0;           
             while(crset.next()){
                 if(crset.getString("status").equals("No")){
                     aa = 1;
                 }
             }
             return aa;
         } 
        catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return 2;
           }
    }
    
    public CachedRowSet getDirAppsForSG(int a){
        
     try
     {
             CachedRowSet crset = new CachedRowSet();
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM socgrpforapp where socID = "+a;
             ResultSet rs = stmt.executeQuery(query);
		     
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
             
             return crset;
         } 
        catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
    }
    
    public void updatePetitionStatus3(int sgid){
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                      
             
             String query = "UPDATE socgrp set SGStatus = 'Social Group', SGMemSet = 'Private', SGAPostExp = 0 where SGID = "+sgid+"";
             stmt.executeUpdate(query);
             
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
    }
    
    public Vector<ResidentObject> getResidentPets(int a){
        
         Vector<ResidentObject> v = new Vector<ResidentObject>();
         try
         {
             con = DriverManager.getConnection (strconnection);
             Statement stmt = con.createStatement();

             String query = "SELECT * FROM socgrppetitions where SocGroupID = "+a;
             ResultSet rs = stmt.executeQuery(query);

             CachedRowSet crset = new CachedRowSet();
             crset.populate(rs);
             rs.close();
             stmt.close();
             con.close();      
                          
             while(crset.next()){
                 ResidentObject temp = new ResidentObject();
                 temp.fname = crset.getString("ResidentNme");
                 temp.residentid = crset.getInt("ResidentID");  
                 
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
    
    public void movePetsToMem(ResidentObject ro, int sgid){
          try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                                
             
             String query = "INSERT into socgrpmembers(socgrpid, residentid, name, pos) values("+sgid+", "+ro.residentid+", '"+ro.fname+"', 'Member')";
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
           }
    }
    
    public void makeLeader(ResidentObject ro, int sgid){
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                                
             
             String query = "INSERT into socgrpmembers(socgrpid, residentid, name, pos) values("+sgid+", "+ro.residentid+", '"+ro.fname+"', 'Admin')";
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
           }
    }
    
    public int getLeaderID(int sgid){
        try
     {
             CachedRowSet crset = new CachedRowSet();
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM socgrp where SGID = "+sgid+"";
             ResultSet rs = stmt.executeQuery(query);
		     
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
                crset.next();
                int a = 0;
                a = crset.getInt("SGResidentHeadID");
                        
             return a;
         } 
        catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return 0;
           }
    }
    
     public CachedRowSet getSocialGroups(){
        
         try
         {
             CachedRowSet crset = new CachedRowSet();
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             String query = "SELECT * FROM socgrp where SGStatus = 'Social Group'";
             ResultSet rs = stmt.executeQuery(query);
		     
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
                        
             return crset;
         } 
        catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
    }
     
     public Vector<Integer> getResidentMembers(int num){
         try
         {
             CachedRowSet crset = new CachedRowSet();
             con = DriverManager.getConnection (strconnection);
             Statement stmt = con.createStatement();
           
             String query = "SELECT * FROM socgrpmembers where residentid = "+num;
             ResultSet rs = stmt.executeQuery(query);
		     
		crset.populate(rs);
		rs.close();
		stmt.close();
		con.close();
                
                  Vector<Integer> v = new Vector<Integer>();
                  
                  if(crset.size() > 0){
                    while(crset.next()){
                        v.add(crset.getInt("socgrpid"));                         
                    }
                  }
                  v.trimToSize();
             return v;
         } 
        catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
    }
     
     public void joinSocGroupResidentSocMem(int a, int b, String lolol, String pipi){
           try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                                
             
             String query = "INSERT into socgrpmembers(socgrpid, residentid, name, pos) values("+a+", "+b+", '"+lolol+"', '"+pipi+"')";
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
           }
     }
            
     public CachedRowSet getSGMEMBERS(int sgid){
        try
     {
             CachedRowSet crset = new CachedRowSet();
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM socgrpmembers where socgrpid = "+sgid+"";
             ResultSet rs = stmt.executeQuery(query);
		     
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
                
               
                        
             return crset;
         } 
        catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
    }
     
     public CachedRowSet getSGMEMBER(int sgid, int rid){
        try
     {
             CachedRowSet crset = new CachedRowSet();
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM socgrpmembers where socgrpid = "+sgid+" AND residentid = "+rid+"";
             ResultSet rs = stmt.executeQuery(query);
		     
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
                
               
                        
             return crset;
         } 
        catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
    }
     
     public String getSocGNewsSet()
     {
          try
         {
             CachedRowSet crset = new CachedRowSet();
             con2 = DriverManager.getConnection (strconnection);
             Statement stmt = con2.createStatement();
           
             String query = "SELECT * FROM socgrpservicesettings";
             ResultSet rs = stmt.executeQuery(query);
		     
		crset.populate(rs);
		rs.close();
		stmt.close();
		con2.close();                
               
                crset.next();
                
                String ewan;
                
                ewan = crset.getString("newslet");
                
                if(ewan.equals("")){
                    ewan = "asdf";
                }
                
                return ewan;              
             
         } 
        catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }  
     }
     
     public void updateSocGNewsSet(String a){
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                      
             
             String query = "UPDATE socgrpservicesettings set newslet = '"+a+"' where GID = 1";
             stmt.executeUpdate(query);
             
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
     }
     
     public String getSocGBulletSet()
     {
          try
         {
             CachedRowSet crset = new CachedRowSet();
             con2 = DriverManager.getConnection (strconnection);
             Statement stmt = con2.createStatement();
           
             String query = "SELECT * FROM socgrpservicesettings";
             ResultSet rs = stmt.executeQuery(query);
		     
		crset.populate(rs);
		rs.close();
		stmt.close();
		con2.close();                
               
                crset.next();
                
                String ewan;
                
                ewan = crset.getString("bullet");
                
                if(ewan.equals("")){
                    ewan = "asdf";
                }
                
                return ewan;              
             
         } 
        catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }  
     }
     
     public void updateSocGBulletSet(String a){
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                      
             
             String query = "UPDATE socgrpservicesettings set bullet = '"+a+"' where GID = 1";
             stmt.executeUpdate(query);
             
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
     }
     
     public String getSocGReserveSet()
     {
          try
         {
             CachedRowSet crset = new CachedRowSet();
             con2 = DriverManager.getConnection (strconnection);
             Statement stmt = con2.createStatement();
           
             String query = "SELECT * FROM socgrpservicesettings";
             ResultSet rs = stmt.executeQuery(query);
		     
		crset.populate(rs);
		rs.close();
		stmt.close();
		con2.close();                
               
                crset.next();
                
                String ewan;
                
                ewan = crset.getString("reserve");
                
                if(ewan.equals("")){
                    ewan = "asdf";
                }
                
                return ewan;              
             
         } 
        catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }  
     }
     
     public void updateSocGReserveSet(String a){
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                      
             
             String query = "UPDATE socgrpservicesettings set reserve = '"+a+"' where GID = 1";
             stmt.executeUpdate(query);
             
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
     }
     
     //for the direk approval. check ng mga settings
     public CachedRowSet getSGServiceSettings(){
           try
         {
             CachedRowSet crset = new CachedRowSet();
             con2 = DriverManager.getConnection (strconnection);
             Statement stmt = con2.createStatement();
           
             String query = "SELECT * FROM socgrpservicesettings";
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
     
     public String getSGMemType(int a, int sgid){
           try
         {
             CachedRowSet crset = new CachedRowSet();
             con2 = DriverManager.getConnection (strconnection);
             Statement stmt = con2.createStatement();
           
             String query = "SELECT * FROM socgrpmembers where socgrpid = "+sgid+" and residentid = "+a+"";
             ResultSet rs = stmt.executeQuery(query);
		     
		crset.populate(rs);
		rs.close();
		stmt.close();
		con2.close();                
               
                crset.next();
                
                String ewan = "";
                
                ewan = crset.getString("pos");
                                                
                return ewan;              
             
         } 
        catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }  
     }
     
      public void updateGroupSettings(String a, String b, int c, String d, int f){
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                      
             
             String query = "UPDATE socgrp set SGMemSet = '"+a+"', SGCategory = '"+b+"', SGAPostExp = "+c+", SGDetails = '"+d+"' where SGID = "+f+"";
             stmt.executeUpdate(query);
             
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
     }
            
      public CachedRowSet getSGApplicantMEMBERS(int sgid){
           try
     {
             CachedRowSet crset = new CachedRowSet();
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM socgrpmembers where socgrpid = "+sgid+" AND pos = 'Applicant'";
             ResultSet rs = stmt.executeQuery(query);
		     
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
                
               
                        
             return crset;
         } 
        catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
      }
      
      public void acceptMemberApplicant(int a, int b){
           try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                      
             
             String query = "UPDATE socgrpmembers set pos = 'Member' where residentid = "+b+" and socgrpid = "+a+"";
             stmt.executeUpdate(query);
             
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
      }
      
      public void rejectMemberApplicant(int a, int b){
           try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                      
             
             String query = "DELETE from socgrpmembers where residentid = "+b+" and socgrpid = "+a+"";
             stmt.executeUpdate(query);
             
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
      }
      
      public void promoteSGMember(int a, int b){
           try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                      
             
             String query = "UPDATE socgrpmembers set pos = 'Admin' where residentid = "+b+" and socgrpid = "+a+"";
             stmt.executeUpdate(query);
             
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
      }
      
      public void removeDirectorsForApp(int sgid){
           try
         {
             con5 = DriverManager.getConnection (strconnection);
             Statement stmt = con5.createStatement();
           
             
             String query = "DELETE from socgrpforapp where socID="+sgid+"";
             stmt.executeUpdate(query);
	
	     
		stmt.close();
		con5.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                
           }
      }
     

}   