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
import java.sql.SQLException;
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
            int puntos = resultSet.getInt("Puntos");

            Producto producto = new Producto(id, nombre, precio, marca, idLocal, descripcion, nombreImagen, stock, puntos);
            productos.add(producto);

        }
        return productos;
    }

    public List<Producto> getProductos(String local) throws Exception {

        List<Producto> productos = new ArrayList<>();

        Connection connection;
        PreparedStatement preparedStatement;
        ResultSet resultSet;

        //Establecer la conexion
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "SELECT * FROM producto WHERE IDLocal=" + local;
        preparedStatement = connection.prepareStatement(sentenciaSQL);

        //Ejecutar SQL
        resultSet = preparedStatement.executeQuery();

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
            int puntos = resultSet.getInt("Puntos");

            Producto producto = new Producto(id, nombre, precio, marca, idLocal, descripcion, nombreImagen, stock, puntos);
            productos.add(producto);

        }
        return productos;
    }

    public void insertarProducto(Producto producto) throws Exception {

        Connection connection;
        PreparedStatement preparedStatement;

        //Establecer la conexion
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "INSERT INTO producto (Nombre, Precio, Marca, IDLocal, Descripcion, NombreImagen, Stock, Puntos) "
                + "VALUES (?,?,?,?,?,?,?,?)";
        preparedStatement = connection.prepareStatement(sentenciaSQL);
        preparedStatement.setString(1, producto.getNombre());
        preparedStatement.setInt(2, producto.getPrecio());
        preparedStatement.setString(3, producto.getMarca());
        preparedStatement.setInt(4, producto.getIdLocal());
        preparedStatement.setString(5, producto.getDescripcion());
        preparedStatement.setString(6, producto.getNombreImagen());
        preparedStatement.setInt(7, producto.getStock());
        preparedStatement.setInt(8, producto.getPuntos());

        preparedStatement.execute();

        preparedStatement.close();
        connection.close();

    }

    public List<String> obtenerEstadisticas(String iDLocal) throws Exception {

        List<String> estadisticas = new ArrayList<>();

        Connection connection;
        PreparedStatement preparedStatement;
        ResultSet resultSet;

        //Establecer la conexion
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "SELECT Nombre, VecesVendido, Despachos, Entregas FROM estadisticasP WHERE IDLocal =" + iDLocal;
        preparedStatement = connection.prepareStatement(sentenciaSQL);

        //Ejecutar sentencia
        resultSet = preparedStatement.executeQuery();

        //Recorrer resultados de la Sentencia
        while (resultSet.next()) {

            String nombre = resultSet.getString("Nombre");
            int vecesVendido = resultSet.getInt("VecesVendido");
            int despachos = resultSet.getInt("Despachos");
            int envios = resultSet.getInt("Entregas");

            String concat = nombre + "--" + vecesVendido + "--" + despachos + "--" + envios;
            estadisticas.add(concat);

        }

        preparedStatement.close();
        resultSet.close();
        connection.close();

        return estadisticas;

    }

    public Producto masVendido(String iDLocal) throws Exception {

        Producto producto = null;

        Connection connection;
        PreparedStatement preparedStatement;
        ResultSet resultSet;

        //Establecer la conexion
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "SELECT * FROM masVendido WHERE IDLocal =" + iDLocal;
        preparedStatement = connection.prepareStatement(sentenciaSQL);

        //Ejecutar sentencia
        resultSet = preparedStatement.executeQuery();

        //Recorrer resultados de la Sentencia
        while (resultSet.next()) {

            int id = resultSet.getInt("IDProducto");
            String nombre = resultSet.getString("Nombre");
            int precio = resultSet.getInt("Precio");
            String marca = resultSet.getString("Marca");
            int idLocal = resultSet.getInt("IDLocal");
            String descripcion = resultSet.getString("Descripcion");
            String nombreImagen = resultSet.getString("NombreImagen");
            int stock = resultSet.getInt("Stock");
            int puntos = resultSet.getInt("Puntos");

            producto = new Producto(id, nombre, precio, marca, idLocal, descripcion, nombreImagen, stock, puntos);

        }

        preparedStatement.close();
        resultSet.close();
        connection.close();

        return producto;

    }

    public Producto masReciente(String iDLocal) throws Exception {

        Producto producto = null;

        Connection connection;
        PreparedStatement preparedStatement;
        ResultSet resultSet;

        //Establecer la conexion
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "SELECT * FROM masReciente WHERE IDLocal =" + iDLocal;
        preparedStatement = connection.prepareStatement(sentenciaSQL);

        //Ejecutar sentencia
        resultSet = preparedStatement.executeQuery();

        //Recorrer resultados de la Sentencia
        while (resultSet.next()) {

            int id = resultSet.getInt("IDProducto");
            String nombre = resultSet.getString("Nombre");
            int precio = resultSet.getInt("Precio");
            String marca = resultSet.getString("Marca");
            int idLocal = resultSet.getInt("IDLocal");
            String descripcion = resultSet.getString("Descripcion");
            String nombreImagen = resultSet.getString("NombreImagen");
            int stock = resultSet.getInt("Stock");
            int puntos = resultSet.getInt("Puntos");

            producto = new Producto(id, nombre, precio, marca, idLocal, descripcion, nombreImagen, stock, puntos);

        }

        preparedStatement.close();
        resultSet.close();
        connection.close();

        return producto;

    }

    public void eliminarProducto(String idProducto) throws Exception {

        Connection connection;
        PreparedStatement borrar;

        //Establecer la conexion
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement y ejecutar
        String sentencia = "DELETE FROM producto WHERE idProducto=?";
        borrar = connection.prepareStatement(sentencia);
        borrar.setString(1, idProducto);
        borrar.execute();

    }

    public void actualizarProducto(Producto producto) throws Exception {
        Connection connection;
        PreparedStatement nombre;
        PreparedStatement precio;
        PreparedStatement marca;
        PreparedStatement stock;
        PreparedStatement descripcion;
        PreparedStatement nombreImagen;
        PreparedStatement puntos;

        //Establecer la conexión
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement en caso de que los valores no sean nulos y ejecutar
        if (!producto.getNombre().equals("")) {
            String sentenciaNombre = "UPDATE producto SET Nombre=? WHERE iDProducto=?";
            nombre = connection.prepareStatement(sentenciaNombre);
            nombre.setString(1, producto.getNombre());
            nombre.setInt(2, producto.getId());
            nombre.executeUpdate();
        }
        if (producto.getPrecio() != 0) {
            String sentenciaPrecio = "UPDATE producto SET Precio=? WHERE iDProducto=?";
            precio = connection.prepareStatement(sentenciaPrecio);
            precio.setInt(1, producto.getPrecio());
            precio.setInt(2, producto.getId());
            precio.executeUpdate();
        }
        if (!producto.getMarca().equals("")) {
            String sentenciaMarca = "UPDATE producto SET Marca=? WHERE iDProducto=?";
            marca = connection.prepareStatement(sentenciaMarca);
            marca.setString(1, producto.getMarca());
            marca.setInt(2, producto.getId());
            marca.executeUpdate();
        }
        if (producto.getStock() != 0) {
            String sentenciaStock = "UPDATE producto SET Stock=? WHERE iDProducto=?";
            stock = connection.prepareStatement(sentenciaStock);
            stock.setInt(1, producto.getStock());
            stock.setInt(2, producto.getId());
            stock.executeUpdate();
        }
        if (!producto.getDescripcion().equals("")) {
            String sentenciaDescripcion = "UPDATE producto SET Descripcion=? WHERE iDProducto=?";
            descripcion = connection.prepareStatement(sentenciaDescripcion);
            descripcion.setString(1, producto.getDescripcion());
            descripcion.setInt(2, producto.getId());
            descripcion.executeUpdate();
        }
        if (!producto.getNombreImagen().equals("")) {
            String sentenciaNombreImagen = "UPDATE producto SET NombreImagen=? WHERE iDProducto=?";
            nombreImagen = connection.prepareStatement(sentenciaNombreImagen);
            nombreImagen.setString(1, producto.getNombreImagen());
            nombreImagen.setInt(2, producto.getId());
            nombreImagen.executeUpdate();
        }
        if (producto.getPuntos() != 0) {
            String sentenciaPuntos = "UPDATE producto SET Puntos=? WHERE iDProducto=?";
            puntos = connection.prepareStatement(sentenciaPuntos);
            puntos.setInt(1, producto.getPuntos());
            puntos.setInt(2, producto.getId());
            puntos.executeUpdate();
        }
    }

    public Producto obtenerProducto(String iDProducto) throws Exception {

        Producto producto = null;

        Connection connection;
        PreparedStatement preparedStatement;
        ResultSet resultSet;

        //Establecer la conexion
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "SELECT * FROM producto WHERE IDProducto =" + iDProducto;
        preparedStatement = connection.prepareStatement(sentenciaSQL);

        //Ejecutar sentencia
        resultSet = preparedStatement.executeQuery();

        //Recorrer resultados de la Sentencia
        while (resultSet.next()) {

            int id = resultSet.getInt("IDProducto");
            String nombre = resultSet.getString("Nombre");
            int precio = resultSet.getInt("Precio");
            String marca = resultSet.getString("Marca");
            int idLocal = resultSet.getInt("IDLocal");
            String descripcion = resultSet.getString("Descripcion");
            String nombreImagen = resultSet.getString("NombreImagen");
            int stock = resultSet.getInt("Stock");
            int puntos = resultSet.getInt("Puntos");

            producto = new Producto(id, nombre, precio, marca, idLocal, descripcion, nombreImagen, stock, puntos);

        }

        preparedStatement.close();
        resultSet.close();
        connection.close();

        return producto;

    }

    public int productosTotales() throws SQLException {
        Connection connection;
        Statement statement;
        ResultSet resultSet;

        int numeroProductos = 0;

        //Establecer la conexion
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement y ejecutar
        String sentencia = "SELECT * FROM productosTotales";
        //Crear sentencia SQL y statement
        statement = connection.createStatement();

        //Ejecutar SQL y guardar valores de consulta en resultSet
        resultSet = statement.executeQuery(sentencia);

        while (resultSet.next()) {
            numeroProductos = resultSet.getInt("Productos");
        }
        return numeroProductos;
    }

}
