/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.compra;

import com.mallbit.Conexion.ConexionDB;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Andres Ramos
 */
public class ModeloCompra {
    
    public int comprasTotales() throws SQLException {
        Connection connection;
        Statement statement;
        ResultSet resultSet;

        int numeroCompras = 0;

        //Establecer la conexion
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement y ejecutar
        String sentencia = "SELECT * FROM comprasTotales";
        //Crear sentencia SQL y statement
        statement = connection.createStatement();

        //Ejecutar SQL y guardar valores de consulta en resultSet
        resultSet = statement.executeQuery(sentencia);

        while (resultSet.next()) {
            numeroCompras = resultSet.getInt("Compras");
        }
        return numeroCompras;
    }
}
