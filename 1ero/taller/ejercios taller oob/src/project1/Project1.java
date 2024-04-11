/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project1;

/**
 *
 * @author tinch
 */import PaqueteLectura.GeneradorAleatorio;
public class Project1 { //ej 4
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
    GeneradorAleatorio.iniciar();
        int i, j;
        int [][] edificio = new int [8][4];
        for (i=0; i < 8; i++)
            for (j=0; j < 4; j++)
                edificio[i][j] = 0;
    int nropisos = GeneradorAleatorio.generarInt(10);
    int nrooficina = GeneradorAleatorio.generarInt(4);
    while (nropisos != 9) {
        edificio[nropisos][nrooficina] = edificio[nropisos][nrooficina] + 1;
        nropisos = GeneradorAleatorio.generarInt(10);
        nrooficina = GeneradorAleatorio.generarInt(4);
    }
    for (i=0; i < 8; i++) {
        for (j=0; j < 4; j++)
            System.out.println(edificio[i][j]);
    }
    }
}
