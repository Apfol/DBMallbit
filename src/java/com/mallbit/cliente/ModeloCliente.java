package com.mallbit.cliente;

import java.util.*;
import java.util.Date;

import com.mallbit.Conexion.ConexionDB;

import java.sql.*;
import java.text.SimpleDateFormat;

public class ModeloCliente {

    public List<Cliente> obtenerClientesDB() throws Exception {

        List<Cliente> clientes = new ArrayList<>();

        Connection connection;
        Statement statement;
        ResultSet resultSet;

        //Establecer la conexi�n
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "SELECT * FROM cliente";
        statement = connection.createStatement();

        //Ejecutar SQL y guardar valores de consulta en resultSet
        resultSet = statement.executeQuery(sentenciaSQL);

        //Recorrer resultador de la sentencia
        while (resultSet.next()) {
            int id = resultSet.getInt("IDCliente");
            String nombre = resultSet.getString("Nombre");
            String apellido = resultSet.getString("Apellido");
            String correo = resultSet.getString("Correo");
            long identificacion = resultSet.getLong("identificacion");
            long telefono = resultSet.getLong("telefono");
            String usuario = resultSet.getString("Usuario");
            String contraseña = resultSet.getString("Password");
            Date fechaNacimiento = resultSet.getDate("FechaNacimiento");
            int idGenero = resultSet.getInt("IDGenero");

            clientes.add(new Cliente(id, nombre, apellido, correo, identificacion, telefono, usuario, contraseña, fechaNacimiento, idGenero));

        }
        return clientes;
    }

    public void agregarClienteDB(Cliente cliente) throws SQLException {

        Connection connection;
        PreparedStatement preparedStatement;

        //Establecer la conexi�n
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "INSERT INTO cliente "
                + "(Nombre,Apellido,Correo,Identificacion,Telefono,Usuario,Password,FechaNacimiento,IDGenero) VALUES (?,?,?,?,?,?,?,?,?)";
        preparedStatement = connection.prepareStatement(sentenciaSQL);

        //Pasar valores del objeto cliente a la sentenciaSQL
        preparedStatement.setString(1, cliente.getNombre());
        preparedStatement.setString(2, cliente.getApellido());
        preparedStatement.setString(3, cliente.getCorreo());
        preparedStatement.setLong(4, cliente.getIdentificacion());
        preparedStatement.setLong(5, cliente.getTelefono());
        preparedStatement.setString(6, cliente.getUsuario());
        preparedStatement.setString(7, cliente.getContraseña());
        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
        preparedStatement.setString(8, formatDate.format(cliente.getFechaNacimiento()));
        preparedStatement.setInt(9, cliente.getIdGenero());

        preparedStatement.execute();
    }
    
    public void actualizarClienteDB(Cliente cliente) throws SQLException {
        Connection connection;
        PreparedStatement nombre;
        PreparedStatement apellido;
        PreparedStatement telefono;
        PreparedStatement correo;
        PreparedStatement password;

        //Establecer la conexión
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement en caso de que los valores no sean nulos y ejecutar
        if (!cliente.getNombre().equals("")) {
            String sentenciaNombre = "UPDATE cliente SET Nombre=? WHERE Usuario=?";
            nombre = connection.prepareStatement(sentenciaNombre);
            nombre.setString(1, cliente.getNombre());
            nombre.setString(2, cliente.getUsuario());
            nombre.executeUpdate();
        }
        if (!cliente.getApellido().equals("")) {
            String sentenciaApellido = "UPDATE cliente SET Apellido=? WHERE Usuario=?";
            apellido = connection.prepareStatement(sentenciaApellido);
            apellido.setString(1, cliente.getApellido());
            apellido.setString(2, cliente.getUsuario());
            apellido.executeUpdate();
        }
        if (cliente.getTelefono() != 0) {
            String sentenciaTelefono = "UPDATE cliente SET Telefono=? WHERE Usuario=?";
            telefono = connection.prepareStatement(sentenciaTelefono);
            telefono.setLong(1, cliente.getTelefono());
            telefono.setString(2, cliente.getUsuario());
            telefono.executeUpdate();
        }
        if (!cliente.getCorreo().equals("")) {
            String sentenciaCorreo = "UPDATE cliente SET Correo=? WHERE Usuario=?";
            correo = connection.prepareStatement(sentenciaCorreo);
            correo.setString(1, cliente.getCorreo());
            correo.setString(2, cliente.getUsuario());
            correo.executeUpdate();
        }
        if (!cliente.getContraseña().equals("")) {
            String sentenciaPassword = "UPDATE cliente SET Password=? WHERE Usuario=?";
            password = connection.prepareStatement(sentenciaPassword);
            password.setString(1, cliente.getContraseña());
            password.setString(2, cliente.getUsuario());
            password.executeUpdate();
        }
    }

    public void borrarClienteDB(Cliente c) throws SQLException {
        Connection connection;
        PreparedStatement borrar;

        //Establecer la conexion
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement y ejecutar
        String sentencia = "DELETE FROM cliente WHERE Usuario=?";
        borrar = connection.prepareStatement(sentencia);
        borrar.setString(1, c.getUsuario());
        borrar.execute();
    }

}
