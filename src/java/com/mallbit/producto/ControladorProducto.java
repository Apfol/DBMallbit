/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.producto;

import java.io.IOException;
import java.util.List;
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
@WebServlet(name = "ControladorProducto", urlPatterns = {"/ControladorProducto"})
public class ControladorProducto extends HttpServlet {

     private static final long serialVersionUID = 1L;

    ModeloProducto modeloProducto = new ModeloProducto();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Producto> productos = modeloProducto.getProductos();

            //Agregar clientes al request
            request.setAttribute("LISTAPRODUCTOS", productos);
            RequestDispatcher requestDispatcher;
            //Enviar request a la pagina que se desea
            requestDispatcher = request.getRequestDispatcher("/interfaz-local.jsp");
            requestDispatcher.forward(request, response);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
