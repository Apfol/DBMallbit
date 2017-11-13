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
                        <a href="#" class="brand-logo"><i class="material-icons">shopping_basket</i>MallBIT</a>
                        <ul id="nav-mobile" class="right hide-on-med-and-down">
                            <li><a href="index.jsp"><i class="material-icons left">home</i>Página principal</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <% List<Producto> productos = new ModeloCompra().productosDeCompras(cliente.getId()); %>
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
            <% for (Producto producto : productos) {%>
            <div class="col s12 m3">
                <div  class="card sticky-action">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" src="images/Productos/<%=producto.getNombreImagen()%>" style="height: 250px; width: 338px;">
                    </div>
                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4"><%= producto.getNombre()%><b class="right"><%= "$" + producto.getPrecio()%></b></span>
                    </div>
                    <div class="card-reveal">
                        <span class="card-title grey-text text-darken-4"><b><%= producto.getNombre()%></b><i class="material-icons right">close</i></span>
                        <p style="font-size: 18px; text-align: justify"><%= producto.getDescripcion()%></p>
                        <p style="font-size: 14px; font-weight: 300;"><%= "<b>    Marca: </b>" + producto.getMarca()%></p>
                        <p style="font-size: 14px; font-weight: 300;"><%= "<b>    Stock: </b>" + producto.getStock()%></p>
                        <p style="font-size: 14px; font-weight: 300;"><%= "<b>    Puntos: </b>" + producto.getPuntos()%></p>
                    </div>
                    <div class="card-action">
                        <a class="green-text modal-trigger lighten-1" href="#datallesCompra<%= producto.getId()%>">Detalles compra</a>
                    </div>
                </div>
            </div>
            <div id="datallesCompra<%= producto.getId()%>" class="modal modal-fixed-footer" style="overflow: hidden">
                <form action="ControladorProducto" method="post" enctype="multipart/form-data" class="col s12">
                    <input type="hidden" name="instruccion" value="actualizarProducto"/>
                    <input type="hidden" name="iDProducto" value="<%= producto.getId()%>"/>
                    <input type="hidden" name="iDLocal" value="<%= producto.getIdLocal()%>"/>
                    <div class="modal-content center-align" style="overflow: hidden">
                        <h3 class="light-blue-text text-darken-3">Editar producto</h3>
                        <p class="center" style="font-weight: 500; font-size: 15px;">A continuación ingresa los datos que desees actualizar</p>
                        <div class="row" style="margin-right: 20px">
                            <div class="col s6 input-field">
                                <i class="material-icons prefix">account_circle</i>
                                <input id="nombre" name="nombre" type="text" class="validate" placeholder="<%= producto.getNombre()%>">
                                <label for="nombre">Nombre del producto</label>
                            </div>
                            <div class="col s6 input-field">
                                <i class="material-icons prefix">attach_money</i>
                                <input id="puntos" name="precio" type="number" class="validate" value="<%= producto.getPrecio()%>">
                                <label for="precio">Precio</label>
                            </div>
                        </div> 
                        <div class="row" style="margin-right: 20px">
                            <div class="col s6 input-field">
                                <i class="material-icons prefix">grade</i>
                                <input id="nombre" name="marca" type="text" class="validate" placeholder="<%= producto.getMarca()%>">
                                <label for="marca">Marca</label>
                            </div>
                            <div class="col s6 input-field">
                                <i class="material-icons prefix">widgets</i>
                                <input id="puntos" name="stock" type="number" class="validate" value="<%= producto.getStock()%>">
                                <label for="stock">Stock</label>
                            </div>
                        </div>
                        <div class="row" style="margin-right: 20px">
                            <div class="input-field col s12">
                                <i class="material-icons prefix">mode_edit</i>
                                <textarea id="textarea1" name="descripcion" class="materialize-textarea" placeholder="<%= producto.getDescripcion()%>"></textarea>
                                <label for="textarea1">Descripción del producto</label>
                            </div>
                        </div>
                        <div class="row" style="margin-right: 20px">
                            <div class="col s12 file-field input-field">
                                <div class="btn grey darken-4">
                                    <i class="material-icons">file_upload</i>
                                    <input type="file" name="imagenPrincipal">
                                </div>
                                <div class="file-path-wrapper">
                                    <input class="file-path validate" type="text" placeholder="<%= producto.getNombreImagen()%>">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="row">
                            <div class="col s6">
                                <button class="btn waves-effect waves-light light-blue darken-3 white-text" type="submit" name="action">
                                    Actualizar
                                </button>
                            </div>
                            <div class="col s1">
                                <a href="#!" class="modal-action modal-close waves-effect waves-blue btn-flat">Cancelar</a>
                            </div>
                        </div>
                    </div>
                </form>
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
