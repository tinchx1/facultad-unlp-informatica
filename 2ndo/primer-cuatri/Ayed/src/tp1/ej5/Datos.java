/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp1.ej5;

/**
 *
 * @author tinch
 */
public class Datos {
    private int maximo;
    private int minimo;
    private int promedio;

    public Datos(int maximo, int minimo, int promedio) {
        this.maximo = maximo;
        this.minimo = minimo;
        this.promedio = promedio;
    }

    public int getMaximo() {
        return maximo;
    }

    public void setMaximo(int maximo) {
        this.maximo = maximo;
    }

    public int getMinimo() {
        return minimo;
    }

    public void setMinimo(int minimo) {
        this.minimo = minimo;
    }

    public int getPromedio() {
        return promedio;
    }

    public void setPromedio(int promedio) {
        this.promedio = promedio;
    }

    @Override
    public String toString() {
        return "Datos{" + "maximo=" + maximo + ", minimo=" + minimo + ", promedio=" + promedio + '}';
    }
    
}
