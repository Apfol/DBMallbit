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
            int idVendedor = resultSet.getInt("IDVendedor");
            String descripcion = resultSet.getString("Descripcion");
            String nombreImagen = resultSet.getString("NombreImagen");
            int idCategoria = resultSet.getInt("IDCategoria");

            locales.add(new Local(id, nombre, descripcion, idVendedor, idCategoria, nombreImagen));

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
                + "(Nombre, IDVendedor, Descripcion, NombreImagen, IDCategoria) VALUES (?,?,?,?,?)";
        preparedStatement = connection.prepareStatement(sentenciaSQL);

        
        //Pasar valores del objeto cliente a la sentenciaSQL
        preparedStatement.setString(1, local.getNombre());
        preparedStatement.setString(2, Integer.toString(local.getIdVendedor()));
        preparedStatement.setString(3, local.getDescripcion());
        preparedStatement.setString(4, local.getNombreImagen());
        preparedStatement.setInt(5, local.getIdCategoria());

        preparedStatement.execute();
    }
    
    public Local obtenerLocalDB(String idLocal) throws SQLException {
        
        Local local = null;
        
        Connection connection;
        PreparedStatement preparedStatement;
        ResultSet resultSet;

        //Establecer la conexion
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "SELECT * FROM local WHERE IDLocal="+idLocal;
        preparedStatement = connection.prepareStatement(sentenciaSQL);

        //Ejecutar SQL
        resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int id = resultSet.getInt("IDLocal");
            String nombre = resultSet.getString("Nombre");
            int idVendedor = resultSet.getInt("IDVendedor");
            String descripcion = resultSet.getString("Descripcion");
            String nombreImagen = resultSet.getString("NombreImagen");
            int idCategoria = resultSet.getInt("IDCategoria");

            local = new Local(id, nombre, descripcion, idVendedor, idCategoria, nombreImagen);

        }
        return local;
        
    }
    
    public Local obtenerLocalV(String IDVendedor) throws SQLException {
        
        Local local = null;
        
        Connection connection;
        PreparedStatement preparedStatement;
        ResultSet resultSet;
        
        //Establecer la conexion
        connection = ConexionDB.conectar();
        
        //Crear sentencia SQL y statement
        String sentenciaSQL = "SELECT * FROM local WHERE IDVendedor="+IDVendedor;
        preparedStatement = connection.prepareStatement(sentenciaSQL);

        //Ejecutar SQL
        resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int id = resultSet.getInt("IDLocal");
            String nombre = resultSet.getString("Nombre");
            int idVendedor = resultSet.getInt("IDVendedor");
            String descripcion = resultSet.getString("Descripcion");
            String nombreImagen = resultSet.getString("NombreImagen");
            int idCategoria = resultSet.getInt("IDCategoria");

            local = new Local(id, nombre, descripcion, idVendedor, idCategoria, nombreImagen);

        }
        return local;
        
    }
}
