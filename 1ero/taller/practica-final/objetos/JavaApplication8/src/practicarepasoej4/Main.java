/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practicarepasoej4;

/**
 *
 * @author tinch
 */
public class Main {
    public static void main(String[] args) {
        // Crear director
        Director director = new Director("Nombre Director", 40, 5);

        // Coro Semicircular
        Coro semicircular = new CoroSemicircular(3, "Coro Semicircular", director);
        semicircular.agregarCorista(new Corista("Juan", 30, 11111111, 440));
        semicircular.agregarCorista(new Corista("María", 25, 22222222, 415));
        semicircular.agregarCorista(new Corista("Pedro", 35, 33333333, 430));

        // Coro por Hileras
        Coro porHileras = new CoroPorHileras( 2, "Coro por Hileras", director);
        porHileras.agregarCorista(new Corista("Ana", 28, 44444444, 420));
        porHileras.agregarCorista(new Corista("Luis", 32, 55555555, 410));
        porHileras.agregarCorista(new Corista("Elena", 27, 66666666, 425));
        porHileras.agregarCorista(new Corista("Carlos", 31, 77777777, 435));

        // Imprimir información de los coros
        System.out.println("Coro Semicircular:");
        System.out.println(semicircular.datosCoro());
        System.out.println("¿Está bien formado?: " + (semicircular.verificarFormado() ? "Sí" : "No"));
        System.out.println();

        System.out.println("Coro por Hileras:");
        System.out.println(porHileras.datosCoro());
        System.out.println("¿Está bien formado?: " + (porHileras.verificarFormado() ? "Sí" : "No"));
    }
}
