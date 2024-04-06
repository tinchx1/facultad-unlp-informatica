/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp1.ej8;
import java.util.*;

/**
 *
 * @author tinch
 */
public class Queue<T> extends Sequence{
    protected List<T> data;
    public  Queue (){
        data = new LinkedList();
    }
    public void enqueue(T dato) {
        data.add(dato);
    }
    public void deenqueue(T dato) {
        data.remove(0);
    }
    public T head() {
        return data.get(0);
    }

    @Override
    public boolean isEmpty() {
        return data.isEmpty();
    }
 
    @Override
    public int Size() {
        return data.size();
    }

    @Override
    public String toString() {
        String str = "";
        for (T d:data) {
            str = str + d + " ";
        }
        return  str;//To change body of generated methods, choose Tools | Templates.
    }
    
    
   
}
