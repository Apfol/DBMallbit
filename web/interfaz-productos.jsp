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
    //En esta parte de código lo que se hace es obtener el administrador que tiene el mismo id que se guardo en la cookie.
    ModeloVendedor modeloVendedor = new ModeloVendedor();
    List<Vendedor> vendedores = modeloVendedor.obtenerVendedoresDB();
    Vendedor vendedor = new ControladorVendedor().obtenerVendedorCookie(vendedores, request);
    
    String iDLocal = Integer.toString(new ModeloLocal().obtenerLocalV(Integer.toString(vendedor.getId())).getId());
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
        <title>Vendedor <%= vendedor.getNombre()%></title>
        <%}%>
        <title>Productos </title>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body id="cuerpov">
        <nav>
            <div class="nav-wrapper light-blue darken-3">
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
            <a id="elementosAdmin" class="btn-floating btn-large light-blue darken-3">
                <i class="large material-icons">add</i>
            </a>
            <ul>
                <li><a href="#actualizarDatosPersonales" class="btn-floating pulse modal-trigger tooltipped teal lighten-2" data-position="left" data-delay="50" data-tooltip="Ver estadísticas"><i class="material-icons">insert_chart</i></a></li>
                <li><a href="registro-producto.jsp" class="btn-floating pulse tooltipped yellow darken-1" data-position="left" data-delay="50" data-tooltip="Agregar producto"><i class="material-icons">local_mall</i></a></li>
            </ul>
        </div>

        <% List<Producto> productos = new ModeloProducto().getProductos(iDLocal); %>
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
            <div class="col s12 m3">
                <div  class="card sticky-action">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" src="images/Productos/<%=producto.getNombreImagen()%>" style="height: 250px; width: 338px;">
                    </div>
                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4"><%= producto.getNombre() %><b class="right"><%= "$"+producto.getPrecio() %></b></span>
                    </div>
                    <div class="card-reveal">
                        <span class="card-title grey-text text-darken-4"><b><%= producto.getNombre()%></b><i class="material-icons right">close</i></span>
                        <p style="font-size: 18px; text-align: justify"><%= producto.getDescripcion()%></p>
                        <p style="font-size: 14px; font-weight: 300;"><%= "<b>    Marca: </b>" + producto.getMarca() %></p>
                        <p style="font-size: 14px; font-weight: 300;"><%= "<b>    Stock: </b>" + producto.getStock() %></p>
                        <p style="font-size: 14px; font-weight: 300;"><%= "<b>    Puntos: </b>" + producto.getPuntos() %></p>
                    </div>
                    <div class="card-action">
                        <a class="green-text lighten-1" href="#">Editar</a>
                        <a class="red-text right" href="#">Eliminar</a>
                    </div>
                </div>
            </div>
            <% } %>

        </div>
        <% } %>

        <div id="actualizarDatosPersonales" class="modal modal-fixed-footer">
            <form action="ControladorAdministrador" method="post">
                <div class="modal-content">
                    <h4>Actualización de datos administrador</h4>

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
                            <label for="apellido">Apellido</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s4 input-field">
                            <i class="material-icons prefix">email</i>
                            <input id="correo" name="correo" type="email" class="validate">
                            <label for="correo" data-error="No válido">Correo</label>
                        </div>
                        <div class="col s4 input-field">
                            <i class="material-icons prefix">phone</i>
                            <input id="telefono" name="telefono" type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" maxlength="10" class="validate">
                            <label for="telefono">Teléfono</label>
                        </div>
                        <div class="col s4 input-field">
                            <i class="material-icons prefix">lock_outline</i>
                            <input id="contraseña" name="password" type="password" class="validate">
                            <label for="contraseña">Contraseña</label>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button class="modal-action modal-close waves-effect waves-light btn light-green darken-1 black-text" type="submit">Actualizar datos</button>
                </div>
            </form>
        </div>

        <div class="tap-target light-blue darken-3" data-activates="elementosAdmin">
            <div class="tap-target-content">
                <% if (vendedor.getIdGenero() == 1) {%>
                <h5>¡Bienvenido <%= vendedor.getNombre()%>!</h5>
                <%} else {%>
                <h5>¡Bienvenida <%= vendedor.getNombre()%>!</h5>
                <% }%>
                <p>Si deseas agregar un nuevo producto a la plataforma, o ver las estadísticas de tu local, has click en este botón.</p>
            </div>
        </div>
        <!--Import jQuery before materialize.js-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script src="js/script.js"></script>
        <script src="js/script-inicio.js"></script>
    </body>

</html>
