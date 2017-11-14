package com.mallbit.Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;


public class ConexionDB {    
    //Metodo para llamar a la base de datos desde otras clases
    public static Connection conectar() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
<<<<<<< HEAD
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mallbit", "root", "Prosciutto123");
=======
            
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mallbit", "root", "wiwi1999");

>>>>>>> ccacbafa5c4fbce9ef4d4b52eac9be8fda00b1e8
            return connection;
        } catch (Exception ex) {
            Logger.getLogger(ConexionDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
