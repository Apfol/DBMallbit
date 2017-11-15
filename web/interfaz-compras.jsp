<%@page import="com.mallbit.compra.Compra"%>
<%@page import="com.mallbit.compra.ModeloCompra"%>
<%@page import="com.mallbit.cliente.ControladorCliente"%>
<%@page import="com.mallbit.cliente.Cliente"%>
<%@page import="com.mallbit.cliente.ModeloCliente"%>
<%@page import="com.mallbit.local.ModeloLocal"%>
<%@page import="com.mallbit.producto.ModeloProducto"%>
<%@page import="com.mallbit.producto.Producto"%>
<%@page import="com.mallbit.vendedor.ControladorVendedor"%>
<%@page import="com.mallbit.vendedor.Vendedor"%>
<%@page import="com.mallbit.vendedor.Vendedor"%>
<%@page import="com.mallbit.vendedor.ModeloVendedor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //En esta parte de código lo que se hace es obtener el cliente que tiene el mismo id que se guardo en la cookie.
    Cliente cliente = new ControladorCliente().obtenerClienteCookie(new ModeloCliente().obtenerClientesDB(), request);
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
        <title>Compras cliente <%= cliente.getNombre()%></title>
        <title>Mis compras </title>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body id="cuerpo">
        <nav>
            <div class="nav-wrapper lime darken-1">
                <div class="col s12">
                    <div id="principal-nav">
                        <a href="index.jsp" class="brand-logo"><i class="material-icons">shopping_basket</i>MallBIT</a>
                        <ul id="nav-mobile" class="right hide-on-med-and-down">
                            <li><a href="index.jsp"><i class="material-icons left">home</i>Página principal</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <% ModeloCompra m = new ModeloCompra(); %>
        <% List<String[]> productos = m.productosDeCompras(cliente.getId()); %>
        <% if (productos.isEmpty()) { %>
        <div id="contenedorAviso" class="valign-wrapper">
            <div class="row">
                <div class="col s6 offset-s3 m6 offset-m3">
                    <h4 class="center-align">No has realizado ninguna compra.</h4>
                </div>  
            </div> 
        </div>
        <% } else { %>
        <div class="row">
            <% for (String[] producto : productos) {%>
            <div class="col s12 m3">
                <div  class="card sticky-action">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" src="images/Productos/<%=producto[6]%>" style="height: 250px; width: 338px;">
                    </div>
                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4"><%=producto[0]%><b class="right"><%= "$" + producto[5]%></b></span>
                    </div>
                    <div class="card-reveal">
                        <span class="card-title grey-text text-darken-4"><b><%=producto[0]%></b><i class="material-icons right">close</i></span>
                        <p style="font-size: 18px; text-align: justify"><%=producto[1]%></p>
                        <p style="font-size: 14px; font-weight: 300;"><%= "<b>    Marca: </b>" + producto[2]%></p>
                        <p style="font-size: 14px; font-weight: 300;"><%= "<b>    Stock: </b>" + producto[3]%></p>
                        <p style="font-size: 14px; font-weight: 300;"><%= "<b>    Puntos: </b>" + producto[4]%></p>
                    </div>
                    <div class="card-action">
                        <a class="green-text modal-trigger lighten-1" href="#detallesCompra<%= producto[7]%>">Detalles compra</a>
                    </div>
                </div>
            </div>
            <% String[] datos = m.detallesCompras(producto[7]); %>
            <div id="detallesCompra<%=producto[7]%>" class="modal modal-fixed-footer" style="overflow: hidden; height: 60%; width: 20%; padding: 20px" >
                <p style="font-size: 30px; font-weight: bold; text-align: center; border-bottom: 0.5px solid #bbbdc1; padding: 0 5px 5px 5px">Detalles de la compra</p>
                <p style="font-size: 20px; font-weight: 300"><b>IDCompra: </b><br><%= datos[0]%></p>
                <p style="font-size: 20px; font-weight: 300"><b>Fecha: </b><br><%= datos[1]%></p>
                <p style="font-size: 20px; font-weight: 300"><b>Nombre del Producto: </b><%= datos[2]%></p>
                <p style="font-size: 20px; font-weight: 300"><b>Nombre del Vendedor: </b><%= datos[3]%></p>   
            </div>
            <% } %>
        </div>
        <% } %>
        
        <!--Import jQuery before materialize.js-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script src="js/script.js"></script>
        <script src="js/script-inicio.js"></script>
    </body>

</html>
