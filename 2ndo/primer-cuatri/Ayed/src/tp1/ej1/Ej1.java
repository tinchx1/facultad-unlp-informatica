/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp1.ej1;

/**
 *
 * @author tinch
 */
public class Ej1 {
    public static void imprimirFor(int a, int b) {
        for (int i = a; i <= b; i++) {
            System.out.println(i + " ");
        }
    } 
    public static void imprimirWhile(int a, int b) {
         while (a <= b) {
             System.out.println(a + " ");
             a++;
         }
    }
    public static void imprimirc(int a, int b) {
         if (a <= b) {
             System.out.println(a + " ");
             a++;
             imprimirWhile( a,  b);
         }
    }
}
