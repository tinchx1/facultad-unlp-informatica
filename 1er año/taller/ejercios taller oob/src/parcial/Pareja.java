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
public class Pareja {
    private Participante participante1;
    private Participante participante2;
    private String estilo;

    public Pareja(Participante participante1, Participante participante2, String estilo) {
        this.participante1 = participante1;
        this.participante2 = participante2;
        this.estilo = estilo;
    }

    public Participante getParticipante1() {
        return participante1;
    }

    public void setParticipante1(Participante participante1) {
        this.participante1 = participante1;
    }

    public Participante getParticipante2() {
        return participante2;
    }

    public void setParticipante2(Participante participante2) {
        this.participante2 = participante2;
    }

    public String getEstilo() {
        return estilo;
    }

    public void setEstilo(String estilo) {
        this.estilo = estilo;
    }
    public int diferenciaEdad(){
        if (this.participante1.getEdad() > this.participante2.getEdad()) {
            return (this.participante1.getEdad() - this.participante2.getEdad());
        } else {
            return this.participante2.getEdad();
        }
    }
}
