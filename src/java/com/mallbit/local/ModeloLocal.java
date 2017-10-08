/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.local;

import com.mallbit.Conexion.ConexionDB;
import com.mallbit.cliente.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Andres Ramos
 */
public class ModeloLocal {
    
    public List<Local> obtenerLocalesDB() throws Exception {

        List<Local> locales = new ArrayList<>();

        Connection connection;
        Statement statement;
        ResultSet resultSet;

        //Establecer la conexi�n
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "SELECT * FROM local";
        statement = connection.createStatement();

        //Ejecutar SQL y guardar valores de consulta en resultSet
        resultSet = statement.executeQuery(sentenciaSQL);

        //Recorrer resultador de la sentencia
        while (resultSet.next()) {
            int id = resultSet.getInt("IDLocal");
            String nombre = resultSet.getString("Nombre");
            String descripcion = resultSet.getString("Descripcion");
            String nombreImagenPrimaria = resultSet.getString("NombreImagenPrimaria");
            String nombreImagenSecundaria = resultSet.getString("NombreImagenSecundaria");

            locales.add(new Local(id, nombre, descripcion, nombreImagenPrimaria, nombreImagenSecundaria));

        }
        return locales;
    }
    
    public void agregarLocalDB(Local local) throws SQLException {

        Connection connection;
        PreparedStatement preparedStatement;

        //Establecer la conexi�n
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "INSERT INTO local "
                + "(Nombre,Descripcion,NombreImagenPrimaria,NombreImagenSecundaria) VALUES (?,?,?,?)";
        preparedStatement = connection.prepareStatement(sentenciaSQL);

        //Pasar valores del objeto cliente a la sentenciaSQL
        preparedStatement.setString(1, local.getNombre());
        preparedStatement.setString(2, local.getDescripcion());
        preparedStatement.setString(3, local.getNombreImagenPrimaria());
        preparedStatement.setString(4, local.getNombreImagenSecundaria());

        preparedStatement.execute();
    }
    
}
