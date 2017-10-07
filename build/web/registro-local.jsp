<%-- 
    Document   : registro-local
    Created on : Oct 7, 2017, 4:16:24 PM
    Author     : Andres Ramos
--%>

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
        <title>Registro Cliente</title>
    </head>

    <body id="cuerpo" class="lime darken-1">

        <nav>
            <div class="nav-wrapper lime darken-1">
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
                <div class="row">
                    <div class="col s10">
                        <p style="font-size: 30px" id="titleis">Registro local</p>
                        <p style="font-size: 15px" id="subtitleis">Registra tu local para empezar a vender</p><br>
                    </div>
                    <div class="col s1">
                        <i class="material-icons left" id="personas">people</i>
                    </div>
                </div>
                <form action="ControladorLocal" method="post" class="col s12">
                    <input type="hidden" name="instruccion" value="insertarLocal"/>
                    <div class="row">
                        <div class="col s12 input-field">
                            <i class="material-icons prefix">account_circle</i>
                            <input id="nombre" name="nombre" type="text" class="validate">
                            <label for="nombre">Nombre local</label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">mode_edit</i>
                            <textarea id="textarea1" class="materialize-textarea"></textarea>
                            <label for="textarea1">Descripción local</label>
                        </div>
                    </div>
                    <div class="center-align">
                        <button class="btn waves-effect waves-light lime lighten-2 black-text" type="submit" name="action">
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
