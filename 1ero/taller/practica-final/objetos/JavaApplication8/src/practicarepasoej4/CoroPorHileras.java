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
public class CoroPorHileras extends Coro {
    private Corista[][] coristas;
    private int dimf;
    private int dimlh = 0;
    private int dimlc = 0;

    public CoroPorHileras(int dimf, String nombre, Director director) {
        super(nombre, director);
        this.coristas = new Corista[dimf][dimf];
    }

    @Override
public void agregarCorista(Corista corista) {
    if (dimlh < dimf && dimlc < dimf) {
        this.coristas[dimlh][dimlc] = corista;
        dimlc++; // Incrementa la columna después de agregar el corista
        if (dimlc == dimf) {
            dimlc = 0; // Reinicia la columna al completar una fila
            dimlh++; // Incrementa la hilera después de completar una fila
        }
    }
    System.out.println(corista); // Verifica el corista recién agregado
}


    @Override
    public boolean verificarLleno() {
        return ((dimlh == dimf)&& (dimlc == dimf));
    }

    @Override
    public boolean verificarFormado() {
        for (int i = 0; i < dimf; i++) {
            if (this.coristas[0][i].getTono() < this.coristas[0][i + 1].getTono()); {
            return false;
            }
        }
        for (int i = 0; i < dimlh; i++) {
            int tono = this.coristas[i][0].getTono();
            for (int j = 1; j < dimlc; j++) {
                if (tono != this.coristas[i][j].getTono()) {
                    return false;
                }
            }
        }
        return true;
    }
        @Override
public String datosCoro() {
    String aux = "";
    aux += this.datosDirector() + "\n";
    for (int i = 0; i < dimlh; i++) {
        for (int j = 0; j < dimlc; j++) {
                aux += coristas[i][j].toString() + "\n";
        }
    }
    return aux;
}

}
