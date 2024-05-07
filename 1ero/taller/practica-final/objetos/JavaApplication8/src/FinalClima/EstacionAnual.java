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
public class EstacionAnual extends Estacion {
    private int años;
    private double[] promedioAnual;
    private int diml= 0;

    public EstacionAnual(int años, String nombre, double cordenadasLatitud, double longitud) {
        super(nombre, cordenadasLatitud, longitud);
        this.años = años;
        this.promedioAnual = new double[años];
    }

    public void agregarPromedio(int año, double temperatura) {
        if (diml < años) {
           promedioAnual[año] = temperatura;
           diml++;
        }
    }

    @Override
    public String maximo() {
        double max = -9999;
        int maxAño = 0;
        for (int i = 0; i < años; i++) {
            if (this.promedioAnual[i] > max) {
                max = this.promedioAnual[i];
                maxAño = 2024 - i;
            }
        }
        return "El año maximo fue " + maxAño + " con la tem" + max; 
    }
     
}
