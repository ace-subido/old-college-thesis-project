package thesis;
import java.sql.*;
import sun.jdbc.rowset.*;
import java.lang.*;
import java.util.*;

public class Newsletter {
	String strconnection;
	
	public Newsletter(){
		try { 
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            strconnection = "jdbc:mysql://localhost/thesis?user=root&password=root";
        }catch (Exception e){
        	System.out.println("Resident() " + e.getMessage());
        }
	}
	
	public void SubmitNewsletter(String author, String subject, String content, String status){
		Connection con;
		Newsletter news = new Newsletter();
                ResultSet rs;
                int newID;
		try{
			con = DriverManager.getConnection (strconnection);
                        Statement stmt = con.createStatement();
                        java.util.Date dt = new java.util.Date();
                        java.sql.Timestamp ts1 = new java.sql.Timestamp(dt.getTime());    
                        rs = stmt.executeQuery("SELECT MAX(entryID) 'max'  FROM NEWSLETTER");
                        rs.first();
                        newID = rs.getInt("max");
                        newID++;
                        String query = "INSERT INTO NEWSLETTER(ENTRYID, AUTHOR, CONTENT, NLSTATUS, TIME, SUBJECT) VALUES('"+newID+"', '"+author+"', '"+content+"', '"+status+"', '"+ts1+"', '"+subject+"')";
                        stmt.executeUpdate(query);
                        rs.close();
                        stmt.close();
               }catch(Exception e){
                                    System.out.println("Newsletter submit error" + e.getMessage());
               }
       }
	
	public CachedRowSet getNewsLetters(){
                Connection con;
                
		try{
			con = DriverManager.getConnection(strconnection);
			Statement stmt = con.createStatement();			
			String query = "SELECT * FROM NEWSLETTER WHERE nlstatus='pending'";
			ResultSet rs = stmt.executeQuery(query);
                        CachedRowSet crs = new CachedRowSet();
			crs.populate(rs);
			rs.close();
			con.close();
			stmt.close();
                        return crs;
		}catch(Exception e){
			System.out.println("Error getting resident " + e.getMessage());
		}
                return null;
	}

	public String getResidentName(String id){
		Connection con;
		String fullname = "";
		String fname = "";
		String lname = "";
		 int nId = Integer.parseInt(id);
                 
		try{
			con = DriverManager.getConnection(strconnection);
			Statement stmt = con.createStatement();
			
			String query = "SELECT FIRSTNAME, LASTNAME FROM RESIDENT WHERE RESID='"+id+"'";
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()){
				fname = rs.getString("FIRSTNAME");
				lname = rs.getString("LASTNAME");
			}
			fullname = lname + ", " + fname;
			rs.close();
			con.close();
			stmt.close();
		}catch(Exception e){
			System.out.println("Error getting resident " + e.getMessage());
		}
		return fullname;
	}
	
	public int getID(){
		Connection con;		
		int count = 0;
		
		try{
                    con = DriverManager.getConnection (strconnection);
                    Statement stmt = con.createStatement();     
                    String query = "SELECT * FROM NEWSLETTER";
                    ResultSet rs = stmt.executeQuery(query);
                    CachedRowSet crs = new CachedRowSet();
                    crs.populate(rs);
                    count = crs.size();
                    rs.close();
                    stmt.close();
                }catch(Exception e){             
                    System.out.println("Error newsletter db count " + e.getMessage());
                }
                return count + 1;
       }
        public void setApproveReject(int id, boolean approve){
            Connection con;		
		
		
		try{
                    con = DriverManager.getConnection (strconnection);
                    Statement stmt = con.createStatement();     
                    String query = "UPDATE NEWSLETTER SET NLSTATUS = ";
                    if(approve)
                        query += "'approved'";
                    else
                        query += "'rejected'";
                    query += " WHERE entryID = " + Integer.toString(id);
                    System.out.println(query);
                    stmt.executeUpdate(query);
                    stmt.close();
                }catch(Exception e){             
                    System.out.println("Error newsletter db count " + e.getMessage());
                }
            
        }
        public CachedRowSet getNewsLetter(String subject){
		CachedRowSet crs = null;
                Connection con;
		try{
                        crs = new CachedRowSet();
			con = DriverManager.getConnection(strconnection);
			Statement stmt = con.createStatement();			
			String query = "SELECT * FROM NEWSLETTER WHERE SUBJECT='"+subject+"'";
			ResultSet rs = stmt.executeQuery(query);
			crs.populate(rs);
			rs.close();
			con.close();
			stmt.close();
		}catch(Exception e){
			System.out.println("Error getting content " + e.getMessage());
			return crs;
		}
		return crs;
	}
        
        public CachedRowSet getNewsLetter(int entryID){
		CachedRowSet crs = null;
                Connection con;
		try{
                        crs = new CachedRowSet();
			con = DriverManager.getConnection(strconnection);
			Statement stmt = con.createStatement();			
			String query = "SELECT * FROM NEWSLETTER WHERE entryID='"+entryID+"'";
			ResultSet rs = stmt.executeQuery(query);
			crs.populate(rs);
			rs.close();
			con.close();
			stmt.close();
		}catch(Exception e){
			System.out.println("Error getting content " + e.getMessage());
			return crs;
		}
		return crs;
	}

	public CachedRowSet viewARNewsletters(){
		CachedRowSet crs = null;
		   Connection con;
		try{
                        crs = new CachedRowSet();
			con = DriverManager.getConnection(strconnection);
			Statement stmt = con.createStatement();			
			String query = "SELECT AUTHOR, SUBJECT, NLSTATUS FROM NEWSLETTER WHERE NLSTATUS='REJECTED' OR NLSTATUS='APPROVED'";
			ResultSet rs = stmt.executeQuery(query);
			crs.populate(rs);
			rs.close();
			con.close();
			stmt.close();
		}catch(Exception e){
			System.out.println("Error getting resident " + e.getMessage());
			return crs;
		}
		return crs;
	
	}
        
        public CachedRowSet getResidentEmails(){
            CachedRowSet crs = null;
            Connection con;
            try{
                        crs = new CachedRowSet();
			con = DriverManager.getConnection(strconnection);
			Statement stmt = con.createStatement();			
			String query = "SELECT EMAILADD FROM RESIDENT";
			ResultSet rs = stmt.executeQuery(query);
			crs.populate(rs);
			rs.close();
			con.close();
			stmt.close();
		}catch(Exception e){
			System.out.println("Error getting content " + e.getMessage());
			return crs;
		}
		return crs;
        }
}
