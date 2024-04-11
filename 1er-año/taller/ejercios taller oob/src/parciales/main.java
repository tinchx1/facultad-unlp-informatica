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
public class main {

    /**public Director(double montoViaticos, String nombre, int dni, int año, double sueldoBasico)
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Director dir1 = new Director(200, "alfonso", 453235, 2020, 2000);
        Empresa emp1 = new Empresa("arcor", "alcantora", dir1, 5);
        Encargado enc1 = new Encargado(5, "carlos", 455353, 2002, 400);
        Encargado enc2 = new Encargado(5, "carlos", 455353, 2002, 400);
        Encargado enc3 = new Encargado(5, "carlos", 455353, 2002, 400);
        Encargado enc4 = new Encargado(5, "carlos", 455353, 2002, 400);
        emp1.asignarEncargado(0, enc1);
        emp1.asignarEncargado(1, enc2);
        emp1.asignarEncargado(2, enc3);
        emp1.asignarEncargado(3, enc4);
        System.out.println(emp1.toString());
    }
    
}
