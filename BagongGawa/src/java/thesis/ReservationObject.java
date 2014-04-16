/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package thesis;

import sun.jdbc.rowset.*;
import java.lang.*;
import java.util.*;
import java.text.*;
import java.util.Calendar;
import java.text.ParseException;
import java.text.SimpleDateFormat;


/**
 *
 * @author ace-dlsu
 */
public class ReservationObject {
    
    public java.util.Date frresdate;
    public java.util.Date toresdate;
    public int facID;
    public String facName;
    public int resID;
    public String resName;
    public int reservationID;
    
    //Date
    public int frresyear;
    public int frresmonth;
    public int frresday;
    public String frresdatestr;
    
    public int toresyear;
    public int toresmonth;
    public int toresday;
    public String toresdatestr;

    //Time
    public int frreshour;
    public int frresmin;
    public String frresminstr;
    public String frresampm = "AM";
        
    public int toreshour;
    public int toresmin;
    public String toresminstr;
    public String toresampm = "AM";
    
    //Sort values
    public int difference;
    
    //Print values
    public int printed;
    
    //status
    public String resstatus;
    
    public ReservationObject(){}
    
    public void makeTimetoString(){          
        Calendar myCalendar = Calendar.getInstance();

        myCalendar.setTime(this.frresdate);
        this.frreshour = myCalendar.get(Calendar.HOUR);
        this.frresmin = myCalendar.get(Calendar.MINUTE);
        
        if(this.frreshour == 0)
            this.frreshour = 12;
        if(this.frresmin == 0)
            this.frresminstr = "00";
        else
            this.frresminstr = "30";
                      
        int temp = myCalendar.get(Calendar.AM_PM);

        if(temp == 1)        
            frresampm = "PM";
      
        myCalendar.setTime(this.toresdate);
        this.toreshour = myCalendar.get(Calendar.HOUR);
        this.toresmin = myCalendar.get(Calendar.MINUTE);
        
        if(this.toreshour == 0)
            this.toreshour = 12;
        if(this.toresmin == 0)
            this.toresminstr = "00";
         else
            this.toresminstr = "30";
        
        temp = myCalendar.get(Calendar.AM_PM);
        
        if(temp == 1)
            toresampm = "PM";
            
    }
    public void makeDatetoString(){
        Calendar myCalendar = Calendar.getInstance();
        int tempinta, tempintb;
        
        myCalendar.setTime(this.frresdate);
        this.frresyear = myCalendar.get(Calendar.YEAR);
        this.frresday = myCalendar.get(Calendar.DAY_OF_MONTH);
        
       
        
        tempinta = myCalendar.get(Calendar.DAY_OF_WEEK);
        this.frresmonth = myCalendar.get(Calendar.MONTH);
        
        String temp = "January";
        String demp = "Sunday";
        
        if(this.frresmonth == 1)
            temp = "February";
        if(this.frresmonth == 2)
            temp = "March";
        if(this.frresmonth == 3)
            temp = "April";
        if(this.frresmonth == 4)
            temp = "May";
        if(this.frresmonth == 5)
            temp = "June";
        if(this.frresmonth == 6)
            temp = "July";
        if(this.frresmonth == 7)
            temp = "August";
        if(this.frresmonth == 8)
            temp = "September";
        if(this.frresmonth == 9)
            temp = "October";
        if(this.frresmonth == 10)
            temp = "November";
        if(this.frresmonth == 11)
            temp = "December";
                   
        
        if(tempinta == 2)
            demp = "Monday";
        else if(tempinta == 3)
            demp = "Tuesday";
        else if(tempinta == 4)
            demp = "Wednesday";
        else if(tempinta == 5)
            demp = "Thursday";
        else if(tempinta == 6)
            demp = "Friday";
        else if(tempinta == 7)
            demp = "Saturday";
        
                                
        this.frresdatestr = demp+" - "+temp+" "+this.frresday+", "+this.frresyear;
                       
        myCalendar.setTime(this.toresdate);
        this.toresyear = myCalendar.get(Calendar.YEAR);
        this.toresday = myCalendar.get(Calendar.DAY_OF_MONTH);
        tempintb = myCalendar.get(Calendar.DAY_OF_WEEK);
        this.toresmonth = myCalendar.get(Calendar.MONTH);         
        
        String temp2 = "January";
        String demp2 = "Sunday";
        
        if(this.toresmonth == 1)
            temp2 = "February";
        if(this.toresmonth == 2)
            temp2 = "March";
        if(this.toresmonth == 3)
            temp2 = "April";
        if(this.toresmonth == 4)
            temp2 = "May";
        if(this.toresmonth == 5)
            temp2 = "June";
        if(this.toresmonth == 6)
            temp2 = "July";
        if(this.toresmonth == 7)
            temp2 = "August";
        if(this.toresmonth == 8)
            temp2 = "September";
        if(this.toresmonth == 9)
            temp2 = "October";
        if(this.toresmonth == 10)
            temp2 = "November";
        if(this.toresmonth == 11)
            temp2 = "December";
        
        
        if(tempintb == 2)
            demp2 = "Monday";
        else if(tempintb == 3)
            demp2 = "Tuesday";
        else if(tempintb == 4)
            demp2 = "Wednesday";
        else if(tempintb == 5)
            demp2 = "Thursday";
        else if(tempintb == 6)
            demp2 = "Friday";
        else if(tempintb == 7)
            demp2 = "Saturday";     
             
        
                        
        this.toresdatestr = demp2+" - "+temp2+" "+this.toresday+", "+this.toresyear;
    }
    
    public void makeStringtoDate(String d){        
       
        try
        { 
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            String d1 = d+" "+this.frreshour+":"+this.frresmin+":00";
            String d2 = d+" "+this.toreshour+":"+this.toresmin+":00";
            java.util.Date dt1 = sdf.parse(d1);
            java.util.Date dt2 = sdf.parse(d2);
            
            this.frresdate = dt1;
            this.toresdate = dt2;
            
         
        }
        catch(Exception e)
        {
            System.out.println("tae" + e.getMessage());
        }
        
    }
    
    
}
