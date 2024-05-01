/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp2.ej5;

import tp1.ej8.Queue;
import tp2.ej2.BinaryTree;

/**
 *
 * @author tinch
 */
public class ProfundidadDeArbolBinario {
    private BinaryTree<Integer> tree;
    	public ProfundidadDeArbolBinario(int nivel, int valor) {
		super();
		if (nivel > 0) {
			this.tree = crearArbolLleno(nivel,valor);
		}    
	}
	
	public BinaryTree<Integer> crearArbolLleno(int nivel, int valor) {
        										
		if (nivel == 0) {
	        return new BinaryTree<>(valor);
	    }
		
		BinaryTree<Integer> nodo = new BinaryTree<Integer>(valor);
        nodo.addLeftChild(crearArbolLleno(nivel - 1, valor * 2)); 
        nodo.addRightChild(crearArbolLleno(nivel - 1, valor * 2 + 1));
        
        return nodo;
    }
	
	public void imprimir() {
		this.tree.toString();
	}
    public int sumaElementosProfundidad (int p) {
        if (this.tree == null || p < 0) {
            return 0;
        }
        Queue<BinaryTree<Integer>> cola = new Queue<BinaryTree<Integer>>();
        cola.enqueue(tree);
        int totalNivel = 0;
        int nivelActual = 0;
        while (!cola.isEmpty() && nivelActual <= p) {
            int nivelSize = cola.Size();
            for (int i = 0; i < nivelSize; i++) {
                BinaryTree<Integer> nodo = cola.deenqueue();
                if (nivelSize == p) {
                    totalNivel=+ nodo.getData();
                } else {
                    if (nodo.hasLeftChild()) {
                        cola.enqueue(nodo.getLeftChild());
                    }
                    if (nodo.hasRightChild()) {
                        cola.enqueue(nodo.getRightChild());
                    }
                }
                
            }
         nivelActual++;
        }
        return totalNivel;
    }
}
