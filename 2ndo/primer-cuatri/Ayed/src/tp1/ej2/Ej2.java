/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp1.ej2;
import java.util.Scanner;

 
/**
 * @author tinch
 */
public class Ej2 {
    public static int[] newArray() {
        Scanner s = new Scanner(System.in) ;
        System.out.println("Ingrese n");
        int n = s.nextInt();
        int[] arreglo = new int[n];
        for (int i = 0; i < n; i++) {
                arreglo[i] = n * (i + 1);
        }   
     
        return arreglo;
    }
}

