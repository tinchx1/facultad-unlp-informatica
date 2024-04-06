/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;
import PaqueteLectura.Lector;
/**
 *
 * @author tinch
 */
public class ej1 {
        
    public static void main(String[] args) {
    triangulo t1 = new triangulo();
    System.out.println("Crear nuevo Triangulo");
    System.out.println("Ingrese lado 1: ");
        t1.setL1(Lector.leerDouble());
        System.out.println("Ingrese lado 2: ");
        t1.setL2(Lector.leerDouble());
        System.out.println("Ingrese lado 3: ");
        t1.setL3(Lector.leerDouble());
        System.out.println("Ingrese color de relleno: ");
        t1.setColor(Lector.leerString());
        System.out.println("Ingrese color de linea: ");
        t1.setBorde(Lector.leerString());
        
        
        System.out.println("El perimetro del triangulo ingresado es: "+t1.getPerimetro());
        
        System.out.println("El area del triangulo ingresado es: "+t1.getArea());
    }
}
