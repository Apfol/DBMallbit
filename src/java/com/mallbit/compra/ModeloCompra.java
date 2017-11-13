/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.compra;

import com.mallbit.Conexion.ConexionDB;
import com.mallbit.producto.Producto;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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

    public List<Compra> obtenerComprasCliente(int idCliente) throws SQLException {
 
        Connection connection;
        PreparedStatement preparedStatement;
        ResultSet resultSet;
        List<Compra> compras = new ArrayList<>();
        
        //Establecer la conexion
        connection = ConexionDB.conectar();
        //Crear sentencia SQL y statement y ejecutar
        String sentenciaSQL = "SELECT * FROM compra WHERE IDCliente = ?";
        //Crear sentencia SQL y statement
        preparedStatement = connection.prepareStatement(sentenciaSQL);
        preparedStatement.setInt(1, idCliente);
        
        resultSet = preparedStatement.executeQuery();
        
        while(resultSet.next()) {
            int idCompra = resultSet.getInt("IDCompra");
            Date fecha = resultSet.getDate("Fecha");
            int idProducto = resultSet.getInt("IDProducto");
            int IdVendedor = resultSet.getInt("IDVendedor");
            Long numerotarjeta = resultSet.getLong("NumeroTarjeta");
            int cvv = resultSet.getInt("CVV");
            
            compras.add(new Compra(idCompra, fecha, idCliente, idProducto, IdVendedor, numerotarjeta, cvv));
        }
        preparedStatement.close();
        connection.close();
        return compras;
    }
    
    public List<Producto> productosDeCompras(int idCliente) throws SQLException {
        Connection connection;
        PreparedStatement preparedStatement;
        ResultSet resultSet;
        List<Producto> productos = new ArrayList<>();
        
        //Establecer la conexion
        connection = ConexionDB.conectar();
        //Crear sentencia SQL y statement y ejecutar
        String sentenciaSQL = "SELECT * from producto P\n" +
                                "INNER JOIN compra C ON C.IDProducto = P.IDProducto\n" +
                                "INNER JOIN cliente Cl ON C.IDCliente = Cl.IDCliente\n" +
                                "WHERE Cl.IDCliente = ? ";
        //Crear sentencia SQL y statement
        preparedStatement = connection.prepareStatement(sentenciaSQL);
        preparedStatement.setInt(1, idCliente);
        resultSet = preparedStatement.executeQuery();
        
        while(resultSet.next()) {
            int idProducto = resultSet.getInt("IDProducto");
            String nombre = resultSet.getString("Nombre");
            int Precio = resultSet.getInt("Precio");
            String marca = resultSet.getString("Marca");
            int idLocal = resultSet.getInt("IDLocal");
            String descripcion = resultSet.getString("Descripcion");
            String NombreImagen = resultSet.getString("NombreImagen");
            int stock = resultSet.getInt("Stock");
            int puntos = resultSet.getInt("Puntos");
            
            productos.add(new Producto(idProducto, nombre, Precio, marca, idLocal, descripcion, NombreImagen, stock, puntos));
        }
        
        return productos;
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
