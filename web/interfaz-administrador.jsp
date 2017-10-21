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
            <a id="elementosAdmin" class="btn-floating btn-large light-green">
                <i class="large material-icons">mode_edit</i>
            </a>
            <ul>
                <li><a class="btn-floating red"><i class="material-icons">insert_chart</i></a></li>
                <li><a class="btn-floating yellow darken-1"><i class="material-icons">format_quote</i></a></li>
                <li><a class="btn-floating green"><i class="material-icons">publish</i></a></li>
                <li><a class="btn-floating blue"><i class="material-icons">attach_file</i></a></li>
            </ul>
        </div>


        <div class="tap-target" data-activates="elementosAdmin">
            <div class="tap-target-content">
                <% if(administrador.getIdGenero() == 1) { %>
                    <h5>¡Bienvenido administrador <%= administrador.getNombre() %>!</h5>
                <%} else { %>
                    <h5>¡Bienvenida administradora <%= administrador.getNombre() %>!</h5>
                <% } %>
                <p>Si deseas agregar un nuevo premio a la plataforma o editar alguno existente, accede a dichas funciones desde este botón</p>
            </div>
        </div>
        <!--Import jQuery before materialize.js-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script src="js/script-administrador.js"></script>
    </body>

</html>
