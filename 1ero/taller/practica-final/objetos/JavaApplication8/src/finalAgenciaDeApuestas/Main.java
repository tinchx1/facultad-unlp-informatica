/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalAgenciaDeApuestas;

/**
 *
 * @author tinch
 */
public class Main {
    public static void main(String[] args) {
        // Crear instancias de Partido
        Partido partido1 = new Partido("EquipoLocal1", "EquipoVisitante1", 2.5, 3.0, 2.8);
        Partido partido2 = new Partido("EquipoLocal2", "EquipoVisitante2", 2.0, 3.2, 2.5);

        // Crear instancias de Apuesta
        Apuesta apuesta1 = new Apuesta("Juan", 12345678, 0, 100.0, "victoria local");
        Apuesta apuesta2 = new Apuesta("Maria", 98765432, 1, 50.0, "empate");

        // Crear instancia de Agencia y agregar partidos y apuestas
        Agencia agencia = new Agencia();
        agencia.agregarPartido(partido1);
        agencia.agregarPartido(partido2);
        agencia.agregarApuesta(apuesta1);
        agencia.agregarApuesta(apuesta2);

        // Ingresar resultados de los partidos
        agencia.ingresarPartido(0, "victoria local");
        agencia.ingresarPartido(1, "empate");

        agencia.cerrarApuestas();

        agencia.limpiarSistema();
    }
}

