/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalTorneoTenis;

/**
 *
 * @author tinch
 */
public class Tenista {
    private String nombre;
    private int partidosGanados;
    private double premios;

    public Tenista(String nombre, int partidosGanados, double premios) {
        this.nombre = nombre;
        this.partidosGanados = partidosGanados;
        this.premios = premios;
    }

    public void setPartidosGanados() {
        this.partidosGanados++;
    }

    public int getPartidosGanados() {
        return partidosGanados;
    }

    public void setPremios(double premio) {
        this.premios+= premio;
    }

    @Override
    public String toString() {
        return "Tenista{" + "nombre=" + nombre + ", partidosGanados=" + partidosGanados + ", premios=" + premios + '}';
    }
    
    
}
