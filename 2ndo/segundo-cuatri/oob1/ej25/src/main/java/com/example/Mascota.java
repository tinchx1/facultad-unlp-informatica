package com.example;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Mascota {
  private String nombre;
  private LocalDate fechaNac;
  private String especio;
  private List<Consulta> consultas;

  public Mascota(String nombre, LocalDate fechaNacimiento, String especie) {
    this.nombre = nombre;
    this.fechaNac = fechaNacimiento;
    this.especie = especie;
    this.consultas = new ArrayList<Consulta>();
  }

  public addConsulta(Consulta c) {
    this.consultas.add(c);
  }

  public double recaudacionEnFecha(LocalDate f) {
    return this.consultas.stream().filter(c -> c.getFecha().equals(f)).mapToDouble(c -> c.calcularCosto()).sum();
  }
}
