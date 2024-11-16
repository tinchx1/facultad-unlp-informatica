package com.example;

public class Conductor extends Usuario {
  private Vehiculo vehiculo;

  public Conductor(String nombre, double saldo, Vehiculo vehiculo) {
    super(nombre, saldo);
    this.vehiculo = vehiculo;
  }

  @Override
  public double getBonificacion() {
    return this.vehiculo.getValorMercado() * 0.001;
  }

  @Override
  public double getComision() {
    if (this.vehiculo.getAño() < 5) {
      return 0.01;
    }
    return 0.1;
  }
}