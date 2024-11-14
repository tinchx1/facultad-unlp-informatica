package com.example;

import java.util.LinkedList;
import java.util.List;

public abstract class Cliente {
  private String nombreEmpresa;
  private String dirección;
  private List<Envio> envios;

  public List<Envio> getEnvios() {
    return envios;
  }

  public Cliente(String nombreEmpresa, String dirección) {
    this.nombreEmpresa = nombreEmpresa;
    this.dirección = dirección;
    this.envios = new LinkedList<>();
  }

  public void agregarEnvio(Envio envio) {
    this.envios.add(envio);
  }

  public double monto(DateLapse periodo) {
    return this.envios.stream().filter(e -> periodo.includesDate(e.getFechaDespacho()))
        .mapToDouble(e -> this.montoConDescuento(e.getMonto()))
        .sum();
  }

  protected abstract double montoConDescuento(double montoSinDescuento);
}