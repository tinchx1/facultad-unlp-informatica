package main.java.ej22;

import java.util.ArrayList;
import java.util.List;

public class Vendedor extends Persona {
  private List<Producto> productos;

  public Vendedor(String nombre, String direcc) {
    super(nombre, direcc);
    this.productos = new ArrayList<Producto>();
  }
}
