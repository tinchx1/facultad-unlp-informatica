/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial2;

/**
 *
 * @author tinch
 */
public class Fecha {
    private int cantGoleadores = 0;
    private Goleador[] goleadores;

    public Fecha(int M) {
        this.goleadores = new Goleador[M];
    }

    public int getCantGoleadores() {
        return cantGoleadores;
    }

    public void setCantGoleadores(int cantGoleadores) {
        this.cantGoleadores = cantGoleadores;
    }

    public Goleador[] getGoleadores() {
        return goleadores;
    }

    public void setGoleadores(Goleador[] goleadores) {
        this.goleadores = goleadores;
    }
    
    public void agregarGoleador(Goleador goleador) {
        this.goleadores[cantGoleadores] = goleador; 
        this.cantGoleadores++;

    }
    public Goleador menosGoles() {
        int minimo = 1000;
        Goleador goleadorMinimo = null;
        for (int i = 0; i < this.getCantGoleadores(); i++) {

        }
        return goleadorMinimo;
    }
}
