/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practicarepasoej4;

/**
 *
 * @author tinch
 */
public class Director {
    private String nombre;
    private int edad;
    private int antiguedad;

    public Director(String nombre, int edad, int antiguedad) {
        this.nombre = nombre;
        this.edad = edad;
        this.antiguedad = antiguedad;
    }

    @Override
    public String toString() {
        return "Director{" + "nombre=" + nombre + ", edad=" + edad + ", antiguedad=" + antiguedad + '}';
    }
    
}
