package com.mallbit.Categoria;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mallbit.Conexion.ConexionDB;

public class ModeloCategoria {
	public List<Categoria> getCategorias() throws Exception {

        List<Categoria> categoria = new ArrayList<>();

        Connection connection;
        Statement statement;
        ResultSet resultSet;

        //Establecer la conexion
        connection = ConexionDB.conectar();

        //Crear sentencia SQL y statement
        String sentenciaSQL = "SELECT * FROM categoria";
        statement = connection.createStatement();

        //Ejecutar SQL
        resultSet = statement.executeQuery(sentenciaSQL);

        //Recorrer resultados de la sentencia mientras existan
        while (resultSet.next()) {
        	
            int id = resultSet.getInt("IDCategoria");
            String nombre = resultSet.getString("TipoCategoria");

            Categoria c = new Categoria(id, nombre);
            categoria.add(c);

        }
        
        connection.close();
        statement.close();
        resultSet.close();
        
        return categoria;
    }
}
