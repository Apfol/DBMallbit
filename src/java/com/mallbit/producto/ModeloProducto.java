/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.producto;

import com.mallbit.Conexion.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class ModeloProducto {
    public List<Producto> getProductos() throws Exception {

        List<Producto> productos = new ArrayList<>();

        Connection connection;
        Statement statement;
        ResultSet resultSet;

        //Establecer la conexion
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "SELECT * FROM producto";
        statement = connection.createStatement();

        //Ejecutar SQL
        resultSet = statement.executeQuery(sentenciaSQL);

        //Recorrer resultados de la sentencia mientras existan
        while (resultSet.next()) {
        	
            int id = resultSet.getInt("IDProducto");
            String nombre = resultSet.getString("Nombre");
            int precio = resultSet.getInt("Precio");
            String marca = resultSet.getString("Marca");
            int idLocal = resultSet.getInt("IDLocal");
            String descripcion = resultSet.getString("Descripcion");
            String nombreImagen = resultSet.getString("NombreImagen");
            int stock = resultSet.getInt("Stock");

            Producto producto = new Producto(id, nombre, precio, marca, idLocal, descripcion, nombreImagen, stock);
            productos.add(producto);

        }
        return productos;
    }

    List<Producto> getProductos(String local) throws Exception{
        
        List<Producto> productos = new ArrayList<>();

        Connection connection;
        PreparedStatement preparedStatement;
        ResultSet resultSet;

        //Establecer la conexion
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "SELECT * FROM producto WHERE IDLocal=?";
        preparedStatement = connection.prepareStatement(sentenciaSQL);
        preparedStatement.setString(1, local);

        //Ejecutar SQL
        resultSet = preparedStatement.executeQuery(sentenciaSQL);

        //Recorrer resultados de la sentencia mientras existan
        while (resultSet.next()) {
        	
            int id = resultSet.getInt("IDProducto");
            String nombre = resultSet.getString("Nombre");
            int precio = resultSet.getInt("Precio");
            String marca = resultSet.getString("Marca");
            int idLocal = resultSet.getInt("IDLocal");
            String descripcion = resultSet.getString("Descripcion");
            String nombreImagen = resultSet.getString("NombreImagen");
            int stock = resultSet.getInt("Stock");

            Producto producto = new Producto(id, nombre, precio, marca, idLocal, descripcion, nombreImagen, stock);
            productos.add(producto);

        }
        return productos;
    }
}
