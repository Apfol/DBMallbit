<%@page import="com.mallbit.vendedor.ControladorVendedor"%>
<%@page import="com.mallbit.vendedor.Vendedor"%>
<%@page import="java.util.List"%>
<%@page import="com.mallbit.vendedor.ModeloVendedor"%>
<%@page import="com.mallbit.local.ModeloLocal"%>
<%@page import="com.mallbit.administrador.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //En esta parte de código lo que se hace es obtener el administrador que tiene el mismo id que se guardo en la cookie.
    ModeloVendedor modeloVendedor = new ModeloVendedor();
    List<Vendedor> vendedores = modeloVendedor.obtenerVendedoresDB();
    Vendedor vendedor = new ControladorVendedor().obtenerVendedorCookie(vendedores, request);
    
    String iDLocal = Integer.toString(new ModeloLocal().obtenerLocalV(Integer.toString(vendedor.getId())).getId());  
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link href="css/style.css" rel="stylesheet" />
        <link type="text/css" rel="stylesheet" href="css/materialize.css"/>

        <meta charset="UTF-8">
        <title>Registro Producto</title>
    </head>

    <body id="cuerpov">

        <nav class="light-blue darken-3">
            <div class="nav-wrapper">
                <div class="col s12">
                    <div id="principal-nav">
                        <a href="interfaz-productos.jsp" class="brand-logo"><i class="material-icons">shopping_basket</i>MallBIT</a>
                    </div>
                </div>
            </div>
        </nav>

        <div class="block" id="blockrc">
            <div class="card-panel">
                <div class="row">
                    <div class="col s10">
                        <p style="font-size: 30px" id="titleis">Registro producto</p>
                        <p style="font-size: 15px" id="subtitleis">Registra un producto para ofrecerlo en tu local</p><br>
                    </div>
                    <div class="col s1">
                        <i class="material-icons left" id="personas">local_mall</i>
                    </div>
                </div>
                <form action="ControladorProducto" method="post" enctype="multipart/form-data" class="col s12">
                    <input type="hidden" name="instruccion" value="insertarProducto"/>
                    <input type="hidden" name="vendor" value="<%= vendedor.getId() %>">
                    <input type="hidden" name="local" value="<%= iDLocal %>">
                    <div class="row">
                        <div class="col s6 input-field">
                            <i class="material-icons prefix">account_circle</i>
                            <input id="nombre" name="nombre" type="text" class="validate">
                            <label for="nombre">Nombre del producto</label>
                        </div>
                        <div class="col s6 input-field">
                            <i class="material-icons prefix">attach_money</i>
                            <input id="puntos" name="precio" type="number" class="validate">
                            <label for="precio">Precio</label>
                        </div>
                    </div> 
                    <div class="row">
                        <div class="col s6 input-field">
                            <i class="material-icons prefix">grade</i>
                            <input id="nombre" name="marca" type="text" class="validate">
                            <label for="marca">Marca</label>
                        </div>
                        <div class="col s6 input-field">
                            <i class="material-icons prefix">widgets</i>
                            <input id="puntos" name="stock" type="number" class="validate">
                            <label for="stock">Stock</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">mode_edit</i>
                            <textarea id="textarea1" name="descripcion" class="materialize-textarea"></textarea>
                            <label for="textarea1">Descripción del producto</label>
                        </div>
                    </div>
                    <div class="row"> 
                        <div class="col s12 file-field input-field">
                            <div class="btn grey darken-4">
                                <i class="material-icons">file_upload</i>
                                <input type="file" name="imagenPrincipal">
                            </div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" type="text" placeholder="Imagen del producto">
                            </div>
                        </div>
                    </div>
                    <div class="center-align">
                        <button class="btn waves-effect waves-light light-blue darken-3 black-text" type="submit" name="action">
                            Registrar
                        </button>
                    </div>
                </form> 
            </div>
        </div>
        <!--Import jQuery before materialize.js-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script src="js/script.js"></script>
    </body>

</html>