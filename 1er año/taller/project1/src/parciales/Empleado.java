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
public abstract class Empleado {
    private String nombre;
    private int dni;
    private int año;
    private double sueldoBasico;

    public Empleado(String nombre, int dni, int año, double sueldoBasico) {
        setNombre(nombre);
        setAño(año);
        setDni(dni);
        setSueldoBasico(sueldoBasico);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getAño() {
        return año;
    }

    public void setAño(int año) {
        this.año = año;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }
    public double sueldoCobrar() {
        if ((2023 - this.getAño()) > 20) {
            return (this.getSueldoBasico() * 0.1 + this.getSueldoBasico());
        } else {
            return this.getSueldoBasico();
        }
    }
    public abstract double sueldoCobrarTotal();

    public String infoConSueldo() {
        return "Nombre: " + this.getNombre() + "dni: " + this.getDni() + " sueldo a cobrar " + this.sueldoCobrarTotal();
    }

    public String toString() {
        return "Empleado{" + "nombre=" + nombre + ", dni=" + dni + ", a\u00f1o=" + año + ", sueldoBasico=" + sueldoBasico + '}';
    }
    
}
