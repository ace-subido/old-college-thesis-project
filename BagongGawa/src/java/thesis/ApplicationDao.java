package thesis;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import sun.jdbc.rowset.*;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.sql.*;

public class ApplicationDao
{
    Connection con, con2;
    String url, uname, pword, strconnection;
    
    public ApplicationDao()
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
    
    public void uploadNameInfo(ArrayList<NameInfoData> list) throws SQLException
    {
        StringBuffer sb = new StringBuffer();
        StringBuffer sb2 = new StringBuffer();
        Jem jem = new Jem();
        int lotsTotal = jem.getTotalLots();
         lotsTotal++;       
        int returnVal = 0;
        try
        {
            int i = 1;
            //sb.append("INSERT INTO lots (`lotarea` , `status`, 'blflid', 'phblid', 'lotNum', 'address') VALUES (?,?,?,?,?,?)");
           // sb2.append("UPDATE setup SET lotarea = ?, status = ? WHERE houseId = ?");
            
            con = DriverManager.getConnection (strconnection);
            Statement stmt = con.createStatement();
            //con2 = DriverManager.getConnection (strconnection);
            //PreparedStatement ps = con.prepareStatement(sb.toString());
            //PreparedStatement ps2 = con2.prepareStatement(sb2.toString());
            Iterator<NameInfoData> iter =list.iterator();

                while(iter.hasNext())
                {
                        NameInfoData data = iter.next();
                        
                        
                        if(isExisting(data.gethouseId()) == false)
                       {	
                            String query = "INSERT into lots(lid, lotarea, status, phblid, blflid, lotNum, address) values("+lotsTotal+", "+(int)Double.parseDouble(data.getlotarea())+", '"+data.getstatus()+"', "+(int)Double.parseDouble(data.getphbl())+", "+(int)Double.parseDouble(data.getblfl())+", "+(int)Double.parseDouble(data.getloun())+", '"+data.getaddress()+"')";
                            stmt.executeUpdate(query);
                           /** //ps.setInt(i++, Integer.parseInt(data.gethouseId()));
                            ps.setInt(i++, (int)Double.parseDouble(data.getlotarea()));
                            ps.setString(i++, data.getstatus());
                            ps.setInt(i++, (int)Double.parseDouble(data.getblfl()));
                            ps.setInt(i++, (int)Double.parseDouble(data.getphbl()));
                            ps.setInt(i++, (int)Double.parseDouble(data.getloun()));
                            ps.setString(i++, data.getaddress());
                            ps.addBatch();
                            i = 1;*/
                        } 
                        /*
                        else
                        {
                            ps2.setDouble(i++, Double.parseDouble(data.getlotarea()));
                            //ps2.setString(i++, data.getaddress());
                            ps2.setString(i++, data.getstatus());
                            ps2.setInt(i++, Integer.parseInt(data.gethouseId()));
                            ps2.addBatch();
                            i = 1;
                        }
                         * */
                        returnVal = 1;
                }			
                //ps.executeBatch();
                //ps2.executeBatch();
               // ps.clearBatch();
                //ps2.clearBatch();

                //ps.close();
                //ps2.close();
                stmt.close();
                con.close();
                
            }
            catch (Exception e)
            {
                    System.out.println(e.getMessage() + "applicationDao");
            }
            
	}
	
	public boolean isExisting(String hId) throws SQLException
	{
            StringBuffer sb = new StringBuffer();
            boolean check = false;
            CachedRowSet crset = new CachedRowSet();
            int houseId = Integer.parseInt(hId);
            
            try
            {
                con2 = DriverManager.getConnection (strconnection);
            Statement stmt = con2.createStatement();
            String query = "SELECT * FROM lots where lid = "+houseId+"";
            ResultSet rs = stmt.executeQuery(query);
            
            crset.populate(rs);
            if(crset.size()>0)
            {
                check = true;
            }
            
            rs.close();
            stmt.close();
            con2.close();
            }
            catch (SQLException e)
            {
                throw e;
            } 

            return check;
	}
}
