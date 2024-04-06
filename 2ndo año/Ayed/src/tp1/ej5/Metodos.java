/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp1.ej5;

/**
 *
 * @author tinch
 */
public class Metodos {
    public static String metodoa(int[] arr) {
        int max = Integer.MIN_VALUE;
        int min = 9999;
        int cant = 0;
        int total = 0;
        for (int num: arr) {
            if (num > max) {
                max = num;
            }
            if (num < min) {
                min= num;
            }
            total=+ num;
            cant=+ 1;
        }
        int promedio= total / cant;
        Datos datos = new Datos(max,min, promedio);
        return datos.toString();
    }
    public static void metodobc(int[] arre) {
        int max = Integer.MIN_VALUE;
        int min = 9999;
        int cant = 0;
        int total = 0;
        for (int num: arre) {
            if (num > max) {
                max = num;
            }
            if (num < min) {
                min= num;
            }
            total=+ num;
            cant=+ 1;
        }
        int promedio= total / cant;
        Datos datos = new Datos(max,min, promedio);
        System.out.println(datos.toString());
    }

}
