public abstract class Persona {
  private String nombre;
  public String getNombre() {
    return nombre;
  }

  private String direcc;

  public Persona(String nombre, String direcc) {
    this.nombre = nombre;
    this.direcc = direcc;
  }

}
