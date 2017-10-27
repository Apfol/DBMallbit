<%-- 
    Document   : interfaz-administrador
    Created on : Oct 21, 2017, 10:23:27 AM
    Author     : Andres Ramos
--%>

<%@page import="com.mallbit.local.ModeloLocal"%>
<%@page import="com.mallbit.local.Local"%>
<%@page import="com.mallbit.producto.ModeloProducto"%>
<%@page import="com.mallbit.producto.Producto"%>
<%@page import="com.mallbit.vendedor.ControladorVendedor"%>
<%@page import="java.util.List"%>
<%@page import="com.mallbit.vendedor.ModeloVendedor"%>
<%@page import="com.mallbit.vendedor.Vendedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //En esta parte de código lo que se hace es obtener el administrador que tiene el mismo id que se guardo en la cookie.
    ModeloVendedor modeloVendedor = new ModeloVendedor();
    List<Vendedor> vendedores = modeloVendedor.obtenerVendedoresDB();
    Vendedor vendedor = new ControladorVendedor().obtenerVendedorCookie(vendedores, request);
    Local local = new ModeloLocal().obtenerLocalV(Integer.toString(vendedor.getId()));
%>
<!DOCTYPE html>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/style-interfaz-administrador.css" rel="stylesheet" />
        <link type="text/css" rel="stylesheet" href="css/materialize.css" />
        <% if (vendedor.getIdGenero() == 1) {%>
        <title>Vendedor <%= vendedor.getNombre()%></title>
        <%} else {%>
        <title>Vendedora <%= vendedor.getNombre()%></title>
        <%}%>
        <title>Vendedor </title>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
        <nav>
            <div class="nav-wrapper light-green darken-1">
                <div class="col s12">
                    <div id="principal-nav">
                        <a href="#" class="brand-logo"><i class="material-icons">shopping_basket</i>MallBIT</a>
                        <ul id="nav-mobile" class="right hide-on-med-and-down">
                            <li><a href="ControladorCookie?objeto=<%= Vendedor.VENDEDOR_COOKIE%>"><i class="material-icons left">exit_to_app</i>Cerrar sesión</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>


        <div class="fixed-action-btn">
            <a id="elementosVendor" class="btn-floating btn-large green lighten-1">
                <i class="large material-icons">add</i>
            </a>
            <ul>
                <li><a href="#actualizarDatosLocal" class="btn-floating pulse modal-trigger tooltipped teal lighten-2" data-position="left" data-delay="50" data-tooltip="Actualizar datos del local"><i class="material-icons">edit</i></a></li>
                <li><a href="registro-producto.jsp?vendor=<%= vendedor.getId()%>" class="btn-floating pulse tooltipped yellow darken-1" data-position="left" data-delay="50" data-tooltip="Agregar producto"><i class="material-icons">card_giftcard</i></a></li>
            </ul>
        </div>

        <% List<Producto> productos = new ModeloProducto().getProductos(Integer.toString(local.getId())); %>
        <% if (productos.isEmpty()) { %>
        <div id="contenedorAviso" class="valign-wrapper">
            <div class="row">
                <div class="col s6 offset-s3 m6 offset-m3">
                    <h4 class="center-align">Aún no has añadido ningún producto.</h4>
                </div>  
            </div> 
        </div>
        <% } else { %>
        <div class="row">
            <% for (Producto producto : productos) {%>
            <div class="col s12 m4">
                <div class="card">
                    <div class="card-image">
                        <img style="width: 100%; height: 400px;" src="images/Productos/<%= local.getNombre() %>/<%=producto.getNombreImagen()%>">
                        <span class="card-title"><%= producto.getNombre()%></span>
                        <a class="btn-floating halfway-fab waves-effect waves-light green"><i class="material-icons">add</i></a>
                    </div>
                    <div class="card-content">
                        <p><%= producto.getDescripcion()%></p>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
        <% } %>

        <div id="actualizarDatosPersonales" class="modal modal-fixed-footer">
            <form action="ControladorAdministrador" method="post">
                <div class="modal-content">
                    <h4>Actualización de datos local</h4>

                    <input type="hidden" name="instruccion" value="actualizarAdministrador"/>
                    <div class="row">
                        <div class="col s12 input-field">
                            <i class="material-icons prefix">person</i>
                            <input id="nombre" name="nombre" type="text" class="validate">
                            <label for="nombre">Nombre</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12 input-field">
                            <i class="material-icons prefix">person</i>
                            <input id="apellido" name="apellido" type="text" class="validate">
                            <label for="apellido">Descripción</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="modal-action modal-close waves-effect waves-light btn light-green darken-1 black-text" type="submit">Actualizar datos</button>
                </div>
            </form>
        </div>

        <div class="tap-target" data-activates="elementosVendor" style="background-color: #66bb6a">
            <div class="tap-target-content">
                <% if (vendedor.getIdGenero() == 1) {%>
                <h5>¡Bienvenido <%= vendedor.getNombre()%>!</h5>
                <%} else {%>
                <h5>¡Bienvenida <%= vendedor.getNombre()%>!</h5>
                <% }%>
                <p>Si deseas agregar un nuevo producto, o cambiar los datos de tu local, has click en este botón.</p>
            </div>
        </div>
        <!--Import jQuery before materialize.js-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script src="js/script.js"></script>
        <script src="js/script-inicio.js"></script>
    </body>

</html>
