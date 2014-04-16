package thesis;

import java.util.*;

public class NewClass 
{
    String password = UUID.randomUUID().toString().substring(0, 7);

    public String getPasswordForRes()
    {
        return password;
    }
}
