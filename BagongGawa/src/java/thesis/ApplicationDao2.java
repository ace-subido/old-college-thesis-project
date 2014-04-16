package thesis;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.sql.*;

public class ApplicationDao2
{
    Connection con, con2, conti, con5;
    String url, uname, pword, strconnection;
    
    public ApplicationDao2()
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
    
    public String uploadNameInfo(ArrayList<NameInfoData2> list) throws SQLException
    {
        StringBuffer sb = new StringBuffer();
        Jem jem = new Jem();
        String vType = jem.getVillageType();
        String hay ="";
        
        try
        {
            int i = 1;
            sb.append("INSERT INTO resident (`ResId`,`EmailAdd` , `StatInFam`, `FamId`, `Password`, `Username`, `UserType`, `FirstName`, `LastName`, `HouseNum`, `Address`, `LotId`, `Sex`, `Status`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            
            con = DriverManager.getConnection (strconnection);
            
            PreparedStatement ps = con.prepareStatement(sb.toString());
            
            Iterator<NameInfoData2> iter =list.iterator();

            while(iter.hasNext())
            {
                NameInfoData2 data = iter.next();
                if(isExisting(data.getresId()) == false)
                {	
                    int lot = (int) Double.parseDouble(data.getlotnum());
                    int block = (int) Double.parseDouble(data.getblock());
                    int phase = (int) Double.parseDouble(data.getphase());
                    String houseNumber = data.gethouse();
                    String realNumber = houseNumber.substring(0, houseNumber.indexOf("."));
                    ps.setInt(i++, Integer.parseInt(data.getresId()));
                    ps.setString(i++, data.getemail());
                    ps.setString(i++, "head");
                    ps.setInt(i++, Integer.parseInt(data.getresId()));
                    ps.setString(i++, "welcome");
                    ps.setString(i++, data.getresId()+data.getfirst());
                    ps.setString(i++, data.getType());
                    ps.setString(i++, data.getfirst());
                    ps.setString(i++, data.getlast());
                    ps.setString(i++, realNumber);
                    if(vType.equals("phase"))
                        ps.setString(i++, "Lot "+lot+" Block "+block+" Phase "+phase);
                    else
                        ps.setString(i++, "Unit "+lot+" Floor "+block+" Building "+phase);
                    ps.setInt(i++, jem.getLotId(lot, block, phase));
                    ps.setString(i++, data.getsex());
                    ps.setString(i++, "Enabled");
                    ps.addBatch();
                    i = 1;
                    hay = sb.toString();
                }
            }			
            ps.executeBatch();
            ps.clearBatch();

            ps.close();
            con.close();
        }
        catch (SQLException e)
        {
            hay = e.getMessage();    
            throw e;
                
        }
        return hay;
    }
	
    public boolean isExisting(String hId) throws SQLException
    {
        StringBuffer sb = new StringBuffer();
        boolean check = false;
        int houseId = Integer.parseInt(hId);
        try
        {
            con5 = DriverManager.getConnection (strconnection);
            sb.append("SELECT * FROM resident WHERE ResId = '"+houseId+"'");

            PreparedStatement ps = con5.prepareStatement(sb.toString());
            ResultSet rs = ps.executeQuery();	
            System.out.println(sb);
            while(rs.next())
                check = true;

            ps.close();
            rs.close();
            con5.close();
        }
        catch (SQLException e)
        {
            throw e;
        } 

        return check;
    }
    
    public void updateLotWithResId(int lotNum, int block, int phase, int resid)
    {
       try
        {
            conti = DriverManager.getConnection (strconnection);
            Statement stmt = conti.createStatement();
            
            String query = "Update lots set rid = "+resid+", status='Occupied' where lotNum ="+lotNum+" and blflid="+block+" and phblid="+phase+"";
            stmt.executeUpdate(query);
            stmt.close();
            conti.close();
        }
        catch (Exception e)
        {            		
            System.out.println(e.getMessage() + " updatelotwithresid");
        }
   }
    
    public void addHead(int headid, int resid) throws SQLException
    {
        StringBuffer sb = new StringBuffer();
        int i = 1;
        try
        {
            con2 = DriverManager.getConnection (strconnection);
            sb.append("INSERT INTO residenthead(`FamId`,`ResId`) VALUES (?,?)");

            PreparedStatement ps = con2.prepareStatement(sb.toString());
            ps.setInt(i++, headid);
            ps.setInt(i++, resid);
            ps.addBatch();
            ps.executeBatch();
            ps.clearBatch();
            ps.close();
            con2.close();
        }
        catch (SQLException e)
        {
            throw e;
        } 
    }
}
