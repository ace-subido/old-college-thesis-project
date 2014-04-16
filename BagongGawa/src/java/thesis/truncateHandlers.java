package thesis;

import java.sql.*;
import sun.jdbc.rowset.*;
import java.lang.*;
import java.util.*;
/**
 *
 * @author Jose Dalino
 */
public class truncateHandlers {
     Connection con, con2;
     String url, uname, pword, strconnection;
     
     public truncateHandlers()
     {            
      try { 
             Class.forName("com.mysql.jdbc.Driver").newInstance();

             strconnection = "jdbc:mysql://localhost/thesis?user=root&password=root";

            
         } catch (Exception e)
            {    System.out.println("Resident() " + e.getMessage());
            }
     }
     
     public void truncate(String p)
     {
        
         try
         {
              con = DriverManager.getConnection (strconnection);
             Statement stmt = con.createStatement();

             String query = "TRUNCATE TABLE "+p+"";
             
             stmt.executeUpdate(query);

		stmt.close();
		con.close();
             
            
         } catch (Exception e)
           {    
           		
           		System.out.println(e.getMessage());
           		                
           }
     }	
     

}
