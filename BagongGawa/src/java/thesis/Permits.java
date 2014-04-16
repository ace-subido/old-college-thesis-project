package thesis;
 
import java.sql.*;
import sun.jdbc.rowset.*;
import java.lang.*;
import java.text.*;
        
public class Permits
{
    Connection con, con2;
    String url, uname, pword, strconnection;

    public Permits()
    {            
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            strconnection = "jdbc:mysql://localhost/thesis?user=root&password=root";
        }
        catch(Exception e)
        {
            System.out.println("Permits.java constructor " + e.getMessage());
        }
    }
    
    public CachedRowSet getPermit()
    {
        String status = "Yes";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            
            String query = "SELECT * FROM permits WHERE Status = '"+status+"' ORDER BY permitName";
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
            System.out.println("Permits.java method getPermit " + e.getMessage());
            return null;
        }
    }    
    
    public CachedRowSet getPendingPermit()
    {
        String stat = "Pending";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            
            String query = "SELECT * FROM permitresident WHERE Status= '"+stat+"' ORDER BY field1 ASC";
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
            System.out.println("Permits.java method getResidentViewPermits " + e.getMessage());
            return null;
        }
    }
    
    public CachedRowSet getFieldDetails(String pid)
    {
        int id = Integer.parseInt(pid);
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            
            String query = "SELECT * FROM permits WHERE pId = '"+id+"'";
            ResultSet rs = stmt.executeQuery(query);
	
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            crset.next();
            return crset;
        }
        catch (Exception e)
        {
            System.out.println("Permits.java method getFieldDetails " + e.getMessage());
            return null;
        }
    }
    
    public CachedRowSet getCheckDetails(String pid)
    {
        int id = Integer.parseInt(pid);
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            
            String query = "SELECT * FROM permitcheck WHERE pId = '"+id+"'";
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
            System.out.println("Permits.java method getCheckDetails " + e.getMessage());
            return null;
        }
    }
    
    public CachedRowSet getResidentPermitDetail(String id)
    {
        int pid = Integer.valueOf(id);
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            
            String query = "SELECT * FROM permitresident WHERE pID = '"+pid+"'";
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
            System.out.println("Permits.java method getResidentViewPermits " + e.getMessage());
            return null;
        }
    }
    
    public void updatePermitStatus(String newStatus, String perID, java.util.Date appliDate, java.util.Date approvedDate, String fieldname, String remarks, String path, java.util.Date expDate, String expStr)
    {
        int permitID = Integer.parseInt(perID);
        java.sql.Timestamp appDate = new java.sql.Timestamp(approvedDate.getTime());
        java.sql.Timestamp applicationDate = new java.sql.Timestamp(appliDate.getTime());
        java.sql.Timestamp years = new java.sql.Timestamp(expDate.getTime());
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "";
            if(fieldname.equalsIgnoreCase("permitApprove"))
                query = "Update permitresident set field1 ='"+applicationDate+"', Status= '" + newStatus + "', permitApprove = '"+appDate+"', path='"+path+"', expiration='"+expStr+"',years='"+years+"' where pID='"+permitID+"'";
            else if (fieldname.equalsIgnoreCase("permitReject"))
                query = "Update permitresident set field1 ='"+applicationDate+"', Status= '" + newStatus + "', permitReject = '"+appDate+"', remark = '"+remarks+"', path='"+path+"' where pID='"+permitID+"'";
            if(fieldname.equalsIgnoreCase("pending"))
                query = "Update permitresident set field1 ='"+applicationDate+"', Status= '" + newStatus + "', permitApprove = '"+appDate+"', path='"+path+"' where pID='"+permitID+"'";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {  		
            System.out.println("Permits.java method updatePermitStatus() " + e.getMessage());
        }    	
    }
    
    public CachedRowSet getTemplate()
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            
            String query = "SELECT * FROM permittemplate";
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
            System.out.println("Permits.java method getPermitDetails " + e.getMessage());
            return null;
        }
    }
    
    public CachedRowSet getTemplateDetails(String pid)
    {
        int id = Integer.parseInt(pid);
        
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            
            String query = "SELECT * FROM permittemplate WHERE pId = '"+id+"'";
            ResultSet rs = stmt.executeQuery(query);
	
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            crset.next();
            return crset;
        }
        catch (Exception e)
        {
            System.out.println("Permits.java method getPermitDetails " + e.getMessage());
            return null;
        }
    }
    
    public boolean checkIsExisting(String permitName)
    {
        boolean isExist = false;
        String query="", status = "No";
        CachedRowSet crset;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
                
            query = "SELECT * FROM permits WHERE permitName = '"+permitName+"' AND Status = '"+status+"'";
            ResultSet rs = stmt.executeQuery(query);            
            crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();            
            stmt.close();
            con.close();
            if (crset.size() > 0)
                isExist = true;
        }
        catch (Exception e)
        {
            System.out.println("Permits.java method AddPermitFields " + e.getMessage());
        }
        
        return isExist;        
    }
    
    public boolean checkIsExisting2(String permitName)
    {
        boolean isExist = false;
        String query="", status = "Yes";
        CachedRowSet crset;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
                
            query = "SELECT * FROM permits WHERE permitName = '"+permitName+"' AND Status = '"+status+"'";
            ResultSet rs = stmt.executeQuery(query);            
            crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();            
            stmt.close();
            con.close();
            if (crset.size() > 0)
                isExist = true;
        }
        catch (Exception e)
        {
            System.out.println("Permits.java method AddPermitFields " + e.getMessage());
        }
        
        return isExist;        
    }
    
    public void AddPermit(String permitname, String check1, String check2, String check3, String check4, String check5, String check6, String check7, String check8, String check9, String check10, String check11, String check12, String check13, String check14, String check15, String check16, String check17, String check18, String check19, String check20, boolean check)
    {
        check1 = "on";
        String query="";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            if (check==false)
                query = "INSERT INTO permitCheck (permitName,field1,field2,field3, field4, field5, field6, field7, field8, field9, field10, field11, field12, field13, field14, field15, field16, field17, field18, field19, field20) VALUES ('"+permitname+"', '"+check1+"','"+check2+"', '"+check3+"','"+check4+"', '"+check5+"','"+check6+"', '"+check7+"','"+check8+"', '"+check9+"','"+check10+"', '"+check11+"','"+check12+"', '"+check13+"','"+check14+"', '"+check15+"','"+check16+"', '"+check17+"','"+check18+"', '"+check19+"','"+check20+"')";
            else
                query = "UPDATE permitCheck SET field1 = '"+check1+"', field2 = '"+check2+"', field3 = '"+check3+"', field4 = '"+check4+"',field5 = '"+check5+"', field6 = '"+check6+"', field7 = '"+check7+"', field8 = '"+check8+"',field9 = '"+check9+"', field10 = '"+check10+"', field11 = '"+check11+"', field12 = '"+check12+"',field13 = '"+check13+"', field14 = '"+check14+"', field15 = '"+check15+"', field16 = '"+check16+"',field17 = '"+check17+"', field18 = '"+check18+"', field19 = '"+check19+"', field20 = '"+check20+"' WHERE permitName = '"+permitname+"'";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println("Permits.java method AddPermit " + e.getMessage());
        }
    }
    
    public void AddPermitFields(String permitname, String field1, String field2, String field3, String field4, String field5, String field6, String field7, String field8, String field9, String field10, String field11, String field12, String field13, String field14, String field15, String field16, String field17, String field18, String field19, String field20,boolean check,String rules,String path, String pfee,int years, String rfee)
    {
        field1 = "Date of Application";
        double dfee = Double.parseDouble(pfee);
        double rdfee = Double.parseDouble(rfee);
        String status = "Yes", query="";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            if (check==false)    
                query = "INSERT INTO permits (permitName,field1,field2,field3, field4, field5, field6, field7, field8, field9, field10, field11, field12, field13, field14, field15, field16, field17, field18, field19, field20,Status,Rules,Path,pfee,years,renewfee) VALUES ('"+permitname+"','"+field1+"','"+field2+"','"+field3+"','"+field4+"','"+field5+"','"+field6+"','"+field7+"','"+field8+"','"+field9+"','"+field10+"','"+field11+"','"+field12+"','"+field13+"','"+field14+"','"+field15+"','"+field16+"','"+field17+"','"+field18+"','"+field19+"','"+field20+"','"+status+"','"+rules+"','"+path+"','"+dfee+"','"+years+"','"+rdfee+"')";
            else
                query = "UPDATE permits SET field1 = '"+field1+"', field2 = '"+field2+"', field3 = '"+field3+"', field4 = '"+field4+"',field5 = '"+field5+"', field6 = '"+field6+"', field7 = '"+field7+"', field8 = '"+field8+"',field9 = '"+field9+"', field10 = '"+field10+"', field11 = '"+field11+"', field12 = '"+field12+"',field13 = '"+field13+"', field14 = '"+field14+"', field15 = '"+field15+"', field16 = '"+field16+"',field17 = '"+field17+"', field18 = '"+field18+"', field19 = '"+field19+"', field20 = '"+field20+"', Status = '"+status+"', Rules = '"+rules+"', Path = '"+path+"', pfee='"+dfee+"',years='"+years+"', renewfee='"+rdfee+"' WHERE permitName = '"+permitname+"'";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println("Permits.java method AddPermitFields " + e.getMessage());
        }
    }
    
    public void updatePermitFieldDetails(String name, int permitID, String field1, String field2, String field3, String field4, String field5, String field6, String field7, String field8, String field9, String field10, String field11, String field12, String field13, String field14, String field15, String field16, String field17, String field18, String field19, String field20, String rules, String path, String pfee,int years,String rfee)
    {       
        field1 = "Date of Application";
        double dfee = Double.parseDouble(pfee);
        double rdfee = Double.parseDouble(rfee);
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
           
            String query = "UPDATE permits SET permitName= '"+name+"',field1 = '"+field1+"', field2 = '"+field2+"', field3 = '"+field3+"', field4 = '"+field4+"',field5 = '"+field5+"', field6 = '"+field6+"', field7 = '"+field7+"', field8 = '"+field8+"',field9 = '"+field9+"', field10 = '"+field10+"', field11 = '"+field11+"', field12 = '"+field12+"',field13 = '"+field13+"', field14 = '"+field14+"', field15 = '"+field15+"', field16 = '"+field16+"',field17 = '"+field17+"', field18 = '"+field18+"', field19 = '"+field19+"', field20 = '"+field20+"', Rules = '"+rules+"', Path='"+path+"', pfee='"+dfee+"', years='"+years+"', renewfee='"+rdfee+"' WHERE pID = '"+permitID+"'";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println("Permits.java method updatePermitFieldDetails " + e.getMessage());
        }
    }
    
    public void updatePermitDetails(String name, int permitID, String field1, String field2, String field3, String field4, String field5, String field6, String field7, String field8, String field9, String field10, String field11, String field12, String field13, String field14, String field15, String field16, String field17, String field18, String field19, String field20)
    {
        field1 = "on";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
           
            String query = "UPDATE permitCheck SET permitName= '"+name+"', field1 = '"+field1+"', field2 = '"+field2+"', field3 = '"+field3+"', field4 = '"+field4+"',field5 = '"+field5+"', field6 = '"+field6+"', field7 = '"+field7+"', field8 = '"+field8+"',field9 = '"+field9+"', field10 = '"+field10+"', field11 = '"+field11+"', field12 = '"+field12+"',field13 = '"+field13+"', field14 = '"+field14+"', field15 = '"+field15+"', field16 = '"+field16+"',field17 = '"+field17+"', field18 = '"+field18+"', field19 = '"+field19+"', field20 = '"+field20+"' WHERE pID = '"+permitID+"'";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println("Permits.java method updatePermitDetails " + e.getMessage());
        }
    }
    
    public void deletePermit(int permitID)
    {
        String stat = "No";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
           
            String query = "UPDATE permits SET Status='"+stat+"' WHERE pID = '"+permitID+"'";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println("Permits.java method updatePermitFieldDetails " + e.getMessage());
        }
    }
    
    public CachedRowSet getResidentPermits(String rID)
    {
        int resID = Integer.valueOf(rID);
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            
            String query = "SELECT * FROM permitresident WHERE resID = '"+resID+"' ORDER BY field1 DESC";
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
            System.out.println("Permits.java method getResidentPermits " + e.getMessage());
            return null;
        }
    }
    
    public String getResidentViewCount(int pid)
    {
        int app=0,rej=0,exp=0;
        String stat = "false";
        String count = "";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            
            String query = "SELECT * FROM permitresident WHERE resID = '"+pid+"' AND view='"+stat+"'";
            ResultSet rs = stmt.executeQuery(query);
	
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            if(crset.size() > 0)
                while(crset.next())
                {
                    if(crset.getString("Status").equalsIgnoreCase("Approved"))
                       app++;
                    else if (crset.getString("Status").equalsIgnoreCase("Rejected"))
                       rej++;
                    
                    if(crset.getString("expiration").equalsIgnoreCase("Expired"))
                        exp++;
                }
            count = app + "-" + rej;
            return count;
        }
        catch (Exception e)
        {
            System.out.println("Permits.java method getResidentViewPermits " + e.getMessage());
            return e.getMessage();
        }
    }
    
    public int getResidentExpiration(int pid)
    {
        int exp=0;
        String stat = "Expired";
        String stat2 = "Approved";
        int count = 0;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            
            String query = "SELECT * FROM permitresident WHERE resID = '"+pid+"' AND Status = '"+stat2+"' AND expiration='"+stat+"'";
            ResultSet rs = stmt.executeQuery(query);
	
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            if(crset.size() > 0)
                while(crset.next())
                {                    
                    if(crset.getString("expiration").equalsIgnoreCase("Expired"))
                        exp++;
                }
            count = exp;
            
        }
        catch (Exception e)
        {
            System.out.println("Permits.java method getResidentViewPermits " + e.getMessage());
        }
        return count;
    }
    
    public void changedView(int permitID, java.util.Date appDate, java.util.Date rejDate, java.util.Date approveDate)
    {
        String stat = "True";
        java.sql.Timestamp applicationDate = new java.sql.Timestamp(appDate.getTime());
        java.sql.Timestamp Daterej = new java.sql.Timestamp(rejDate.getTime());
        java.sql.Timestamp Dateapp = new java.sql.Timestamp(approveDate.getTime());
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
           
            String query = "UPDATE permitresident SET field1= '"+applicationDate+"', permitApprove='"+Dateapp+"', permitReject='"+Daterej+"', view='"+stat+"' WHERE pID = '"+permitID+"'";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println("Permits.java method updatePermitFieldDetails " + e.getMessage());
        }
    }
    
    public void addResidentPermit(String permitID,int resID, java.util.Date applicationDate, String field2, String field3, String field4, String field5, String field6, String field7, String field8, String field9, String field10, String field11, String field12, String field13, String field14, String field15, String field16, String field17, String field18, String field19, String field20,String path,double dfee)
    {
        int id = Integer.parseInt(permitID);
        String stat = "Pending", view="false",expstat="none";
        
        java.sql.Timestamp appDate = new java.sql.Timestamp(applicationDate.getTime());
        
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "INSERT INTO permitResident (permitID,resID, field1,field2,field3, field4, field5, field6, field7, field8, field9, field10, field11, field12, field13, field14, field15, field16, field17, field18, field19, field20,Status,path,view,pfee,expiration) VALUES ('"+id+"','"+resID+"', '"+appDate+"','"+field2+"', '"+field3+"','"+field4+"', '"+field5+"','"+field6+"', '"+field7+"','"+field8+"', '"+field9+"','"+field10+"', '"+field11+"','"+field12+"', '"+field13+"','"+field14+"', '"+field15+"','"+field16+"', '"+field17+"','"+field18+"', '"+field19+"','"+field20+"','"+stat+"','"+path+"','"+view+"','"+dfee+"','"+expstat+"')";
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println("Permits.java method addResidentPermit " + e.getMessage());
        }
    }
    
    public CachedRowSet getStaffPermitsSearch(String id, String status)
    {
        int pType = Integer.parseInt(id);
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "";
            if(status.equalsIgnoreCase("Pending"))
                query = "SELECT * FROM permitresident WHERE permitID = '"+pType+"' AND Status= '"+status+"' ORDER BY field1 ASC";
            else
                query = "SELECT * FROM permitresident WHERE permitID = '"+pType+"' AND Status= '"+status+"' ORDER BY field1 DESC";
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
            System.out.println("Permits.java method getResidentViewPermits " + e.getMessage());
            return null;
        }
    }
    
    public CachedRowSet getStaffPermitsSearchAll(String status)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "";
            if(status.equalsIgnoreCase("Pending"))
                query = "SELECT * FROM permitresident WHERE Status= '"+status+"' ORDER BY field1 ASC";
            else
                query = "SELECT * FROM permitresident WHERE Status= '"+status+"' ORDER BY field1 DESC";
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
            System.out.println("Permits.java method getResidentViewPermits " + e.getMessage());
            return null;
        }
    }
    
    public boolean isPending(int id)
    {
        boolean isExist = false;
        String query="", status = "Pending";
        CachedRowSet crset;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
                
            query = "SELECT * FROM permitresident WHERE permitID = '"+id+"' AND Status = '"+status+"'";
            ResultSet rs = stmt.executeQuery(query);            
            crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();            
            stmt.close();
            con.close();
            if (crset.size() > 0)
                isExist = true;
        }
        catch (Exception e)
        {
            System.out.println("Permits.java method AddPermitFields " + e.getMessage());
        }
        
        return isExist;  
    }
    
    public int getLastPermitId()
    {
        int last = 0;
        String query="";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
                
            query = "SELECT pID FROM permitresident";
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next())
                last = rs.getInt("pID");
            rs.close();            
            stmt.close();
            con.close();
            last++;
        }
        catch (Exception e)
        {
            System.out.println("Permits.java method AddPermitFields " + e.getMessage());
        }
        
        return last;  
    }
    
    public void updateResidentPermit(String permitID, java.util.Date applicationDate, String field2, String field3, String field4, String field5, String field6, String field7, String field8, String field9, String field10, String field11, String field12, String field13, String field14, String field15, String field16, String field17, String field18, String field19, String field20,String path,double dfee,java.util.Date expDate)
    {
        int id = Integer.parseInt(permitID);
        String status = "Pending", view="false",expstat="none";
        java.sql.Timestamp appDate = new java.sql.Timestamp(applicationDate.getTime());
        java.sql.Timestamp years = new java.sql.Timestamp(expDate.getTime());
        
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
           
            String query = "UPDATE permitresident SET field1 = '"+appDate+"', field2 = '"+field2+"', field3 = '"+field3+"', field4 = '"+field4+"',field5 = '"+field5+"', field6 = '"+field6+"', field7 = '"+field7+"', field8 = '"+field8+"',field9 = '"+field9+"', field10 = '"+field10+"', field11 = '"+field11+"', field12 = '"+field12+"',field13 = '"+field13+"', field14 = '"+field14+"', field15 = '"+field15+"', field16 = '"+field16+"',field17 = '"+field17+"', field18 = '"+field18+"', field19 = '"+field19+"', field20 = '"+field20+"', Status = '"+status+"', path='"+path+"', view='"+view+"', pfee='"+dfee+"', expiration='"+expstat+"', years= '"+years+"' WHERE pID = '"+id+"'";
            stmt.executeUpdate(query);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println("Permits.java method updatePermitFieldDetails " + e.getMessage());
        }
    }
    
    public void updateExpiration(int perResidentID)
    {
        String expStr = "Expired";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
           
            String query = "UPDATE permitresident SET expiration='"+expStr+"' WHERE pID='"+perResidentID+"'";
            stmt.executeUpdate(query);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println("Permits.java method updatePermitFieldDetails " + e.getMessage());
        }
    }
    
    public CachedRowSet getAllPermitResident()
    {
        String status = "Approved", expStat = "Ongoing";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM permitresident WHERE Status= '"+status+"' AND expiration='"+expStat+"'";
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
            System.out.println("Permits.java method getResidentViewPermits " + e.getMessage());
            return null;
        }
    }
    
    public void norenew(int resPermitID)
    {
        String status="Expired.";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
           
            String query = "UPDATE permitresident SET expiration='"+status+"' WHERE pID='"+resPermitID+"'";
            stmt.executeUpdate(query);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println("Permits.java method updatePermitFieldDetails " + e.getMessage());
        }
    }
    
    public int countLimit(int resPermitID)
    {
        String status = "Approved",status2 = "Pending", query="";
        String expStat="Ongoing", expStat2="none", expStat3="No Expiration";
        int limit = 0;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            query = "SELECT * FROM permitresident WHERE (Status= '"+status+"' OR Status='"+status2+"') AND (expiration='"+expStat+"' OR expiration='"+expStat2+"' OR expiration='"+expStat3+"') AND resID='"+resPermitID+"'";
            ResultSet rs = stmt.executeQuery(query);
            
            while(rs.next())
            {
                limit++;
            }
            rs.close();
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {
            System.out.println("Permits.java method getResidentViewPermits " + e.getMessage());
            
        }
        return limit;
    }
    
    public CachedRowSet getNo(int id)
    {
        String status = "No";
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM permits WHERE Status= '"+status+"' AND pId='"+id+"'";
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
            System.out.println("Permits.java method getResidentViewPermits " + e.getMessage());
            return null;
        }
    }
    
}