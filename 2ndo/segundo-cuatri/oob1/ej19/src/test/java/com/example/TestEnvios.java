package com.example;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class TestEnvios {
    private PersonaFisica per;
    private ClientesCorporativos emp;
    private Envio env1;
    private Envio env2;
    private Envio env3;

    @BeforeEach
    public void SetUp() {
        per = new PersonaFisica("Carlos", "116, 175", 46628);
        emp = new ClientesCorporativos("Globant", "Moreno 1700", 1231);
        env1 = new EnvioLocal(LocalDate.of(2024, 10, 5), "Tolosa", "Los Hornos", 100.00, true);
        env2 = new EnvioUrbano(LocalDate.of(2024, 11, 10), "Moron", "La Matanza", 250.0, 100);
        env3 = new EnvioInternacional(LocalDate.of(2024, 7, 15), "Argentina", "Alemania", 1500);
    }

    @Test
    void testAgregarEnvio() {
        per.agregarEnvio(env1);
        per.agregarEnvio(env2);
        per.agregarEnvio(env3);
        assertEquals(3, per.getEnvios().size());
    }

    @Test
    void testMontos() {
        per.agregarEnvio(env1);
        per.agregarEnvio(env2);
        per.agregarEnvio(env3);
        emp.agregarEnvio(env1);
        emp.agregarEnvio(env2);
        emp.agregarEnvio(env3);
        assertEquals(1500, emp.monto(new DateLapse(LocalDate.of(2024, 10, 1), LocalDate.of(2024, 10, 30))));
        assertEquals(23000, emp.monto(new DateLapse(LocalDate.of(2024, 7, 1), LocalDate.of(2024, 7, 31))));
    }

}