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
public class Entrenadores extends Empleados{
    private int campeonatos_ganados;

    public Entrenadores(int campeonatos_ganados, String nombre, double sueldo_basico, int antiguedad) {
        super(nombre, sueldo_basico, antiguedad);
        this.campeonatos_ganados = campeonatos_ganados;
    }

    public int getCampeonatos_ganados() {
        return campeonatos_ganados;
    }

    public void setCampeonatos_ganados(int campeonatos_ganados) {
        this.campeonatos_ganados = campeonatos_ganados;
    }

    public double calcularEfectividad() {
        return campeonatos_ganados * this.getAntiguedad();
    }

    
    public double calcularBonus() {
        if ((this.getCampeonatos_ganados() <= 4) && (this.getCampeonatos_ganados() >= 1)) {
            return 5000;
        }
        else if ((this.getCampeonatos_ganados() <= 10) && (this.getCampeonatos_ganados() >= 5)) {
            return 30000;
        } else if (this.getCampeonatos_ganados() >= 10){
            return 50000;
        } else {
            return 0;
        } 
    }
}
