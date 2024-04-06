/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project2;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author tinch
 */
public class ej2 {
    
    public static void main(String[] args) {
    int dimf = 15;
    int diml = 0;
    Persona [] personas = new Persona[dimf];
    int dni;
    int edad = -1;
    String nombre;
    GeneradorAleatorio.iniciar();
    while((diml < dimf)&&(edad != 0)) {
        dni = GeneradorAleatorio.generarInt(1000);
        edad = GeneradorAleatorio.generarInt(80);
        nombre = GeneradorAleatorio.generarString(8);
        if (dni != 0) {
            personas[diml] = new Persona(nombre, dni, edad); 
            diml++;
        }
    }
    int mayores = 0;
    int i;
    for (i=0; i < diml; i++) {
        if (personas[i].getEdad()> 65) {
            mayores++;
        }
    }
    System.out.println("La cantidad de personas mayores de 65 años es: "+mayores);
    int min = 1001;
    int permin = -1;
    for (i = 0; i < diml; diml++) {
        if (personas[i].getDNI() < min) {
            min = personas[i].getDNI();
            permin = i;
        }
    }
    System.out.println(personas[permin].toString());
}   
}
