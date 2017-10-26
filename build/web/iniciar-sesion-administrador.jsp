<%-- 
    Document   : iniciar-sesion-administrador
    Created on : Oct 21, 2017, 9:51:03 AM
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

    <body id="cuerpoA">
        <nav>
            <div class="nav-wrapper light-green darken-1">
                <div class="col s12">
                    <div id="principal-nav">
                        <a href="index.jsp" class="brand-logo"><i class="material-icons">shopping_basket</i>MallBIT</a>
                    </div>

                </div>
            </div>
        </nav>
        <div class="block" id="blockrc">
            <div class="card-panel">
                <form action="ControladorAdministrador" method="post">
                    <input type="hidden" name="instruccion" value="validarAdministrador">
                    <div class="row">
                        <div class="col s10">
                            <p style="font-size: 30px" id="titleis">Inicio de sesión</p>
                            <p style="font-size: 15px" id="subtitleis">Acceder como administrador a MallBIT</p><br>
                        </div>
                        <div class="col s1">
                            <i class="material-icons left" id="personas">security</i>
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
                        <button class="waves-effect waves-light btn light-green darken-1 black-text" type="submit">Iniciar sesión</button>
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
                <br>

            </div>

        </div>


        <!--Import jQuery before materialize.js-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script src="js/script.js"></script>
    </body>
</html>
