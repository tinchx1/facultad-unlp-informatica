/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5;

/**
 *
 * @author tinch
 */
public class Estacionamiento {
    private String nombre;
    private String direccion;
    private String horaApertura;
    private String horaCierre;
    private int numPisos;
    private int numPlazas;
    private Auto[][] matriz;

    public Estacionamiento(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = "8:00";
        this.horaCierre = "21:00";
        this.numPisos = 5;
        this.numPlazas = 10;
        this.matriz = new Auto[5][10];
    }

    public Estacionamiento(String nombre, String direccion, String horaCierre, String horaApertura, int numPisos, int numPlazas) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaCierre = horaCierre;
        this.horaApertura = horaApertura;
        this.numPisos = numPisos;
        this.numPlazas = numPlazas;
        this.matriz = new Auto[numPisos][numPlazas];
    }
     
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getHoraApertura() {
        return horaApertura;
    }

    public void setHoraApertura(String horaApertura) {
        this.horaApertura = horaApertura;
    }

    public String getHoraCierre() {
        return horaCierre;
    }

    public void setHoraCierre(String horaCierre) {
        this.horaCierre = horaCierre;
    }

    public int getNumPisos() {
        return numPisos;
    }

    public void setNumPisos(int numPisos) {
        this.numPisos = numPisos;
    }

    public int getNumPlazas() {
        return numPlazas;
    }

    public void setNumPlazas(int numPlazas) {
        this.numPlazas = numPlazas;
    }
    
    public void registrarAuto(Auto a, int x, int y) {
        this.matriz[x][y] = a;
    } 
    public String checkearAuto(String patente) {
        for (int i = 0; i < this.getNumPisos(); i++) {
            for (int j = 0; j < this.getNumPlazas(); j++) {
                if ((this.matriz[i][j] != null) && (this.matriz[i][j].getPatente().equals(patente))) {
                    return "Auto existente en el piso " + i + " plaza " + j;
            }
            }
        }
        return "Auto inexistente";
    }
    public int cantidadAutos(int y) {
        int cant = 0;
        for (int i = 0; i < this.getNumPisos(); i++) {
            if (this.matriz[i][y] != null) {
                cant++;
            }
        }
        return cant;
    }

    public String representacion() {
        String completo = "";
        for (int i = 0; i < this.getNumPisos(); i++) {
            for (int j = 0; j < this.getNumPlazas(); j++) {
                if (this.matriz[i][j] != null) {
                    completo += "piso " + i + " plaza "+ j + ": " + this.matriz[i][j].toString() + ", ";
                } else {
                    completo += "piso " + i + " plaza " + j + ": libre";
                }       
            }            
        }
        return completo;
    }
    public String toString() {
        return this.representacion();
    }
}
