/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author tinch
 */
public class ej5 {
        
    public static void main(String[] args) {
        int [][] cliente = new int [5][4];
        int i, j;
        for (i = 0; i < 5; i++){
            for (j=0; j < 4; j++)
                cliente[i][j] = 1 + GeneradorAleatorio.generarInt(10);
        }
        for (i = 0; i < 4; i++){
        int cant = 0;
            for (j=0; j < 5; j++)
                cant = cliente[j][i] + cant;
        System.out.println("La calificacion promedio en el aspecto " + i + " es de " + cant/4);
        }
    }
}
