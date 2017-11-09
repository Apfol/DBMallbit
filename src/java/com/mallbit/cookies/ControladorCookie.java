/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.cookies;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Andres Ramos
 */
@WebServlet(name = "ControladorCookie", urlPatterns = {"/ControladorCookie"})
public class ControladorCookie extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String objeto = request.getParameter("objeto");
        eliminarCookie(response, objeto);
        response.sendRedirect("index.jsp");
    }
    
    //En ese metodo se guarda el id del objeto de la sesión actual en una cookie.
    public static void crearCookie(int id, String objeto, HttpServletResponse response) throws IOException {
        Cookie cookieCliente = new Cookie(objeto, String.valueOf(id));
        cookieCliente.setMaxAge(30 * 12 * 60 * 60);// Duración de 30 días
        cookieCliente.setPath("/");
        response.addCookie(cookieCliente);
    }
    
    public void eliminarCookie(HttpServletResponse response, String objeto) {
        Cookie killMyCookie = new Cookie(objeto, null);
        killMyCookie.setMaxAge(0);
        killMyCookie.setPath("/");
        response.addCookie(killMyCookie);
    }
}
