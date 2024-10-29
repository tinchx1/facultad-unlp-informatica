/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp3.ej9;

import tp2.ej2.BinaryTree;

/**
 *
 * @author tinch
 */
public class ej9 {
    
    public void sumAndDif(BinaryTree<Integer> arbol, BinaryTree<SumAndDif> newTree, int total, int padre) {
        int datoActual = arbol.getData();
        SumAndDif newNodo = new SumAndDif(datoActual + total, datoActual - padre);
        newTree.setData(newNodo);
        if (arbol.hasLeftChild()) {
            newTree.addLeftChild(new BinaryTree<SumAndDif>());
            sumAndDif(arbol.getLeftChild(), newTree.getLeftChild(), total, padre);
        }
        if (arbol.hasRightChild()) {
            newTree.addRightChild(new BinaryTree<SumAndDif>());
            sumAndDif(arbol.getRightChild(), newTree.getRightChild(), total, padre);
        }
    }
    public BinaryTree<SumAndDif> SumAndDif(BinaryTree<Integer> arbol) {
        BinaryTree<SumAndDif> newTree = new BinaryTree<SumAndDif>();
        if (!arbol.isEmpty()) {
            sumAndDif(arbol, newTree, 0, 0);
        }
        return newTree;
    }
}
