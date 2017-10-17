<%@page import="java.util.Date"%>
<%@page import="com.mallbit.cliente.*"%>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">

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
        <nav>
            <div class="nav-wrapper lime darken-1" id="sombra">
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

        <div style="height: 64px;"></div>
        <%
            Cliente interfaz = null;

            if (request.getAttribute("ClienteInterfazS") != null) {
                interfaz = (Cliente) request.getAttribute("ClienteInterfazS");
            }
            if (request.getAttribute("ClienteInterfazA") != null) {
                interfaz = (Cliente) request.getAttribute("ClienteInterfazA");
            }

            String nombre = interfaz.getNombre() + " " + interfaz.getApellido();
        %>   
        <div class="row">
            <div class="col s8" >
                <div class="block" id="bloque">
                    <div class="card-panel" id="cardp">
                        <div class="center-align" id="cardtopv">
                            <p id="titleis2"><%= nombre%></p>
                            <p id="subtitleis2">Cliente</p><br>
                        </div>
                        <div id="datos">
                            <div id="datapair">
                                <p id="datatitle"><b>Usuario</b></p>
                                <div class="right-align" id="data"><%= interfaz.getUsuario()%></div>
                            </div>
                            <div id="datapair">
                                <p id="datatitle"><b>Correo</b></p>
                                <div class="right-align" id="data"><%= interfaz.getCorreo()%></div>
                            </div >
                            <div id="datapair">
                                <p id="datatitle"><b>Identificación</b></p>
                                <div class="right-align" id="data"><%= interfaz.getIdentificacion()%></div>
                            </div >
                            <div id="datapair">
                                <p id="datatitle"><b>Teléfono</b></p>
                                <div class="right-align" id="data"><%= interfaz.getTelefono()%></div>
                            </div >
                            <div id="datapair">
                                <p id="datatitle"><b>Fecha de Nacimiento</b></p>
                                <div class="right-align" id="data"><%= interfaz.getFechaNacimiento()%></div>
                            </div>
                            <div id="datapair">
                                <p id="datatitle"><b>Género</b></p>
                                <div class="right-align" id="data"><% if (interfaz.getIdGenero() == 1) {%>Masculino<%} else {%>Femenino<%}%></div>
                            </div>
                        </div>
                        <div id="puntos">
                            <div class="row" id="points">
                                <div class="col s0" id="pointstitle">
                                    <p id="p1Pr">MallBITs</p>
                                </div>
                                <div class="col s0" id="pointscount">
                                    <p id="p2Pr" class="center-align"><%= interfaz.getPuntos()%></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-panel" id="cardpa">
                        <form action="ControladorCliente" method="post">
                            <input type="hidden" name="instruccion" value="actualizarCliente"/>
                            <input type="hidden" name="usuario" value="<%= interfaz.getUsuario()%>">
                            <div class="center-align" id="cardtop">
                                <p id="titleis2" class="center-align">Actualización de Datos</p>
                                <p id="subtitleis2" class="center-align"><%= interfaz.getUsuario()%></p><br>
                            </div>
                            <div id="datos2">
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
                            </div>
                            <div class="center-align">
                                <button class="btn waves-effect waves-light lime lighten-2 black-text" type="submit" name="action">
                                    Actualizar
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="card-panel" id="cardpb">
                        <form action="ControladorCliente" method="post">
                            <input type="hidden" name="instruccion" value="borrarCliente"/>
                            <input type="hidden" name="usuario" value="<%= interfaz.getUsuario()%>">
                            <div class="center-align" id="aviso">
                                <p id="advise" class="center-align">¿Estas seguro/a que deseas eliminar esta cuenta? Una vez eliminada ningún dato podrá ser recuperado.</p>
                            </div>
                            <div class="center-align">
                                <button class="btn waves-effect waves-light dark grey black-text" type="submit" name="action" id="delete">
                                    <b>Borrar</b>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col s2" id="opciones">
                <div class="center-align" id="btn1">
                    <a class="btn-floating btn-large waves-effect waves-light" id="compras"><i id="comprastext2">Mis Compras</i><i class="material-icons" id="comprastext">shopping_cart</i></a>
                </div>
                <div class="center-align" id="btn2">
                    <a class="btn-floating btn-large waves-effect waves-light" id="editar" onclick="mostrarEditar()"><i id="editartext2">Editar</i><i class="material-icons" id="editartext">create</i></a>
                </div>
                <div class="center-align" id="btn22">
                    <a class="btn-floating btn-large waves-effect waves-light" id="editar2" onclick="mostrarEditar2()"><i id="editartext4">Editar</i><i class="material-icons" id="editartext3">arrow_back</i></a>
                </div>
                <div class="center-align" id="btn3">
                    <a class="btn-floating btn-large waves-effect waves-light" id="borrar" onclick="mostrarBorrar()"><i id="borrartext2">Eliminar</i><i class="material-icons" id="borrartext">clear</i></a>
                </div>
                <div class="center-align" id="btn32">
                    <a class="btn-floating btn-large waves-effect waves-light" id="borrar2" onclick="mostrarBorrar2()"><i id="borrartext4">Eliminar</i><i class="material-icons" id="borrartext3">arrow_back</i></a>
                </div>
            </div>      
        </div>

        <!--Scripts de Interfaz-->
        <script>
            function mostrarEditar() {
                var x = document.getElementById("cardp");
                var y = document.getElementById("cardpa");
                var z = document.getElementById("btn2");
                var w = document.getElementById("btn22");
                var u = document.getElementById("btn1");
                var v = document.getElementById("btn3");
                x.style.display = "none";
                y.style.display = "block";
                z.style.display = "none";
                w.style.display = "block";
                u.style.display = "none";
                v.style.display = "none";
            }
            function mostrarEditar2() {
                var x = document.getElementById("cardp");
                var y = document.getElementById("cardpa");
                var z = document.getElementById("btn2");
                var w = document.getElementById("btn22");
                var u = document.getElementById("btn1");
                var v = document.getElementById("btn3");
                y.style.display = "none";
                x.style.display = "block";
                w.style.display = "none";
                z.style.display = "block";
                u.style.display = "block";
                v.style.display = "block";
            }
            function mostrarBorrar() {
                var x = document.getElementById("cardp");
                var y = document.getElementById("cardpb");
                var z = document.getElementById("btn3");
                var w = document.getElementById("btn32");
                var u = document.getElementById("btn1");
                var v = document.getElementById("btn2");
                x.style.display = "none";
                y.style.display = "block";
                z.style.display = "none";
                w.style.display = "block";
                u.style.display = "none";
                v.style.display = "none";
            }
            function mostrarBorrar2() {
                var x = document.getElementById("cardp");
                var y = document.getElementById("cardpb");
                var z = document.getElementById("btn3");
                var w = document.getElementById("btn32");
                var u = document.getElementById("btn1");
                var v = document.getElementById("btn2");
                y.style.display = "none";
                x.style.display = "block";
                w.style.display = "none";
                z.style.display = "block";
                u.style.display = "block";
                v.style.display = "block";
            }
        </script>                

        <!--Import jQuery before materialize.js-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script src="js/script.js"></script>

    </body>

</html>