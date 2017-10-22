/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.administrador;

import com.mallbit.cookies.ControladorCookie;
import com.mallbit.genero.Genero;
import com.mallbit.genero.ModeloGenero;
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

/**
 *
 * @author Andres Ramos
 */
@WebServlet(name = "ControladorAdministrador", urlPatterns = {"/ControladorAdministrador"})
public class ControladorAdministrador extends HttpServlet {

    private final ModeloAdministrador modeloAdministrador = new ModeloAdministrador();
    private final ModeloGenero modeloGenero = new ModeloGenero();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Leer parametro (value) del input hidden del formulario
        String parametro = request.getParameter("instruccion");

        //Ejecutar método según valor del parametro
        switch (parametro) {
            case "insertarAdministrador":
                insertarAdministrador(request, response);
                break;
            case "validarAdministrador":
                validarAdministrador(request, response);
                break;
        }
    }

    private void insertarAdministrador(HttpServletRequest request, HttpServletResponse response) {
        try {

            //Crear objeto Administrador con los datos recibidos del formulario
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
            String apellido = request.getParameter("apellido");
            String usuario = request.getParameter("usuario");
            String correo = request.getParameter("correo");
            long identificacion = Long.parseLong(request.getParameter("identificacion"));
            long telefono = Long.parseLong(request.getParameter("telefono"));
            String contraseña = request.getParameter("password");
            int idGenero = Integer.parseInt(request.getParameter("genero"));

            String existe = "";

            //Se verifica si existe otro administrador con ese Usuario
            List<Administrador> administradores = modeloAdministrador.obtenerAdministradoresDB();
            for (Administrador administrador : administradores) {
                if (administrador.getUsuario().equals(usuario)) {
                    existe = "existe";
                    break;
                }
            }

            //Se envia un request al jsp correspondiente segun el caso
            if (existe.equals("existe")) {
                List<Genero> generos = modeloGenero.getGeneros();
                String[] parametros = {existe, nombre, apellido, correo, contraseña, request.getParameter("fechaNacimiento"), request.getParameter("identificacion"), request.getParameter("telefono"), request.getParameter("genero")};
                request.setAttribute("ESTADO", parametros);
                request.setAttribute("LISTAGENEROS", generos);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/registro-administrador.jsp");
                requestDispatcher.forward(request, response);
            } else {
                Administrador administrador = new Administrador(nombre, apellido, correo, identificacion, telefono, usuario, contraseña, fechaNacimiento, idGenero);

                //Enviar objeto al modelo para guardar en la Base de Datos
                modeloAdministrador.agregarAdministradorDB(administrador);
                //Actualiza lista de administradores con el que se acaba de ingresar
                administradores = modeloAdministrador.obtenerAdministradoresDB();

                //Guardar id del administrador en una cookie
                int idAdministrador = administradores.get(administradores.size() - 1).getId();
                ControladorCookie.crearCookie(idAdministrador, Administrador.ADMINISTRADOR_COOKIE, response);
                response.sendRedirect("interfaz-administrador.jsp");
            }

        } catch (Exception ex) {

        }
    }

    private void validarAdministrador(HttpServletRequest request, HttpServletResponse response) {
        try {
            String usuario = request.getParameter("usuario");
            String contraseña = request.getParameter("password");
            String estado = "indefinido";
            Administrador a = null;

            List<Administrador> administradores = modeloAdministrador.obtenerAdministradoresDB();
            for (Administrador administrador : administradores) {
                if (administrador.getUsuario().equals(usuario) && administrador.getContraseña().equals(contraseña)) {
                    estado = "correcto";
                    a = administrador;
                    break;
                }
            }

            if (estado.equals("indefinido")) {
                for (Administrador administrador : administradores) {
                    if (administrador.getUsuario().equals(usuario) && !administrador.getContraseña().equals(contraseña)) {
                        estado = "incorrecto";
                        break;
                    }
                }
            }

            switch (estado) {
                case "correcto":
                    //Guardar id del administrador en una cookie
                    ControladorCookie.crearCookie(a.getId(), Administrador.ADMINISTRADOR_COOKIE, response);
                    response.sendRedirect("interfaz-administrador.jsp");
                    break;
                case "incorrecto":
                    request.setAttribute("RESULTADO", estado);
                    RequestDispatcher requestDispatcherI = request.getRequestDispatcher("/iniciar-sesion-administrador.jsp");
                    requestDispatcherI.forward(request, response);
                    break;
                case "indefinido":
                    request.setAttribute("RESULTADO", estado);
                    RequestDispatcher requestDispatcherC = request.getRequestDispatcher("/iniciar-sesion-administrador.jsp");
                    requestDispatcherC.forward(request, response);
                    break;
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

}
