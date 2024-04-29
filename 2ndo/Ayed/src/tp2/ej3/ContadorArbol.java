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
public class ContadorArbol {
    private BinaryTree<Integer> tree;
    
    public ContadorArbol(Integer data) {
        this.tree = new BinaryTree<>(data);
    }
    public ContadorArbol(BinaryTree<Integer> data) {
        this.tree = data;
    }
    public ArrayList<Integer> numerosParesPostOrden() {
        ArrayList<Integer> numerosPares = new ArrayList<>();
        numerosParesPostOrden(this.tree, numerosPares);
        return numerosPares;
    }
    public void numerosParesPostOrden(BinaryTree<Integer> nodo, ArrayList<Integer> numerosPares) {
        if (nodo != null) {
            numerosParesPostOrden(nodo.getLeftChild(), numerosPares);
            numerosParesPostOrden(nodo.getRightChild(), numerosPares);
            if (nodo.getData() % 2 == 0) {
                numerosPares.add(nodo.getData());
            }
        }
    }
    public ArrayList<Integer> numerosParesInOrden() {
        ArrayList<Integer> numerosPares = new ArrayList<>();
        numerosParesInOrden(this.tree, numerosPares);
        return numerosPares;
    }
    public void numerosParesInOrden(BinaryTree<Integer> nodo, ArrayList<Integer> numerosPares) {
        if (nodo != null) {
            numerosParesInOrden(nodo.getLeftChild(), numerosPares);
            if (nodo.getData() % 2 == 0) {
                numerosPares.add(nodo.getData());
            }
            numerosParesInOrden(nodo.getRightChild(), numerosPares);
        }
    }

    public BinaryTree<Integer> getTree() {
        return tree;
    }

    public void setTree(BinaryTree<Integer> tree) {
        this.tree = tree;
    }
    
    
}
