/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp3.ej7;

import tp2.ej2.BinaryTree;

/**
 *
 * @author tinch
 */
public class ParcialArboles {
    private BinaryTree<Integer> tree;

    public ParcialArboles(BinaryTree<Integer> tree) {
        this.tree = tree;
    }
    
    public BinaryTree<Integer> buscar(BinaryTree<Integer> tree, int num) {
        if (tree.getData() == num) {
            return tree;
        }
        BinaryTree<Integer> res = new BinaryTree<Integer>();
        if (tree.hasLeftChild()) {
            res = buscar(tree.getLeftChild(), num);
        }
        if (tree.hasRightChild()) {
            res = buscar(tree.getRightChild(),num);
        }
        return res;
    }
    
    public int soloNodo(BinaryTree<Integer> tree) {
        int cant = 0;
        if (tree.hasLeftChild()) {
            cant += soloNodo(tree.getLeftChild());
        }
        if (tree.hasRightChild()) {
            cant += soloNodo(tree.getRightChild());
        }
        if ((tree.hasLeftChild() && !tree.hasRightChild()) || tree.hasRightChild() && tree.hasLeftChild()) cant++;
        return cant;
    }
    public boolean isLeftTree(BinaryTree<Integer> tree) {
        int izq = -1;
        int der = -1;
        if (tree.hasLeftChild()) izq = soloNodo(tree.getLeftChild());
        if (tree.hasRightChild()) der = soloNodo(tree.getRightChild());
        
        return izq > der;
    }
    public boolean isLeftTree(int num) {
        BinaryTree<Integer> subArbol = buscar(tree, num);
        return (!subArbol.isEmpty()) ? isLeftTree(subArbol) : false;
    }
}
