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
public class JavaApplication8 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Cliente c1 = new Cliente(2332,"carlos", "pepe");
        Cliente c2 = new Cliente(2332,"carlos", "pepe");
        Cliente c3 = new Cliente(2332,"carlos", "pepe");
        Cliente c4 = new Cliente(2332,"carlos", "pepe");
        Cliente c5 = new Cliente(23,"carlos", "pepe");
        Fecha f1 = new Fecha(2,4,2024);
        Fecha f2 = new Fecha(2,4,2024);
        Fecha f3 = new Fecha(1,3,2024);
        Fecha f4 = new Fecha(2,4,2023);
        Fecha f5 = new Fecha(1,3,2024);
        Poliza p1 = new Poliza(c1, 2.5,1.2,f4,f1);
        Poliza p2 = new Poliza(c2, 2.5,1.2,f4,f2);
        Poliza p3 = new Poliza(c3, 2.5,1.2,f4,f3);
        Poliza p4 = new Poliza(c4, 2.5,1.2,f4,f4);
        Poliza p5 = new Poliza(c5, 2.5,1.2,f4,f5);
        Compania compania = new Compania();
        compania.agregarPoliza(p1, 3);
        compania.agregarPoliza(p2, 3);
        compania.agregarPoliza(p3, 3);
        compania.agregarPoliza(p4, 3);
        compania.agregarPoliza(p5, 1);
        compania.aumentar(1.11, 3);
        System.out.println(compania.infoCliente(2332));
        System.out.println("La cantidad a vencer es de " + compania.cantidadAVencer(4, 2024));
    }
    
}
