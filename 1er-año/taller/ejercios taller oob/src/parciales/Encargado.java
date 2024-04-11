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
public class Encargado extends Empleado{
    private int cantidadEmpleados;

    public Encargado(int cantidadEmpleados, String nombre, int dni, int año, double sueldoBasico) {
        super(nombre, dni, año, sueldoBasico);
        this.cantidadEmpleados = cantidadEmpleados;
    }

    public int getCantidadEmpleados() {
        return cantidadEmpleados;
    }

    public void setCantidadEmpleados(int cantidadEmpleados) {
        this.cantidadEmpleados = cantidadEmpleados;
    }

    public double sueldoCobrarTotal() {
        return (this.cantidadEmpleados * 1000 + this.sueldoCobrar());
    }

    public String toString() {
        return super.toString() + "Encargado{" + "cantidadEmpleados=" + cantidadEmpleados + '}';
    }


}
