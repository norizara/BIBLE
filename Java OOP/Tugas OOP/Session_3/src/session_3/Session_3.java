package session_3;
import java.util.*;

public class Session_3 {
    ArrayList<String> arr = new ArrayList<String>();
    
    public Session_3()
    {
        arr.add("Hello");
        
        String word = arr.get(0);
        for(int i = 0; i<word.length();i++){
            System.out.println(word.charAt(i));
        }
    }
    
    public static void main(String[] args) {
        new Session_3();
    }
}
    