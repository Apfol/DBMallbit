/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.premio;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Andres Ramos
 */
@WebServlet(name = "ControladorPremio", urlPatterns = {"/ControladorPremio"})
@MultipartConfig
public class ControladorPremio extends HttpServlet {

    ModeloPremio modeloPremio = new ModeloPremio();
    
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Leer parametro (value) del input hidden del formulario
        String parametro = request.getParameter("instruccion");

        //Ejecutar método según valor del parametro
        switch (parametro) {
            case "listarPremios":
                listarPremios(request, response);
                break;
            case "insertarPremio":
                insertarPremio(request, response);
                break;
            case "actualizarPremio":
                actualizarCliente(request, response);
                break;
            case "borrarPremio":
                borrarCliente(request, response);
                break;
            default:
                break;
        }
    }
    
  
    private void listarPremios(HttpServletRequest request, HttpServletResponse response) {

    }

    private void insertarPremio(HttpServletRequest request, HttpServletResponse response) {
        try {
            //Crear objeto Premio con los datos recibidos del formulario     
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            String nombreImagen = guardarImagenObtenerNombre(request, "imagenPrincipal", nombre);
            int puntos = Integer.parseInt(request.getParameter("puntos"));
            int idAdministrador = Integer.parseInt(request.getParameter("admin"));

            Premio premio = new Premio(nombre, descripcion, nombreImagen, puntos, idAdministrador);

            //Enviar objeto al modelo para guardar en la Base de Datos
            modeloPremio.agregarPremioDB(premio);
            response.sendRedirect("interfaz-administrador.jsp");

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void actualizarCliente(HttpServletRequest request, HttpServletResponse response) {
        
    }

    private void borrarCliente(HttpServletRequest request, HttpServletResponse response) {

    }

    //    Con este método las imagenes que se suban al formulario
    //    seran guardadas en la carpeta images/premios y se obtiene
    //    el nombre de la imagen como una concatenación del nombre
    //    del premio y el nombre de la imagen que se subio, los nombres
    //    de las imagenes se guardan en la base de datos para despues 
    //    poder manipularlas
    private String guardarImagenObtenerNombre(HttpServletRequest request, String tipoImagen, String nombrePremio) throws ServletException, IOException {
        // Obtener dirección a guardar archivo
        String pathServlet = getServletContext().getRealPath("/");
        String pathProject = pathServlet.substring(0, pathServlet.length() - 11);
        String path = pathProject + "\\web\\images\\premios\\";
        Part filePart = request.getPart(tipoImagen);

        //Obtener nombre archivo
        String fileName = nombrePremio + "-" + getNombreImagen(filePart);

        OutputStream out = null;
        InputStream filecontent = null;

        try {
            out = new FileOutputStream(new File(path + File.separator + fileName));
            filecontent = filePart.getInputStream();

            int read = 0;
            final byte[] bytes = new byte[1024];

            while ((read = filecontent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
        } catch (FileNotFoundException fne) {
            fne.printStackTrace();
        } finally {
            if (out != null) {
                out.close();
            }
            if (filecontent != null) {
                filecontent.close();
            }
        }
        return fileName;
    }

    private String getNombreImagen(final Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

}
