public class Producto {
  private String nombre;
  private String categoria;
  private double precio;

  public double getPrecio() {
    return precio;
  }

  private int unidadadesDisponibles;

  public Producto(String nombre, String categoria, double precio, int unidadadesDisponibles) {
    this.nombre = nombre;
    this.categoria = categoria;
    this.precio = precio;
    this.unidadadesDisponibles = unidadadesDisponibles;
  }

  public Boolean hayUnidadesDisponibles(String nombreProduct, int cant) {
    if (this.nombre != nombreProduct) {
      return false;
    }
    if (this.unidadadesDisponibles < cant) {
      return false;
    }
    return true;
  }

  public String getNombre() {
    return nombre;
  }

  public void descontarUnidades(int cant) {
    this.unidadadesDisponibles = this.unidadadesDisponibles - cant;
  }
}
