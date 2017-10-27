/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.local;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
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
@WebServlet(name = "ControladorLocal", urlPatterns = {"/ControladorLocal"})
@MultipartConfig
public class ControladorLocal extends HttpServlet {
    
    ModeloLocal modeloLocal = new ModeloLocal();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Leer parametro (value) del input hidden del formulario
        String parametro = request.getParameter("instruccion");

        //Ejecutar mÃ©todo segÃºn valor del parametro
        switch (parametro) {
            case "listarLocales":
                listarLocalesDB(request, response);
                break;
            case "insertarLocal":
                insertarLocalesDB(request, response);
                break;
            case "validarLocal":

                break;
            case "actualizarLocal":

                break;
            case "borrarLocal":

                break;
            default:
                break;
        }
    }

    private void listarLocalesDB(HttpServletRequest request, HttpServletResponse response) {
        try {
            //Obtener lista de locales
            List<Local> locales;

            locales = modeloLocal.obtenerLocalesDB();

            //Agregar lista de locales al Request
            request.setAttribute("LISTALOCALES", locales);

            //Enviar request al JSP correspondiente
            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void insertarLocalesDB(HttpServletRequest request, HttpServletResponse response) {

        try {
            
            //Crear objeto Local con los datos recibidos del formulario   
            String nombre = request.getParameter("nombre");
            //<editor-fold defaultstate="collapsed" desc="Crear directorio del local con carpeta de Productos">
            
            String pathServlet = getServletContext().getRealPath("/");
            String pathProject = pathServlet.substring(0, pathServlet.length() - 11);
            String path = pathProject + "\\web\\images\\Locales\\" + nombre + "\\Productos";
            File f = new File (path);
            f.mkdirs();
            
            // </editor-fold>  
            int idVendedor = Integer.parseInt(request.getParameter("vendedor"));
            String descripcion = request.getParameter("descripcion");
            String nombreImagen = guardarImagenObtenerNombre(request, "imagenPrincipal", nombre);
            int idCategoria = Integer.parseInt(request.getParameter("categoria"));

            Local local = new Local(nombre, idVendedor, descripcion, idCategoria, nombreImagen);
            
            //Enviar objeto al modelo para guardar en la Base de Datos
            modeloLocal.agregarLocalDB(local);
            
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/interfaz-vendedor.jsp");
            requestDispatcher.forward(request, response);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    
//    Con este mÃ©todo las imagenes que se suban al formulario
//    seran guardadas en la carpeta images/locales y se obtiene
//    el nombre de la imagen como una concatenaciÃ³n del nombre
//    del local y el nombre de la imagen que se subio, los nombres
//    de las imagenes se guardan en la base de datos para despues 
//    poder manipularlas
    private String guardarImagenObtenerNombre(HttpServletRequest request, String tipoImagen, String nombreLocal) throws ServletException, IOException {
        // Obtener dirección a guardar archivo
        String pathServlet = getServletContext().getRealPath("/");
        String pathProject = pathServlet.substring(0, pathServlet.length() - 11);
        String path = pathProject + "\\web\\images\\Locales\\" + nombreLocal + "\\";
        Part filePart = request.getPart(tipoImagen);

        //Obtener nombre archivo
        String fileName = nombreLocal + "-" + getNombreImagen(filePart);

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