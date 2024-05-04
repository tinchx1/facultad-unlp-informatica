/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalCompaniaSeguros;

/**
 *
 * @author tinch
 */
public class Poliza {
    private Cliente cliente;
    private double montoAsegurado;
    private double cuotaMensual;
    private Fecha fechaComienzo;
    private Fecha fechaFin;

    public Poliza(Cliente cliente, double montoAsegurado, double cuotaMensual, Fecha fechaComienzo, Fecha fechaFin) {
        this.cliente = cliente;
        this.montoAsegurado = montoAsegurado;
        this.cuotaMensual = cuotaMensual;
        this.fechaComienzo = fechaComienzo;
        this.fechaFin = fechaFin;
    }

    
    public int getDniCliente() {
        return cliente.getDni();
    }

    @Override
    public String toString() {
        return "Poliza{" + "cliente=" + cliente + ", montoAsegurado=" + montoAsegurado + ", cuotaMensual=" + cuotaMensual + ", fechaComienzo=" + fechaComienzo + ", fechaFin=" + fechaFin + '}';
    }

  
    
    public void actualizarCuota(double unPorcentaje) {
        this.cuotaMensual = this.cuotaMensual * unPorcentaje;
    }

    public Fecha getFechaFin() {
        return fechaFin;
    }
    
}
