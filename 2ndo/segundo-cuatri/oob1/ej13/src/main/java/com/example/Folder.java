import java.util.List;

public class Folder {
  private String name;
  private List<Email> emails;

  public void addEmail(Email email) {
    emails.add(email);
  }

  public delete(Email email) {
    this.emails.remove(email);
  }

  public void mover(Email email, Folder destino) {
    this.delete(email);
    destino.addEmail(email);
  }

  public Email buscar(String texto) {
    return this.emails.stream().filter(e -> e.cumple(texto)).findFirst().orElse(null);
  }

  public int espacioOcupado() {
    return this.emails.mapToInt(m -> m.espacionOcupado()).sum();
  }
}