package thesis;

import java.sql.*;
import sun.jdbc.rowset.*;
import java.lang.*;
import java.util.*;

public class Pao
{
    Connection con, con2, con3, con4, con5;
    String url, uname, pword, strconnection;
    
    public Pao()
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
    
    public void updateResInfo(String LastName, String FirstName, String Sex, String Address, String HouseNum, String EmailAdd, String UserType, String Password, String Username, String Status, int a)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "Update resident set EmailAdd = '"+EmailAdd+"', Password = '"+Password+"', Username = '"+Username+"', UserType = '"+UserType+"', FirstName = '"+FirstName+"', LastName = '" + LastName + "', HouseNum = "+HouseNum+", Address = '"+Address+"', Sex = '"+Sex+"', Status = '"+Status+"' where ResId=" + a + "";

            stmt.executeUpdate(query);

            stmt.close();
            con.close();
        } 
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
        }
    }
    
    public void addSubAccount(String LastName, String FirstName, int FamId, String Sex, String Address, String HouseNum, String EmailAdd, String StatInFam, String UserType, String Password, String Username, String Status)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "INSERT into resident (EmailAdd, StatInFam, FamId, Password, Username, UserType, FirstName, LastName, HouseNum, Address, Sex, Status) values('"+EmailAdd+"','"+StatInFam+"', "+FamId+", '"+Password+"' ,'"+Username+"', '"+UserType+"', '"+FirstName+"', '"+LastName+"', "+HouseNum+", '"+Address+"', '"+Sex+"', '"+Status+"')";
             
            stmt.executeUpdate(query);
            stmt.close();
            con.close();
        }
        catch (Exception e)
        {    
            System.out.println(e.getMessage());
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
    
    public void addHeadAccount(String LastName, String FirstName, String Sex, String Address, String HouseNum, String EmailAdd, String StatInFam, String UserType, String Password, String Username, String Status)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "INSERT into resident (EmailAdd, StatInFam, Password, Username, UserType, FirstName, LastName, HouseNum, Address, Sex, Status) values('"+EmailAdd+"', '"+StatInFam+"', '"+Password+"', '"+Username+"', '"+UserType+"', '"+FirstName+"', '"+LastName+"', "+HouseNum+", '"+Address+"', '"+Sex+"', '"+Status+"')";

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
    
    public CachedRowSet getResId(String LastName, String FirstName)
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT ResId FROM resident WHERE LastName='" + LastName + "' and FirstName='"+FirstName+"' ";
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
      
    public CachedRowSet getVillageInfo()
    {
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

            return crset;
        } 
        catch (Exception e)
        {
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    public void addPoll(String pollname, String status)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "INSERT into pollstable (Pollname,Pollstatus) values ('"+pollname+"','"+status+"')";

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
     
    public int getPollId(String Pollname)
    {    
        int i=0;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT Pollid FROM pollstable WHERE Pollname='"+Pollname+"' ";
            ResultSet rs = stmt.executeQuery(query);
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();

            while(crset.next())
            {
                i = crset.getInt("Pollid");
            }
            return i;
        } 
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return 0;
        }
    }
     
    public void addPollChoice(int pollid, String pollchoicename)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "INSERT into pollchoices (Pollid, pollchoicename) values ("+pollid+", '"+pollchoicename+"')";
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
    
    public CachedRowSet getPoll()
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM pollstable";
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
     
    public CachedRowSet getSpecificPoll(int Pollid)
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM pollstable where Pollid='"+Pollid+"'";
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

    public CachedRowSet getPollChoices(int Pollid)
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM pollchoices WHERE Pollid="+Pollid+"";
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

    public CachedRowSet checkPollStatus(int Pollid)
    {     
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT Pollstatus FROM pollstable WHERE Pollid="+Pollid+"";
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
     
    public void changePollStatus(int Pollid, String status)
    {  
        if(status.equals("closed"))
        {
            try
            {
                con = DriverManager.getConnection (strconnection);
                Statement stmt = con.createStatement();
                String query = "Update pollstable set Pollstatus = 'open' where Pollid="+Pollid+"";
                stmt.executeUpdate(query);
                stmt.close();
                con.close();
            }
            catch (Exception e)
            {            		
                System.out.println(e.getMessage());
            }
        }
        else
        {
            try
            {
                con = DriverManager.getConnection (strconnection);
                Statement stmt = con.createStatement();
                String query = "Update pollstable set Pollstatus = 'closed' where Pollid="+Pollid+"";
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
     
    public int getPollChoiceId(String Pollname,int Pollid)
    {    
        int i=0;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT pollchoicesID FROM pollchoices WHERE pollchoicename='"+Pollname+"' AND Pollid= "+Pollid+"";
            ResultSet rs = stmt.executeQuery(query);
            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            while(crset.next())
            {
                i = crset.getInt("pollchoicesID");
            }
            return i;
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return 0;
        }
    }
      
    public void addToVoteTable(int residentId, int pollchoiceID, int Pollid)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "INSERT into votetable (residentID, pollchoiceID, pollID) values ("+residentId+", "+pollchoiceID+", "+Pollid+")";

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
      
    public int getVoteNum(int pollchoiceID)
    {    
        int i=0;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            String query = "SELECT votenum FROM pollchoices WHERE pollchoicesID='"+pollchoiceID+"' ";
            ResultSet rs = stmt.executeQuery(query);

            CachedRowSet crset = new CachedRowSet();
            crset.populate(rs);
            rs.close();
            stmt.close();
            con.close();
            while(crset.next())
            {
                i = crset.getInt("votenum");
            }
            return i;
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return 0;
        }
    }
     
    public void updateVoteNum(int votenum, int pollchoiceID)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "Update pollchoices set votenum= " + votenum + " where pollchoicesID=" + pollchoiceID + "";

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
     
    public CachedRowSet getVoteTable(int pollID, int residentID)
    {             
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM votetable WHERE pollID="+pollID+" AND residentID="+residentID+"";
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
     
    public int getMaxDays()
    {     
        int maggot=0;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT * FROM pollssettings";
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
                    maggot = crset.getInt("days");
                }    
            }
            return maggot;
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage());
            return 0;
        }
    }
     
    public CachedRowSet checkPollUnique(int Pollid, String Pollname)
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT Pollname FROM pollstable where Pollid="+Pollid+" and Pollname='"+Pollname+"'";
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
    
    public int getLatestResId()
    {    
        int temp=0;
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT ResId FROM resident";
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
                    temp+=1;
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
     public void adminAddNewHeadAccount(String UserType, String StatInFam, String Username, String Password, String EmailAdd, String LastName, String FirstName, String Status)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "INSERT into resident (UserType, StatInFam, Username, Password, EmailAdd, LastName, FirstName, Status) values ('"+UserType+"', '"+StatInFam+"', '"+Username+"', '"+Password+"','"+EmailAdd+"', '"+LastName+"', '"+FirstName+"', '"+Status+"')";

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
     
    
    public CachedRowSet getBlFl(int phblid)
    {
        
        try
        {
            CachedRowSet crset = new CachedRowSet();
            con2 = DriverManager.getConnection (strconnection);
            Statement stmt = con2.createStatement();

            String query = "SELECT DISTINCT blflid FROM lots where phblid="+phblid+"";
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
    public CachedRowSet getlotNum(int blflid)
    {
        
        try
        {
            CachedRowSet crset = new CachedRowSet();
            con2 = DriverManager.getConnection (strconnection);
            Statement stmt = con2.createStatement();

            String query = "SELECT DISTINCT lotNum FROM lots where phblid="+blflid+"";
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
    public void addResToLot(int phbl, int blfl, int ltrm, int Id)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "Update lots set rid= "+Id+", Status='Occupied' where phblid="+phbl+" and blflid="+blfl+" and lotNum="+ltrm+" ";

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
    
    public void updateResAddressAndLotId1(String newAddress,int LotID,int Id)
    {
         try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "UPDATE resident SET Address= '"+newAddress+"', LotID="+LotID+" WHERE ResId = "+Id+" ";

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
     public void updateResAddressAndLotId2(String newAddress,int LotID,int Id)
    {
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "UPDATE resident SET Address= '"+newAddress+"', LotID="+LotID+" WHERE ResId = "+Id+" ";

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
     public CachedRowSet getStatInFam(int ResId)
    {    
        try
        {
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();

            String query = "SELECT StatInFam FROM resident WHERE ResId="+ResId+"";
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