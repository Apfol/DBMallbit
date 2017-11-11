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
import com.mallbit.premio.Premio;
import com.mallbit.vendedor.ModeloVendedor;
import com.mallbit.vendedor.Vendedor;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet(name = "ControladorProducto", urlPatterns = {"/ControladorProducto"})
@MultipartConfig
public class ControladorProducto extends HttpServlet {

     private static final long serialVersionUID = 1L;

    ModeloProducto modeloProducto = new ModeloProducto();
    ModeloCliente modeloCliente = new ModeloCliente();
    ModeloLocal modeloLocal = new ModeloLocal();
    ModeloVendedor modeloVendedor = new ModeloVendedor();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, IOException {
    
        try {

            //Leer parametro (value) del input hidden del formulario
            String parametro = request.getParameter("instruccion");

            //Ejecutar método según valor del parametro
            switch (parametro) {
                case "borrarProducto":
                    borrarProducto(request, response);
                    break;
                default:
                    break;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
    }  
        
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, IOException {
        
        String parametro = request.getParameter("instruccion");

        try{
        
        switch (parametro) {
            case "listarProductos":
                listarProductos(request, response);
                break;
            case "listarProductosL":
                listarProductosL(request, response);
                break;
            case "insertarProducto":
                insertarProducto(request, response);
                break;
            case "actualizarProducto":
                actualizarProducto(request, response);
                break;
            default:
                break;
        }
        
        }catch(Exception e){
            e.printStackTrace();
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

    private void listarProductosL(HttpServletRequest request, HttpServletResponse response){
        try {
            String local = request.getParameter("iDLocal");
            List<Producto> productos = modeloProducto.getProductos(local);
            Local localB = modeloLocal.obtenerLocalDB(local);
            List<Cliente> clientes = modeloCliente.obtenerClientesDB();
            Vendedor vendedor = modeloVendedor.obtenerVendedorL(local);
            
            Cliente c = null;
            String usuario = request.getParameter("user");
            for (Cliente cliente : clientes) {
                if (cliente.getUsuario().equals(usuario)) {
                    c = cliente;
                    break;
                }
            }
            
            //Crear sesion del cliente
            HttpSession session = request.getSession();
            session.setAttribute("CLIENTE_SESSION", c);
            //Agregar objetos al request
            request.setAttribute("LISTAPRODUCTOS", productos);
            request.setAttribute("LOCAL", localB);
            request.setAttribute("VENDEDOR", vendedor);
            //Enviar request a la pagina que se desea
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/interfaz-local.jsp");
            requestDispatcher.forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void insertarProducto(HttpServletRequest request, HttpServletResponse response) {
        try{
            
            Local l = modeloLocal.obtenerLocalDB(request.getParameter("local"));
            String nombre = request.getParameter("nombre");
            int precio = Integer.parseInt(request.getParameter("precio"));
            String marca = request.getParameter("marca");
            int stock = Integer.parseInt(request.getParameter("stock"));
            String descripcion = request.getParameter("descripcion");
            String nombreImagen = guardarImagenObtenerNombre(request, "imagenPrincipal", nombre, l.getNombre());
            
            //Operacion para calcular puntos
            int puntos = 0; 
            
            Producto producto = new Producto (nombre, precio, marca, l.getId(), descripcion, nombreImagen, stock, puntos);
            modeloProducto.insertarProducto(producto);
            
            request.setAttribute("caso", "InterfazProductos");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/carga-vendedor.jsp");
            requestDispatcher.forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private void borrarProducto(HttpServletRequest request, HttpServletResponse response) {
        try {

            String idProducto = request.getParameter("idProducto");
            String idLocal = request.getParameter("local");
            eliminarImagen(idProducto, idLocal);
            modeloProducto.eliminarProducto(idProducto);
            response.sendRedirect("interfaz-productos.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private void actualizarProducto(HttpServletRequest request, HttpServletResponse response) {
        try {

            String idProducto = request.getParameter("iDProducto");
            String idLocal = request.getParameter("iDLocal");
            
            Local local = modeloLocal.obtenerLocalDB(idLocal);          
            Producto p = modeloProducto.obtenerProducto(idProducto);
            
            String nombre = request.getParameter("nombre");
            int precio = 0;
            if (!request.getParameter("precio").equals("")) {
                precio = Integer.parseInt(request.getParameter("precio"));
            }
            String marca = request.getParameter("marca");
            int stock = 0;
            if (!request.getParameter("stock").equals("")) {
                stock = Integer.parseInt(request.getParameter("stock"));
            }
            String descripcion = request.getParameter("descripcion");
            
            String nombreImagen = "";
            if(!request.getPart("imagenPrincipal").getSubmittedFileName().equals("")){
                if(!nombre.equals("")){
                    eliminarImagen(Integer.toString(p.getId()), Integer.toString(p.getIdLocal()));
                    nombreImagen = guardarImagenObtenerNombre(request, "imagenPrincipal", nombre, local.getNombre());
                }else{
                    nombreImagen = guardarImagenObtenerNombre(request, "imagenPrincipal", p.getNombre(), local.getNombre());
                }
            }else{
                if(!nombre.equals("")){
                    nombreImagen = actualizarImagenObtenerNombre(Integer.toString(p.getId()), local.getNombre(), nombre);
                }
            }
            int puntos = 0;
            
            Producto producto = new Producto (p.getId(), nombre, precio, marca, 0, descripcion, nombreImagen, stock, puntos);
            
            modeloProducto.actualizarProducto(producto);
            
            request.setAttribute("caso", "InterfazProductos");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/carga-vendedor.jsp");
            requestDispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
//    Con estos métodos las imágenes que se suban al formulario
//    seran guardadas en la carpeta images/locales y se obtiene
//    el nombre de la imagen como una concatenación del nombre
//    del local y el nombre de la imagen que se subió, los nombres
//    de las imagenes se guardan en la base de datos para después 
//    poder manipularlas.
    //<editor-fold defaultstate="collapsed" desc="Métodos para administrar imágenes">
    private String guardarImagenObtenerNombre(HttpServletRequest request, String tipoImagen, String nombreProducto, String nombreLocal) throws ServletException, IOException {
        // Obtener dirección a guardar archivo
        String pathServlet = getServletContext().getRealPath("/");
        String pathProject = pathServlet.substring(0, pathServlet.length() - 11);
        String path = pathProject + "\\web\\images\\Productos\\";
        Part filePart = request.getPart(tipoImagen);

        //Asignar nombre archivo
        String[] a = getNombreImagen(filePart).split("\\.(?=[^\\.]+$)");
        String fileName = nombreLocal + "-" + nombreProducto + "." + a[1];

        OutputStream out = null;
        InputStream filecontent = null;

        try {
            out = new FileOutputStream(new File(path + File.separator + fileName), false);
            filecontent = filePart.getInputStream();

            int read = 0;
            final byte[] bytes = new byte[1024];

            while ((read = filecontent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
        } catch (FileNotFoundException fne) {
            fne.printStackTrace();
        } finally {
            if (out != null) {
                out.close();
            }
            if (filecontent != null) {
                filecontent.close();
            }
        }
        return fileName;
    }

    private String getNombreImagen(final Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
    
    private void eliminarImagen(String idProducto, String idLocal) throws Exception {
        
        List<Producto> productos = modeloProducto.getProductos(idLocal);
        
        String nombreImagen = "";
        for(Producto producto: productos) {
            if(producto.getId() == Integer.parseInt(idProducto)) {
                nombreImagen = producto.getNombreImagen();
            }
        }
        
        String pathServlet = getServletContext().getRealPath("/");
        String pathProject = pathServlet.substring(0, pathServlet.length() - 11);
        String path = pathProject + "\\web\\images\\Productos\\";
        
        File imagen = new File(path + File.separator + nombreImagen);
        imagen.delete();
    }
    
    private String actualizarImagenObtenerNombre(String idProducto, String nombreLocal, String nuevoNombre) throws Exception {
        
        Producto p = modeloProducto.obtenerProducto(idProducto);
        
        String nombreImagen = p.getNombreImagen();

        String[] a = nombreImagen.split("\\.(?=[^\\.]+$)");
        String nombreImagen2 = nombreLocal + "-" + nuevoNombre + "." + a[1];
        
        String pathServlet = getServletContext().getRealPath("/");
        String pathProject = pathServlet.substring(0, pathServlet.length() - 11);
        String path = pathProject + "\\web\\images\\Productos\\";
        
        File imagen = new File(path + File.separator + nombreImagen);
        imagen.renameTo(new File(path + File.separator + nombreImagen2));
        
        return nombreImagen2;
    }
    // </editor-fold>

}
