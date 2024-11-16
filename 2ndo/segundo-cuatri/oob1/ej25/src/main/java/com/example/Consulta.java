package com.example;

import java.time.LocalDate;

public abstract class Consulta {
  private Mascota mascota;
  private LocalDate fecha;

  public LocalDate getFecha() {
    return fecha;
  }

  public Consulta(Mascota mascota) {
    this.mascota = mascota;
    this.mascota.addConsulta(this);
    this.fecha = LocalDate.now()
  }

  public abstract double calcularCosto();
}
