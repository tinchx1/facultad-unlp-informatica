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
public class Jugadores extends Empleados{
    private int partidos;
    private int goles;

    public Jugadores(int partidos, int goles, String nombre, double sueldo_basico, int antiguedad) {
        super(nombre, sueldo_basico, antiguedad);
        this.partidos = partidos;
        this.goles = goles;
    }



    public int getPartidos() {
        return partidos;
    }

    public void setPartidos(int partidos) {
        this.partidos = partidos;
    }

    public int getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }

    public double calcularEfectividad() {
        return this.getGoles()/this.getPartidos();
    }

    public double calcularBonus() {
        if ((this.getPartidos()/this.getGoles()) > 0.5) {
        return this.getSueldo_basico();
    } else {
        return 0;
      }
    }
    
    
}
