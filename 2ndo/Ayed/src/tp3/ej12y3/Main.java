/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp3.ej12y3;

import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author tinch
 */
public class Main {
    	public static void main(String[] args) {
		
		GeneralTree<Integer> A1 = new GeneralTree<Integer>(1);
		List <GeneralTree<Integer>> children1 = new LinkedList<GeneralTree<Integer>>();
		children1.add(new GeneralTree<Integer>(5));
		children1.add(new GeneralTree<Integer>(9));
		children1.add(new GeneralTree<Integer>(30));
		
		GeneralTree<Integer> A2 = new GeneralTree<Integer>(2,children1);
		List <GeneralTree<Integer>> children2 = new LinkedList<GeneralTree<Integer>>();
		children2.add(new GeneralTree<Integer>(6));
		children2.add(new GeneralTree<Integer>(7));

		GeneralTree<Integer> A3 = new GeneralTree<Integer>(3,children2);
		List <GeneralTree<Integer>> children = new LinkedList<GeneralTree<Integer>>();
		children.add(A1);
		children.add(A2);
		children.add(A3);
		GeneralTree<Integer> A = new GeneralTree<Integer>(4,children);
		
		System.out.println("La longitud del camino más largo desde el nodo raíz hasta una hoja es "+A3.altura());
		
		System.out.println();
		System.out.println("El nivel del dato en el arbol es "+A.nivel(6));
		
		System.out.println();
		System.out.println("La amplitud o ancho del arbol es "+A.ancho());
	}

}
