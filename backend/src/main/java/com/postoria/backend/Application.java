package com.postoria.backend;

import com.postoria.backend.config.DatabaseConnection;

import java.net.ConnectException;
import java.sql.Connection;
import java.sql.SQLException;

public class Application {
    public static void main(String[] args) {
        System.out.println("Iniciando Postoria Backend...");

        try(Connection connection = DatabaseConnection.getConnection()){
            System.out.println("Conexion exitosa a PostgreSQL");
        } catch (SQLException e) {
            System.out.println("Error al conectar");
            e.printStackTrace();
        }
    }
}
