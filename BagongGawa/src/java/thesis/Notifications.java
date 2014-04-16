/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package thesis;

import java.sql.*;
import sun.jdbc.rowset.*;
import java.lang.*;
import java.util.*;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.text.ParseException;
/**
 *
 * @author ace-dlsu
 */
public class Notifications {
    
    Connection con, con2;
     String url, uname, pword, strconnection;

     public Notifications()
     {            
      try { 
             Class.forName("com.mysql.jdbc.Driver").newInstance();

             strconnection = "jdbc:mysql://localhost/thesis?user=root&password=root";

            
         } catch (Exception e)
            {    System.out.println("Resident() " + e.getMessage());
            }
     }
     /*
     public void sendNotification(int resid, String msg)
     {
         
     }*/

}
