<%-- 
    Document   : interfaz-administrador
    Created on : Oct 21, 2017, 10:23:27 AM
    Author     : Andres Ramos
--%>

<%@page import="java.util.List"%>
<%@page import="com.mallbit.administrador.ModeloAdministrador"%>
<%@page import="com.mallbit.administrador.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%  
        //En esta parte de código lo que se hace es obtener el administrador que tiene el mismo id que se guardo en la cookie.
        ModeloAdministrador modeloAdministrador = new ModeloAdministrador();
        List<Administrador> administradores = modeloAdministrador.obtenerAdministradoresDB();
        Administrador administrador = null;
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("administrador")) {
                for (Administrador admin : administradores) {
                    if (admin.getId() == Integer.parseInt(cookie.getValue())) {
                        administrador = admin;
                        break;
                    }
                }
            }
        }
    %>
    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/style-interfaz-administrador.css" rel="stylesheet" />
        <link type="text/css" rel="stylesheet" href="css/materialize.css" />
        <% if (administrador.getIdGenero() == 1) {%>
        <title>Administrador <%= administrador.getNombre()%></title>
        <%} else {%>
        <title>Administradora <%= administrador.getNombre()%></title>
        <%}%>
        <title>Admnistrador </title>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
        <nav>
            <div class="nav-wrapper light-green darken-1">
                <div class="col s12">
                    <div id="principal-nav">
                        <a href="#" class="brand-logo"><i class="material-icons">shopping_basket</i>MallBIT</a>
                        <ul id="nav-mobile" class="right hide-on-med-and-down">
                            <li><a href="index.jsp"><i class="material-icons left">exit_to_app</i>Salir</a></li>
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
                <li><a href="#actualizarDatosPersonales" class="btn-floating pulse modal-trigger tooltipped teal lighten-2" data-position="left" data-delay="50" data-tooltip="Actualizar datos administrador"><i class="material-icons">edit</i></a></li>
                <li><a href="registro-premio.jsp?admin=<%= administrador.getId()%>" class="btn-floating pulse tooltipped yellow darken-1" data-position="left" data-delay="50" data-tooltip="Agregar premio"><i class="material-icons">card_giftcard</i></a></li>
            </ul>
        </div>

        <div id="contenedorAviso" class="valign-wrapper">
            <div class="row">
                <div class="col s6 offset-s3 m6 offset-m3">
                    <h4 class="center-align">Aún no haz añadido ningún premio.</h4>
                </div>  
            </div> 
        </div>

        <div id="actualizarDatosPersonales" class="modal modal-fixed-footer">
            <div class="modal-content">
                <h4>Actualización de datos administrador</h4>
                <form>
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
                </form>
            </div>
            <div class="modal-footer">
                <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cancelar</a>
                <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Listo</a>
            </div>
        </div>

        <div class="tap-target" data-activates="elementosAdmin">
            <div class="tap-target-content">
                <% if (administrador.getIdGenero()
                            == 1) {%>
                <h5>¡Bienvenido <%= administrador.getNombre()%>!</h5>
                <%} else {%>
                <h5>¡Bienvenida <%= administrador.getNombre()%>!</h5>
                <% }%>
                <p>Si deseas agregar un nuevo premio a la plataforma, o cambiar tus datos personales haz click en este botón.</p>
            </div>
        </div>
        <!--Import jQuery before materialize.js-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script src="js/script.js"></script>
        <script src="js/script-administrador.js"></script>
    </body>

</html>