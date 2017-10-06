/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.local;

import com.mallbit.cliente.Cliente;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Andres Ramos
 */
@WebServlet(name = "ControladorLocal", urlPatterns = {"/ControladorLocal"})
public class ControladorLocal extends HttpServlet {

    ModeloLocal modeloLocal = new ModeloLocal();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        //Leer parametro (value) del input hidden del formulario
        String parametro = request.getParameter("instruccion");

        //Ejecutar método según valor del parametro
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
            //Obtener lista de Clientes
            List<Local> locales;

            locales = modeloLocal.obtenerLocalesDB();

            //Agregar lista de clientes al Request
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

            //Crear objeto Cliente con los datos recibidos del formulario
            //<editor-fold defaultstate="collapsed" desc="Pasos para cambiar al formato fecha de MySQL">
            //Formato de fecha que aparece en la pagina
            //Definiendo el idioma de la fecha
            Locale idioma = new Locale("en");
            SimpleDateFormat formatPage = new SimpleDateFormat("dd MMM, yyyy", idioma);

            //Formato de fecha que acepta MySQL
            SimpleDateFormat formatSQL = new SimpleDateFormat("yyyy-MM-dd", idioma);

            Date fechaNacimiento = null;

            //Se pasa la fecha de la pagina a un objeto Date
            Date date = formatPage.parse(request.getParameter("fechaNacimiento"));
            //Se pasa el objeto Date al formato que admite MySQL
            fechaNacimiento = formatSQL.parse(formatSQL.format(date));
            System.out.println(fechaNacimiento);

            // </editor-fold>      
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");

            String existe = "";

            //Se envia un request al jsp correspondiente segun el caso
            /*if(existe.equals("existe")){
                String[] parametros= {existe,nombre,apellido,correo,contraseña,request.getParameter("fechaNacimiento"),request.getParameter("genero")};
                request.setAttribute("ESTADO", parametros);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/registro-cliente.jsp");
                requestDispatcher.forward(request, response);
            }else{*/
            Local local = new Local(nombre, descripcion);

            //Enviar objeto al modelo para guardar en la Base de Datos
            modeloLocal.agregarLocalDB(local);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
            requestDispatcher.forward(request, response);
            /*}*/

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
