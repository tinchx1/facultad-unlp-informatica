/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalClima;

/**
 *
 * @author tinch
 */
public abstract class Estacion  {
    private String nombre;
    private double cordenadasLatitud;
    private double longitud;

    public Estacion(String nombre, double cordenadasLatitud, double longitud) {
        this.nombre = nombre;
        this.cordenadasLatitud = cordenadasLatitud;
        this.longitud = longitud;
    }
    public abstract String maximo(); 

    @Override
    public String toString() {
        return "Estacion{" + "nombre=" + nombre + ", cordenadasLatitud=" + cordenadasLatitud + ", longitud=" + longitud + '}';
    }
    
}
