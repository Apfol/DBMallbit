package com.mallbit.genero;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ControladorGenero")
public class ControladorGenero extends HttpServlet {

    private static final long serialVersionUID = 1L;

    ModeloGenero modeloGenero = new ModeloGenero();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Genero> generos = modeloGenero.getGeneros();

            //Agregar clientes al request
            request.setAttribute("LISTAGENEROS", generos);
            RequestDispatcher requestDispatcher;
            //Enviar request a la página que se desea
            int parametro = Integer.parseInt(request.getParameter("instruccion"));
            switch (parametro) {
                case Genero.GENERO_CLIENTE:
                    requestDispatcher = request.getRequestDispatcher("/registro-cliente.jsp");
                    requestDispatcher.forward(request, response);
                    break;
                case Genero.GENERO_VENDEDOR:
                    requestDispatcher = request.getRequestDispatcher("/registro-vendedor.jsp");
                    requestDispatcher.forward(request, response);
                    break;
                case Genero.GENERO_ADMINISTRADOR:
                    requestDispatcher = request.getRequestDispatcher("/registro-administrador.jsp");
                    requestDispatcher.forward(request, response);
                    break;
                default:
                    break;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
