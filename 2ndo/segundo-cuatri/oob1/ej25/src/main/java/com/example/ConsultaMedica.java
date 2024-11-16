package com.example;

import java.time.LocalDate;

public class ConsultaMedica extends ConsultaConMedico {
  private LocalDate fechaAtencion;

  public ConsultaMedica(String nombreMedico, String especialidad) {
    super(nombreMedico, especialidad);
    this.fechaAtencion = LocalDate.now();
  }
  
  @Override
  public double costoExtra() {
    return 300;
  };
}
