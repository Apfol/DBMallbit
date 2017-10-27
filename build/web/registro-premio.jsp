<%-- 
    Document   : registro-premio
    Created on : Oct 21, 2017, 9:58:59 PM
    Author     : Andres Ramos
--%>

<%@page import="com.mallbit.administrador.Administrador"%>
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
        <title>Registro Premio</title>
    </head>

    <body id="cuerpoA">

        <nav class="light-green darken-1">
            <div class="nav-wrapper">
                <div class="col s12">
                    <div id="principal-nav">
                        <a href="interfaz-administrador.jsp" class="brand-logo"><i class="material-icons">shopping_basket</i>MallBIT</a>
                    </div>
                </div>
            </div>
        </nav>

        <div class="block" id="blockrc">
            <div class="card-panel">
                <div class="row">
                    <div class="col s10">
                        <p style="font-size: 30px" id="titleis">Registro premio</p>
                        <p style="font-size: 15px" id="subtitleis">Registra tu premio para ofrecerlo en la plataforma</p><br>
                    </div>
                    <div class="col s1">
                        <i class="material-icons left" id="personas">card_giftcard</i>
                    </div>
                </div>
                <form action="ControladorPremio" method="post" enctype="multipart/form-data" class="col s12">
                    <input type="hidden" name="instruccion" value="insertarPremio"/>
                    <input type="hidden" name="admin" value="<%= request.getParameter("admin") %>"/>
                    <div class="row">
                        <div class="col s8 input-field">
                            <i class="material-icons prefix">account_circle</i>
                            <input id="nombre" name="nombre" type="text" class="validate">
                            <label for="nombre">Nombre premio</label>
                        </div>
                        <div class="col s4 input-field">
                            <i class="material-icons prefix">adjust</i>
                            <input id="puntos" name="puntos" type="number" maxlength="3" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" class="validate">
                            <label for="puntos">Puntos</label>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">mode_edit</i>
                            <textarea id="textarea1" name="descripcion" class="materialize-textarea"></textarea>
                            <label for="textarea1">Descripción premio</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12 file-field input-field">
                            <div class="btn grey darken-4">
                                <i class="material-icons">file_upload</i>
                                <input type="file" name="imagenPrincipal">
                            </div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" type="text" placeholder="Imagen premio">
                            </div>
                        </div>
                    </div>
                    <div class="center-align">
                        <button class="btn waves-effect waves-light light-green darken-1 black-text" type="submit" name="action">
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
