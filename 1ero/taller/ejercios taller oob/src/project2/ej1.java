/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project2;
import PaqueteLectura.Lector;

/**
 *
 * @author tinch
 */
public class ej1 {
/**
 *
 * @author vsanz
 */
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Persona unapersona = new Persona();
        unapersona.setDNI(Lector.leerInt());
        unapersona.setEdad(Lector.leerInt());
        unapersona.setNombre(Lector.leerString());
        System.out.println(unapersona.toString());
    }
    
}

