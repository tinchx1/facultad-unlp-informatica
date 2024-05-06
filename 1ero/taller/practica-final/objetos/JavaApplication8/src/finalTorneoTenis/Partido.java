/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalTorneoTenis;

/**
 *
 * @author tinch
 */
public abstract class Partido {
    private String fecha;
    private String lugar;
    private int setsLado1 = 0;
    private int setsLado2 = 0;

    public Partido(String fecha, String lugar) {
        this.fecha = fecha;
        this.lugar = lugar;
    }
    public void actualizarResultado(int gamesL1, int gamesL2) {
        if (gamesL1 < gamesL2) {
            this.setsLado2++;
        } else if (gamesL1 > gamesL2) {
            this.setsLado1++;
        }
    }
    public boolean verificarFinalizado() {
        return ((this.setsLado1 == 3) || (this.setsLado1 == 3));
    }
    abstract public void otorgarPremio(double premio);

    public int getSetsLado1() {
        return setsLado1;
    }

    public int getSetsLado2() {
        return setsLado2;
    }

}
