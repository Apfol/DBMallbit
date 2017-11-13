/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.compra;

import com.mallbit.cliente.ControladorCliente;
import com.mallbit.cliente.ModeloCliente;
import com.mallbit.vendedor.ModeloVendedor;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
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
@WebServlet(name = "ControladorCompra", urlPatterns = {"/ControladorCompra"})
public class ControladorCompra extends HttpServlet {
    
    ModeloCompra modeloCompra = new ModeloCompra();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String parametro = request.getParameter("instruccion");
            
            switch (parametro) {
                case "realizarPago":
                    realizarCompra(request, response);
                    break;
                default:
                    break;
            }
        } catch (Exception ex) {
            Logger.getLogger(ControladorCompra.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void realizarCompra(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Date fecha = Date.valueOf(LocalDate.now());
        int idCliente= new ControladorCliente().obtenerClienteCookie(new ModeloCliente().obtenerClientesDB(), request).getId();
        int idProducto = Integer.parseInt(request.getParameter("idProducto"));
        int idVendedor = new ModeloVendedor().obtenerVendedorDesdeProducto(idProducto);
        Long numeroTarjeta = Long.parseLong(request.getParameter("numeroTarjeta"));
        int cvv = Integer.parseInt(request.getParameter("cvv"));
        
        Compra compra = new Compra(fecha, idCliente, idProducto, idVendedor, numeroTarjeta, cvv);
        
        modeloCompra.agregarCompra(compra);
        
        response.sendRedirect("compra-realizada.jsp");
    }

}
