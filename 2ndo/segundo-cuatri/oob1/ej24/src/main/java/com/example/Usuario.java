package com.example;

public abstract class Usuario {
  private String nombre;
  private double saldo;

  public Usuario(String nombre, double saldo) {
    this.nombre = nombre;
    this.saldo = saldo;
  }

  public double getSaldo() {
    return saldo;
  }

  public abstract double getBonificacion();

  public abstract double getComision();

  public void incrementarSaldo(double monto) {
    this.saldo += monto;
    this.saldo -= this.saldo * this.getComision();
  };

  public void descontarSaldo(double monto) {
    this.saldo = this.saldo - monto + this.getBonificacion();
  }
}
