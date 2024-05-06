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
public class Corista {
    private String nombre;
    private int edad;
    private int dni;
    private int tono;

    public Corista(String nombre, int edad, int dni, int tono) {
        this.nombre = nombre;
        this.edad = edad;
        this.dni = dni;
        this.tono = tono;
    }
    public int getTono() {
        return tono;
    }

    @Override
    public String toString() {
        return "Corista{" + "nombre=" + nombre + ", edad=" + edad + ", dni=" + dni + ", tono=" + tono + '}';
    }
}
