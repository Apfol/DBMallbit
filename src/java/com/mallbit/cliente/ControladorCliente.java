package com.mallbit.cliente;

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

@WebServlet("/ControladorCliente")
public class ControladorCliente extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ModeloCliente modeloCliente = new ModeloCliente();
    private ModeloGenero modeloGenero = new ModeloGenero();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Leer parametro (value) del input hidden del formulario
        String parametro = request.getParameter("instruccion");

        //Ejecutar método según valor del parametro
        switch (parametro) {
            case "listarClientes":
                listarClientesDB(request, response);
                break;
            case "insertarCliente":
                insertarClienteDB(request, response);
                break;
            case "validarCliente":
                validarClienteDB(request, response);
                break;
            case "actualizarCliente":
                actualizarClienteDB(request, response);
                break;
            case "borrarCliente":
                borrarClienteDB(request, response);
                break;
            case "sesion":
                sesion(request, response);
                break;
            default:
                break;
        }

    }

    private void insertarClienteDB(HttpServletRequest request, HttpServletResponse response) {

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
            String apellido = request.getParameter("apellido");
            String usuario = request.getParameter("usuario");
            String correo = request.getParameter("correo");
            long identificacion = Long.parseLong(request.getParameter("identificacion"));
            long telefono = Long.parseLong(request.getParameter("telefono"));
            String contraseña = request.getParameter("password");
            int idGenero = Integer.parseInt(request.getParameter("genero"));

            String existe = "";

            //Se verifica si existe otro cliente con ese Usuario
            List<Cliente> clientes = modeloCliente.obtenerClientesDB();
            for (Cliente cliente : clientes) {
                if (cliente.getUsuario().equals(usuario)) {
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
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/registro-cliente.jsp");
                requestDispatcher.forward(request, response);
            } else {
                Cliente cliente = new Cliente(nombre, apellido, correo, identificacion, telefono, usuario, contraseña, fechaNacimiento, idGenero);

                //Enviar objeto al modelo para guardar en la Base de Datos
                modeloCliente.agregarClienteDB(cliente);
                //Actualiza lista de clientes con el que se acaba de ingresar
                clientes = modeloCliente.obtenerClientesDB();
                //Guardar id del clientes en una cookie
                int idCliente = clientes.get(clientes.size() - 1).getId();
                ControladorCookie.crearCookie(idCliente, Cliente.CLIENTE_COOKIE, response);
                response.sendRedirect("index.jsp");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    private void listarClientesDB(HttpServletRequest request, HttpServletResponse response) {
        try {
            //Obtener lista de Clientes
            List<Cliente> clientes;

            clientes = modeloCliente.obtenerClientesDB();

            //Agregar lista de clientes al Request
            request.setAttribute("LISTACLIENTES", clientes);

            //Enviar request al JSP correspondiente
            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    private void validarClienteDB(HttpServletRequest request, HttpServletResponse response) {
        try {
            String usuario = request.getParameter("usuario");
            String contraseña = request.getParameter("password");
            String interfaz = request.getParameter("interfaz");
            String local = request.getParameter("local");
            String estado = "indefinido";
            Cliente c = null;

            List<Cliente> clientes = modeloCliente.obtenerClientesDB();
            for (Cliente cliente : clientes) {
                if (cliente.getUsuario().equals(usuario) && cliente.getContraseña().equals(contraseña)) {
                    estado = "correcto";
                    c = cliente;
                    break;
                }
            }

            if (estado.equals("indefinido")) {
                for (Cliente cliente : clientes) {
                    if (cliente.getUsuario().equals(usuario) && !cliente.getContraseña().equals(contraseña)) {
                        estado = "incorrecto";
                        break;
                    }
                }
            }

            switch (estado) {
                case "correcto":
                    //Guardar id del cliente en una cookie
                    ControladorCookie.crearCookie(c.getId(), Cliente.CLIENTE_COOKIE, response);
                    if (interfaz.equals("1")) {
                        response.sendRedirect("/ControladorProducto?user=" + c.getUsuario() + "&idlocal=" + local);
                    } else {
                        System.out.println(interfaz);
                        System.out.println("aiuda");
                        response.sendRedirect("index.jsp");
                    }
                    break;
                case "incorrecto":
                    request.setAttribute("RESULTADO", estado);
                    RequestDispatcher requestDispatcherI = request.getRequestDispatcher("/iniciar-sesion-cliente.jsp");
                    requestDispatcherI.forward(request, response);
                    break;
                case "indefinido":
                    request.setAttribute("RESULTADO", estado);
                    RequestDispatcher requestDispatcherC = request.getRequestDispatcher("/iniciar-sesion-cliente.jsp");
                    requestDispatcherC.forward(request, response);
                    break;
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    private void actualizarClienteDB(HttpServletRequest request, HttpServletResponse response) {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String usuario = request.getParameter("usuario");
        String correo = request.getParameter("correo");
        long telefono = 0;
        if (!request.getParameter("telefono").equals("")) {
            telefono = Long.parseLong(request.getParameter("telefono"));
        }
        String password = request.getParameter("password");
        Cliente cliente = new Cliente(nombre, apellido, correo, 0, telefono, usuario, password, null, 0);
        try {
            modeloCliente.actualizarClienteDB(cliente);

            Cliente buscado = null;

            List<Cliente> clientes = modeloCliente.obtenerClientesDB();
            for (Cliente cl : clientes) {
                if (cl.getUsuario().equals(usuario)) {
                    buscado = cl;
                    break;
                }
            }

            request.setAttribute("ClienteInterfazA", buscado);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/interfaz-cliente.jsp");
            requestDispatcher.forward(request, response);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void sesion(HttpServletRequest request, HttpServletResponse response) {
        String usuario = request.getParameter("user");
        Cliente c = null;
        try {
            List<Cliente> clientes = modeloCliente.obtenerClientesDB();
            for (Cliente cliente : clientes) {
                if (cliente.getUsuario().equals(usuario)) {
                    c = cliente;
                    break;
                }
            }
            request.setAttribute("ClienteInterfazS", c);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/interfaz-cliente.jsp");
            requestDispatcher.forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void borrarClienteDB(HttpServletRequest request, HttpServletResponse response) {
        String usuario = request.getParameter("usuario");
        try {
            Cliente c = null;
            List<Cliente> clientes = modeloCliente.obtenerClientesDB();
            for (Cliente cliente : clientes) {
                if (cliente.getUsuario().equals(usuario)) {
                    c = cliente;
                    break;
                }
            }
            modeloCliente.borrarClienteDB(c);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
            requestDispatcher.forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
