/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp1.ej3;

/**
 *
 * @author tinch
 */
public class Test {
    public static void main () {
        Estudiante[] arregloEstudiantes = new Estudiante[2];
        arregloEstudiantes [0] = new Estudiante("alfonso","dsa","sadsa","sdasd","sdsd");
        arregloEstudiantes [1] = new Estudiante("alfsdonso","dssda","ssdadsa","sdasd","sdsd");
        
        Profesor[] arregloProfesores = new Profesor[3];
        arregloProfesores [0] = new Profesor("alfonso","dsa","sadsa","sdasd","sdsd");
        arregloProfesores [1] = new Profesor("alfsdonso","dssda","ssdadsa","sdasd","sdsd");
        arregloProfesores [2] = new Profesor("alfsdonso","dssda","ssdadsa","sdasd","sdsd");
        
        for (Estudiante est: arregloEstudiantes) {
            System.out.println(est.tusDatos());
        }
        for (Profesor prof: arregloProfesores) {
            System.out.println(prof.tusDatos());
        }
    }
}
