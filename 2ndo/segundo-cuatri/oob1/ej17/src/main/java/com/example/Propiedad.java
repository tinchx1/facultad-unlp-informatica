public class Propiedad {
  private String direcc;
  private String nombreDescriptivo;
  private Double precio;
  private List<Reserva> reservas;

  public Boolean estaReservada(DateLapse periodo) {
    return this.reservas.stream().noneMatch(r -> r.estaReservada(periodo))
  }

  public void crearReserva(Reserva reserva) {
    this.reservas.add(reserva)
  }
  public Double 
}
