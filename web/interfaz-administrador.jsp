<%-- 
    Document   : interfaz-administrador
    Created on : Oct 21, 2017, 10:23:27 AM
    Author     : Andres Ramos
--%>

<%@page import="com.mallbit.administrador.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/style-interfaz-administrador.css" rel="stylesheet" />
        <link type="text/css" rel="stylesheet" href="css/materialize.css" />

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>

    <body>
        <nav>
            <% Administrador administrador = (Administrador) session.getAttribute("ADMINISTRADOR_SESSION"); %>
            <div class="nav-wrapper light-green">
                <div class="col s12">
                    <div id="principal-nav">
                        <a href="index.jsp" class="brand-logo"><i class="material-icons">shopping_basket</i>MallBIT</a>
                        <ul id="nav-mobile" class="right hide-on-med-and-down">
                            <li><a href="index.jsp" onclick="<% session.invalidate(); %>"><i class="material-icons left">exit_to_app</i>Salir</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>

        <div class="fixed-action-btn">
            <a id="elementosAdmin" class="btn-floating btn-large red lighten-1">
                <i class="large material-icons">add</i>
            </a>
            <ul>
                <li><a href="#actualizarDatosPersonales" class="btn-floating modal-trigger tooltipped red" data-position="left" data-delay="50" data-tooltip="Actualizar datos administrador"><i class="material-icons">edit</i></a></li>
                <li><a class="btn-floating tooltipped yellow darken-1" data-position="left" data-delay="50" data-tooltip="Agregar premio"><i class="material-icons">add_circle</i></a></li>
            </ul>
        </div>

        <div id="contenedorAviso" class="valign-wrapper">
            <div class="row">
                <div class="col s6 offset-s3 m6 offset-m3">
                    <h4 class="center-align">Aún no haz añadido ningún premio</h4>
                </div>  
            </div> 
        </div>

        <div id="actualizarDatosPersonales" class="modal modal-fixed-footer">
            <div class="modal-content">
                <h4>Actualización de datos administrador</h4>
                <form>
                    <div class="input-field">
                        <label for="nombre">Nombre</label>
                        <input id="nombre" name="nombre" type="text" class="validate">
                    </div>
                    <div class="input-field">
                        <label for="apellido">Apellido</label>
                        <input id="apellido" name="apellido" type="text" class="validate">                          
                    </div>
                    <div class="input-field">
                        <label for="correo">Correo</label>
                        <input id="correo" name="correo" type="text" class="validate">
                    </div>
                    <div class="input-field">
                        <label for="telefono">Teléfono</label>
                        <input id="telefono" name="telefono" type="tel" maxlength="10" class="validate">
                    </div>
                    <div class="input-field">
                        <input id="contraseña" name="password" type="password" class="validate">
                        <label for="contraseña">Contraseña</label>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cancelar</a>
                <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Listo</a>
            </div>
        </div>

        <div class="tap-target" data-activates="elementosAdmin">
            <div class="tap-target-content">
                <% if (administrador.getIdGenero() == 1) {%>
                <h5>¡Bienvenido <%= administrador.getNombre()%>!</h5>
                <%} else {%>
                <h5>¡Bienvenida <%= administrador.getNombre()%>!</h5>
                <% }%>
                <p>Si deseas agregar un nuevo premio a la plataforma, o cambiar algunos de tus datos personales haz click en este botón</p>
            </div>
        </div>
        <!--Import jQuery before materialize.js-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script src="js/script-administrador.js"></script>
    </body>

</html>
