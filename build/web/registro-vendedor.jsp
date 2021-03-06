<%-- 
    Document   : registro-vendedor
    Created on : Oct 5, 2017, 11:51:52 AM
    Author     : Andres Ramos
--%>

<%@page import="java.util.List"%>
<%@page import="com.mallbit.genero.Genero"%>
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
        <title>Registro Vendedor</title>
    </head>

    <body id="cuerpov">
        
        <nav class="light-blue darken-3">
            <div class="nav-wrapper">
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
                        <p style="font-size: 30px" id="titleis">Registro vendedor</p>
                        <p style="font-size: 15px" id="subtitleis">Acceder como vendedor a MallBIT</p><br>
                    </div>
                    <div class="col s1">
                        <i class="material-icons left" id="personas">local_shipping</i>
                    </div>
                </div>
                    <form action="ControladorVendedor" method="post" onsubmit="return validar()" class="col s12">
                    <input type="hidden" name="instruccion" value="insertarVendedor"/>
                    <div class="row">
                        <div class="col s6 input-field">
                            <i class="material-icons prefix">person</i>
                            <input id="nombre" name="nombre" type="text" class="validate">
                            <label for="nombre">Nombre</label>
                        </div>
                        <div class="col s6 input-field">
                            <i class="material-icons prefix">person</i>
                            <input id="apellido" name="apellido" type="text" class="validate">
                            <label for="apellido">Apellido</label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col s6 input-field">
                            <i class="material-icons prefix">email</i>
                            <input id="correo" name="correo" type="email" class="validate">
                            <label for="correo" data-error="No válido">Correo</label>
                        </div>
                        <div class="col s6 input-field">
                            <i class="material-icons prefix">date_range</i>
                            <input id="fecha" name="fechaNacimiento" type="text" class="datepicker">
                            <label for="fecha">Fecha de nacimiento</label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col s6 input-field">
                            <i class="material-icons prefix">perm_identity</i>
                            <input id="identificacion" name="identificacion" type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" maxlength="10" class="validate">
                            <label for="identificacion">N° identificación</label>
                        </div>
                        <div class="col s6 input-field">
                            <i class="material-icons prefix">phone</i>
                            <input id="telefono" name="telefono" type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" maxlength="10" class="validate">
                            <label for="telefono">Teléfono</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s4 input-field">
                            <i class="material-icons prefix">account_circle</i>
                            <input id="usuario" name="usuario" type="text" class="validate">
                            <label for="usuario">Usuario</label>
                        </div>

                        <div class="col s4 input-field">
                            <i class="material-icons prefix">lock_outline</i>
                            <input id="contraseña" name="password" type="password" class="validate">
                            <label for="contraseña">Contraseña</label>
                        </div>
                        <div class="input-field col s4">
                            <i class="material-icons prefix">wc</i>
                            <select name="genero">
                                <option value="" disabled selected>Género</option>
                                <% List<Genero> generos = (List<Genero>) request.getAttribute("LISTAGENEROS"); %>
                                <% for (Genero g : generos) {%>
                                <option value="<%= g.getIdGenero()%>"><%= g.getGenero()%></option>
                                <% }%>
                            </select>
                        </div>
                    </div>
                    <div class="center-align">
                        <button class="btn waves-effect black-text light-blue darken-3" type="submit" name="action">
                            Registrar
                        </button>
                    </div>
                </form> 
            </div>

        </div>
                            
        <script>
            function validar() {
                var a = document.getElementById("nombre").value;
                var b = document.getElementById("apellido").value;
                var c = document.getElementById("correo").value;
                var d = document.getElementById("fecha").value;
                var e = document.getElementById("identificacion").value;
                var f = document.getElementById("telefono").value;
                var g = document.getElementById("usuario").value;
                var h = document.getElementById("contraseña").value;
                var i = document.getElementById("genero").value;
                if (a=="" || b=="" || c=="" || d=="" || e=="" || f=="" || g=="" || h=="" || i=="") {
                    alert("Por favor, llena todos los campos");
                    return false;
                }
            }
        </script>
        <!--Import jQuery before materialize.js-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script src="js/script.js"></script>
    </body>

</html>
