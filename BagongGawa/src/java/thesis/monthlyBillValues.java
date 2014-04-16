/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package thesis;
import java.sql.*;
import sun.jdbc.rowset.*;
import java.lang.*;

/**
 *
 * @author Jose Dalino
 */
public class monthlyBillValues {
    
     Connection con, con2;
     String url, uname, pword, strconnection;
     
     public monthlyBillValues()
     {
         try { 
             Class.forName("com.mysql.jdbc.Driver").newInstance();

             strconnection = "jdbc:mysql://localhost/thesis?user=root&password=root";

            
         } catch (Exception e)
            {    System.out.println("Resident() " + e.getMessage());
            }
     }
     
     public void insertIntoMonthlyBillValues(int totComMeter, int totMaynilad, int masterTax, int garbage, int security, int salary, int bId)
     {
         try
         {
              con = DriverManager.getConnection (strconnection);
             Statement stmt = con.createStatement();

             String query = "INSERT into monthlybillvalues (mnBill, comMeter, masterTax, security, garbage, salary, billBatch) values("+totMaynilad+", "+totComMeter+" , "+masterTax+", "+security+", "+garbage+", "+salary+", "+bId+")";
             
             stmt.executeUpdate(query);
            
		stmt.close();
		con.close();
                
            
         } 
        
         catch (Exception e)
           {    
           		
           	System.out.println(e.getMessage());
           	
           } 
     }
     public void updateMonthlyBillValues(int totComMeter, int totMaynilad, int masterTax, int garbage, int security, int salary, int bId)
     {
     
     	try
        {
        	
        	 con = DriverManager.getConnection (strconnection);

             Statement stmt = con.createStatement();
             String query = "Update monthlybillvalues set mnBill = "+totMaynilad+", comMeter = "+totComMeter+", masterTax="+masterTax+", security="+security+", garbage="+garbage+", salary="+salary+" where billBatch = '"+bId+"' ";
             
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
