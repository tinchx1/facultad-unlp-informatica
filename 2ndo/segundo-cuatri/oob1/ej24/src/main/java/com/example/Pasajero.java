package com.example;

import java.util.ArrayList;
import java.util.List;

public class Pasajero extends Usuario {
  private List<Viaje> viajesRegistrados;

  public Pasajero(String nombre, double saldo) {
    super(nombre, saldo);
    this.viajesRegistrados = new ArrayList<Viaje>();
  }

  public void registrarViaje(Viaje viaje) {
    this.viajesRegistrados.add(viaje);
  };

  public Boolean puedeRegistrar() {
    return this.getSaldo() >= 0;
  }

  @Override
  public double getBonificacion() {
    return 500;
  }

  @Override
  public double getComision() {
    if (this.viajesRegistrados.stream().noneMatch(v -> v.getFecha().isAfter(v.getFecha().minusDays(30)))) {
      return 0.1;
    }
    return 1;
  }
}
