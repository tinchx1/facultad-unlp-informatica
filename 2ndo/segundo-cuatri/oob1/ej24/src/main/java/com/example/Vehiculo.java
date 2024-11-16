package com.example;

public class Vehiculo {
  private String descripcion;
  private int año;

  public int getAño() {
    return año;
  }

  private double valorMercado;

  public double getValorMercado() {
    return valorMercado;
  }

  private int capacidad;

  public int getCapacidad() {
    return capacidad;
  }

  private Conductor dueño;

  public Vehiculo(String descripcion, int año, double valorMercado, int capacidad, Conductor dueño) {
    this.descripcion = descripcion;
    this.año = año;
    this.valorMercado = valorMercado;
    this.capacidad = capacidad;
    this.dueño = dueño;
  }

  public Conductor getDueño() {
    return dueño;
  }

}
