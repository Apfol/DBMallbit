<!DOCTYPE html>
<html lang="en" style="overflow-y: hidden">

    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link href="css/style.css" rel="stylesheet" />
        <link type="text/css" rel="stylesheet" href="css/materialize.css" />


        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Usuario</title>
    </head>

    <body id="cuerpo">
        <!--# NOTE: Comienza parte mostrar barra navegación.-->
        <div id="primera" class="scrollspy">
            <nav class="pushpin-nav z-depth-0" data-target="primera">
                <div class="nav-wrapper lime darken-1" id="sombra">
                    <div class="col s12">
                        <div id="principal-nav">
                            <a href="#" class="brand-logo"><i class="material-icons">shopping_basket</i>MallBIT</a>
                            <ul id="nav-mobile" class="right hide-on-med-and-down">
                                <li><a href="index.jsp" onclick="<% session.invalidate(); %>"><i class="material-icons left">exit_to_app</i>Salir</a></li>
                            </ul>
                        </div>

                        <div style="height: 56px;" id="search-nav">
                            <div class="row">
                                <div class="col s10">
                                    <div class="input-field black-text">
                                        <i class="material-icons prefix">search</i>
                                        <input placeholder="Haz click para buscar" id="icon_prefix" type="text" class="validate">
                                    </div>
                                </div>
                                <div class="col s2">
                                    <ul class="right hide-on-med-and-down">
                                        <li><a id="search-nav-cancel" href="#"><i class="material-icons left black-text">cancel</i>Cancelar</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>

            <div style="height: 64px;"></div>
        </div>
        <div class="row" id="main">
            <div class="col s8">
                <div class="block" id="bloque">
                    <div class="card-panel" id="cardp">
                        <div class="center-align" id="cardtop">
                            <p id="titleis2">Alejandro Cubillos Perdigon</p>
                            <p id="subtitleis2">Cliente</p><br>
                        </div>
                        <div id="datos">
                            <div id="datapair">
                                <p id="datatitle"><b>Usuario</b></p>
                                <div class="right-align" id="data">Alejo</div>
                            </div>
                            <div id="datapair">
                                <p id="datatitle"><b>Correo</b></p>
                                <div class="right-align" id="data">alejocp236@hotmail.com</div>
                            </div >
                            <div id="datapair">
                                <p id="datatitle"><b>Fecha de Nacimiento</b></p>
                                <div class="right-align" id="data">16/03/1999</div>
                            </div>
                            <div id="datapair">
                                <p id="datatitle"><b>Género</b></p>
                                <div class="right-align" id="data">Masculino</div>
                            </div>
                        </div>
                        <div id="puntos">
                            <div class="row" id="points">
                                <div class="col s0" id="pointstitle">
                                    <p id="p1">MallBITs</p>
                                </div>
                                <div class="col s0" id="pointscount">
                                    <p id="p2" class="center-align">10</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col s2" id="opciones">
                <div class="center-align">
                    <a class="btn-floating btn-large waves-effect waves-light" id="compras"><i id="comprastext2">Mis Compras</i><i class="material-icons" id="comprastext">shopping_cart</i></a>
                </div>
                <div class="center-align">
                    <a class="btn-floating btn-large waves-effect waves-light" id="editar"><i id="editartext2">Editar</i><i class="material-icons" id="editartext">create</i></a>
                </div>
                <div class="center-align">
                    <a class="btn-floating btn-large waves-effect waves-light" id="borrar"><i id="borrartext2">Eliminar</i><i class="material-icons" id="borrartext">clear</i></a>
                </div>
            </div>
            
            
        </div>


        <!--Import jQuery before materialize.js-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script src="js/script.js"></script>

    </body>

</html>