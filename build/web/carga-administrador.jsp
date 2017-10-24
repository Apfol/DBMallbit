<%-- 
    Document   : carga-administrador
    Created on : Oct 24, 2017, 1:00:07 AM
    Author     : Andres Ramos
--%>

<%@page import="com.mallbit.administrador.ControladorAdministrador"%>
<%@page import="com.mallbit.administrador.Administrador"%>
<%@page import="java.util.List"%>
<%@page import="com.mallbit.administrador.ModeloAdministrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //En esta parte de código lo que se hace es obtener el administrador que tiene el mismo id que se guardo en la cookie.
    List<Administrador> administradores = new ModeloAdministrador().obtenerAdministradoresDB();
    Administrador administrador = new ControladorAdministrador().ObtenerAdministradorCookie(administradores, request);
%>
<html>
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
                            <li><a href="ControladorCookie?objeto=<%= Administrador.ADMINISTRADOR_COOKIE%>"><i class="material-icons left">exit_to_app</i>Cerrar sesión</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>

        <div id="contenedorAviso" class="valign-wrapper">
            <div class="row">
                <div class="col s6 offset-s3 m6 offset-m3">
                    <div class="preloader-wrapper big active">
                        <div class="spinner-layer spinner-red-only">
                            <div class="circle-clipper left">
                                <div class="circle"></div>
                            </div><div class="gap-patch">
                                <div class="circle"></div>
                            </div><div class="circle-clipper right">
                                <div class="circle"></div>
                            </div>
                        </div>
                    </div>
                </div>  
            </div> 
        </div>

        <script language="JavaScript">
            setTimeout("location.href='interfaz-administrador.jsp'", 1000);
        </script>
    </body>
</html>
