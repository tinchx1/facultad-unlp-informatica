/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp1.ej8;

/**
 *
 * @author tinch
 */
public class CircularQueue<T> extends Queue<T> {
    public void enqueueFirst(T dato) {
        data.add(0, dato);
    }

}
