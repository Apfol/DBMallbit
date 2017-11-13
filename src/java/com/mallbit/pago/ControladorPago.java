/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.pago;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Andres Ramos
 */
@WebServlet(name = "ControladorPago", urlPatterns = {"/ControladorPago"})
public class ControladorPago extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String parametro = request.getParameter("instruccion");

        switch (parametro) {
            case "realizarPago":
                realizarPago(request, response);
                break;
            default:
                break;
        }
    }

    private void realizarPago(HttpServletRequest request, HttpServletResponse response) {
        Long numeroTarjeta = Long.parseLong(request.getParameter("numeroTarjeta"));
        int cvv = Integer.parseInt(request.getParameter("cvv"));
        
        Pago pago = new Pago(numeroTarjeta, cvv);
        
        
    }

}
