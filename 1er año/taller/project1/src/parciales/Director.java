/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parciales;

/**
 *
 * @author tinch
 */
public class Director extends Empleado{
    private double montoViaticos;

    public Director(double montoViaticos, String nombre, int dni, int año, double sueldoBasico) {
        super(nombre, dni, año, sueldoBasico);
        this.montoViaticos = montoViaticos;
    }

    public double getMontoViaticos() {
        return montoViaticos;
    }

    public void setMontoViaticos(double montoViaticos) {
        this.montoViaticos = montoViaticos;
    }

    public double sueldoCobrarTotal() {
        return (this.getMontoViaticos() + this.sueldoCobrar());
    }

    @Override
    public String toString() {
        return super.toString() + "montoViaticos=" + montoViaticos + '}';
    }
    
    
}
