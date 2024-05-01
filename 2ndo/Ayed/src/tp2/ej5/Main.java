/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp2.ej5;

/**
 *
 * @author tinch
 */
public class Main {
	public static void main(String[] args) {
		
		int nivel = 2;
	
		ProfundidadDeArbolBinario profAb = new ProfundidadDeArbolBinario(3,2);
		
		profAb.imprimir();
		
		int sumaProfundiadad = profAb.sumaElementosProfundidad(nivel);
		
		System.out.println();
		System.out.println("La suma de todos los nodos del nivel "+nivel+" es: "+sumaProfundiadad);
	}
	
	

}
