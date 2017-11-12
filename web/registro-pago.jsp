<%-- 
    Document   : registro-pago
    Created on : Nov 12, 2017, 2:20:31 PM
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
        <title>Iniciar Sesión</title>
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
                <form action="ControladorPago" method="post">
                    <input type="hidden" name="instruccion" value="realizarPago">
                    <div class="row">
                        <div class="col s10">
                            <p style="font-size: 30px" id="titleis">Datos tarjeta de credito</p>
                            <p style="font-size: 15px" id="subtitleis">Realizar pago en MallBIT</p><br>
                        </div>
                        <div class="col s1">
                            <i class="material-icons left" id="personas">attach_money</i>
                        </div>
                    </div>
                    <div class="input-field">
                        <i class="material-icons prefix">credit_card</i>
                        <input id="usuario" type="number" name="numeroTarjeta" class="validate" maxlength="15" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);">
                        <label for="numeroTarjeta">N° tarjeta de credito</label>
                    </div>

                    <div class="input-field">
                        <i class="material-icons prefix">lock_outline</i>
                        <input id="contraseña" type="number" name="cvv" class="validate" maxlength="3" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);">
                        <label for="cvv">CVV</label>
                    </div>
                    <div class="center-align">
                        <button class="waves-effect waves-light btn lime lighten-2 black-text" type="submit">Realizar pago</button>
                    </div>
                </form>
                <br>
            </div>
        </div>


        <!--Import jQuery before materialize.js-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script src="js/script.js"></script>
    </body>
</html>