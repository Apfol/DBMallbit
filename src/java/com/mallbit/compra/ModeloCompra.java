/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.compra;

import com.mallbit.Conexion.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Andres Ramos
 */
public class ModeloCompra {
    
    public void agregarCompra(Compra compra) throws SQLException {
        Connection connection;
        PreparedStatement preparedStatement;

        //Establecer la conexion
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "INSERT INTO compra (Fecha, IDCliente, IDProducto, IDVendedor, NumeroTarjeta, CVV) "
                + "VALUES (?,?,?,?,?,?)";
        
        preparedStatement = connection.prepareStatement(sentenciaSQL);
        preparedStatement.setDate(1, compra.getFecha());
        preparedStatement.setInt(2, compra.getIdCliente());
        preparedStatement.setInt(3, compra.getIdProducto());
        preparedStatement.setInt(4, compra.getIdVendedor());
        preparedStatement.setLong(5, compra.getNumeroTarjeta());
        preparedStatement.setInt(6, compra.getCVV());

        preparedStatement.execute();

        preparedStatement.close();
        connection.close();
    }
    
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
        statement.close();
        connection.close();
        return numeroCompras;
    }
}
