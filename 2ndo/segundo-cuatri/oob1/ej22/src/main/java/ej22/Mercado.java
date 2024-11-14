import java.util.List;

public class Mercado {
  private List<Cliente> clientes;
  private List<Vendedor> vendedores;
  private List<Producto> productos;
  private List<Pedido> pedidos;

  public void crearPedido(String nombreCliente, String nombreProducto, String formaPago, String formaEnvio, int cant) {
    Producto producto = this.productos.stream().filter(p -> p.hayUnidadesDisponibles(nombreProducto, cant));
    if (producto == null) {
      return;
    }
    Pedido pedido = new Pedido(formaPago, formaEnvio, producto, cant);
    this.clientes = this.clientes.stream().map(c -> {
      if (c.getNombre() == nombreCliente) {
        c.addPedido(pedido);
      }
      return c;
    });
    this.productos = this.productos.stream().map(p -> {
      if (p.getNombre() == nombreProducto) {
        p.descontarUnidades(cant);
        return p;
      }
      return p;
    });
  }
}
