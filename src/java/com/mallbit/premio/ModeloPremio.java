/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.premio;

import com.mallbit.Conexion.ConexionDB;
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

        //Establecer la conexi�n
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

        //Establecer la conexi�n
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

}
