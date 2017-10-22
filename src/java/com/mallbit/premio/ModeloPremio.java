/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.premio;

import com.mallbit.Conexion.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
    
}
