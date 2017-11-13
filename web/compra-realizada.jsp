<%-- 
    Document   : compra-realizada
    Created on : Nov 12, 2017, 10:18:23 PM
    Author     : Andres Ramos
--%>

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
        <title>Compra realizada</title>
    </head>

    <body id="cuerpo">
        <nav>
            <div class="nav-wrapper lime darken-1">
                <div class="col s12">
                    <div id="principal-nav">
                        <a href="index.jsp" class="brand-logo"><i class="material-icons">shopping_basket</i>MallBIT</a>
                    </div>
                </div>
            </div>
        </nav>
        <div class="block" id="blockrc">
            <div class="card-panel">
                <div class="row">
                    <div class="col s10">
                        <p style="font-size: 30px" id="titleis">¡Compra realizada!</p>
                        <br>
                        <p style="font-size: 15px" id="subtitleis">Tu compra está pendiente a ser despachada, por favor espera a que el vendedor confirme el envío.</p><br>
                    </div>
                    <div class="col s1">
                        <i class="material-icons left" id="personas">check</i>
                    </div>
                </div>
                <div class="center-align">
                    <a class="waves-effect waves-light btn lime lighten-2 black-text" href="index.jsp">Entendido</a>
                </div>
            </div>
        </div>


        <!--Import jQuery before materialize.js-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script src="js/script.js"></script>
    </body>
</html>
