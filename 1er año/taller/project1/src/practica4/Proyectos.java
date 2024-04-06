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
public class Proyectos {
    private String nombreProyecto;
    private String nombreDirector;
    private int cod;
    private Investigador[] investigadores;
    private int diml;

    public Proyectos(String nombreProyecto, String nombreDirector, int cod) {
        this.nombreProyecto = nombreProyecto;
        this.nombreDirector = nombreDirector;
        this.cod = cod;
        this.investigadores = new Investigador[50];
    }
    
    public String getNombreProyecto() {
        return nombreProyecto;
    }

    public void setNombreProyecto(String nombreProyecto) {
        this.nombreProyecto = nombreProyecto;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }

    public int getCod() {
        return cod;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }

    public Investigador[] getInvestigadores() {
        return investigadores;
    }

    public void setInvestigadores(Investigador[] investigadores) {
        this.investigadores = investigadores;
    }

    public int getDiml() {
        return diml;
    }

    public void setDiml(int diml) {
        this.diml = diml;
    }

    public String toString() {
        return "nombreProyecto: " + nombreProyecto + ", nombreDirector: " + nombreDirector + ", cod: " + cod ;
    }
    
}
