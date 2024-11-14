package com.example;

import java.time.LocalDate;

public class EnvioUrbano extends Envio {
  private double km;

  public EnvioUrbano(LocalDate fechaDespacho, String direcDestino, String direcOrigen, double peso,
      double km) {
    super(fechaDespacho, direcDestino, direcOrigen, peso);
    this.km = km;
  }

  @Override
  public double getMonto() {
    // TODO Auto-generated method stub
    if (this.km < 100) {
      return 20;
    } else if (this.km > 100 && this.km < 500) {
      return 25;
    } else {
      return 30;
    }

  }

}
