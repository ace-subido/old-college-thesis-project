package thesis;

import java.io.FileInputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.sql.*;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

public class Setup
{
    Connection con, con2;
    String url, uname, pword, strconnection;
    
    public Setup()
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
    
    public boolean upload(String filename) throws Exception 
    {
        ApplicationDao dao = new ApplicationDao(); 
        Jem jem  = new Jem();
        String vType = jem.getVillageType();
        int phbl;
        int blfl;
        int lotnum;
        String address = "";
        int ph=0;
        boolean success = false;
        try 
        {  
            if(filename != null)
            {
                
                try
                {   
                    ArrayList<NameInfoData> list = new ArrayList<NameInfoData>();
                    
                    //Inputs the excel file to the POI file system
                    POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream("C://Documents and Settings//Jose Dalino//My Documents//NetBeansProjects//BagongGawa//physical.xls"));
                    
                    HSSFWorkbook wb = new HSSFWorkbook(fs);
                    
                    //Reads the first work sheet of the excel file
                    HSSFSheet sheet = wb.getSheetAt(0);
                    
                    Iterator<HSSFRow> iterator = sheet.rowIterator();
                    
                       
                    //Iterate each row of the excel file
                    int i=1;
                    
                    while(iterator.hasNext())
                    {   
                            
                            NameInfoData data = new NameInfoData();
                            HSSFRow row = iterator.next();
                            
                            //Reads the first column of the file
                            data.sethouseId(String.valueOf(i));
                            
                            HSSFCell cell = row.getCell((short)0);
                            //Reads the second column of the file
                            data.setlotarea(cell.toString());
                            
                            cell = row.getCell((short)1);
                            data.setstatus(cell.toString());
                            
                             cell = row.getCell((short)2);
                            data.setblfl(cell.toString());
                            blfl=(int)Double.parseDouble(cell.toString());
                            
                            cell = row.getCell((short)3);
                            data.setphbl(cell.toString());
                            phbl = (int)Double.parseDouble(cell.toString());
                            
                            cell = row.getCell((short)4);
                            data.setloun(cell.toString());
                            lotnum = (int)Double.parseDouble(cell.toString());
                            if(vType.equals("phase"))
                                address="Lot " +Integer.toString(lotnum)+ " Block " +Integer.toString(blfl)+ " Phase " +Integer.toString(phbl);
                            else
                                address="Unit " +Integer.toString(lotnum)+ " Floor " +Integer.toString(blfl)+ " Building " +Integer.toString(phbl);
                            
                            data.setaddress(address);
                            list.add(data);
                            
                            dao.uploadNameInfo(list);
                            
                            
                            
                            i++;
                    }
                    
                    success = true;
                }
                catch (java.lang.IllegalArgumentException ex)
                {
                    ex.getMessage();
                }
            }
            
        }
        catch (Exception e)
        {
            System.out.println("Error occured in reading file.");
            e.printStackTrace();		
        }
        return success;
        
    }
}
