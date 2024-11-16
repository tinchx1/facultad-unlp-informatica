package com.example;

import java.time.DayOfWeek;

public abstract class ConsultaConMedico extends Consulta {
  private Medico medico;

  public ConsultaConMedico(Medico medico, Mascota mascota) {
    super(mascota);
    this.medico = medico;
  }

  private double costoDomingo() {
    return this.getFecha().getDayOfWeek().equals(DayOfWeek.SUNDAY) ? 500 : 0;

  }

  public abstract double costoMateriales();

  public abstract double costoExtra();

  @Override
  public double calcularCosto() {
    return this.medico.getCobra() + this.costoMateriales() + this.costoExtra() + this.costoDomingo();
  }

}
