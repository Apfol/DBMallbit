<%@page import="com.mallbit.vendedor.Vendedor"%>
<%@page import="com.mallbit.local.Local"%>
<%@page import="com.mallbit.cliente.Cliente"%>
<%@page import="com.mallbit.producto.Producto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link href="css/style.css" rel="stylesheet" />
        <link type="text/css" rel="stylesheet" href="css/materialize.css" />


        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Usuario</title>
    </head>
    <body id="cuerpopr">
        <% Cliente cliente = (Cliente) session.getAttribute("CLIENTE_SESSION"); %>
        <% List<Producto> productos = (List<Producto>)(request.getAttribute("LISTAPRODUCTOS")); %>
        <% Local local = (Local) request.getAttribute("LOCAL"); %>
        <% Vendedor vendedor = (Vendedor) request.getAttribute("VENDEDOR"); %>
        <nav class="pushpin-nav z-depth-5" id="navl">
            <div class="nav-wrapper lime lighten-2">
                <div class="col s12">
                    <div id="principal-nav">
                        <a href="index.jsp" class="brand-logo"><i class="material-icons">shopping_basket</i>MallBIT</a>
                        <ul id="nav-mobile" class="right hide-on-med-and-down">
                            <li><a id="search-nav-button" href="#search-nav"><i class="material-icons left">search</i>Buscar</a></li>                        
                                <% if (cliente == null) { %>
                            <li><a href="iniciar-sesion-cliente.jsp?i=1&o=<%= local.getId() %>"><i class="material-icons left">people</i>Acceder</a></li>
                                <% } else {%>
                            <li>
                                <form method="post" action="ControladorCliente" id="iu">
                                    <input type="hidden" name="instruccion" value="sesion">
                                    <input type="hidden" name="user" value="<%= cliente.getUsuario()%>">
                                    <a onclick="document.getElementById('iu').submit()"><i class="material-icons left">people</i><%= cliente.getNombre()%></a>
                                </form>
                                <% } %>
                            </li>
                            <%if (cliente != null) { %>
                            <li><a href="sass.html"><i class="material-icons left">shopping_cart</i>Mis Compras</a></li>
                            <li><a href="index.jsp"><i class="material-icons left">home</i>Página principal</a></li>
                            <% } %>
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
        <div class="row">
            <div class="col s3" id="latbar">
                <div class="row">
                    <div class="col s12 m7">
                        <div class="card z-depth-5" id="cardlocal">
                            <div class="card-image">
                                <img src="images/Locales/<%= local.getNombreImagen() %>" id="imagencard">
                            </div>
                            <div class="card-content" id="titulolocal">
                                <p><%= local.getNombre() %></p>
                            </div>
                            <div class="col s12 m7">
                                <div class="card horizontal" id="cardft">
                                    <div class="card-image">
                                        <img src="https://lorempixel.com/100/190/nature/6" id="imagenft">
                                    </div>
                                    <div class="card-stacked">
                                        <div class="card-content" id="contentft">
                                            <p id="titlePft">Más Vendido</p>
                                            <p>Nombre Producto</p>
                                        </div>
                                        <div class="waves-effect card-action center" id="cardLinkft">
                                            <a href="#" id="textLink">Más Información</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col s12 m7">
                                <div class="card horizontal" id="cardnv">
                                    <div class="card-image">
                                        <img src="css/fondo-entretenimiento.jpg" id="imagenft">
                                    </div>
                                    <div class="card-stacked">
                                        <div class="card-content" id="contentft">
                                            <p id="titlePft">Lo Último</p>
                                            <p>Nombre Producto</p>
                                        </div>
                                        <div class="waves-effect card-action center" id="cardLinkft">
                                            <a href="#" id="textLink">Más Información</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-panel" id="cardct">
                                <div class="row">
                                    <div class="col s3">
                                        <i class="material-icons left" id="iconoct">call</i>
                                    </div>
                                    <div class="col s9">
                                <span id="textoct"><b>Contacto</b><br>
                                Teléfono: <%= vendedor.getTelefono() %><br>
                                Correo: <%= vendedor.getCorreo() %></span>
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col s8" id="listaproductos">
                <ul class="collapsible" data-collapsible="accordion">
                    <% for(Producto p: productos) {%>
                    <% String disponible = "";
                       if(p.getStock() == 0){
                           disponible = "No";
                       }else{
                           disponible = "Sí";
                       }
                    %>
                    <li id="producto">
                        <div class="collapsible-header" id="headPr">
                            <a class="btn-floating btn-large waves-effect waves-light" id="comprar"><i class="material-icons" id="comprartext">shopping_cart</i></a>
                            <div class="row">
                                <div class="col s3" id="divimg">
                                    <img class="materialboxed" src="<%= p.getNombreImagen() %>" id="imgPr">
                                </div>
                                <div class="col s8 center-align" id="divtext">
                                    <h1 id="titleProduct"><%= p.getNombre() %></h1>
                                    <h1 id="titlePrecio">$<%= p.getPrecio() %></h1>
                                    <div id="puntosPr">
                                        <div class="row" id="pointsPr">
                                            <div class="col s6" id="pointstitlePr">
                                                <p id="p1Pr">MallBITs</p>
                                            </div>
                                            <div class="col s6" id="pointscountPr">
                                                <p id="p2Pr" class="center-align"><%= p.getPuntos() %></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="collapsible-body" id="descripcion">
                            <span id="subtext">
                                <b id="desctitle">Nombre del Producto:</b> <%= p.getNombre() %> <br>
                                <b id="desctitle">Marca:</b> <%= p.getMarca() %> <br>
                                <b id="desctitle">Disponible:</b> <%= disponible %><br>
                                <b id="desctitle">Descripción:</b> <%= p.getDescripcion() %> <br>
                            </span>
                        </div>
                    </li>
                    <% }%>
                </ul>
            </div>
        </div>

        <!--Import jQuery before materialize.js-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
            $('.collapsible').collapsible();
            });
        </script>
        <script src="js/script.js"></script>
    </body>
</html>
