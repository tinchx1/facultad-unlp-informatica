import java.util.ArrayList;

public class Cliente extends Persona {
  private List<Pedido> pedidos;

  public Cliente(String nombre, String direcc) {
    super(nombre, direcc);
    this.pedidos = new ArrayList<Pedido>();
  }

  public void addPedido(Pedido pedido) {
    this.pedidos.add(pedido);
  }
}
