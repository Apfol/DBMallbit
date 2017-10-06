<%@page import="com.mallbit.vendedor.Vendedor"%>
<%@page import="java.util.Date"%>
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

    <body id="cuerpov">
        <!--# NOTE: Comienza parte mostrar barra navegaci�n.-->
        <nav>
            <div class="nav-wrapper navV" id="sombra">
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
            Vendedor interfaz = (Vendedor)request.getAttribute("VENDEDOR_SESSION");
            String nombre = interfaz.getNombre() + " " + interfaz.getApellido();
        %>   
        <div class="row">
            <div class="col s8" >
                <div class="block" id="bloque">
                    <div class="card-panel" id="cardp">
                        <div class="center-align" id="cardtop">
                            <p id="titleis2"><%= nombre%></p>
                            <p id="subtitleis2">Vendedor</p><br>
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
                                <p id="datatitle"><b>Identificaci�n</b></p>
                                <div class="right-align" id="data"><%= interfaz.getIdentificacion()%></div>
                            </div >
                            <div id="datapair">
                                <p id="datatitle"><b>Tel�fono</b></p>
                                <div class="right-align" id="data"><%= interfaz.getTelefono()%></div>
                            </div >
                            <div id="datapair">
                                <p id="datatitle"><b>Fecha de Nacimiento</b></p>
                                <div class="right-align" id="data"><%= interfaz.getFechaNacimiento()%></div>
                            </div>
                            <div id="datapair">
                                <p id="datatitle"><b>G�nero</b></p>
                                <div class="right-align" id="data"><% if (interfaz.getIdGenero() == 1) {%>Masculino<%} else {%>Femenino<%}%></div>
                            </div>
                        </div>
                    </div>
                    <div class="card-panel" id="cardpa">
                        <form action="ControladorVendedor" method="post">
                            <input type="hidden" name="instruccion" value="actualizarVendedor"/>
                            <input type="hidden" name="usuario" value="<%= interfaz.getUsuario()%>">
                            <div class="center-align" id="cardtop">
                                <p id="titleis2" class="center-align">Actualizaci�n de Datos</p>
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
                                    <label for="telefono">Tel�fono</label>
                                    <input id="telefono" name="telefono" type="tel" maxlength="10" class="validate">
                                </div>
                                <div class="input-field">
                                    <input id="contrase�a" name="password" type="password" class="validate">
                                    <label for="contrase�a">Contrase�a</label>
                                </div>
                            </div>
                            <div class="center-align">
                                <button class="btn waves-effect waves-light black-text" type="submit" name="action" id="navV">
                                    Actualizar
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col s2" id="opciones">
                <div class="center-align" id="btn1">
                    <a class="btn-floating btn-large waves-effect waves-light" id="compras"><i id="comprastext2">Mi Tienda</i><i class="material-icons" id="comprastext">store</i></a>
                </div>
                <div class="center-align" id="btn2">
                    <a class="btn-floating btn-large waves-effect waves-light" id="editar" onclick="mostrarEditar()"><i id="editartext2">Editar</i><i class="material-icons" id="editartext">create</i></a>
                </div>
                <div class="center-align" id="btn22">
                    <a class="btn-floating btn-large waves-effect waves-light" id="editar2" onclick="mostrarEditar2()"><i id="editartext4">Editar</i><i class="material-icons" id="editartext3">arrow_back</i></a>
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