<%@page import="com.mallbit.Categoria.Categoria"%>
<%@page import="com.mallbit.Categoria.ModeloCategoria"%>
<%@page import="java.util.List"%>
<%@page import="com.mallbit.vendedor.ControladorVendedor"%>
<%@page import="com.mallbit.vendedor.ModeloVendedor"%>
<%@page import="com.mallbit.vendedor.Vendedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link href="css/style.css" rel="stylesheet" />
        <link type="text/css" rel="stylesheet" href="css/materialize.css"/>

        <meta charset="UTF-8">
        <title>Registro Local</title>
    </head>
    
    <body id="cuerpov">

        <nav class="light-blue darken-3">
            <div class="nav-wrapper">
                <div class="col s12">
                    <div id="principal-nav">
                        <a href="index.jsp" class="brand-logo"><i class="material-icons">shopping_basket</i>MallBIT</a>
                        <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                    </div>
                </div>
            </div>
        </nav>

        <%
            ModeloVendedor modeloVendedor = new ModeloVendedor();
            List<Vendedor> vendedores = modeloVendedor.obtenerVendedoresDB();
            Vendedor vendedor = new ControladorVendedor().obtenerVendedorCookie(vendedores, request);
        %>
        
        <div class="block" id="blockrc">
            <div class="card-panel">
                <div class="row">
                    <div class="col s10">
                        <p style="font-size: 30px" id="titleis">Registro local</p>
                        <p style="font-size: 15px" id="subtitleis">¡Hola <%= vendedor.getNombre() %>! Registra tu local para empezar a vender</p><br>
                    </div>
                    <div class="col s1">
                        <i class="material-icons left" id="personas">store</i>
                    </div>
                </div>
                <form action="ControladorLocal" onsubmit="return validar()" method="post" enctype="multipart/form-data" class="col s12">
                    <input type="hidden" name="instruccion" value="insertarLocal"/>
                    <input type="hidden" name="vendedor" value="<%= vendedor.getId() %>"/>
                    <div class="row">
                        <div class="col s12 input-field">
                            <i class="material-icons prefix">account_circle</i>
                            <input id="nombre" name="nombre" type="text" class="validate">
                            <label for="nombre">Nombre del local</label>
                        </div>
                    </div> 
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">mode_edit</i>
                            <textarea id="descripcionL" name="descripcion" class="materialize-textarea"></textarea>
                            <label for="descripcionL">Descripción del local</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">apps</i>
                            <select id="categoria" name="categoria">
                                <option value="" disabled selected>Categoría</option>
                                <% List<Categoria> categorias = new ModeloCategoria().getCategorias(); %>
                                <% for (Categoria c : categorias) {%>
                                <option value="<%= c.getIdCategoria()%>"><%= c.getTipoCategoria()%></option>
                                <% }%>
                            </select>
                            <label for="categoria">Categoría del local</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s6 offset-s3 file-field input-field">
                            <div class="btn grey darken-4">
                                <i class="material-icons">file_upload</i>
                                <input id="imagenPrincipal" type="file" name="imagenPrincipal">
                            </div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" type="text" placeholder="Imagen principal">
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
                            
        <script>
            function validar() {
                var a = document.getElementById("nombre").value;
                var b = document.getElementById("descripcionL").value;
                var c = document.getElementById("categoria").value;
                var d = document.getElementById("imagenPrincipal").value;
                if (a=="" || b=="" || c=="" || d=="") {
                    alert("Por favor, llena todos los campos");
                    return false;
                }
            }
        </script>
                            
        <!--Import jQuery before materialize.js-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script src="js/script.js"></script>
    </body>

</html>
