public class Email {
  private List<File> attachments;
  private String title;
  private String body;

  public String getTitle() {
    return title;
  }

  public String getBody() {
    return body;
  }

  public Boolean cumple(String texto) {
    return title.contains(texto) || body.contains(texto);
  }

  public Integer espacionOcupado() {
    return this.title.length()
        + this.body.length()
        + this.attachments.stream().mapToInt(f -> f.tamaño).sum();
  }

}
