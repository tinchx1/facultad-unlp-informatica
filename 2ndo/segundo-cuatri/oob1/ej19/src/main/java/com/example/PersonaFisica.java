package com.example;

import java.util.List;

public class PersonaFisica extends Cliente {
  private Integer dni;

  public PersonaFisica(String nombreEmpresa, String dirección, Integer dni) {
    super(nombreEmpresa, dirección);
    this.dni = dni;
  }

  @Override
  protected double montoConDescuento(double montoSinDescuento) {
    return montoSinDescuento * 0.10;
  }

}
