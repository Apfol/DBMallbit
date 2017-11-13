<%@page import="com.mallbit.premio.ModeloPremio"%>
<%@page import="com.mallbit.premio.Premio"%>
<%@page import="com.mallbit.administrador.ControladorAdministrador"%>
<%@page import="java.util.List"%>
<%@page import="com.mallbit.administrador.ModeloAdministrador"%>
<%@page import="com.mallbit.administrador.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //En esta parte de código lo que se hace es obtener el administrador que tiene el mismo id que se guardo en la cookie.
    ModeloAdministrador modeloAdministrador = new ModeloAdministrador();
    List<Administrador> administradores = modeloAdministrador.obtenerAdministradoresDB();
    Administrador administrador = new ControladorAdministrador().obtenerAdministradorCookie(administradores, request);
%>
<!DOCTYPE html>
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
        <title>Administrador </title>
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


        <div class="fixed-action-btn">
            <a id="elementosAdmin" class="btn-floating btn-large green lighten-1">
                <i class="large material-icons">add</i>
            </a>
            <ul>
                <li><a href="#actualizarDatosPersonales" class="btn-floating pulse modal-trigger tooltipped teal lighten-2" data-position="left" data-delay="50" data-tooltip="Actualizar datos administrador"><i class="material-icons">edit</i></a></li>
                <li><a href="registro-premio.jsp?admin=<%= administrador.getId()%>" class="btn-floating pulse tooltipped yellow darken-1" data-position="left" data-delay="50" data-tooltip="Agregar premio"><i class="material-icons">card_giftcard</i></a></li>
            </ul>
        </div>

        <% List<Premio> premios = new ModeloPremio().obtenerPremiosAdministradorDB(administrador.getId()); %>
        <% if (premios.isEmpty()) { %>
        <div id="contenedorAviso" class="valign-wrapper">
            <div class="row">
                <div class="col s6 offset-s3 m6 offset-m3">
                    <h4 class="center-align">Aún no has añadido ningún premio.</h4>
                </div>  
            </div> 
        </div>
        <% } else { %>
        <div class="row">
            <% for (Premio premio : premios) {%>
            <div class="col s12 m4">
                <div  class="card sticky-action">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" src="images/Premios/<%=premio.getNombreImagen()%>" style="height: 350px; width: 458px;">
                    </div>
                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4"><%= premio.getNombre()%><b class="right"><%= premio.getPuntos() + " puntos "%></b></span>
                    </div>
                    <div class="card-reveal">
                        <span class="card-title grey-text text-darken-4"><%= premio.getNombre()%><i class="material-icons right">close</i></span>
                        <p><%= premio.getDescripcion()%></p>
                    </div>
                    <div class="card-action">
                        <a class="green-text lighten-1 modal-trigger" href="#actualizarPremio<%= premio.getId()%>">Editar premio</a>
                        <a class="red-text modal-trigger" href="#eliminarPremio<%= premio.getId()%>">Eliminar premio</a>
                    </div>
                </div>
            </div>
            <div id="eliminarPremio<%= premio.getId()%>" class="modal">
                <div class="modal-content">
                    <h4>Eliminar premio</h4>
                    <p>¿Estás seguro de eliminar el premio "<%= premio.getNombre()%>"?</p>
                </div>
                <div class="modal-footer">
                    <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cancelar</a>
                    <a href="ControladorPremio?instruccion=borrarPremio&idPremio=<%= premio.getId()%>" class="modal-action modal-close waves-effect waves-green btn-flat red-text">Eliminar</a>
                </div>
            </div>
            <div id="actualizarPremio<%= premio.getId()%>" class="modal modal-fixed-footer">
                <form action="ControladorPremio" method="post">
                    <div class="modal-content">
                        <h4 class="center-align">Actualización de datos premio</h4>
                        <input type="hidden" name="instruccion" value="actualizarPremio"/>
                        <input type="hidden" name="idPremio" value="<%= premio.getId()%>"/>
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
                    </div>
                    <div class="modal-footer">
                        <button class="modal-action modal-close waves-effect waves-light btn light-green darken-1 black-text" type="submit">Actualizar datos</button>
                    </div>
                </form>
            </div>
            <% } %>
        </div>
        <% } %>

        <div id="actualizarDatosPersonales" class="modal modal-fixed-footer">
            <form action="ControladorAdministrador" method="post">
                <div class="modal-content">
                    <h4 class="center-align">Actualización de datos administrador</h4>
                    <input type="hidden" name="instruccion" value="actualizarAdministrador"/>
                    <div class="row">
                        <div class="col s12 input-field">
                            <i class="material-icons prefix">person</i>
                            <input id="nombre" name="nombre" type="text" class="validate">
                            <label for="nombre">Nombre</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12 input-field">
                            <i class="material-icons prefix">person</i>
                            <input id="apellido" name="apellido" type="text" class="validate">
                            <label for="apellido">Apellido</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s4 input-field">
                            <i class="material-icons prefix">email</i>
                            <input id="correo" name="correo" type="email" class="validate">
                            <label for="correo" data-error="No válido">Correo</label>
                        </div>
                        <div class="col s4 input-field">
                            <i class="material-icons prefix">phone</i>
                            <input id="telefono" name="telefono" type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" maxlength="10" class="validate">
                            <label for="telefono">Teléfono</label>
                        </div>
                        <div class="col s4 input-field">
                            <i class="material-icons prefix">lock_outline</i>
                            <input id="contraseña" name="password" type="password" class="validate">
                            <label for="contraseña">Contraseña</label>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button class="modal-action modal-close waves-effect waves-light btn light-green darken-1 black-text" type="submit">Actualizar datos</button>
                </div>
            </form>
        </div>

        <div id="actualizarDatosPersonales" class="modal modal-fixed-footer">
            <form action="ControladorAdministrador" method="post">
                <div class="modal-content">
                    <h4>Actualización de datos administrador</h4>
                    <input type="hidden" name="instruccion" value="actualizarAdministrador"/>
                    <div class="row">
                        <div class="col s12 input-field">
                            <i class="material-icons prefix">person</i>
                            <input id="nombre" name="nombre" type="text" class="validate">
                            <label for="nombre">Nombre</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12 input-field">
                            <i class="material-icons prefix">person</i>
                            <input id="apellido" name="apellido" type="text" class="validate">
                            <label for="apellido">Apellido</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s4 input-field">
                            <i class="material-icons prefix">email</i>
                            <input id="correo" name="correo" type="email" class="validate">
                            <label for="correo" data-error="No válido">Correo</label>
                        </div>
                        <div class="col s4 input-field">
                            <i class="material-icons prefix">phone</i>
                            <input id="telefono" name="telefono" type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" maxlength="10" class="validate">
                            <label for="telefono">Teléfono</label>
                        </div>
                        <div class="col s4 input-field">
                            <i class="material-icons prefix">lock_outline</i>
                            <input id="contraseña" name="password" type="password" class="validate">
                            <label for="contraseña">Contraseña</label>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button class="modal-action modal-close waves-effect waves-light btn light-green darken-1 black-text" type="submit">Actualizar datos</button>
                </div>
            </form>
        </div>

        <div id="modal1" class="modal">
            <div class="modal-content">
                <h4>Modal Header</h4>
                <p>A bunch of text</p>
            </div>
            <div class="modal-footer">
                <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
            </div>
        </div>

        <div class="tap-target" data-activates="elementosAdmin" style="background-color: #66bb6a">
            <div class="tap-target-content">
                <% if (administrador.getIdGenero() == 1) {%>
                <h5>¡Bienvenido <%= administrador.getNombre()%>!</h5>
                <%} else {%>
                <h5>¡Bienvenida <%= administrador.getNombre()%>!</h5>
                <% }%>
                <p>Si deseas agregar un nuevo premio a la plataforma, o cambiar tus datos personales has click en este botón.</p>
            </div>
        </div>
        <!--Import jQuery before materialize.js-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script src="js/script.js"></script>
        <script src="js/script-inicio.js"></script>
    </body>

</html>
