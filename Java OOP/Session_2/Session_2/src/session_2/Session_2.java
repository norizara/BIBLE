package session_2;
import java.util.*;

public class Session_2 {
//    int x = Integer.parseInt("10");
//    boolean x = Boolean.parseBoolean("true");
//    double x = Double.parseDouble("19.5");
    
    String s = "Hello World";
    String s1 = new String("hello world");
    int[] x = {10, 2, 3, 4, 5};
    
    ArrayList<Integer> y = new ArrayList<Integer>();
    
    
    public Session_2(){
        System.out.println(Arrays.toString(x));
        System.out.println(s);
        System.out.println(s.equalsIgnoreCase(s1));
        
        y.add(7);
        y.add(5);
        y.add(4);
        for (int n : y) {
            System.out.println(n + " " + y.size());
        }
        
    HashMap<String,Integer> z = new HashMap<String,Integer>();
        z.put("sfx",99);
        System.out.println(z.get("sfx"));
    HashMap<Mahasiswa,Float> p = new HashMap<Mahasiswa,Float>();
        
        Mahasiswa mhs1= new Mahasiswa();
        Mahasiswa mhs2 = new Mahasiswa();
        
        p.put(mhs1, 77f);
        p.put(mhs2, 77f);
        System.out.println(p.get(mhs1));
        
    }
    
    public static void main(String[] args) {
        new Session_2();
    }
}