/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FinalClima;

/**
 *
 * @author tinch
 */
public class EstacionMensual extends Estacion {
    private int años;
    private double[][] temperaturas;

    public EstacionMensual(int años, String nombre, double cordenadasLatitud, double longitud) {
        super(nombre, cordenadasLatitud, longitud);
        this.años = años;
        this.temperaturas = new double[años][12];
    }

    public void agregarPromedio(double tiempo, double temperatura) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String maximo() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
