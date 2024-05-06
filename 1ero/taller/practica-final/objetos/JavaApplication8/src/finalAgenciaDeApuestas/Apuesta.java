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
public class Apuesta {
    private String nombre;
    private int dni;
    private int idPartido;
    private double montoApuesta;
    private String apuesta;

    public Apuesta(String nombre, int dni, int idPartido, double montoApuesta, String apuesta) {
        this.nombre = nombre;
        this.dni = dni;
        this.idPartido = idPartido;
        this.montoApuesta = montoApuesta;
        this.apuesta = apuesta;
    }

    public int getIdPartido() {
        return idPartido;
    }

    public String getApuesta() {
        return apuesta;
    }

    public String infoGanador(Double monto) {
        return this.nombre + " con dni " + this.dni + "gano " + monto;
    }

    public double getMontoApuesta() {
        return montoApuesta;
    }
    
}
