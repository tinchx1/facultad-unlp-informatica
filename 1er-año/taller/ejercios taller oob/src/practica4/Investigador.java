/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4;

/**
 *
 * @author tinch
 */
public class Investigador {
    private String nombre;
    private String especialidad;
    private int categoria;
    private Subsidio[] subsidios;

    public Investigador(String nombre, String especialidad, int categoria) {
        this.nombre = nombre;
        this.especialidad = especialidad;
        this.categoria = categoria;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public Subsidio[] getSubsidios() {
        return subsidios;
    }

    public void setSubsidios(Subsidio[] subsidios) {
        this.subsidios = subsidios;
    }

    public String toString() {
        return "nombre=" + nombre + ", especialidad=" + especialidad + ", categoria=" + categoria + ", el total de dinero de sus subsidios es de " ;
    }
    
}
