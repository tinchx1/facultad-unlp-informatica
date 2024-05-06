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
public class PartidoSingle extends Partido {
    private Tenista tenista1;
    private Tenista tenista2;

    public PartidoSingle(Tenista tenista1, Tenista tenista2, String fecha, String lugar) {
        super(fecha, lugar);
        this.tenista1 = tenista1;
        this.tenista2 = tenista2;
    }

    @Override
    public void otorgarPremio(double premio) {
        if (this.verificarFinalizado()) {
            if (this.getSetsLado1() > this.getSetsLado2()) {
                this.tenista1.setPartidosGanados();
                this.tenista1.setPremios(premio);
            } else {
                this.tenista2.setPartidosGanados();
                this.tenista2.setPremios(premio);

            }
        }
    }
    
}
