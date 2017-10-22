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
import com.mallbit.vendedor.ModeloVendedor;
import com.mallbit.vendedor.Vendedor;
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
    ModeloVendedor modeloVendedor = new ModeloVendedor();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, IOException {
        
        String local = request.getParameter("idlocal");
        if(local == null){
            listarProductos(request, response);
        }else{
            listarProductosL(request, response, local);
        }
    }

    private void listarProductos(HttpServletRequest request, HttpServletResponse response){
        try {
            List<Producto> productos = modeloProducto.getProductos();
            //Agregar clientes al request
            request.setAttribute("LISTAPRODUCTOS", productos);
            //Enviar request a la pagina que se desea
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/interfaz-local.jsp");
            requestDispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void listarProductosL(HttpServletRequest request, HttpServletResponse response, String local){
        try {
            List<Producto> productos = modeloProducto.getProductos(local);
            List<Local> locales = modeloLocal.obtenerLocalesDB();
            List<Cliente> clientes = modeloCliente.obtenerClientesDB();
            Vendedor vendedor = modeloVendedor.obtenerVendedorL(local);
            
            Cliente c = null;
            Local l = null;
            String usuario = request.getParameter("user");
            for (Cliente cliente : clientes) {
                if (cliente.getUsuario().equals(usuario)) {
                    c = cliente;
                    break;
                }
            }
            for (Local buscado : locales) {
                if (local.equals(Integer.toString(buscado.getId())));
                l = buscado;
                break;
            }
            
            //Crear sesion del cliente
            HttpSession session = request.getSession();
            session.setAttribute("CLIENTE_SESSION", c);
            //Agregar objetos al request
            request.setAttribute("LISTAPRODUCTOS", productos);
            request.setAttribute("LOCAL", l);
            request.setAttribute("VENDEDOR", vendedor);
            //Enviar request a la pagina que se desea
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/interfaz-local.jsp");
            requestDispatcher.forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
