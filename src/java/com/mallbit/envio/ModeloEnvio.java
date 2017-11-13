/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.envio;

import com.mallbit.Conexion.ConexionDB;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;

/**
 *
 * @author Andres Ramos
 */
public class ModeloEnvio {
    
    public void agregarEnvioDB(Envio envio) throws SQLException {
        Connection connection;
        PreparedStatement preparedStatement;

        //Establecer la conexi�n
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "INSERT INTO envio "
                + "(IDCompra, IDVendedor, Direccion) VALUES (?,?,?)";
        preparedStatement = connection.prepareStatement(sentenciaSQL);
        
        //Pasar valores del objeto envio a la sentenciaSQL
        preparedStatement.setInt(1, envio.getIdCompra());
        preparedStatement.setInt(2, envio.getIdVendedor());
        preparedStatement.setString(3, envio.getDireccion());
        preparedStatement.execute();
        preparedStatement.close();
        connection.close();
    }
    
    public void actualizarEstadoEnvio(int idEnvio) throws SQLException {
        Connection connection;
        PreparedStatement preparedStatement;

        //Establecer la conexi�n
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "update envio set IDEstado = 2, FechaEnvio = ? where IDEnvio = ?";
        preparedStatement = connection.prepareStatement(sentenciaSQL);
        preparedStatement.setDate(1, Date.valueOf(LocalDate.now()));
        preparedStatement.setInt(2, idEnvio);
        preparedStatement.execute();
        preparedStatement.close();
        connection.close();
    }
    
}
