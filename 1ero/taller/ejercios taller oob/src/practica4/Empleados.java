/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4;

/**
 *
 * @author tinch
 */
public abstract class Empleados {
    private String nombre;
    private double sueldo_basico;
    private int antiguedad;

    public Empleados(String nombre, double sueldo_basico, int antiguedad) {
        this.nombre = nombre;
        this.sueldo_basico = sueldo_basico;
        this.antiguedad = antiguedad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo_basico() {
        return sueldo_basico;
    }

    public void setSueldo_basico(double sueldo_basico) {
        this.sueldo_basico = sueldo_basico;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    public abstract double calcularEfectividad();
    public abstract double calcularBonus();
    public double calcularSueldoACobrar() {
        return this.sueldo_basico+((this.getSueldo_basico()/10) * this.getAntiguedad())+ this.calcularBonus();
    }
    
    public String toString() {
        return "el empleado: " + nombre + " cobra " + this.calcularSueldoACobrar() + " y tiene efectividad: " + this.calcularEfectividad();
    };
}
