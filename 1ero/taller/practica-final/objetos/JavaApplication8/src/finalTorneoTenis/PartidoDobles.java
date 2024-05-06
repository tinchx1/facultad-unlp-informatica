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
public class PartidoDobles extends Partido {
    private Tenista tenista1Equipo1;
    private Tenista tenista2Equipo1;
    private Tenista tenista1Equipo2;
    private Tenista tenista2Equipo2;

    public PartidoDobles(Tenista tenista1Equipo1, Tenista tenista2Equipo1, Tenista tenista1Equipo2, Tenista tenista2Equipo2, String fecha, String lugar) {
        super(fecha, lugar);
        this.tenista1Equipo1 = tenista1Equipo1;
        this.tenista2Equipo1 = tenista2Equipo1;
        this.tenista1Equipo2 = tenista1Equipo2;
        this.tenista2Equipo2 = tenista2Equipo2;
    }
   @Override
    public void otorgarPremio(double premio) {
        double premioJ1;
        double premioJ2;
            if (this.getSetsLado1() > this.getSetsLado2()) {
                premioJ1 = premio * (this.tenista1Equipo1.getPartidosGanados() / this.tenista1Equipo1.getPartidosGanados() + this.tenista2Equipo1.getPartidosGanados());
                premioJ2 = premio * (this.tenista2Equipo1.getPartidosGanados() / this.tenista1Equipo1.getPartidosGanados() + this.tenista2Equipo1.getPartidosGanados());
                this.tenista1Equipo1.setPartidosGanados();
                this.tenista1Equipo1.setPremios(premioJ1);
                this.tenista2Equipo1.setPartidosGanados();
                this.tenista2Equipo1.setPremios(premio);
            } else {
                premioJ1 = premio * (this.tenista1Equipo2.getPartidosGanados() / this.tenista1Equipo2.getPartidosGanados() + this.tenista2Equipo2.getPartidosGanados());
                premioJ2 = premio * (this.tenista2Equipo2.getPartidosGanados() / this.tenista1Equipo2.getPartidosGanados() + this.tenista2Equipo2.getPartidosGanados());
                this.tenista1Equipo2.setPartidosGanados();
                this.tenista1Equipo2.setPremios(premio);
                this.tenista2Equipo2.setPartidosGanados();
                this.tenista2Equipo2.setPremios(premio);
            }
        
    }
}
