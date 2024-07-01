/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialesarboles.parcial2023arbriltema1;

import java.util.LinkedList;
import java.util.List;
import tp2.ej2.BinaryTree;

/**
 *
 * @author tinch
 */
public class ProcesadorDeArbol {


       
       private BinaryTree<Integer> arbol;
       
    public ProcesadorDeArbol(BinaryTree<Integer> ab) {
        this.arbol = ab;
    }

       public tipoLista procesar() {
           List<BinaryTree<Integer>> lista = new LinkedList<BinaryTree<Integer>>();
           int cant = 0;
           if (!arbol.isEmpty()) {
               cant = procesar(arbol, lista);
           }
           return new tipoLista(cant,lista);
       }
       public int procesar(BinaryTree<Integer> arbol, List<BinaryTree<Integer>> lista) {
           int cant = 0;
           int num = arbol.getData();
           if (num % 2 == 0) {
               cant++;
               if (arbol.hasLeftChild() && arbol.hasRightChild()) lista.add(arbol);
           }
           if (arbol.hasLeftChild()) cant+= procesar(arbol.getLeftChild(), lista);
           if (arbol.hasRightChild()) cant+= procesar(arbol.getRightChild(), lista);
           return cant;
       }
       public static void main(String[] args) {
        BinaryTree<Integer> ab = new BinaryTree<Integer>(2);
        ab.addLeftChild(new BinaryTree<Integer>(7));
        ab.addRightChild(new BinaryTree<Integer>(-5));
        ab.getLeftChild().addLeftChild(new BinaryTree<Integer>(23));
        ab.getLeftChild().addRightChild(new BinaryTree<Integer>(6));
        ab.getLeftChild().getLeftChild().addLeftChild(new BinaryTree<Integer>(-3));
        ab.getLeftChild().getRightChild().addLeftChild(new BinaryTree<Integer>(55));
        ab.getLeftChild().getRightChild().getLeftChild().addLeftChild(new BinaryTree<Integer>(9));
        ab.getLeftChild().getRightChild().getLeftChild().addRightChild(new BinaryTree<Integer>(16));
        ab.getRightChild().addLeftChild(new BinaryTree<Integer>(19));
        ab.getRightChild().addRightChild(new BinaryTree<Integer>(4));
        ab.getRightChild().getRightChild().addRightChild(new BinaryTree<Integer>(18));
        ab.getRightChild().getRightChild().getRightChild().addLeftChild(new BinaryTree<Integer>(8));
        ab.getRightChild().getRightChild().getRightChild().addRightChild(new BinaryTree<Integer>(24));
        ab.entreNiveles(0, 4);
        
        ProcesadorDeArbol p = new ProcesadorDeArbol(ab);
        tipoLista parc = p.procesar();
        
        System.out.println("");
        
        System.out.println(parc.getLista());
        System.out.println(parc.getCant());
    }
       }

