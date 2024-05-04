/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalCompaniaSeguros;

/**
 *
 * @author tinch
 */
public class RubroSeguro {
    private Poliza[] polizas;
    private int dimF = 200;
    private int dimL = 0;

    public RubroSeguro() {
        this.polizas = new Poliza[dimF];
    }
    public void newPoliza(Poliza poliza) {
        if (dimL < dimF) {
            this.polizas[dimL] = poliza;
            this.dimL++;
        } else {
            System.out.println("Error: ya hay 200 polizas");
        }
    }

    public Poliza getPoliza(int i) {
        return polizas[i];
    }
    
    public int getDimL() {
        return dimL;
    }
    
}
