/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5;

/**
 *
 * @author tinch
 */
public class ej2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estacionamiento est1 = new Estacionamiento("roman", "9 de julio", "9:00", "21:00", 3, 3);
        Auto au1 = new Auto("volcas", "25483sf4");
        Auto au2 = new Auto("volcassda", "2548saf34");
        Auto au3 = new Auto("volcas3sa", "25483afs4");
        Auto au4 = new Auto("volcas3", "25483324");
        Auto au5 = new Auto("volcas34", "25344834");
        Auto au6 = new Auto("volcas3", "2544834");
        est1.registrarAuto(au1, 2, 1);
        est1.registrarAuto(au2, 1, 2);
        est1.registrarAuto(au3, 1, 0);
        est1.registrarAuto(au4, 2, 1);
        est1.registrarAuto(au5, 1, 2);
        est1.registrarAuto(au6, 2, 1);
        System.out.println(est1.toString());
        System.out.println(est1.cantidadAutos(1));
        System.out.println(est1.checkearAuto("2544834"));
    }
    
}
