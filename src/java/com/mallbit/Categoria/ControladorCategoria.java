/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.Categoria;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author USUARIO
 */
@WebServlet(name = "ControladorCategoria", urlPatterns = {"/ControladorCategoria"})
public class ControladorCategoria extends HttpServlet {

    private static final long serialVersionUID = 1L;

    ModeloCategoria modeloCategoria = new ModeloCategoria();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
                
            List<Categoria> categorias = modeloCategoria.getCategorias();

            //Agregar clientes al request
            request.setAttribute("LISTACATEGORIAS", categorias);
            RequestDispatcher requestDispatcher;

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}