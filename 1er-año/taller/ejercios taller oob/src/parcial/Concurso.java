/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial;

/**
 *
 * @author tinch
 */
public class Concurso {
    private Pareja[] parejas;
    private int diml;  
    private int dimf;  
    

    public Concurso(int dimf) {
        this.diml = 0;
        this.dimf =  dimf;
        this.parejas = new Pareja[dimf];
    }

    public Pareja[] getParejas() {
        return parejas;
    }

    public void setParejas(Pareja[] parejas) {
        this.parejas = parejas;
    }

    public int getDiml() {
        return diml;
    }

    public void setDiml(int diml) {
        this.diml = diml;
    }
    public void agregarPareja(Pareja pareja) {
        if (this.diml < this.dimf)  {
            this.parejas[this.diml] = pareja;            
            this.diml++;
        }
    }
    public Pareja parejaMayor() {
        int edadMayor = 0;
        int i;
        Pareja parejaMayor = null;
        for(i = 0; i < diml; i++) {
            if (this.parejas[i].diferenciaEdad() > edadMayor) {
                edadMayor = this.parejas[i].diferenciaEdad();
                parejaMayor= parejas[i];
            }
        }
        return parejaMayor;
    }

    @Override
    public String toString() {
        return "Concurso{" + "parejas=" + parejas + ", diml=" + diml + ", dimf=" + dimf + '}';
    }
    
}
