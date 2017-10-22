/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.vendedor;

import com.mallbit.Conexion.ConexionDB;
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
public class ModeloVendedor {
    
    public List<Vendedor> obtenerVendedoresDB() throws Exception {

        List<Vendedor> vendedores = new ArrayList<>();

        Connection connection;
        Statement statement;
        ResultSet resultSet;

        //Establecer la conexi�n
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "SELECT * FROM vendedor";
        statement = connection.createStatement();

        //Ejecutar SQL y guardar valores de consulta en resultSet
        resultSet = statement.executeQuery(sentenciaSQL);

        //Recorrer resultador de la sentencia
        while (resultSet.next()) {
            int id = resultSet.getInt("IDVendedor");
            String nombre = resultSet.getString("Nombre");
            String apellido = resultSet.getString("Apellido");
            String correo = resultSet.getString("Correo");
            long identificacion = resultSet.getLong("Identificacion");
            long telefono = resultSet.getLong("Telefono");
            String usuario = resultSet.getString("Usuario");
            String contraseña = resultSet.getString("Password");
            Date fechaNacimiento = resultSet.getDate("FechaNacimiento");
            int idGenero = resultSet.getInt("IDGenero");

            vendedores.add(new Vendedor(id, nombre, apellido, fechaNacimiento, correo, identificacion, telefono, usuario, contraseña, idGenero));

        }
        return vendedores;
    }

    public void agregarVendedorDB(Vendedor vendedor) throws SQLException {

        Connection connection;
        PreparedStatement preparedStatement;

        //Establecer la conexi�n
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "INSERT INTO vendedor "
                + "(Nombre,Apellido,Correo,Identificacion,Telefono,Usuario,Password,FechaNacimiento,IDGenero) VALUES (?,?,?,?,?,?,?,?,?)";
        preparedStatement = connection.prepareStatement(sentenciaSQL);

        //Pasar valores del objeto cliente a la sentenciaSQL
        preparedStatement.setString(1, vendedor.getNombre());
        preparedStatement.setString(2, vendedor.getApellido());
        preparedStatement.setString(3, vendedor.getCorreo());
        preparedStatement.setLong(4, vendedor.getIdentificacion());
        preparedStatement.setLong(5, vendedor.getTelefono());
        preparedStatement.setString(6, vendedor.getUsuario());
        preparedStatement.setString(7, vendedor.getContraseña());
        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
        preparedStatement.setString(8, formatDate.format(vendedor.getFechaNacimiento()));
        preparedStatement.setInt(9, vendedor.getIdGenero());

        preparedStatement.execute();
    }
    
        public void actualizarVendedorDB(Vendedor vendedor) throws SQLException {
        Connection connection;
        PreparedStatement nombre;
        PreparedStatement apellido;
        PreparedStatement telefono;
        PreparedStatement correo;
        PreparedStatement password;

        //Establecer la conexión
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement en caso de que los valores no sean nulos y ejecutar
        if (!vendedor.getNombre().equals("")) {
            String sentenciaNombre = "UPDATE vendedor SET Nombre=? WHERE Usuario=?";
            nombre = connection.prepareStatement(sentenciaNombre);
            nombre.setString(1, vendedor.getNombre());
            nombre.setString(2, vendedor.getUsuario());
            nombre.executeUpdate();
        }
        if (!vendedor.getApellido().equals("")) {
            String sentenciaApellido = "UPDATE vendedor SET Apellido=? WHERE Usuario=?";
            apellido = connection.prepareStatement(sentenciaApellido);
            apellido.setString(1, vendedor.getApellido());
            apellido.setString(2, vendedor.getUsuario());
            apellido.executeUpdate();
        }
        if (vendedor.getTelefono() != 0) {
            String sentenciaTelefono = "UPDATE vendedor SET Telefono=? WHERE Usuario=?";
            telefono = connection.prepareStatement(sentenciaTelefono);
            telefono.setLong(1, vendedor.getTelefono());
            telefono.setString(2, vendedor.getUsuario());
            telefono.executeUpdate();
        }
        if (!vendedor.getCorreo().equals("")) {
            String sentenciaCorreo = "UPDATE vendedor SET Correo=? WHERE Usuario=?";
            correo = connection.prepareStatement(sentenciaCorreo);
            correo.setString(1, vendedor.getCorreo());
            correo.setString(2, vendedor.getUsuario());
            correo.executeUpdate();
        }
        if (!vendedor.getContraseña().equals("")) {
            String sentenciaPassword = "UPDATE vendedor SET Password=? WHERE Usuario=?";
            password = connection.prepareStatement(sentenciaPassword);
            password.setString(1, vendedor.getContraseña());
            password.setString(2, vendedor.getUsuario());
            password.executeUpdate();
        }
    }

    public Vendedor obtenerVendedorL(String local) throws SQLException {
        
        Vendedor vendedor = null;
        
        Connection connection;
        PreparedStatement preparedStatement;
        ResultSet resultSet;

        //Establecer la conexion
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "SELECT * FROM vendedor v INNER JOIN local l ON v.IDVendedor=l.IDVendedor WHERE l.IDLocal=?";
        preparedStatement = connection.prepareStatement(sentenciaSQL);
        preparedStatement.setString(1, local);

        //Ejecutar SQL
        resultSet = preparedStatement.executeQuery();

        //Recorrer resultados de la sentencia mientras existan
        while (resultSet.next()) {
        	
            int id = resultSet.getInt("IDVendedor");
            String nombre = resultSet.getString("Nombre");
            String apellido = resultSet.getString("Apellido");
            Date fechaNacimiento = resultSet.getDate("FechaNacimiento");
            String correo = resultSet.getString("correo");
            Long identificacion = resultSet.getLong("Identificacion");
            Long telefono = resultSet.getLong("Telefono");
            String usuario = resultSet.getString("Usuario");
            String password = resultSet.getString("Password");
            int idGenero = resultSet.getInt("IDGenero");

            vendedor = new Vendedor(id, nombre, apellido, fechaNacimiento, correo, identificacion, telefono, usuario, password, idGenero);

        }
        return vendedor;
    }
}

