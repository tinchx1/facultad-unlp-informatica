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
public class Compania {
    private RubroSeguro[] seguros;
    private int dimF = 10;

    public Compania() {
       this.seguros = new RubroSeguro[dimF];
       for (int i = 0; i < dimF; i++) {
        this.seguros[i] = new RubroSeguro();
       }
    }
    public void agregarPoliza (Poliza poliza, int unRubro) {
        this.seguros[unRubro].newPoliza(poliza);
    }
    public String infoCliente(int unDni) {
        String info = "";
        for (int i = 0; i < dimF; i++) {
            for (int j = 0; j < seguros[i].getDimL(); j++) {
                if (unDni == this.seguros[i].getPoliza(j).getDniCliente()) {
                    info+= this.seguros[i].getPoliza(j).toString();
                }
            }
        }
        return info;
    }
    public int cantidadAVencer(int mes, int año) {
        int cantidad = 0;
        for (int i = 0; i < dimF; i++) {
            for (int j = 0; j < seguros[i].getDimL(); j++) {
                if (mes == this.seguros[i].getPoliza(j).getFechaFin().getMes() && año == this.seguros[i].getPoliza(j).getFechaFin().getAño()) {
                    cantidad++;
                }
            }
        }
        return cantidad;
    }
    public void aumentar(double unPorcentaje, int unRubro) {
        for (int i = 0; i < this.seguros[unRubro].getDimL(); i++) {
            this.seguros[unRubro].getPoliza(i).actualizarCuota(unPorcentaje);
        }
    }
    
}
