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
public class Empresa {
    private String nombre;
    private String direccion;
    private Director director;
    private int diml;
    private Encargado[] encargados;

    public Empresa(String nombre, String direccion, Director director, int n) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.director = director;
        this.diml = n;
        this.encargados = new Encargado[n];
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

    public int getDiml() {
        return diml;
    }

    public void setDiml(int diml) {
        this.diml = diml;
    }
    public void asignarEncargado(int x, Encargado e) {
        encargados[x]= e;
    } 

    public String representacionEncargados() {
        String aux = "";
        for (int i = 0; i < this.getDiml(); i++) {
            if (this.encargados[i] != null) {
                aux += "Sucursal numero " + i + " con encargado " + this.encargados[i].toString();
            } else {
                aux += "Sucursal numero " + i + " sin encargado ";
            }
        }
        return aux;
    }
    public String toString() {
        return "Empresa " + "nombre=" + nombre + ", direccion=" + direccion + " con director " + this.director.toString() + " y con " + this.representacionEncargados();
    }
}
    

