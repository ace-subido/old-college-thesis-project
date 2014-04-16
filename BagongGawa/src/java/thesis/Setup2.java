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

public class Setup2
{
    Connection con, con2;
    String url, uname, pword, strconnection;
    
    public Setup2()
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
    
    public boolean upload2(String filename) throws Exception 
    {
        ApplicationDao2 dao = new ApplicationDao2();  
        boolean success = false;
        int lotnum=0;
        int block=0;
        int phase=0;
        try 
        {  
            if(filename != null)
            {
                
                try
                {   
                    ArrayList<NameInfoData2> list = new ArrayList<NameInfoData2>();
                    
                    //Inputs the excel file to the POI file system
                    POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream("C://Documents and Settings//Jose Dalino//My Documents//NetBeansProjects//BagongGawa//residents.xls"));
                    
                    HSSFWorkbook wb = new HSSFWorkbook(fs);
                    
                    //Reads the first work sheet of the excel file
                    HSSFSheet sheet = wb.getSheetAt(0);
                    
                    Iterator<HSSFRow> iterator = sheet.rowIterator();
                    
                       
                    //Iterate each row of the excel file
                    int i=3;
                    
                    while(iterator.hasNext())
                    {   
                            
                        NameInfoData2 data = new NameInfoData2();
                        HSSFRow row = iterator.next();

                        data.setresId(String.valueOf(i));
                        
                        HSSFCell cell = row.getCell((short)0);
                        data.setfirst(cell.toString());

                        cell = row.getCell((short)1);
                        data.setlast(cell.toString());

                        cell = row.getCell((short)2);
                        data.setemail(cell.toString());
                        
                        cell = row.getCell((short)3);
                        data.sethouse(cell.toString());
                        
                        cell = row.getCell((short)4);
                        data.setsex(cell.toString());
                        
                        cell = row.getCell((short)5);
                        data.setblock(cell.toString());
                        block = (int)Double.parseDouble(cell.toString());
                        
                        cell = row.getCell((short)6);
                        data.setphase(cell.toString());
                        phase = (int)Double.parseDouble(cell.toString());
                        
                        cell = row.getCell((short)7);
                        data.setlotnum(cell.toString());
                        lotnum = (int)Double.parseDouble(cell.toString());
                        
                        cell = row.getCell((short)8);
                        data.setlotarea(cell.toString());
                        
                        cell = row.getCell((short)9);
                        data.setType(cell.toString());
                        
                        list.add(data);
                        
                        dao.uploadNameInfo(list);
                        dao.updateLotWithResId(lotnum, block, phase, i);
                        //dao.addLot(i,i,data.getlotarea(),data.getblock(),data.getphase(), data.getlotnum());
                        dao.addHead(i, i);
                        
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