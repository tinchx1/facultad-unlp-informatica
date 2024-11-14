package com.example;

import java.time.LocalDate;

public class EnvioInternacional extends Envio {
  public EnvioInternacional(LocalDate fechaDespacho, String direcDestino, String direcOrigen, double peso) {
    super(fechaDespacho, direcDestino, direcOrigen, peso);
  }

  @Override
  public double getMonto() {
    double total = 5000;
    double peso = this.getPeso();

    if (peso < 1000) {
      return total + peso * 10;
    } else if (peso > 1000) {
      return total + peso * 12;
    }
    return total;
  }

}