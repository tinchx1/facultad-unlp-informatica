package com.example;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Viaje {
  private String origen;
  private String destino;
  private double costo;
  private Vehiculo vehiculo;
  private LocalDate fecha;
  private List<Usuario> pasajeros;

  public Viaje(String origen, String destino, double costo, Vehiculo vehiculo, LocalDate fecha) {
    this.origen = origen;
    this.destino = destino;
    this.costo = costo;
    this.vehiculo = vehiculo;
    this.fecha = fecha;
    this.pasajeros = new ArrayList<Usuario>();
    this.pasajeros.add(vehiculo.getDueño());
  }

  public LocalDate getFecha() {
    return fecha;
  }

  public void registrarPasajero(Pasajero pasajero) {
    if (pasajero.puedeRegistrar() && this.pasajeros.size() < vehiculo.getCapacidad()
        && LocalDate.now().isBefore(this.fecha.minusDays(2))) {
      this.pasajeros.add(pasajero);
      pasajero.registrarViaje(this);
    }
  }

  public void procesarViaje() {
    this.pasajeros.forEach(p -> p.descontarSaldo(this.costo));
  }
}
