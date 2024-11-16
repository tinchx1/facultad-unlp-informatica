package com.example;

import java.time.LocalDate;

public class Medico {
  private String nombre;
  private LocalDate fechaIng;

  public LocalDate getFechaIng() {
    return fechaIng;
  }

  private double cobra;

  public double getCobra() {
    return cobra;
  }

  public Medico(String nombre, LocalDate fechaIng, double cobra) {
    this.nombre = nombre;
    this.fechaIng = fechaIng;
    this.cobra = cobra;
  }

}
