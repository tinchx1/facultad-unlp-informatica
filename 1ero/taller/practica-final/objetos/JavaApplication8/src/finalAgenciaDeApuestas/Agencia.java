/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalAgenciaDeApuestas;

/**
 *
 * @author tinch
 */
public class Agencia {
    private Partido[] partidos;
    private int dimFP = 20;
    private int dimLP = 0;
    private Apuesta[] apuestas;
    private int dimFA = 100;
    private int dimLA = 0;

    public Agencia() {
        this.partidos = new Partido[dimFP];
        this.apuestas = new Apuesta[dimFA];
    }
    
    public int agregarPartido(Partido newPartido) {
        if (dimFP > dimLP) {
            this.partidos[dimLP] = newPartido;
            this.dimLP++;
        } else {
            System.out.println("Error: maximo numero de partidos");
        }
        return this.dimLP;
    }
    public void agregarApuesta(Apuesta newApuesta) {
           if (dimFA > dimLA) {
            this.apuestas[dimLA] = newApuesta;
            this.dimLA++;
        } else {
            System.out.println("Error: maximo numero de apuestas");
        }
    }
    public void ingresarPartido(int id, String resultado) {
        this.partidos[id].setResultado(resultado);
    }
    public void cerrarApuestas() {
        for (int i = 0; i < this.dimLA; i++) {
            int id = this.apuestas[i].getIdPartido();
            if (id < this.dimLP && this.apuestas[i].getApuesta() == this.partidos[id].getResultado()) {
                double monto = 0;
                if (this.apuestas[i].getApuesta() == "victoria visitante") {
                    monto = this.partidos[id].getPagoVisitanteVisitante() * this.apuestas[i].getMontoApuesta();
                } else if (this.apuestas[i].getApuesta() == "victoria local") {
                    monto = this.partidos[id].getPagoVictoriaLocal()* this.apuestas[i].getMontoApuesta();
                } else if (this.apuestas[i].getApuesta() == "empate") {
                    monto = this.partidos[id].getPagoEmpate() * this.apuestas[i].getMontoApuesta();
                }
                System.out.println(this.apuestas[i].infoGanador(monto));
            }
        }
    }
    public void limpiarSistema() {
        this.apuestas = new Apuesta[dimFA];
        this.partidos = new Partido[dimFP];
        this.dimLA = 0;
        this.dimLP = 0;
    }
}
     

