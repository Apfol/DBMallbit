package com.mallbit.genero;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mallbit.Conexion.ConexionDB;

public class ModeloGenero {
	public List<Genero> getGeneros() throws Exception {

        List<Genero> generos = new ArrayList<>();

        Connection connection;
        Statement statement;
        ResultSet resultSet;

        //Establecer la conexion
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "SELECT * FROM genero";
        statement = connection.createStatement();

        //Ejecutar SQL
        resultSet = statement.executeQuery(sentenciaSQL);

        //Recorrer resultados de la sentencia mientras existan
        while (resultSet.next()) {
        	
            int id = resultSet.getInt("IDGenero");
            String nombre = resultSet.getString("TipoGenero");

            Genero genero = new Genero(id, nombre);
            generos.add(genero);

        }
        
        connection.close();
        statement.close();
        resultSet.close();
        
        return generos;
    }
}
