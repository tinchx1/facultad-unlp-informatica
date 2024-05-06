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
public class CoroSemicircular extends Coro {
    private Corista[] coristas;
    private int dimf;
    private int diml = 0;

    public CoroSemicircular(int dimf, String nombre, Director director) {
        super(nombre, director);
        this.coristas = new Corista[dimf];
        this.dimf = dimf;
    }

    @Override
    public void agregarCorista(Corista corista) {
        if (this.diml < this.dimf) {
            this.coristas[diml] = corista;
            diml++;
        } else {
            System.out.println("Error: maximo numero de coristas");
        }
    }

    @Override
    public boolean verificarLleno() {
        return diml == dimf;
    }

    @Override
    public boolean verificarFormado() {
        for (int i = 0; i < dimf; i++) {
            if (this.coristas[i].getTono() < this.coristas[i + 1].getTono()) {
                return false;
            }
        }
        return true;
    }

    @Override
    public String datosCoro() {
        String aux = "";
        aux+= this.datosDirector() + "\n";
        for (int i = 0; i < diml; i++) {
            aux+= this.coristas[i].toString() + "\n";
        }  
        return aux;
    }
    
    
}
