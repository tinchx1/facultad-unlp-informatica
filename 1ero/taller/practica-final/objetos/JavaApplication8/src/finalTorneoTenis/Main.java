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
public class Main {
    public static void main(String[] args) {
        Tenista t1 = new Tenista("del potro", 5, 4222.2);
        Tenista t2 = new Tenista("martin", 5, 4222.2);
        Tenista t3 = new Tenista("franco", 5, 4222.2);
        Tenista t4 = new Tenista("lisandro", 5, 4222.2);
        PartidoSingle ps = new PartidoSingle(t1, t2, "020242", "casa");
        PartidoDobles pd = new PartidoDobles(t3,t4, t1, t2, "020242", "casa");
        ps.actualizarResultado(3, 2);
        ps.actualizarResultado(3, 2);
        ps.actualizarResultado(3, 2);
        ps.otorgarPremio(100000);
        pd.actualizarResultado(3, 2);
        pd.actualizarResultado(3, 2);
        pd.actualizarResultado(3, 2);
        pd.otorgarPremio(500000);
        System.out.println(t1.toString());
        System.out.println(t2.toString());
        System.out.println(t3.toString());
        System.out.println(t4.toString());
    }
}
