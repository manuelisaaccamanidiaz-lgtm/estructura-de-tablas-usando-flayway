package com.practica_tablas.infrastructure;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = { "com.practica_tablas" })
public class PracticaTablasApplication {
    public static void main(String[] args) {
        SpringApplication.run(PracticaTablasApplication.class, args);
    }
}
