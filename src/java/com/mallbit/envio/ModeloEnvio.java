/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.envio;

import com.mallbit.Conexion.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
                + "(IDCompra, IDVendedor) VALUES (?,?)";
        preparedStatement = connection.prepareStatement(sentenciaSQL);
        
        //Pasar valores del objeto envio a la sentenciaSQL
        preparedStatement.setInt(1, envio.getIdCompra());
        preparedStatement.setInt(2, envio.getIdVendedor());
        preparedStatement.execute();
        preparedStatement.close();
        connection.close();
    }
    
    
}
