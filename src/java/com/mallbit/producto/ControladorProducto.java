/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.producto;

import com.mallbit.cliente.Cliente;
import com.mallbit.cliente.ModeloCliente;
import com.mallbit.local.Local;
import com.mallbit.local.ModeloLocal;
import java.io.IOException;
import java.util.List;
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
@WebServlet(name = "ControladorProducto", urlPatterns = {"/ControladorProducto"})
public class ControladorProducto extends HttpServlet {

     private static final long serialVersionUID = 1L;

    ModeloProducto modeloProducto = new ModeloProducto();
    ModeloCliente modeloCliente = new ModeloCliente();
    ModeloLocal modeloLocal = new ModeloLocal();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, IOException {
        
        try {
            List<Producto> productos = null;
            String local = request.getParameter("local");
            if (local == null) {
                productos = modeloProducto.getProductos();
            }else{
                productos = modeloProducto.getProductos(local);
            }
            Cliente c = null;
            String usuario = request.getParameter("user");
            List<Cliente> clientes = modeloCliente.obtenerClientesDB();
            for (Cliente cliente : clientes) {
                if (cliente.getUsuario().equals(usuario)) {
                    c = cliente;
                    break;
                }
            }
            HttpSession session = request.getSession();
            session.setAttribute("CLIENTE_SESSION", c);
            //Agregar clientes al request
            request.setAttribute("LISTAPRODUCTOS", productos);
            //Enviar request a la pagina que se desea
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/interfaz-local.jsp");
            requestDispatcher.forward(request, response);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
