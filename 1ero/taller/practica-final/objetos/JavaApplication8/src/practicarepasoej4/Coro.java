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
public abstract class Coro {
    private String nombre;
    private Director director;

    public Coro(String nombre, Director director) {
        this.nombre = nombre;
        this.director = director;
    }
    public abstract void agregarCorista(Corista corista);
    public abstract boolean verificarLleno();
    public abstract boolean verificarFormado();
    public abstract String datosCoro();
    
    public String datosDirector() {
        return this.director.toString();
    }
}
