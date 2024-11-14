package com.example;

import java.time.LocalDate;

public abstract class Envio {
  private String direcDestino;
  private String direcOrigen;
  private double peso;

  public double getPeso() {
    return peso;
  }

  private LocalDate fechaDespacho;

  public Envio(LocalDate fechaDespacho, String direcDestino, String direcOrigen, double peso) {
    this.direcDestino = direcDestino;
    this.direcOrigen = direcOrigen;
    this.peso = peso;
    this.fechaDespacho = fechaDespacho;
  }


  public LocalDate getFechaDespacho() {
    return fechaDespacho;
  }

  public abstract double getMonto();

}
