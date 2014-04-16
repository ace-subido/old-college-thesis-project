/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package thesis;

import java.sql.*;
import sun.jdbc.rowset.*;
import java.lang.*;
import java.util.*;
/**
 *
 * @author ace-dlsu
 */
public class ResidentObject {

    public String fname, lastname, address, username, telenumber;    
    public int residentid;
    public int lotid;
    
       
    
    public ResidentObject(){
        
    }   
    public ResidentObject(int a, String b, String c){
       this.residentid = a;
       this.fname = b;
       this.lastname = c;
       
    }
}
