
<%@page import="com.mallbit.cliente.ControladorCliente"%>
<%@page import="java.util.List"%>
<%@page import="com.mallbit.cliente.ModeloCliente"%>
<%@page import="com.mallbit.local.Local"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mallbit.local.ModeloLocal"%>
<%@page import="com.mallbit.cliente.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    //En esta parte de código lo que se hace es obtener el cliente que tiene el mismo id que se guardo en la cookie.
    ModeloCliente modeloCliente = new ModeloCliente();
    List<Cliente> clientes = modeloCliente.obtenerClientesDB();
    Cliente cliente = new ControladorCliente().obtenerClienteCookie(clientes, request);
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link href="css/style.css" rel="stylesheet" />
        <link type="text/css" rel="stylesheet" href="css/materialize.css" />


        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>MallBIT - Compra y Vende</title>
    </head>

    <body>


        <%
            ModeloLocal modeloLocal = new ModeloLocal();
            ArrayList<Local> locales = (ArrayList<Local>) modeloLocal.obtenerLocalesDB();
        %>

        <!--# NOTE: Comienza parte mostrar barra navegación.-->
        <div id="primera" class="scrollspy">
            <nav class="pushpin-nav z-depth-0" data-target="primera">
                <div class="nav-wrapper lime lighten-2">
                    <div class="col s12">
                        <div id="principal-nav">
                            <a href="#" class="brand-logo"><i class="material-icons">shopping_basket</i>MallBIT</a>
                            <ul id="nav-mobile" class="right hide-on-med-and-down">
                                <% if (cliente == null) { %>
                                <li><a href="iniciar-sesion-cliente.jsp"><i class="material-icons left">people</i>Acceder</a></li>
                                <li><a href="iniciar-sesion-vendedor.jsp"><i class="material-icons left">local_shipping</i>Vender</a></li>
                                <li><a href="iniciar-sesion-administrador.jsp"><i class="material-icons left">security</i>Administrar</a></li>
                                <li><a id="search-nav-button" href="#search-nav"><i class="material-icons left">search</i>Buscar</a></li>
                                    <%} else {%>
                                <li><a id="search-nav-button" href="#search-nav"><i class="material-icons left">search</i>Buscar</a></li>
                                <li>
                                    <form method="post" action="ControladorCliente" id="iu">
                                        <input type="hidden" name="instruccion" value="sesion">
                                        <input type="hidden" name="user" value="<%= cliente.getUsuario()%>">
                                        <a onclick="document.getElementById('iu').submit()"><i class="material-icons left">people</i><%= cliente.getNombre()%></a>
                                    </form>
                                </li>
                                <li><a href="sass.html"><i class="material-icons left">shopping_cart</i>Mis Compras</a></li>
                                <li><a href="ControladorCookie?objeto=<%= Cliente.CLIENTE_COOKIE%>"><i class="material-icons left">exit_to_app</i>Cerrar sesión</a></li>
                                    <% }%>
                            </ul>
                        </div>

                        <div style="height: 56px;" id="search-nav">
                            <div class="row">
                                <div class="col s10">
                                    <div class="input-field black-text">
                                        <i class="material-icons prefix">search</i>
                                        <input placeholder="Haz click para buscar" id="icon_prefix" type="text" class="validate">
                                    </div>
                                </div>
                                <div class="col s2">
                                    <ul class="right hide-on-med-and-down">
                                        <li><a id="search-nav-cancel" href="#"><i class="material-icons left black-text">cancel</i>Cancelar</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>

            <div style="height: 64px;"></div>

            <!--# NOTE: Comienza parte mostrar fotos.-->
            <header id="inicio">
                <div class="carousel carousel-slider" data-indicators="true" style="margin: 0px;">
                    <div id="first-photo-slides" class="row carousel-item white-text" href="#one!">
                        <div class="col s3 right">
                            <div class="card brown darken-3 z-depth-5">
                                <div class="card-content white-text">
                                    <span class="card-title">Card Title</span>
                                    <p>I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>
                                </div>
                                <div class="card-action">
                                    <a href="#">This is a link</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="second-photo-slides" class="row carousel-item black-text" href="#two!">
                        <div style="margin: 20px;" class="col s3 right">
                            <div class="card blue lighten-5 z-depth-5">
                                <div class="card-content black-text">
                                    <span class="card-title">Card Title</span>
                                    <p>I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>
                                </div>
                                <div class="card-action">
                                    <a href="#">This is a link</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="third-photo-slides" class="row carousel-item green black-text" href="#three!">
                        <div style="margin: 20px;" class="col s3 left">
                            <div class="card blue lighten-5 z-depth-5">
                                <div class="card-content black-text">
                                    <span class="card-title">Card Title</span>
                                    <p>I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>
                                </div>
                                <div class="card-action">
                                    <a href="#">This is a link</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="fourth-photo-slides" class="row carousel-item blue white-text" href="#four!">
                        <div style="margin: 20px;" class="col s3 left">
                            <div class="card lime lighten-4 z-depth-5">
                                <div class="card-content black-text">
                                    <span class="card-title">Card Title</span>
                                    <p>I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>
                                </div>
                                <div class="card-action">
                                    <a href="#">This is a link</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
        </div>




        <div id="segunda">
            <nav class="pushpin-nav" data-target="segunda">
                <div class="nav-wrapper lime darken-1">
                    <div class="col s12">
                        <ul id="gender-options" class="left hide-on-med-and-down">
                            <li><a href="#primera">INICIO</a></li>
                            <li><a href="#entretenimiento">ENTRETENIMIENTO</a></li>
                            <li><a href="#tecnologia">TECNOLOGIA</a></li>
                            <li><a href="#hogar">HOGAR</a></li>
                            <li><a href="#belleza">BELLEZA</a></li>
                            <li><a href="#infantil">INFANTIL</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            
            <!--# NOTE: Entretenimiento genero.-->
            <div id="entretenimiento" class="scrollspy">
                <div class="parallax-container">
                    <div class="parallax"><img src="images/parallax3.jpg"></div>
                    <div class="row">
                        <div style="height: 400px;" class="col s5 center valign-wrapper">
                            <div id="card-entretenimiento" class="card-panel z-depth-5 white">
                                <h3>ENTRETENIMIENTO</h3>
                                <h5>Te mostramos los principales locales de entretenimiento</h5>
                            </div>
                        </div>
                        <div class="col s7 center">
                            <div class="carousel carousel-logos">
                                <% for (Local l : locales) { %>

                                    <% if (l.getIdCategoria() == 1) { %>  
                                        <form action="ControladorProducto" method="post" id="int<%= l.getId() %>">
                                            <% if (cliente != null) {%>
                                            <input type="hidden" name="user" value="<%= cliente.getUsuario()%>">                                         
                                            <% } %>
                                            <input type="hidden" name="idlocal" value="<%= l.getId()%>">
                                            <a class="carousel-item" onclick="document.getElementById('int<%= l.getId() %>').submit()"><img style="height: 250px; width: 250px" src="<%= l.getNombreImagenPrimaria() %>"></a>
                                        </form>
                                    <% } %>
                                <% }%>
                            </div>
                        </div>
                    </div>
                </div>

                <!--# NOTE: Entretenimiento, comienza parte mostrar locales.-->
                <div class="container" style="height:320px ; width: 80%; padding: 0px; overflow: auto" id="style-2">
                    <div class="row" style="margin-left: auto; margin-right: auto; padding: 0px; margin-bottom: 0; margin-top: 0">
                        <% for (Local l : locales) { %>
                        <% if (l.getIdCategoria() == 1) {%>
                        <div class="col s3" style="margin: 0px">
                            <div class="card small" style="margin-bottom: 0;">
                                <div class="card-image waves-effect waves-block waves-light">
                                    <img class="activator" src="images/Locales/<%= l.getNombreImagenPrimaria()%>">
                                </div>
                                <div class="card-content">
                                    <span class="card-title activator grey-text text-darken-4" style="font-weight: 300"><%= l.getNombre()%><i class="material-icons right">more_vert</i></span>
                                    <form action="ControladorProducto" method="post" id="cad<%= l.getId() %>">
                                            <% if (cliente != null) {%>
                                            <input type="hidden" name="user" value="<%= cliente.getUsuario()%>">                                         
                                            <% } %>
                                            <input type="hidden" name="idlocal" value="<%= l.getId()%>">
                                            <p class="center" style="margin-top: 5%"><a href="#!" onclick="document.getElementById('cad<%= l.getId() %>').submit()">Ir al local</a></p>
                                    </form>   
                                </div>
                                <div class="card-reveal">
                                    <span class="card-title grey-text text-darken-4" style="font-weight: 500;"><span>Descripción</span><i class="material-icons right bottom" style="margin-top: 6px">close</i></span>
                                    <p style="text-align: justify"><%= l.getDescripcion()%></p>
                                </div>
                            </div>
                        </div>
                        <% } %>
                        <% } %>
                    </div>
                </div>
            </div>

            <div class="divider"></div>

            <!--# NOTE: Tecnología, genero.-->
            <div id="tecnologia" class="scrollspy">
                <div class="parallax-container">
                    <div class="parallax"><img src="images/parallax-tecnologia.jpg"></div>
                    <div class="row">
                        <div class="col s7 center">
                            <div class="carousel carousel-logos">
                                <% for (Local l : locales) { %>
                                    <% if (l.getIdCategoria() == 2) { %>  
                                        <form action="ControladorProducto" method="post" id="int<%= l.getId() %>">
                                            <% if (cliente != null) {%>
                                            <input type="hidden" name="user" value="<%= cliente.getUsuario()%>">                                         
                                            <% } %>
                                            <input type="hidden" name="idlocal" value="<%= l.getId()%>">
                                            <a class="carousel-item" onclick="document.getElementById('int<%= l.getId() %>').submit()"><img style="height: 250px; width: 250px" src="<%= l.getNombreImagenPrimaria() %>"></a>
                                        </form>
                                    <% } %>
                                <% }%>
                            </div>
                        </div>
                        <div style="height: 400px;" class="col s5 center valign-wrapper">
                            <div id="card-tecnologia" class="card-panel z-depth-5 blue-grey darken-4">
                                <h3>TECNOLOGÍA</h3>
                                <h5>Te mostramos los principales locales de tecnología</h5>
                            </div>
                        </div>
                    </div>
                </div>
                <!--# NOTE: Tecnologia, comienza parte mostrar locales.-->
                <div class="container" style="height:320px ; width: 80%; padding: 0px; overflow: auto" id="style-2">
                    <div class="row" style="margin-left: auto; margin-right: auto; padding: 0px; margin-bottom: 0; margin-top: 0">
                        <% for (Local l : locales) { %>
                        <% if (l.getIdCategoria() == 2) {%>
                        <div class="col s3" style="margin: 0px">
                            <div class="card small" style="margin-bottom: 0;">
                                <div class="card-image waves-effect waves-block waves-light">
                                    <img class="activator" src="images/Locales/<%= l.getNombreImagenPrimaria()%>">
                                </div>
                                <div class="card-content">
                                    <span class="card-title activator grey-text text-darken-4" style="font-weight: 300"><%= l.getNombre()%><i class="material-icons right">more_vert</i></span>
                                    <form action="ControladorProducto" method="post" id="cad<%= l.getId() %>">
                                            <% if (cliente != null) {%>
                                            <input type="hidden" name="user" value="<%= cliente.getUsuario()%>">                                         
                                            <% } %>
                                            <input type="hidden" name="idlocal" value="<%= l.getId()%>">
                                            <p class="center" style="margin-top: 5%"><a href="#!" onclick="document.getElementById('cad<%= l.getId() %>').submit()">Ir al local</a></p>
                                    </form>   
                                </div>
                                <div class="card-reveal">
                                    <span class="card-title grey-text text-darken-4" style="font-weight: 500;"><span>Descripción</span><i class="material-icons right bottom" style="margin-top: 6px">close</i></span>
                                    <p style="text-align: justify"><%= l.getDescripcion()%></p>
                                </div>
                            </div>
                        </div>
                        <% } %>
                        <% } %>
                    </div>
                </div>
            </div>

            <div class="divider"></div>

            <!--# NOTE: Hogar, genero.-->

            <div id="hogar" class="scrollspy">
                <div class="parallax-container">
                    <div class="parallax"><img src="images/parallax-hogar.jpg"></div>
                    <div class="row">
                        <div style="height: 400px;" class="col s5 center valign-wrapper">
                            <div id="card-hogar" class="card-panel z-depth-5 white">
                                <h3>HOGAR</h3>
                                <h5>Te mostramos los principales locales para el hogar</h5>
                            </div>
                        </div>
                        <div class="col s7 center">
                            <div class="carousel carousel-logos">
                                <% for (Local l : locales) { %>
                                    <% if (l.getIdCategoria() == 3) { %>  
                                        <form action="ControladorProducto" method="post" id="int<%= l.getId() %>">
                                            <% if (cliente != null) {%>
                                            <input type="hidden" name="user" value="<%= cliente.getUsuario()%>">                                         
                                            <% } %>
                                            <input type="hidden" name="idlocal" value="<%= l.getId()%>">
                                            <a class="carousel-item" onclick="document.getElementById('int<%= l.getId() %>').submit()"><img style="height: 250px; width: 250px" src="<%= l.getNombreImagenPrimaria() %>"></a>
                                        </form>
                                    <% } %>
                                <% }%>
                            </div>
                        </div>
                    </div>
                </div>
                <!--# NOTE: Hogar, comienza parte mostrar locales.-->
                <div class="container" style="height:320px ; width: 80%; padding: 0px; overflow: auto" id="style-2">
                    <div class="row" style="margin-left: auto; margin-right: auto; padding: 0px; margin-bottom: 0; margin-top: 0">
                        <% for (Local l : locales) { %>
                        <% if (l.getIdCategoria() == 3) {%>
                        <div class="col s3" style="margin: 0px">
                            <div class="card small" style="margin-bottom: 0;">
                                <div class="card-image waves-effect waves-block waves-light">
                                    <img class="activator" src="images/Locales/<%= l.getNombreImagenPrimaria()%>">
                                </div>
                                <div class="card-content">
                                    <span class="card-title activator grey-text text-darken-4" style="font-weight: 300"><%= l.getNombre()%><i class="material-icons right">more_vert</i></span>
                                    <form action="ControladorProducto" method="post" id="cad<%= l.getId() %>">
                                            <% if (cliente != null) {%>
                                            <input type="hidden" name="user" value="<%= cliente.getUsuario()%>">                                         
                                            <% } %>
                                            <input type="hidden" name="idlocal" value="<%= l.getId()%>">
                                            <p class="center" style="margin-top: 5%"><a href="#!" onclick="document.getElementById('cad<%= l.getId() %>').submit()">Ir al local</a></p>
                                    </form>   
                                </div>
                                <div class="card-reveal">
                                    <span class="card-title grey-text text-darken-4" style="font-weight: 500;"><span>Descripción</span><i class="material-icons right bottom" style="margin-top: 6px">close</i></span>
                                    <p style="text-align: justify"><%= l.getDescripcion()%></p>
                                </div>
                            </div>
                        </div>
                        <% } %>
                        <% } %>
                    </div>
                </div>
            </div>

            <div class="divider"></div>

            <!--# NOTE: Belleza, genero.-->

            <div id="belleza" class="scrollspy">
                <div class="parallax-container">
                    <div class="parallax"><img src="images/parallax-belleza.jpg"></div>
                    <div class="row">
                        <div class="col s7 center">
                            <div class="carousel carousel-logos">
                                <% for (Local l : locales) { %>
                                    <% if (l.getIdCategoria() == 4) { %>  
                                        <form action="ControladorProducto" method="post" id="int<%= l.getId() %>">
                                            <% if (cliente != null) {%>
                                            <input type="hidden" name="user" value="<%= cliente.getUsuario()%>">                                         
                                            <% } %>
                                            <input type="hidden" name="idlocal" value="<%= l.getId()%>">
                                            <a class="carousel-item" onclick="document.getElementById('int<%= l.getId() %>').submit()"><img style="height: 250px; width: 250px" src="<%= l.getNombreImagenPrimaria() %>"></a>
                                        </form>
                                    <% } %>
                                <% }%>
                            </div>
                        </div>
                        <div style="height: 400px;" class="col s5 center valign-wrapper">
                            <div id="card-belleza" class="card-panel z-depth-5 blue-grey darken-4">
                                <h3>BELLEZA</h3>
                                <h5>Te mostramos los principales locales de belleza</h5>
                            </div>
                        </div>
                    </div>
                </div>
                <!--# NOTE: Belleza, comienza parte mostrar locales.-->
                <div class="container" style="height:320px ; width: 80%; padding: 0px; overflow: auto" id="style-2">
                    <div class="row" style="margin-left: auto; margin-right: auto; padding: 0px; margin-bottom: 0; margin-top: 0">
                        <% for (Local l : locales) { %>
                        <% if (l.getIdCategoria() == 4) {%>
                        <div class="col s3" style="margin: 0px">
                            <div class="card small" style="margin-bottom: 0;">
                                <div class="card-image waves-effect waves-block waves-light">
                                    <img class="activator" src="images/Locales/<%= l.getNombreImagenPrimaria()%>">
                                </div>
                                <div class="card-content">
                                    <span class="card-title activator grey-text text-darken-4" style="font-weight: 300"><%= l.getNombre()%><i class="material-icons right">more_vert</i></span>
                                    <form action="ControladorProducto" method="post" id="cad<%= l.getId() %>">
                                            <% if (cliente != null) {%>
                                            <input type="hidden" name="user" value="<%= cliente.getUsuario()%>">                                         
                                            <% } %>
                                            <input type="hidden" name="idlocal" value="<%= l.getId()%>">
                                            <p class="center" style="margin-top: 5%"><a href="#!" onclick="document.getElementById('cad<%= l.getId() %>').submit()">Ir al local</a></p>
                                    </form>   
                                </div>
                                <div class="card-reveal">
                                    <span class="card-title grey-text text-darken-4" style="font-weight: 500;"><span>Descripción</span><i class="material-icons right bottom" style="margin-top: 6px">close</i></span>
                                    <p style="text-align: justify"><%= l.getDescripcion()%></p>
                                </div>
                            </div>
                        </div>
                        <% } %>
                        <% } %>
                    </div>
                </div>
            </div>

            <div class="divider"></div>

            <!--# NOTE: Infantil, genero.-->

            <div id="infantil" class="scrollspy">
                <div class="parallax-container">
                    <div class="parallax"><img src="images/parallax-infantil.jpg"></div>
                    <div class="row">
                        <div style="height: 400px;" class="col s5 center valign-wrapper">
                            <div id="card-infantil" class="card-panel z-depth-5 white">
                                <h3>INFANTIL</h3>
                                <h5>Te mostramos los principales locales infantiles</h5>
                            </div>
                        </div>
                        <div class="col s7 center">
                            <div class="carousel carousel-logos">
                                <% for (Local l : locales) { %>
                                    <% if (l.getIdCategoria() == 5) { %>  
                                        <form action="ControladorProducto" method="post" id="int<%= l.getId() %>">
                                            <% if (cliente != null) {%>
                                            <input type="hidden" name="user" value="<%= cliente.getUsuario()%>">                                         
                                            <% } %>
                                            <input type="hidden" name="idlocal" value="<%= l.getId()%>">
                                            <a class="carousel-item" onclick="document.getElementById('int<%= l.getId() %>').submit()"><img style="height: 250px; width: 250px" src="<%= l.getNombreImagenPrimaria() %>"></a>
                                        </form>
                                    <% } %>
                                <% }%>
                            </div>
                        </div>
                    </div>
                </div>
                <!--# NOTE: Infantil, comienza parte mostrar locales.-->
                <div class="container" style="height:320px ; width: 80%; padding: 0px; overflow: auto" id="style-2">
                    <div class="row" style="margin-left: auto; margin-right: auto; padding: 0px; margin-bottom: 0; margin-top: 0">
                        <% for (Local l : locales) { %>
                        <% if (l.getIdCategoria() == 5) {%>
                        <div class="col s3" style="margin: 0px">
                            <div class="card small" style="margin-bottom: 0;">
                                <div class="card-image waves-effect waves-block waves-light">
                                    <img class="activator" src="images/Locales/<%= l.getNombreImagenPrimaria()%>">
                                </div>
                                <div class="card-content">
                                    <span class="card-title activator grey-text text-darken-4" style="font-weight: 300"><%= l.getNombre()%><i class="material-icons right">more_vert</i></span>
                                    <form action="ControladorProducto" method="post" id="cad<%= l.getId() %>">
                                            <% if (cliente != null) {%>
                                            <input type="hidden" name="user" value="<%= cliente.getUsuario()%>">                                         
                                            <% } %>
                                            <input type="hidden" name="idlocal" value="<%= l.getId()%>">
                                            <p class="center" style="margin-top: 5%"><a href="#!" onclick="document.getElementById('cad<%= l.getId() %>').submit()">Ir al local</a></p>
                                    </form>   
                                </div>
                                <div class="card-reveal">
                                    <span class="card-title grey-text text-darken-4" style="font-weight: 500;"><span>Descripción</span><i class="material-icons right bottom" style="margin-top: 6px">close</i></span>
                                    <p style="text-align: justify"><%= l.getDescripcion()%></p>
                                </div>
                            </div>
                        </div>
                        <% } %>
                        <% } %>
                    </div>
                </div>
            </div>

            <!--# NOTE: Comienza parte pie de página.-->

            <footer class="page-footer lime darken-2">
                <div class="container">
                    <div class="row">
                        <div class="col l6 s12">
                            <h5 class="black-text">ACERCA DE NOSOTROS</h5>
                            <p class="black-text text-lighten-4">You can use rows and columns here to organize your footer content.</p>
                        </div>
                        <div class="col l4 offset-l2 s12">
                            <h5 class="black-text">CONECTAR</h5>
                            <ul>
                                <li><a class="black-text text-lighten-3" href="#!">Link 1</a></li>
                                <li><a class="black-text text-lighten-3" href="#!">Link 2</a></li>
                                <li><a class="black-text text-lighten-3" href="#!">Link 3</a></li>
                                <li><a class="black-text text-lighten-3" href="#!">Link 4</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="footer-copyright">
                    <div class="container black-text">
                        © 2017 MallBIT, Todos los derechos reservados
                        <a class="black-text text-lighten-4 right" href="#!">More Links</a>
                    </div>
                </div>
            </footer>
        </div>

        <!--Import jQuery before materialize.js-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script src="js/script.js"></script>

    </body>

</html>

