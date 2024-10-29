/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grafos.parcial2024t1;

/**
 *
 * @author tinch
 */
public class Recinto {
    private int tiempo;
    private String nombre;

    public Recinto(int tiempo, String nombre) {
        this.tiempo = tiempo;
        this.nombre = nombre;
    }

    public int getTiempo() {
        return tiempo;
    }

    public void setTiempo(int tiempo) {
        this.tiempo = tiempo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}
