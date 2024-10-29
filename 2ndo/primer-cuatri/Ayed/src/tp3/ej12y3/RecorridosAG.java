/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp3.ej12y3;

import java.util.ArrayList;
import java.util.List;
import tp1.ej8.Queue;

/**
 *
 * @author tinch
 */
public class RecorridosAG {
    
    public static boolean esImpar(int n) {
          return (n % 2) != 0;
    }
    public void preOrden(GeneralTree<Integer> a,List<Integer> list,Integer n) {
        if (!a.isEmpty()) {
            if ((a.getData() == n) && esImpar(a.getData())) {
                list.add(a.getData());
            }
            for (GeneralTree nodo: a.getChildren()) {
                preOrden(a, list, n);
            }
        }
    }
    public List<Integer> numerosImparesMayoresQuePreOrden(GeneralTree<Integer> a,
Integer n) {
        List<Integer> result = new ArrayList<Integer>();
        preOrden(a, result,n);
        return result;
    }
    public static void postOrden(GeneralTree<Integer> a,List<Integer> list,Integer n) {
        if (!a.isEmpty()) {
            for (GeneralTree nodo: a.getChildren()) {
                postOrden(a, list, n);
            }
            if ((a.getData() > n) && esImpar(a.getData())) {
                list.add(a.getData());
            }
        }
    }
    public static List<Integer> numerosImparesMayoresQuePostOrden(GeneralTree<Integer> a,
Integer n) {
        List<Integer> result = new ArrayList<Integer>();
        postOrden(a, result,n);
        return result;
    }
    public static List<Integer> numerosImparesMayoresQuePorNiveles(GeneralTree<Integer> a, Integer n) {
        List<Integer> list = new ArrayList<Integer>();
        Queue<GeneralTree<Integer>> cola = new Queue<GeneralTree<Integer>>();
        cola.enqueue(a);
        GeneralTree<Integer> aux;
        while (!cola.isEmpty()) {
            aux = cola.deenqueue();
            if ((aux.getData() > n) && (esImpar(aux.getData()))) {
                list.add(aux.getData());
            }
            for (GeneralTree<Integer> nodo: aux.getChildren()) {
                cola.enqueue(nodo);
            }
        }
        return list;
    }

}
