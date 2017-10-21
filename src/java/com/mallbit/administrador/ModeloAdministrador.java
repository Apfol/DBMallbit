/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.administrador;

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
public class ModeloAdministrador {

    public List<Administrador> obtenerAdministradoresDB() throws Exception {
        
        List<Administrador> administradores = new ArrayList<>();

        Connection connection;
        Statement statement;
        ResultSet resultSet;

        //Establecer la conexi�n
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "SELECT * FROM administrador";
        statement = connection.createStatement();

        //Ejecutar SQL y guardar valores de consulta en resultSet
        resultSet = statement.executeQuery(sentenciaSQL);

        //Recorrer resultador de la sentencia
        while (resultSet.next()) {
            int id = resultSet.getInt("IDAdministrador");
            String nombre = resultSet.getString("Nombre");
            String apellido = resultSet.getString("Apellido");
            String correo = resultSet.getString("Correo");
            long identificacion = resultSet.getLong("identificacion");
            long telefono = resultSet.getLong("telefono");
            String usuario = resultSet.getString("Usuario");
            String contraseña = resultSet.getString("Password");
            Date fechaNacimiento = resultSet.getDate("FechaNacimiento");
            int idGenero = resultSet.getInt("IDGenero");

            administradores.add(new Administrador(id, nombre, apellido, correo, identificacion, telefono, usuario, contraseña, fechaNacimiento, idGenero));

        }
        return administradores;
    }

    public void agregarAdministradorDB(Administrador administrador) throws SQLException {

        Connection connection;
        PreparedStatement preparedStatement;

        //Establecer la conexi�n
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "INSERT INTO administrador "
                + "(Nombre,Apellido,Correo,Identificacion,Telefono,Usuario,Password,FechaNacimiento,IDGenero) VALUES (?,?,?,?,?,?,?,?,?)";
        preparedStatement = connection.prepareStatement(sentenciaSQL);

        //Pasar valores del objeto cliente a la sentenciaSQL
        preparedStatement.setString(1, administrador.getNombre());
        preparedStatement.setString(2, administrador.getApellido());
        preparedStatement.setString(3, administrador.getCorreo());
        preparedStatement.setLong(4, administrador.getIdentificacion());
        preparedStatement.setLong(5, administrador.getTelefono());
        preparedStatement.setString(6, administrador.getUsuario());
        preparedStatement.setString(7, administrador.getContraseña());
        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
        preparedStatement.setString(8, formatDate.format(administrador.getFechaNacimiento()));
        preparedStatement.setInt(9, administrador.getIdGenero());

        preparedStatement.execute();
    }
    
    
}
