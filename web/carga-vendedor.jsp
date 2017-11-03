<%@page import="com.mallbit.vendedor.ControladorVendedor"%>
<%@page import="com.mallbit.vendedor.ModeloVendedor"%>
<%@page import="com.mallbit.vendedor.Vendedor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //En esta parte de código lo que se hace es obtener el administrador que tiene el mismo id que se guardo en la cookie.
    List<Vendedor> vendedores = new ModeloVendedor().obtenerVendedoresDB();
    Vendedor vendedor = new ControladorVendedor().obtenerVendedorCookie(vendedores, request);
%>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/style-interfaz-administrador.css" rel="stylesheet" />
        <link type="text/css" rel="stylesheet" href="css/materialize.css" />
        <title>Saliendo... </title>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body id="cuerpo" >
        <nav>
            <div class="nav-wrapper light-green lighten-1">
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

        <div id="contenedorAviso" class="valign-wrapper">
            <div class="row">
                <div class="col s6 offset-s3 m6 offset-m3">
                    <div class="preloader-wrapper big active">
                        <div class="spinner-layer spinner-green-only">
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
            setTimeout("location.href='index.jsp'", 10000);
        </script>
    </body>
</html>
