package com.mallbit.premio;

import com.mallbit.administrador.Administrador;
import com.mallbit.administrador.ControladorAdministrador;
import com.mallbit.administrador.ModeloAdministrador;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "ControladorPremio", urlPatterns = {"/ControladorPremio"})
@MultipartConfig
public class ControladorPremio extends HttpServlet {

    ModeloPremio modeloPremio = new ModeloPremio();

    List<Administrador> administradores;
    Administrador administrador;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //Obtener administrador que inició sesión
            administradores = new ModeloAdministrador().obtenerAdministradoresDB();
            administrador = new ControladorAdministrador().obtenerAdministradorCookie(administradores, request);

            //Leer parametro (value) del input hidden del formulario
            String parametro = request.getParameter("instruccion");

            //Ejecutar mÃ©todo según valor del parametro
            switch (parametro) {
                case "borrarPremio":
                    borrarPremio(request, response);
                    break;
                default:
                    break;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            //Obtener administrador que iniciÃ³ sesiÃ³n
            administradores = new ModeloAdministrador().obtenerAdministradoresDB();
            administrador = new ControladorAdministrador().obtenerAdministradorCookie(administradores, request);

            //Leer parametro (value) del input hidden del formulario
            String parametro = request.getParameter("instruccion");

            //Ejecutar mÃ©todo segÃºn valor del parametro
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
                    borrarPremio(request, response);
                    break;
                default:
                    break;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void listarPremios(HttpServletRequest request, HttpServletResponse response) {
        try {
            //Obtener lista de Clientes
            List<Premio> premios;

            premios = modeloPremio.obtenerPremiosDB(administrador.getId());

            //Agregar lista de clientes al Request
            request.setAttribute("LISTAPREMIOS", premios);

            //Enviar request al JSP correspondiente
            RequestDispatcher dispatcher = request.getRequestDispatcher("/interfaz-administrador.jsp");
            dispatcher.forward(request, response);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void insertarPremio(HttpServletRequest request, HttpServletResponse response) {
        try {
            //Crear objeto Premio con los datos recibidos del formulario     
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            String nombreImagen = guardarImagenObtenerNombre(request, "imagenPrincipal", nombre);
            int puntos = Integer.parseInt(request.getParameter("puntos"));

            Premio premio = new Premio(nombre, descripcion, nombreImagen, puntos, administrador.getId());

            //Enviar objeto al modelo para guardar en la Base de Datos
            modeloPremio.agregarPremioDB(premio);

            response.sendRedirect("carga-administrador.jsp");

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void actualizarCliente(HttpServletRequest request, HttpServletResponse response) {

    }

    private void borrarPremio(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idPremio = request.getParameter("idPremio");
        try {
            eliminarImagen(idPremio);
            modeloPremio.eliminiarPremioDB(idPremio);
            response.sendRedirect("interfaz-administrador.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(ControladorPremio.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

//    Con estos métodos las imágenes que se suban al formulario
//    seran guardadas en la carpeta images/locales y se obtiene
//    el nombre de la imagen como una concatenación del nombre
//    del local y el nombre de la imagen que se subió, los nombres
//    de las imagenes se guardan en la base de datos para después 
//    poder manipularlas.
    //<editor-fold defaultstate="collapsed" desc="Métodos para administrar imágenes">
    private String guardarImagenObtenerNombre(HttpServletRequest request, String tipoImagen, String nombrePremio) throws ServletException, IOException {
        // Obtener dirección a guardar archivo
        String pathServlet = getServletContext().getRealPath("/");
        String pathProject = pathServlet.substring(0, pathServlet.length() - 11);
        String path = pathProject + "\\web\\images\\Premios\\";
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
    
    private void eliminarImagen(String idPremio) throws SQLException {
        List<Premio> premios = modeloPremio.obtenerPremiosDB(administrador.getId());
        
        String nombreImagen = "";
        for(Premio premio: premios) {
            if(premio.getId() == Integer.parseInt(idPremio)) {
                nombreImagen = premio.getNombreImagen();
            }
        }
        
        String pathServlet = getServletContext().getRealPath("/");
        String pathProject = pathServlet.substring(0, pathServlet.length() - 11);
        String path = pathProject + "\\web\\images\\Premios\\";
        
        File imagen = new File(path + File.separator + nombreImagen);
        imagen.delete();
    }
    // </editor-fold>
}
