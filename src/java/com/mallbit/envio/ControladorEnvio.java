/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.envio;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Andres Ramos
 */
@WebServlet(name = "ControladorEnvio", urlPatterns = {"/ControladorEnvio"})
public class ControladorEnvio extends HttpServlet {

    ModeloEnvio modeloEnvio = new ModeloEnvio();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            agregarEnvio(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ControladorEnvio.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String instruccion = request.getParameter("instruccion");

            switch (instruccion) {
                case "actualizarEstado":
                    actualizarEstado(request, response);
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ControladorEnvio.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void agregarEnvio(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int idCompra = Integer.parseInt(request.getParameter("idCompra"));
        int idVendedor = Integer.parseInt(request.getParameter("idVendedor"));
        String direccion = request.getParameter("direccion");

        Envio envio = new Envio(null, direccion, 0, idCompra, idVendedor);

        modeloEnvio.agregarEnvioDB(envio);

        response.sendRedirect("compra-realizada.jsp");
    }

    private void actualizarEstado(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String idEnvio[] = request.getParameterValues("idEnvio");

        if (idEnvio != null) {
            for (String idEnvio1 : idEnvio) {
                modeloEnvio.actualizarEstadoEnvio(Integer.parseInt(idEnvio1));
            }
        }
        response.sendRedirect("interfaz-productos.jsp");
    }

}
