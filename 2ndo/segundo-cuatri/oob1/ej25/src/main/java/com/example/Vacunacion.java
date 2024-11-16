package com.example;

public class Vacunacion extends ConsultaConMedico {

  private String nombreVacuna;
  private double costoVacuna;

  public Vacunacion(String paciente, String medico, String fecha, String nombreVacuna, double costoVacuna) {
    super(paciente, medico);
    this.nombreVacuna = nombreVacuna;
    this.costoVacuna = costoVacuna;
  }
}
