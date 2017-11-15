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
    
    public List<String[]> productosDeCompras(int idCliente) throws SQLException {
        Connection connection;
        PreparedStatement preparedStatement;
        ResultSet resultSet;
        List<String[]> productos = new ArrayList<>();
        
        //Establecer la conexion
        connection = ConexionDB.conectar();
        //Crear sentencia SQL y statement y ejecutar
        String sentenciaSQL = "SELECT p.Nombre, p.Descripcion, p.Marca, p.Stock, p.Puntos, p.Precio, p.NombreImagen, c.IDCompra\n" +
                                "FROM producto p\n" +
                                "INNER JOIN compra C ON C.IDProducto = P.IDProducto\n" +
                                "INNER JOIN cliente Cl ON C.IDCliente = Cl.IDCliente\n" +
                                "WHERE Cl.IDCliente="+idCliente;
        //Crear sentencia SQL y statement
        preparedStatement = connection.prepareStatement(sentenciaSQL);
        resultSet = preparedStatement.executeQuery();
        
        while(resultSet.next()) {
            String[] datos = new String[8];
            datos[0] = resultSet.getString("Nombre");
            datos[1] = resultSet.getString("Descripcion");
            datos[2] = resultSet.getString("Marca");
            datos[3] = resultSet.getString("Stock");
            datos[4] = resultSet.getString("Puntos");
            datos[5] = resultSet.getString("Precio");
            datos[6] = resultSet.getString("NombreImagen");
            datos[7] = resultSet.getString("IDCompra");

            productos.add(datos);
        }
        
        connection.close();
        preparedStatement.close();
        resultSet.close();
        
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
    
    public String[] detallesCompras(String idCompra) throws SQLException {
        Connection connection;
        Statement statement;
        ResultSet resultSet;
        String[] datos = new String[4];

        //Establecer la conexion
        connection = ConexionDB.conectar();
        //Crear sentencia SQL y statement y ejecutar
        String sentencia = "SELECT c.IDCompra, c.Fecha, p.Nombre, CONCAT(v.Nombre,' ',v.Apellido) NombreV\n" +
                            "FROM compra c\n" +
                            "INNER JOIN vendedor v ON v.IDVendedor = c.IDVendedor\n" +
                            "INNER JOIN cliente cl ON cl.IDCliente = c.IDCliente \n" +
                            "INNER JOIN producto p ON p.IDProducto = c.IDProducto\n" + 
                            "WHERE c.IDCompra="+idCompra;
        //Crear sentencia SQL y statement
        statement = connection.createStatement();

        //Ejecutar SQL y guardar valores de consulta en resultSet
        resultSet = statement.executeQuery(sentencia);

        while (resultSet.next()) {   
            datos[0] = resultSet.getString("IDCompra");
            datos[1] = resultSet.getString("Fecha");
            datos[2] = resultSet.getString("Nombre");
            datos[3] = resultSet.getString("NombreV");
        }
        statement.close();
        connection.close();
        return datos;
    }
}
