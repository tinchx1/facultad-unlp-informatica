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
public class Marchionni {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Participante part1 = new Participante(342,"ar",24);
        Participante part2 = new Participante(342,"ar",254);
        Participante part3 = new Participante(3422,"arsd",2);
        Participante part4 = new Participante(342,"arasdsd",2524);
        Pareja parj1 = new Pareja(part1,part2,"clasico");
        Pareja parj2 = new Pareja(part3,part4,"clasico");
        Concurso concurso = new Concurso(2);
        concurso.agregarPareja(parj1);
        concurso.agregarPareja(parj2);
        System.out.println(concurso.parejaMayor().getParticipante1().getNombre() + " " + concurso.parejaMayor().getParticipante1().getNombre());
    }
}

    