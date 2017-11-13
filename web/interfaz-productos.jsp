<%@page import="com.mallbit.producto.ProductoEnviar"%>
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
    List<String> estadisticas = new ModeloProducto().obtenerEstadisticas(iDLocal);
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
                <li><a href="#productosEnviar" class="btn-floating pulse modal-trigger tooltipped red darken-1" data-position="left" data-delay="50" data-tooltip="Productos a enviar"><i class="material-icons">local_shipping</i></a></li>
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
                        <a class="green-text modal-trigger lighten-1" href="#editarProducto<%= producto.getId()%>">Editar</a>
                        <a class="red-text modal-trigger right" href="#eliminarProducto<%= producto.getId()%>">Eliminar</a>
                    </div>
                </div>
            </div>
            <div id="eliminarProducto<%= producto.getId()%>" class="modal">
                <div class="modal-content">
                    <h4>Eliminar producto</h4>
                    <p>¿Estás seguro de eliminar el producto "<%= producto.getNombre()%>"?</p>
                </div>
                <div class="modal-footer">
                    <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cancelar</a>
                    <a href="ControladorProducto?instruccion=borrarProducto&idProducto=<%= producto.getId()%>&local=<%= producto.getIdLocal()%>" class="modal-action modal-close waves-effect waves-green btn-flat red-text">Eliminar</a>
                </div>
            </div>
            <div id="editarProducto<%= producto.getId()%>" class="modal modal-fixed-footer" style="overflow: hidden">
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

        <div id="actualizarDatosPersonales" class="modal modal-fixed-footer">
            <div class="modal-content col s12">
                <h4 class="center" style="font-weight: 700">Revisión de Estadísticas de Ventas</h4>
                <div class="row indigo lighten-1" style="padding-bottom: 10px;">
                    <div class="col s1 input-field">
                        <i class="material-icons prefix" style="padding: 0; margin: 0;">local_mall</i>
                    </div>
                    <div class="col s2 input-field" style="border-right-style: solid; border-right-width: 1px">
                        <p style="padding: 0; margin: 0; text-align: center">Nombre</p><br>
                    </div>
                    <div class="col s1 input-field">
                        <i class="material-icons prefix" style="padding: 0; margin: 0;">attach_money</i>
                    </div>
                    <div class="col s2 input-field" style="border-right-style: solid; border-right-width: 1px">
                        <p style="padding: 0; margin: 0; text-align: center">Cantidad de Ventas</p>
                    </div>
                    <div class="col s1 input-field">
                        <i class="material-icons prefix" style="padding: 0; margin: 0;">local_shipping</i>
                    </div>
                    <div class="col s2 input-field" style="border-right-style: solid; border-right-width: 1px">
                        <p style="padding: 0; margin: 0; text-align: center">Cantidad de Despachos</p>
                    </div>
                    <div class="col s1 input-field">
                        <i class="material-icons prefix" style="padding: 0; margin: 0;">check_circle</i>
                    </div>   
                    <div class="col s2 input-field">
                        <p style="padding: 0; margin: 0; text-align: center">Cantidad de Entregas</p>
                    </div>
                </div>
                <%
                    int totalVentas = 0;
                    int totalDespachos = 0;
                    int totalEntregas = 0;
                    for (String concat : estadisticas) {
                        String[] stats = concat.split("--");
                %>
                <div class="row indigo lighten-5">
                    <div class="col s3">
                        <p style="text-align: center; font-weight: 300;"><%= stats[0]%></p>
                    </div>
                    <div class="col s3">
                        <p style="text-align: center; font-weight: 300;"><%= stats[1]%></p>
                    </div>
                    <div class="col s3">
                        <p style="text-align: center; font-weight: 300;"><%= stats[2]%></p>
                    </div>
                    <div class="col s3">
                        <p style="text-align: center; font-weight: 300;"><%= stats[3]%></p>
                    </div>
                </div>
                <%
                        totalVentas = totalVentas + Integer.parseInt(stats[1]);
                        totalDespachos = totalDespachos + Integer.parseInt(stats[2]);
                        totalEntregas = totalEntregas + Integer.parseInt(stats[3]);
                    }
                %>   
            </div>
            <div class="modal-footer" style="overflow: hidden">
                <div class="row">
                    <div class="col s4">
                        <p style="text-align: center; font-weight: 300;"><b>VENTAS: </b><%= totalVentas%></p>
                    </div>
                    <div class="col s4">
                        <p style="text-align: center; font-weight: 300;"><b>DESPACHOS: </b><%= totalDespachos%></p>
                    </div>
                    <div class="col s4">
                        <p style="text-align: center; font-weight: 300;"><b>ENTREGAS: </b><%= totalEntregas%></p>
                    </div>
                </div>
            </div>
        </div>
        <% List<ProductoEnviar> productosEnviar = new ModeloProducto().obtenerProductosEnviarDB(vendedor.getId()); %>
        <div id="productosEnviar" class="modal modal-fixed-footer">
            <% if (productosEnviar.size() != 0) { %>
            <form action="ControladorEnvio" method="post">
                <input type="hidden" name="instruccion" value="actualizarEstado"/>
                <div class="modal-content">
                    <h4 class="center-align">Productos a enviar</h4>
                    <table>
                        <thead>
                            <tr>
                                <th>Cliente</th>
                                <th>Producto</th>
                                <th>Fecha compra</th>
                                <th>Dirección envío</th>
                                <th>Enviar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (ProductoEnviar producto : productosEnviar) {%>
                            <tr>
                                <td><%= producto.getNombreCliente()%></td>
                                <td><%= producto.getNombreProducto()%></td>
                                <td><%= producto.getFecha()%></td>
                                <td><%= producto.getDireccion()%></td>
                                <td>
                                    <input type="checkbox" id="test<%= producto.getIdEnvio()%>" name="idEnvio" value="<%= producto.getIdEnvio()%>" />
                                    <label for="test<%= producto.getIdEnvio()%>"></label>
                                </td>
                            </tr>
                            <% } %>

                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button class="modal-action modal-close waves-effect waves-light btn light-blue darken-3 white-text" type="submit">Enviar productos</button>
                </div>
            </form>
            <% } else { %>
            <div class="modal-content">
                <h4>Sin productos para enviar.</h4>
            </div>
            <div class="modal-footer">
                <a class="modal-action modal-close waves-effect waves-light btn light-blue darken-3 white-text" href="#!">OK</a>
            </div>
            <% } %>
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