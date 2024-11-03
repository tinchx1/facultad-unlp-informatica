public class MailClient {
  private List<Folder> folders;
  private Folder inbox;

  public receive(Email email) {
    inbox.addEmail(email);
  }

  public Email buscar(String texto) {
    return this.folders.stream().map(f -> f.buscar(texto)).findFirst().orElse(null);
  }

  public int espacioOcupado() {
    return this.folders.mapToInt(f -> f.espacionOcupado()).sum();
  }
}
