package thesis;

public class Converter
{
    public String convMonth(int month)
    {
        String m="";
        if(month==1)
            m = "January";
        else if(month==2)
            m = "February";
        else if(month==3)
            m = "March";
        else if(month==4)
            m = "April";
        else if(month==5)
            m = "May";
        else if(month==6)
            m = "June";
        else if(month==7)
            m = "July";
        else if(month==8)
            m = "August";
        else if(month==9)
            m = "September";
        else if(month==10)
            m = "October";
        else if(month==11)
            m = "November";
        else if(month==12)
            m = "December";
        
        return m;
    }
    
    public String convType(String typeNum, String path)
    {
        String type="";
        if(typeNum.equalsIgnoreCase("0"))
            type = "Admin-";
        else if (typeNum.equalsIgnoreCase("1"))
            type = "Director-";
        else if (typeNum.equalsIgnoreCase("2"))
            type = "Staff-";
        else if (typeNum.equalsIgnoreCase("5"))
            type = "";
        
        return path+type;
    }
    
    public int convType2(String path)
    {
        String type="";
        if(path.equalsIgnoreCase("Admin"))
            type = "0";
        else if (path.equalsIgnoreCase("Director"))
            type = "1";
        else if (path.equalsIgnoreCase("Staff"))
            type = "2";
        
        return Integer.parseInt(type);
    }
}
