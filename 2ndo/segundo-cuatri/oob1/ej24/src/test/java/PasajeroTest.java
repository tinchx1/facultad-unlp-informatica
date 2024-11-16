import com.example.Conductor;
import com.example.Pasajero;
import com.example.Vehiculo;
import com.example.Viaje;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class PasajeroTest {
  private Pasajero pasajero;
  // private Viaje viaje;

  // private Auto
  @BeforeEach
  public void setUp() {
    pasajero = new Pasajero("pepe", 0);
    // viaje = new Viaje("A", "B", 100, new Vehiculo("Auto", 2020, 20000, 4, new
    // Conductor("pepe", 0, null)), LocalDate.now().minusDays(10));
  }

  @Test
  public void incrementarSaldoTest() {
    this.pasajero.incrementarSaldo(100);
    assertEquals(90, pasajero.getSaldo());
  }

}
