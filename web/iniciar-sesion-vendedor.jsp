<%-- 
    Document   : iniciar-sesion-vendedor
    Created on : Oct 5, 2017, 12:03:44 PM
    Author     : Andres Ramos
--%>

<%@page import="com.mallbit.genero.Genero"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="overflow-y: hidden">
    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link href="css/style.css" rel="stylesheet" />
        <link type="text/css" rel="stylesheet" href="css/materialize.css"/>

        <meta charset="UTF-8">
        <title>Iniciar Sesión</title>
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
        <div class="block" id="blockrc">
            <div class="card-panel">
                <form action="ControladorVendedor" method="post">
                    <input type="hidden" name="instruccion" value="validarVendedor">
                    <div class="row">
                        <div class="col s10">
                            <p style="font-size: 30px" id="titleis">Inicio de sesión</p>
                            <p style="font-size: 15px" id="subtitleis">Acceder como vendedor a MallBIT</p><br>
                        </div>
                        <div class="col s1">
                            <i class="material-icons left" id="personas">local_shipping</i>
                        </div>
                    </div>
                    <div class="input-field">
                        <i class="material-icons prefix">account_circle</i>
                        <input id="usuario" type="text" name="usuario" class="validate">
                        <label for="usuario">Usuario</label>
                    </div>

                    <div class="input-field">
                        <i class="material-icons prefix">lock_outline</i>
                        <input id="contraseña" type="password" name="password" class="validate">
                        <label for="contraseña">Contraseña</label>
                    </div>
                    <div class="center-align">
                        <button class="waves-effect waves-light btn light-blue darken-3 black-text" type="submit">
                            Iniciar sesión
                        </button>
                    </div>
                </form>
                <br>
                <% String estado = (String) request.getAttribute("RESULTADO"); %>
                <% if (estado == "incorrecto") {%>
                <div class="center-align">
                    <style>
                        #usuario,#contraseña{
                            border-color: red;
                        }
                    </style>
                    <p style="color: red">Usuario o Contraseña Incorrectos</p>
                </div>
                <% } else {%>
                <% if (estado == "indefinido") {%>
                <style>
                    #register{
                        font-size: 18px;
                        text-decoration: underline;
                    }
                </style>
                <% }%>
                <% }%>
                <div class="center-align" id="register">
                    ¿No tienes una cuenta?
                    <a href="ControladorGenero?instruccion=<%= Genero.GENERO_VENDEDOR %>">
                        Regístrate
                    </a>
                </div>
                <br>

            </div>

        </div>


        <!--Import jQuery before materialize.js-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script src="js/script.js"></script>
    </body>
</html>
