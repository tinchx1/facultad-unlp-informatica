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
public class Torneo {
    private String name;
    private int N;
    private Fecha[] tabla;

    public Torneo(String name, int N, int M) {
        this.name = name;
        this.N = N;
        for (int i = 0; i < N; i++) {
            this.tabla[i] = new Fecha(M);
        }
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getN() {
        return N;
    }

    public void setN(int N) {
        this.N = N;
    }

    public Fecha[] getTabla() {
        return tabla;
    }

    public void setTabla(Fecha[] tabla) {
        this.tabla = tabla;
    }
    
    public void nuevogoleador(Goleador goleador, int x) {
        this.tabla[x].agregarGoleador(goleador);
    }
    
    public Goleador menorgoleador( int x) {
        return this.getTabla()[x].menosGoles();
    }
    public int cantidadGoleadores() {
        int cant = 0;
        for (int i = 1; i < this.getN(); i++) {
        }
    }
}
