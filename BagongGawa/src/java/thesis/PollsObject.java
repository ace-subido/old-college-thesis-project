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
public class PollsObject {

    public Vector<String> pollchoices;
    public Vector<Integer> pollchoicesID;
    public String pollname;
    public int pollID;
    public java.util.Date startingDate, closingDate;
       
    public PollsObject(){
        
    }
}
