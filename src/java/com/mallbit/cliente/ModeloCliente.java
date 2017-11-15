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
            int puntos = resultSet.getInt("Puntos");
            int idGenero = resultSet.getInt("IDGenero");

            clientes.add(new Cliente(id, nombre, apellido, correo, identificacion, telefono, usuario, contraseña, fechaNacimiento, idGenero, puntos));

        }
        
        connection.close();
        statement.close();
        resultSet.close();
        
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
        
        connection.close();
        preparedStatement.close();
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
            nombre.close();
        }
        if (!cliente.getApellido().equals("")) {
            String sentenciaApellido = "UPDATE cliente SET Apellido=? WHERE Usuario=?";
            apellido = connection.prepareStatement(sentenciaApellido);
            apellido.setString(1, cliente.getApellido());
            apellido.setString(2, cliente.getUsuario());
            apellido.executeUpdate();
            apellido.close();
        }
        if (cliente.getTelefono() != 0) {
            String sentenciaTelefono = "UPDATE cliente SET Telefono=? WHERE Usuario=?";
            telefono = connection.prepareStatement(sentenciaTelefono);
            telefono.setLong(1, cliente.getTelefono());
            telefono.setString(2, cliente.getUsuario());
            telefono.executeUpdate();
            telefono.close();
        }
        if (!cliente.getCorreo().equals("")) {
            String sentenciaCorreo = "UPDATE cliente SET Correo=? WHERE Usuario=?";
            correo = connection.prepareStatement(sentenciaCorreo);
            correo.setString(1, cliente.getCorreo());
            correo.setString(2, cliente.getUsuario());
            correo.executeUpdate();
            correo.close();
        }
        if (!cliente.getContraseña().equals("")) {
            String sentenciaPassword = "UPDATE cliente SET Password=? WHERE Usuario=?";
            password = connection.prepareStatement(sentenciaPassword);
            password.setString(1, cliente.getContraseña());
            password.setString(2, cliente.getUsuario());
            password.executeUpdate();
            password.close();
        }
        
        connection.close();
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
        
        borrar.close();
        connection.close();
    }
    
    public int clientesTotales() throws SQLException {
        Connection connection;
        Statement statement;
        ResultSet resultSet;
        
        int numeroClientes = 0;
        
        //Establecer la conexion
        connection = ConexionDB.conectar();
        
        //Crear sentencia SQL y statement y ejecutar
        String sentencia = "SELECT * FROM clientesTotales";
        //Crear sentencia SQL y statement
        statement = connection.createStatement();

        //Ejecutar SQL y guardar valores de consulta en resultSet
        resultSet = statement.executeQuery(sentencia);
        
        while(resultSet.next()) {
            numeroClientes = resultSet.getInt("Clientes");
        }
        
        connection.close();
        statement.close();
        resultSet.close();
        
        return numeroClientes;
    }
    
    public void agregarPuntos(int points, int idCliente) throws SQLException {
        
        Connection connection;
        PreparedStatement puntos;

        //Establecer la conexión
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement en caso de que los valores no sean nulos y ejecutar
        String sentenciaNombre = "UPDATE cliente SET Puntos=Puntos+? WHERE IDCliente=?";
        puntos = connection.prepareStatement(sentenciaNombre);
        puntos.setInt(1, points);
        puntos.setInt(2, idCliente);
        puntos.executeUpdate();
        puntos.close();
        
        connection.close();
        
    }
    
    public void quitarPuntos(int points, int idCliente) throws SQLException {
        
        Connection connection;
        PreparedStatement puntos;

        //Establecer la conexión
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement en caso de que los valores no sean nulos y ejecutar
        String sentenciaNombre = "UPDATE cliente SET Puntos=Puntos-? WHERE IDCliente=?";
        puntos = connection.prepareStatement(sentenciaNombre);
        puntos.setInt(1, points);
        puntos.setInt(2, idCliente);
        puntos.executeUpdate();
        puntos.close();
        
        connection.close();
        
    }

}
