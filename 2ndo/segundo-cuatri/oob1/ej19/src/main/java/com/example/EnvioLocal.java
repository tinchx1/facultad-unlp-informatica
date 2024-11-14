package com.example;

import java.time.LocalDate;

public class EnvioLocal extends Envio {
  private boolean entregaRapida;

  public EnvioLocal(LocalDate fechaDespacho, String direcDestino, String direcOrigen, double peso,
      boolean entregaRapida) {
    super(fechaDespacho, direcDestino, direcOrigen, peso);
    this.entregaRapida = entregaRapida;
  }

  @Override
  public double getMonto() {
    // TODO Auto-generated method stub
    if (this.entregaRapida) {
      return 1500;
    }
    return 1000;
  }

}