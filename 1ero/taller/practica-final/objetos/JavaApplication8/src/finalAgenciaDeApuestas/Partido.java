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
public class Partido {
    private String local;
    private String visitante;
    private String resultado = "";
    private double pagoVictoriaLocal;
    private double pagoVisitanteVisitante;
    private double pagoEmpate;

    public Partido(String local, String visitante, double pagoVictoriaLocal, double pagoVisitanteVisitante, double pagoEmpate) {
        this.local = local;
        this.visitante = visitante;
        this.pagoVictoriaLocal = pagoVictoriaLocal;
        this.pagoVisitanteVisitante = pagoVisitanteVisitante;
        this.pagoEmpate = pagoEmpate;
    }
    public String getResultado() {
        return resultado;
    }

    public void setResultado(String resultado) {
        this.resultado = resultado;
    }

    public double getPagoVictoriaLocal() {
        return pagoVictoriaLocal;
    }

    public double getPagoVisitanteVisitante() {
        return pagoVisitanteVisitante;
    }

    public double getPagoEmpate() {
        return pagoEmpate;
    }
    
}
