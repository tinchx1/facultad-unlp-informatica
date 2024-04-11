/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp1.ej7incompleto;
import java.util.*;

/**
 *
 * @author tinch
 */
public class TestArrayList {
    
    public static void metodod() {
        List<String> list = new ArrayList();
        String e1 = "pepe";
        String e2 = "psdepe";
        String e3 = "pesdpe";
        list.add(e1);
        list.add(e2);
        list.add(e3);
        
        List<String> list2 = new ArrayList(list);
        list2.addAll(list);
        
        
        list.toString();
        list2.toString();
        
    }
}
