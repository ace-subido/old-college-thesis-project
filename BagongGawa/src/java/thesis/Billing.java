/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package thesis;

import java.sql.*;
import sun.jdbc.rowset.*;
import java.lang.*;
import java.util.*;
import java.text.*;
import java.sql.Timestamp;

//ace
public class Billing
{
     Connection con, con2, con5, con6, cont, conti;
     String url, uname, pword, strconnection;

     public Billing()
     {            
      try { 
             Class.forName("com.mysql.jdbc.Driver").newInstance();

             strconnection = "jdbc:mysql://localhost/thesis?user=root&password=root";

            
         } catch (Exception e)
            {    System.out.println("Resident() " + e.getMessage());
            }
     }
     
     public String getPenaltySettings()
     {    
        
        try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billsettings";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
                crset.next();
        String lol = "";
        lol = crset.getString("penalty");
        
        if(lol==null)
                lol = "";
        
             return lol;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
     } 
     
     public String getMiscSettings()
     {    
        
        try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billsettings";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
                crset.next();
        String lol = "";
        lol = crset.getString("miscalleneous");
        
        if(lol==null)
                lol = "";
        
             return lol;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
     } 
     
     public void updatePenaltySettingE()
     {    
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
        
             String query = "UPDATE billsettings set penalty = 'Enabled' where bId = 1";
             stmt.executeUpdate(query);
          
	
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
     }
     
      public void updatePenaltySettingD()
     {    
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
        
             String query = "UPDATE billsettings set penalty = 'Disabled' where bId = 1";
             stmt.executeUpdate(query);
           
	
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
     }
      
        public void updateMiscSettingD()
     {    
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
        
             String query = "UPDATE billsettings set miscalleneous = 'Disabled' where bId = 1";
             stmt.executeUpdate(query);
           
	
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
     }
        
        public void updateMiscSettingE()
     {    
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
        
             String query = "UPDATE billsettings set miscalleneous = 'Enabled' where bId = 1";
             stmt.executeUpdate(query);
           
	
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
     }
      
       public void updateCutDate(int a)
     {    
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
        
             String query = "UPDATE billsettings set cutOffDate = "+a+" where bId = 1";
             stmt.executeUpdate(query);
           
	
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
     }
       
         public void updateDelDate(int a)
     {    
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
        
             String query = "UPDATE billsettings set delDate = "+a+" where bId = 1";
             stmt.executeUpdate(query);
           
	
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
     }
         
         public int getCutDateSetting(){
              try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billsettings";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
                crset.next();
        int lol = 0;
        lol = crset.getInt("cutOffDate");
        
        
             return lol;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return 0;
           }
         }
         
         public int getDelDateSetting(){
                    try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billsettings";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
                crset.next();
        int lol = 0;
        lol = crset.getInt("delDate");
        
        
             return lol;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return 0;
           }
         }
         
         public double getAssociationDueSetting(){
                try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billsettings";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
                crset.next();
        double lol = 0;
        lol = crset.getDouble("assocdue");
        
        
             return lol;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return 0;
           }
         }
         
         public void updateAssocDueSetting(double a){
              try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
        
             String query = "UPDATE billsettings set assocdue = "+a+" where bId = 1";
             stmt.executeUpdate(query);
           	     
		stmt.close();
		conti.close();
            
         } catch (Exception e)
           {           
          	System.out.println("sira update status" + e.getMessage());
           }
         }
         
          public CachedRowSet getBillingSetting(){
                try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billsettings";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
       
        
        
             return crset;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
         }
          
       public void updateUnitMeasure(String a){
              try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
        
             String query = "UPDATE billsettings set aduemeasureunit = '"+a+"' where bId = 1";
             stmt.executeUpdate(query);
           	     
		stmt.close();
		conti.close();
            
         } catch (Exception e)
           {           
          	System.out.println("sira update status" + e.getMessage());
           }
         }
            
       public CachedRowSet getAssocBDowns(){
            try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billassocbdown";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
       
        
        
             return crset;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
       }
       
       public void addADueSubtotal(String a, double b, String c){
           
           
           try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                      
             
             String query = "INSERT into billassocbdown(subtotalName, subtotalamount, subtotaltype) values('"+a+"', "+b+", '"+c+"')";
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
           }
       }
       
       public double roundTwoDecimals(double d) {
        	DecimalFormat twoDForm = new DecimalFormat("#.##");
		return Double.valueOf(twoDForm.format(d));
       }
       
       public void delADueSubtotal(int a){
            try
         {
             con5 = DriverManager.getConnection (strconnection);
             Statement stmt = con5.createStatement();
           
             
             String query = "DELETE from billassocbdown where subid="+a+"";
             stmt.executeUpdate(query);
	
	     
		stmt.close();
		con5.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                
           }
       }
       
       public void deleteAllABSubs(){
           try
         {
             con5 = DriverManager.getConnection (strconnection);
             Statement stmt = con5.createStatement();
           
             
             String query = "DELETE from billassocbdown";
             stmt.executeUpdate(query);
	
	     
		stmt.close();
		con5.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                
           }
       }
       
       public void waterSettingYESNO(String a){
             try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
        
             String query = "UPDATE billsettings set water = '"+a+"' where bId = 1";
             stmt.executeUpdate(query);
           	     
		stmt.close();
		conti.close();
            
         } catch (Exception e)
           {           
          	System.out.println("sira update status" + e.getMessage());
           }
       }
       
       public void elecSettingYESNO(String a){
             try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
        
             String query = "UPDATE billsettings set elec = '"+a+"' where bId = 1";
             stmt.executeUpdate(query);
           	     
		stmt.close();
		conti.close();
            
         } catch (Exception e)
           {           
          	System.out.println("sira update status" + e.getMessage());
           }
       }
       
       public void updateWaterSettings(int a, int b, double c){
           try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
        
             String query = "UPDATE billsettings set wcutdate = "+a+", wduedate = "+b+", waterpercube= "+c+" where bId = 1";
             stmt.executeUpdate(query);
           	     
		stmt.close();
		conti.close();
            
         } catch (Exception e)
           {           
          	System.out.println("sira update status" + e.getMessage());
           }
       }
       
       public void updateElecSettings(int a, int b, double c){
           try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
        
             String query = "UPDATE billsettings set ecutdate = "+a+", eduedate = "+b+", elecperkwh = "+c+" where bId = 1";
             stmt.executeUpdate(query);
           	     
		stmt.close();
		conti.close();
            
         } catch (Exception e)
           {           
          	System.out.println("sira update status" + e.getMessage());
           }
       }
       
       public CachedRowSet getPenaltyDuesSettings(){
         try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billpenalty";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
       
        
        
             return crset;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
       }
       
       public void addPenaltyFeeSetting(String a, Double b, String d){
             try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                      
             
             String query = "INSERT into billpenalty(penaltyname, penaltyamt, penaltymeasure) values('"+a+"', "+b+", '"+d+"')";
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
           }
       }
       
       public void delPenaltyFeeSetting(int a){
            try
         {
             con5 = DriverManager.getConnection (strconnection);
             Statement stmt = con5.createStatement();
           
             
             String query = "DELETE from billpenalty where subid="+a+"";
             stmt.executeUpdate(query);
	
	     
		stmt.close();
		con5.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                
           }
       }
       
        public void deleteAllPenaltyFeesSettings(){
           try
         {
             con5 = DriverManager.getConnection (strconnection);
             Statement stmt = con5.createStatement();
           
             
             String query = "DELETE from billassocbdown";
             stmt.executeUpdate(query);
	
	     
		stmt.close();
		con5.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                
           }
       }
        public CachedRowSet getWaterCharges(){
         try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billwater";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
       
        
        
             return crset;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
       }
       
        public CachedRowSet getElecCharges(){
         try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billelec";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
       
        
        
             return crset;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
       }
        
         public void addWaterChargeSetting(String a, Double b, String c){
             try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                      
             
             String query = "INSERT into billwater(wfee, wname, wfeecomptype) values("+b+", '"+a+"', '"+c+"')";
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
           }
       }
         
         public void addElecChargeSetting(String a, Double b, String c){
             try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                      
             
             String query = "INSERT into billwater(elecName, elecFee, efeecomptype) values('"+a+"', "+b+", '"+c+"')";
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
           }
       }
        public void delWChargeSetting(int a){
            try
         {
             con5 = DriverManager.getConnection (strconnection);
             Statement stmt = con5.createStatement();
           
             
             String query = "DELETE from billwater where bid="+a+"";
             stmt.executeUpdate(query);
	
	     
		stmt.close();
		con5.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                
           }
       } 
        
         public void delEChargeSetting(int a){
            try
         {
             con5 = DriverManager.getConnection (strconnection);
             Statement stmt = con5.createStatement();
           
             
             String query = "DELETE from billelec where bid="+a+"";
             stmt.executeUpdate(query);
	
	     
		stmt.close();
		con5.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                
           }
       } 
       
        public void deleteAllEChargeSettings(){
           try
         {
             con5 = DriverManager.getConnection (strconnection);
             Statement stmt = con5.createStatement();
           
             
             String query = "DELETE from billelec";
             stmt.executeUpdate(query);
	
	     
		stmt.close();
		con5.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                
           }
       }
        
        public void deleteAllWChargeSettings(){
           try
         {
             con5 = DriverManager.getConnection (strconnection);
             Statement stmt = con5.createStatement();
           
             
             String query = "DELETE from billelec";
             stmt.executeUpdate(query);
	
	     
		stmt.close();
		con5.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                
           }
       }
        
        public String makeDateToString(java.util.Date frresdate){
                
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
        frresdatestr = temp+" "+frresday+", "+frresyear;
        
        return frresdatestr;
    }
        
        public java.util.Date makeDueDate(int hm, java.util.Date frresdate){
                
         try
        { 
            Calendar myCalendar = Calendar.getInstance();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            
            int frresyear, frresmonth, frresday;
            
            String bb = "";
            
            myCalendar.setTime(frresdate);
            frresyear = myCalendar.get(Calendar.YEAR);
            frresday = myCalendar.get(Calendar.DAY_OF_MONTH)+hm;
            
            frresmonth = myCalendar.get(Calendar.MONTH)+1;
                        
            bb = frresyear+"-"+frresmonth+"-"+frresday;
            
            java.util.Date dt1 = sdf.parse(bb);
          
            return dt1;
        }
             catch(Exception e)
        {
            System.out.println("tae" + e.getMessage());
            return null;
        }
    }
        
        public void addMiscFee(String a, double b, String c){
             try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
             java.util.Date dt = new java.util.Date();
             java.sql.Timestamp ts1 = new java.sql.Timestamp(dt.getTime());
             
             String query = "INSERT into billpenaltymisc(dueName, feeamt, dDate, type) values('"+a+"', "+b+", '"+ts1+"', '"+c+"')";
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
           }
        }    
        
        public java.util.Date reformatThisDate(java.util.Date frresdate){
             try
        { 
            Calendar myCalendar = Calendar.getInstance();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            
            int frresyear, frresmonth, frresd;
            
            String bb = "";
            
           
            myCalendar.setTime(frresdate);
            frresyear = myCalendar.get(Calendar.YEAR);
            frresd = myCalendar.get(Calendar.DAY_OF_MONTH);
            
            frresmonth = myCalendar.get(Calendar.MONTH)+1;
                       
            
            bb = frresyear+"-"+frresmonth+"-"+frresd;
            
            java.util.Date dt1 = sdf.parse(bb);
            
            return dt1;}
             catch(Exception e)
        {
            System.out.println("tae" + e.getMessage());
            return null;
        }
        }
        
        
        public java.util.Date getStartDate(int a, String s){
           
        try
        { 
            Calendar myCalendar = Calendar.getInstance();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date frresdate = new java.util.Date();
            int frresyear, frresmonth;
            
            String bb = "";
            
           
            myCalendar.setTime(frresdate);
            frresyear = myCalendar.get(Calendar.YEAR);
                    
            
            frresmonth = myCalendar.get(Calendar.MONTH)+1;
            
            if(s.equals("lastmonth")){
                frresmonth = frresmonth-1;
            }
            
            bb = frresyear+"-"+frresmonth+"-"+a;
            
            java.util.Date dt1 = sdf.parse(bb);
            
            return dt1;}
             catch(Exception e)
        {
            System.out.println("tae" + e.getMessage());
            return null;
        }
            
        }
        public java.util.Date getEndDate(int a, String s){
        try
        { 
            Calendar myCalendar = Calendar.getInstance();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date frresdate = new java.util.Date();
            int frresyear, frresmonth;
            
            String bb = "";
            
            myCalendar.setTime(frresdate);
            frresyear = myCalendar.get(Calendar.YEAR);
                    
            
            frresmonth = myCalendar.get(Calendar.MONTH)+1;
            
            if(s.equals("nextmonth")){
                frresmonth = frresmonth+1;
            }
            bb = frresyear+"-"+frresmonth+"-"+a;
            
            java.util.Date dt1 = sdf.parse(bb);
          
            return dt1;
        }
             catch(Exception e)
        {
            System.out.println("tae" + e.getMessage());
            return null;
        }
            
        }
        
        public int getDaysInBetween(java.util.Date d1, java.util.Date d2){
            long mili = 24 * 60 * 60 * 1000;
            long diff = d2.getTime() - d1.getTime();
            int days = (int) Math.floor(diff / mili);
            return Math.abs(days);
        }
        
        public CachedRowSet getAllPenaltiesWithResidentID(int a){
             try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billpenaltymisc where residentID = "+a+" and type= 'Penalty Flat' or type= 'Penalty Per' ";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
       
        
        
             return crset;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
        }
        
        public CachedRowSet getPenaltyCharge(int a){
                 try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billpenalty where bid = "+a+"";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
       
        
        
             return crset;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
        }
        
        public void addPenaltyChargetoResident(int a, double b, String c, int d, String e, int t, String q){
             try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
             java.util.Date dt = new java.util.Date();
             java.sql.Timestamp ts1 = new java.sql.Timestamp(dt.getTime());
             
             String query = "INSERT into billpenaltymisc(dueName, feeamt, residentName, dDate, residentID, familyHeadID, type, lotid) values('"+c+"', "+b+", '"+e+"', '"+ts1+"', "+a+", "+d+", '"+q+"', "+t+")";
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

            
         } catch (Exception f)
           {            		
           	System.out.println(f.getMessage());
           }
        }
        
        public void addPenaltyChargetoResidentFamHead(int a, double b, String c, String e, int t, String q){
             try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
             java.util.Date dt = new java.util.Date();
             java.sql.Timestamp ts1 = new java.sql.Timestamp(dt.getTime());
             
             String query = "INSERT into billpenaltymisc(dueName, feeamt, residentName, dDate, residentID, familyHeadID, type, lotid) values('"+c+"', "+b+", '"+e+"', '"+ts1+"', "+a+", 0, '"+q+"', "+t+")";
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

            
         } catch (Exception f)
           {            		
           	System.out.println(f.getMessage());
           }
        }
        
       /* public CachedRowSet getAllMiscCharge(){
            
        }*/
        
        public CachedRowSet getAllFamilyHeads(){
            try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM resident where StatInFam = 'head'";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
       
        
        
             return crset;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
        }
        
        public void removePenaltyCharge(int a){
         try
         {
             con5 = DriverManager.getConnection (strconnection);
             Statement stmt = con5.createStatement();
           
             
             String query = "DELETE from billpenaltymisc where bid="+a+"";
             stmt.executeUpdate(query);
	
	     
		stmt.close();
		con5.close();

            
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                
           }
        }
        
        public CachedRowSet getAllMiscFees(){
             try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billpenaltymisc where type = 'Misc Com' OR type = 'Misc Res'";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
       
        
        
             return crset;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
        }
        
        public CachedRowSet getAllPenaltiesWithLOTID(int a){
             try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             System.out.print("91028h3");
             String query = "SELECT * FROM billpenaltymisc where lotid = "+a+" AND type = 'Penalty Flat' ";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
       
        
        
             return crset;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
        }
        
        public void initializeAssocBills(int a, double b, String c, double d, double e, double g, double h, java.util.Date d3, int kk, int ii){
             try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
           
             java.sql.Timestamp ts3 = new java.sql.Timestamp(d3.getTime());
             
             
             String query = "INSERT into billresident(residentID, billtotal, status, residentName, penaltymiscsubtotl, reservesubtotl, permitsubtotl, assocduessubtotl, billType, lotID, issueID, billNotice) values("+a+", "+b+", 'unpaid', '"+c+"', "+d+", "+e+", "+g+", "+h+", 'Assoc', "+kk+", "+ii+", '"+ts3+"')";
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

            
         } catch (Exception f)
           {            		
           	System.out.println(f.getMessage());
           }
        }
        
        public void issueAssocBill(java.util.Date d1, java.util.Date d2, double a, String b){
            try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
             java.util.Date dt = new java.util.Date();
             java.sql.Timestamp ts1 = new java.sql.Timestamp(d1.getTime());
             java.sql.Timestamp ts2 = new java.sql.Timestamp(d2.getTime());
             
             String query = "INSERT into billissue(stat, sdate, edate, type, basecharge, ameasure) values('Not Issued', '"+ts1+"', '"+ts2+"', 'Assoc', "+a+", '"+b+"')";
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

            
         } catch (Exception f)
           {            		
           	System.out.println(f.getMessage());
           }
        }
        
        public CachedRowSet getAllAssUnIssuedBatch(){
            try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billissue where stat = 'Not Issued' and type= 'Assoc'";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();      
        
        
             return crset;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
        }
        
        public CachedRowSet getAllAssIssuedBatch(){
            try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billissue where stat = 'Issued' and type= 'Assoc'";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();      
        
        
             return crset;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
        }
        
         public CachedRowSet getAllWatIssuedBatch(){
            try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billissue where stat = 'Issued' and type= 'Water'";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();      
        
        
             return crset;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
        }
        
        public CachedRowSet getAllWatUnIssuedBatch(){
            try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billissue where stat = 'Not Issued' and type = 'Water'";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();      
        
        
             return crset;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
        }
        
        public CachedRowSet getAllAssIssuedBatchWITHID(int a){
              try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billissue where id = "+a+"";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();      
        
        
             return crset;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
        }
        
        public void updateIssuedBatch(int a){
              try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
        
             String query = "UPDATE billissue set stat = 'Issued' where id = "+a+"";
             stmt.executeUpdate(query);
          
	
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
        }
        
        public ResidentObject getResidentObject(int a){
        try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM resident where ResId = "+a+"";
             ResultSet rs = stmt.executeQuery(query);
	
                CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();      
                crset.next();
           
        
                 ResidentObject temp = new ResidentObject();
                 temp.fname = crset.getString("FirstName");
                 temp.lastname = crset.getString("LastName");
                 temp.residentid = crset.getInt("ResId");  
                 temp.address = crset.getString("Address");
                 temp.telenumber = crset.getString("HouseNum");
                 temp.username=crset.getString("Username");
                 return temp;
        }
        catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                return null;
           }
             
             
        }
        
        public Vector<Integer> getUnPaidResidents(){            
              try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billresident where status = 'unpaid' OR status = 'partial' and billType = 'Assoc'";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();      
        
        
            Vector<Integer> v = new Vector<Integer>();
                  
                  if(crset.size() > 0){
                    while (crset.next()){
                        v.add(crset.getInt("residentID"));                         
                    }
                  }
                  v.trimToSize();
                  
                  return v;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
        }
        
         public Vector<Integer> getUnPaidResidents2(){            
              try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billresident where status = 'unpaid' OR status = 'partial' and billType = 'Water'";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();      
        
        
            Vector<Integer> v = new Vector<Integer>();
                  
                  if(crset.size() > 0){
                    while (crset.next()){
                        v.add(crset.getInt("residentID"));                         
                    }
                  }
                  v.trimToSize();
                  
                  return v;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
        }
        
        public CachedRowSet getAllUnPaidBillsOFRESID(int a){
              try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billresident where residentID = "+a+" and billType = 'Assoc' and (status = 'unpaid' OR status = 'partial')";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();      
        
        
             return crset;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
        }
        
         public CachedRowSet getAllBillsOFRESID(int a){
              try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billresident where residentID = "+a+" and billType = 'Assoc'";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();      
        
        
             return crset;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
        }
        
        public CachedRowSet getAllUnPaidBillsOFRESID2(int a){
              try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billresident where residentID = "+a+" and status = 'unpaid' OR status = 'partial' and billType = 'Water'";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();      
        
        
             return crset;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
        }
        
        public void clearAssocBill(int a, String b){
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
        
             String query = "UPDATE billresident set status = 'paid', pymttype = '"+b+"' where bid = "+a+"";
             stmt.executeUpdate(query);
          
	
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
        }
        
        
         public void partialAssocBill(int a, String b, double c){
         try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
        
             String query = "UPDATE billresident set status = 'partial', pymttype = '"+b+"', balance="+c+" where bid = "+a+"";
             stmt.executeUpdate(query);
          
	
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
        }
          
        
        public CachedRowSet getAllPermitsWithFAMANDRESID(int a, int b){
             try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billpermits where residentID = "+a+" OR familyHeadID = "+b+"";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
       
        
        
             return crset;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
        }
        
         public void issueWaterBill(java.util.Date d1, java.util.Date d2, double c){
            try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
             java.sql.Timestamp ts1 = new java.sql.Timestamp(d1.getTime());
             java.sql.Timestamp ts2 = new java.sql.Timestamp(d2.getTime());
             
             String query = "INSERT into billissue(stat, sdate, edate, type, basecharge) values('Not Issued', '"+ts1+"', '"+ts2+"', 'Water', "+c+")";
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

            
         } catch (Exception f)
           {            		
           	System.out.println(f.getMessage());
           }
        }
         
         
         
         public void initializeWaterBills(int a, String c, double d, java.util.Date d3, int ll, int kk){
             try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
             
             java.sql.Timestamp ts3 = new java.sql.Timestamp(d3.getTime());
             double temp = 0.00;
             
             String query = "INSERT into billresident(residentID, status, billtotal, residentName, watersubtotl, billType, billNotice, billWReading, lotID, issueID) values("+a+", 'issued', "+temp+", '"+c+"', "+d+", 'Water', '"+ts3+"', 0, "+ll+", "+kk+")";
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

            
         } catch (Exception f)
           {            		
           	System.out.println(f.getMessage());
           }
        }
         
         public Vector<Integer> getWIssuedResidents(){
             try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billresident where status = 'issued' and billType = 'Water'";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();      
        
        
            Vector<Integer> v = new Vector<Integer>();
                  
                  if(crset.size() > 0){
                    while (crset.next()){
                        v.add(crset.getInt("residentID"));                         
                    }
                  }
                  v.trimToSize();
                  
                  return v;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
         }
         
         public CachedRowSet getAllWIssueBillOFRESID(int a){
             try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billresident where residentID = "+a+" and status = 'issued' and billType = 'Water'";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
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
         
         public CachedRowSet getAllWPaidBillOFRESID(int a){
             try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billresident where residentID = "+a+" and status = 'paid' and billType = 'Water'";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
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
         
         public void updateWaterBill(int a, double b, int c, java.util.Date d1){
              try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
             
        
             java.sql.Timestamp ts1 = new java.sql.Timestamp(d1.getTime());
             String query = "UPDATE billresident set billtotal = "+b+", billWReading = "+c+", status = 'unpaid', billNotice = '"+ts1+"' where bid = "+a+"";
             stmt.executeUpdate(query);
          
	
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
         }
         
         public CachedRowSet getWaterBill(int a){
               try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billresident where bid = "+a+"";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
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
            
             
         public CachedRowSet getAssocIssueBatchWITHEDATE(java.util.Date d1){
                 try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             java.sql.Timestamp ts1 = new java.sql.Timestamp(d1.getTime());
             String query = "SELECT * FROM billissue where edate = '"+ts1+"'";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
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
         
          public CachedRowSet getWaterIssueBatchWITHEDATE(java.util.Date d1){
                 try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             java.sql.Timestamp ts1 = new java.sql.Timestamp(d1.getTime());
             String query = "SELECT * FROM billissue where edate = '"+ts1+"'";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
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
         public void recordAssocBillCharges(int a, String b, double c, String d){
            
             try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                      
             
             String query = "INSERT into billchargesbdown(issueID, chargename, chargeamt, chargecomptype, chargebilltype) values("+a+", '"+b+"', "+c+", '"+d+"', 'Association Due')";
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
           }
         }
         
          public void recordWaterBillCharges(int a, String b, double c, String d){
            
             try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                      
             
             String query = "INSERT into billchargesbdown(issueID, chargename, chargeamt, chargecomptype, chargebilltype) values("+a+", '"+b+"', "+c+", '"+d+"', 'Water')";
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
           }
         }
        
         public CachedRowSet getAllHousesOfRes(int a){
                 try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             String query = "SELECT * FROM lots where rid = "+a+"";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
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
         
         public CachedRowSet getAChargesWITHISSUEID(int a){
                try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             String query = "SELECT * FROM billchargesbdown where issueID = "+a+"";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
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
         
           public CachedRowSet getBatchIssueWITHISSUEID(int a){
                try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             String query = "SELECT * FROM billissue where id = "+a+"";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
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
           
           public CachedRowSet getBillAllReservationsWITHLOTID(int a){
                try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             String query = "SELECT * FROM billreserve where lotid = "+a+"";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
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
           public CachedRowSet getBillAllPermitsWITHLOTID(int a){
                try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             String query = "SELECT * FROM billpermits where lotid= "+a+"";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
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
        public CachedRowSet getAllAssBillBatch(){
               try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             String query = "SELECT * FROM billissue where type= 'Assoc'";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
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
        
         public CachedRowSet getAllWatBillBatch(){
               try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             String query = "SELECT * FROM billissue where type= 'Water'";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
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
        
        public CachedRowSet getHouseWITHLOTID(int a){
            try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             String query = "SELECT * FROM lots where lid= "+a+"";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
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
        
        public CachedRowSet getBillWITHBID(int a){
            try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             String query = "SELECT * FROM billresident where bid= "+a+"";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
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
        
        public CachedRowSet getAllBillsWITHISSUEID(int a){
            try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             String query = "SELECT * FROM billresident where issueID = "+a+"";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
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
                
        
        
        public int getBillIDWITHRESLOTISSUEID(int a, int b, int c){
            try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             
             String query = "SELECT * FROM billresident where lotID = "+a+" and residentID = "+b+" and issueID = "+c+"";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();
                crset.next();
                
        int lol = 0;
        lol = crset.getInt("bid");
        
        
             return lol;
         } catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return 0;
           }
        }
        
        public void updateBillBalanceWITHBILLID(int a, double b){
              try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
             
        
             String query = "UPDATE billresident set balance = "+b+" where bid = "+a+"";
             stmt.executeUpdate(query);
          
	
	     
		stmt.close();
		conti.close();

            
         } catch (Exception e)
           {           
                
           	System.out.println("sira update status" + e.getMessage());
                
           }
        }
        
        public Vector<Integer> getAllHousesInBldg(int a){
              try
         {
             con6 = DriverManager.getConnection (strconnection);
             Statement stmt = con6.createStatement();
           
             String query = "SELECT * FROM lots where phblid = "+a+"";
             ResultSet rs = stmt.executeQuery(query);
	
	     CachedRowSet crset = new CachedRowSet();
		crset.populate(rs);
		rs.close();
		stmt.close();
		con6.close();     
              
            Vector<Integer> v = new Vector<Integer>();
                  
                  if(crset.size() > 0){
                    while (crset.next()){                       
                        v.add(crset.getInt("lid"));                         
                    }
                    
                  }
                  
                  
                  return v;
             }
             catch (Exception e)
           {            		
           	System.out.println(e.getMessage());
                return null;
           }
        }
        
        public int compareYears(int a, java.util.Date frresdate1){
             int dt1 = 0; 
            try
        { 
            Calendar myCalendar = Calendar.getInstance();
        
            
            int frresyear2=0;          
            
            myCalendar.setTime(frresdate1);
             frresyear2 = myCalendar.get(Calendar.YEAR);
                       
           
            
            if(a==frresyear2)
                dt1 = 1;
            
             return dt1;
              }
             catch(Exception e)
        {
            System.out.println("tae" + e.getMessage());
            return 0;
        }
      
        }
        
        public void addPermit(int a, java.util.Date b, int c, String d, int e, double f, String g, int h){
                 try
         {
             conti = DriverManager.getConnection (strconnection);
             Statement stmt = conti.createStatement();
                   java.sql.Timestamp ts1 = new java.sql.Timestamp(b.getTime());     
             
             String query = "INSERT into billpermits(permitID, permitDate, residentID, residentName, familyHeadID, permitfee, permitName, lotid) values("+a+", '"+ts1+"', "+c+", '"+d+"', "+e+", "+f+", '"+g+"', "+h+")";
             stmt.executeUpdate(query);
		     
		stmt.close();
		conti.close();

         } catch (Exception ez)
           {            		
           	System.out.println(ez.getMessage());
           }
        }
                
      
}

