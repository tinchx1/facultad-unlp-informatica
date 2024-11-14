public class Pedido {
  private String opcionDePago;
  private String opcionEnvio;
  private Producto producto;
  private int cant;

  public Pedido(String opcionDePago, String opcionEnvio, Producto producto, int cant) {
    this.opcionDePago = opcionDePago;
    this.opcionEnvio = opcionEnvio;
    this.producto = producto;
    this.cant = cant;
  }

  public double calcularCosto() {
    double precio = this.producto.getPrecio();

    if (this.opcionDePago = "6 cuotas") {
      precio = precio + (precio * 0.20);
    }
    if (this.opcionEnvio = "retirar en sucursal del correo") {
      precio += 3000;
    }
    if (this.opcionEnvio = "express a domicilio") {
      CalculadoraDistancia calc = new CalculadoraDistancia();

      precio += calc.distaciaEntre(opcionEnvio, opcionDePago);
    }
    return precio;
  }
}
