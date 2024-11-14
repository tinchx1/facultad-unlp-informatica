package com.example;

import java.util.List;

public class ClientesCorporativos extends Cliente {
  private int cuit;

  public ClientesCorporativos(String nombreEmpresa, String dirección, int cuit) {
    super(nombreEmpresa, dirección);
    this.cuit = cuit;
  }

  @Override
  protected double montoConDescuento(double montoSinDescuento) {
    return montoSinDescuento;
  }

}
