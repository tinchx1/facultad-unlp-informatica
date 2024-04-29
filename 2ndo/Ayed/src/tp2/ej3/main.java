/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp2.ej3;

import java.util.ArrayList;
import tp2.ej2.BinaryTree;

/**
 *
 * @author tinch
 */
public class main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
    BinaryTree<Integer> tree = new BinaryTree<>(1);
    tree.addLeftChild(new BinaryTree<Integer>(5));
    tree.addRightChild(new BinaryTree<Integer>(10));
    
    tree.getLeftChild().addLeftChild(new BinaryTree<Integer>(2));
    tree.getLeftChild().addRightChild(new BinaryTree<Integer>(6));
    tree.getRightChild().addRightChild(new BinaryTree<Integer>(3));
    
    tree.getLeftChild().getLeftChild().addLeftChild(new BinaryTree<Integer>(33));
    tree.getLeftChild().getLeftChild().addRightChild(new BinaryTree<Integer>(23));
    tree.getRightChild().getRightChild().addLeftChild(new BinaryTree<Integer>(14));
        ContadorArbol contador = new ContadorArbol(tree);
        
        ArrayList<Integer> numerosParesPostOrden  = contador.numerosParesPostOrden();
        ArrayList<Integer> numerosParesInOrden  = contador.numerosParesInOrden();
        
        System.out.println("Números pares en el árbol con reccorrido PostOrden: " + numerosParesPostOrden);
        System.out.println("Números pares en el árbol con reccorrido InOrden: " + numerosParesInOrden);
    }
    
}
