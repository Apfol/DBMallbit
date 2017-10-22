/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.vendedor;

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
@WebServlet(name = "ControladorVendedor", urlPatterns = {"/ControladorVendedor"})
public class ControladorVendedor extends HttpServlet {
   
    private ModeloVendedor modeloVendedor = new ModeloVendedor();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Leer parametro (value) del input hidden del formulario
        String parametro = request.getParameter("instruccion");
        //Ejecutar método segun valor del parametro
        switch (parametro) {
            case "listarVendedores":
                listarVendedoresDB(request, response);
                break;
            case "insertarVendedor":
                insertarVendedorDB(request, response);
                break;
            case "validarVendedor":
                validarVendedorDB(request, response);
                break;
            case "actualizarVendedor":
                actualizarVendedorDB(request, response);
                break;
            default:
                break;
        }
    }

    private void insertarVendedorDB(HttpServletRequest request, HttpServletResponse response) {

        try {

            //Crear objeto Vendedor con los datos recibidos del formulario
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

            //Se verifica si existe otro vendedor con ese Usuario
            List<Vendedor> vendedores = modeloVendedor.obtenerVendedoresDB();
            for (Vendedor vendedor : vendedores) {
                if (vendedor.getUsuario().equals(usuario)) {
                    existe = "existe";
                    break;
                }
            }

            Vendedor vendedor = new Vendedor(nombre, apellido, correo, identificacion, telefono, usuario, contraseña, fechaNacimiento, idGenero);

            //Enviar objeto al modelo para guardar en la Base de Datos
            modeloVendedor.agregarVendedorDB(vendedor);
            request.setAttribute("VENDEDOR", vendedor);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/interfaz-vendedor.jsp");
            requestDispatcher.forward(request, response);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void listarVendedoresDB(HttpServletRequest request, HttpServletResponse response) {
        try {
            //Obtener lista de Clientes
            List<Vendedor> vendedores;

            vendedores = modeloVendedor.obtenerVendedoresDB();

            //Agregar lista de clientes al Request
            request.setAttribute("LISTAVENDEDORES", vendedores);

            //Enviar request al JSP correspondiente
            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    private void validarVendedorDB(HttpServletRequest request, HttpServletResponse response) {
        try {
            String usuario = request.getParameter("usuario");
            String contraseña = request.getParameter("password");
            String estado = "indefinido";
            Vendedor v = null;

            List<Vendedor> vendedores = modeloVendedor.obtenerVendedoresDB();
            for (Vendedor vendedor : vendedores) {
                if (vendedor.getUsuario().equals(usuario) && vendedor.getContraseña().equals(contraseña)) {
                    estado = "correcto";
                    v = vendedor;
                    break;
                }
            }

            if (estado.equals("indefinido")) {
                for (Vendedor vendedor : vendedores) {
                    if (vendedor.getUsuario().equals(usuario) && !vendedor.getContraseña().equals(contraseña)) {
                        estado = "incorrecto";
                        break;
                    }
                }
            }

            switch (estado) {
                case "correcto":
                    request.setAttribute("VENDEDOR", v);
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/interfaz-vendedor.jsp");
                    requestDispatcher.forward(request, response);
                    break;
                case "incorrecto":
                    request.setAttribute("RESULTADO", estado);
                    RequestDispatcher requestDispatcherI = request.getRequestDispatcher("/iniciar-sesion-vendedor.jsp");
                    requestDispatcherI.forward(request, response);
                    break;
                case "indefinido":
                    request.setAttribute("RESULTADO", estado);
                    RequestDispatcher requestDispatcherC = request.getRequestDispatcher("/iniciar-sesion-vendedor.jsp");
                    requestDispatcherC.forward(request, response);
                    break;
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

    }
    
    private void actualizarVendedorDB(HttpServletRequest request, HttpServletResponse response) {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String usuario = request.getParameter("usuario");
        String correo = request.getParameter("correo");
        long telefono = 0;
        if (!request.getParameter("telefono").equals("")) {
            telefono = Long.parseLong(request.getParameter("telefono"));
        }
        String password = request.getParameter("password");
        Vendedor cliente = new Vendedor(nombre, apellido, correo, 0, telefono, usuario, password, null, 0);
        try {
            modeloVendedor.actualizarVendedorDB(cliente);

            Vendedor buscado = null;

            List<Vendedor> vendedores = modeloVendedor.obtenerVendedoresDB();
            for (Vendedor v : vendedores) {
                if (v.getUsuario().equals(usuario)) {
                    buscado = v;
                    System.out.println("Hola BB");
                    break;
                }
            }
            
            request.setAttribute("VENDEDOR_SESSION", buscado);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/interfaz-vendedor.jsp");
            requestDispatcher.forward(request, response);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }


}

