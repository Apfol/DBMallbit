/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.premio;

import com.mallbit.Conexion.ConexionDB;
import com.mallbit.producto.Producto;
import java.sql.Connection;
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
public class ModeloPremio {

    public void agregarPremioDB(Premio premio) throws SQLException {
        Connection connection;
        PreparedStatement preparedStatement;

        //Establecer la conexión
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "INSERT INTO premio "
                + "(Nombre,Descripcion,NombreImagen,Puntos,IDAdministrador) VALUES (?,?,?,?,?)";
        preparedStatement = connection.prepareStatement(sentenciaSQL);

        //Pasar valores del objeto cliente a la sentenciaSQL
        preparedStatement.setString(1, premio.getNombre());
        preparedStatement.setString(2, premio.getDescripcion());
        preparedStatement.setString(3, premio.getNombreImagen());
        preparedStatement.setInt(4, premio.getPuntos());
        preparedStatement.setInt(5, premio.getIdAdminitrador());

        preparedStatement.execute();
    }

    public List<Premio> obtenerPremiosDB(int idAdmin) throws SQLException {
        List<Premio> premios = new ArrayList<>();

        Connection connection;
        Statement statement;
        ResultSet resultSet;

        //Establecer la conexiï¿½n
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "SELECT * FROM premio WHERE IDAdministrador= " + idAdmin;
        statement = connection.createStatement();

        //Ejecutar SQL y guardar valores de consulta en resultSet
        resultSet = statement.executeQuery(sentenciaSQL);

        //Recorrer resultador de la sentencia
        while (resultSet.next()) {
            int id = resultSet.getInt("IDPremio");
            String nombre = resultSet.getString("Nombre");
            String descripcion = resultSet.getString("Descripcion");
            String nombreImagen = resultSet.getString("NombreImagen");
            int puntos = resultSet.getInt("puntos");
            int idAdministrador = resultSet.getInt("IDAdministrador");

            premios.add(new Premio(id, nombre, descripcion, nombreImagen, puntos, idAdministrador));

        }
        return premios;
    }
    
    public List<Premio> obtenerTodosPremios() throws SQLException {
        List<Premio> premios = new ArrayList<>();

        Connection connection;
        Statement statement;
        ResultSet resultSet;

        //Establecer la conexiï¿½n
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "SELECT * FROM premio";
        statement = connection.createStatement();

        //Ejecutar SQL y guardar valores de consulta en resultSet
        resultSet = statement.executeQuery(sentenciaSQL);

        //Recorrer resultador de la sentencia
        while (resultSet.next()) {
            int id = resultSet.getInt("IDPremio");
            String nombre = resultSet.getString("Nombre");
            String descripcion = resultSet.getString("Descripcion");
            String nombreImagen = resultSet.getString("NombreImagen");
            int puntos = resultSet.getInt("puntos");
            int idAdministrador = resultSet.getInt("IDAdministrador");

            premios.add(new Premio(id, nombre, descripcion, nombreImagen, puntos, idAdministrador));

        }
        return premios;
    }

    void eliminiarPremioDB(String idPremio) throws SQLException {
        Connection connection;
        PreparedStatement borrar;

        //Establecer la conexion
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement y ejecutar
        String sentencia = "DELETE FROM premio WHERE IDPremio = ?";
        borrar = connection.prepareStatement(sentencia);
        borrar.setString(1, idPremio);
        borrar.execute();
    }
    
    public Premio obtenerMasPopular() throws SQLException {
        
        Premio premio = null;
        
        Connection connection;
        PreparedStatement preparedStatement;
        ResultSet resultSet;
        
        //Establecer la conexion
        connection = ConexionDB.conectar();
        
        String sentenciaSQL = "SELECT * FROM masPopular";
        preparedStatement = connection.prepareStatement(sentenciaSQL);
        
        //Ejecutar sentencia
        resultSet = preparedStatement.executeQuery();
        
        //Recorrer resultados de la Sentencia
        while (resultSet.next()) {
        	
            int id = resultSet.getInt("IDPremio");
            String nombre = resultSet.getString("Nombre");
            String descripcion = resultSet.getString("Descripcion");
            String nombreImagen = resultSet.getString("NombreImagen");
            int puntos = resultSet.getInt("Puntos");
            int idAdministrador = resultSet.getInt("IDAdministrador");

            premio = new Premio(id, nombre, descripcion, nombreImagen, puntos, idAdministrador);
        }
        return premio;
    }
}
