package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import com.mallbit.administrador.ModeloAdministrador;
import com.mallbit.administrador.Administrador;

public final class interfaz_002dadministrador_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

    //En esta parte de código lo que se hace es obtener el administrador que tiene el mismo id que se guardo en la cookie.
    ModeloAdministrador modeloAdministrador = new ModeloAdministrador();
    List<Administrador> administradores = modeloAdministrador.obtenerAdministradoresDB();
    Administrador administrador = null;
    Cookie[] cookies = request.getCookies();
    for (Cookie cookie : cookies) {
        if (cookie.getName().equals(Administrador.ADMINISTRADOR_COOKIE)) {
            for (Administrador admin : administradores) {
                if (admin.getId() == Integer.parseInt(cookie.getValue())) {
                    administrador = admin;
                    break;
                }
            }
        }
    }

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <!--Import Google Icon Font-->\r\n");
      out.write("        <link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">\r\n");
      out.write("        <!--Import materialize.css-->\r\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\" />\r\n");
      out.write("        <link href=\"css/style-interfaz-administrador.css\" rel=\"stylesheet\" />\r\n");
      out.write("        <link type=\"text/css\" rel=\"stylesheet\" href=\"css/materialize.css\" />\r\n");
      out.write("        ");
 if (administrador.getIdGenero() == 1) {
      out.write("\r\n");
      out.write("        <title>Administrador ");
      out.print( administrador.getNombre());
      out.write("</title>\r\n");
      out.write("        ");
} else {
      out.write("\r\n");
      out.write("        <title>Administradora ");
      out.print( administrador.getNombre());
      out.write("</title>\r\n");
      out.write("        ");
}
      out.write("\r\n");
      out.write("        <title>Admnistrador </title>\r\n");
      out.write("        <!--Let browser know website is optimized for mobile-->\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <nav>\r\n");
      out.write("            <div class=\"nav-wrapper light-green darken-1\">\r\n");
      out.write("                <div class=\"col s12\">\r\n");
      out.write("                    <div id=\"principal-nav\">\r\n");
      out.write("                        <a href=\"#\" class=\"brand-logo\"><i class=\"material-icons\">shopping_basket</i>MallBIT</a>\r\n");
      out.write("                        <ul id=\"nav-mobile\" class=\"right hide-on-med-and-down\">\r\n");
      out.write("                            <li><a href=\"ControladorCookie?objeto=");
      out.print( Administrador.ADMINISTRADOR_COOKIE);
      out.write("\"><i class=\"material-icons left\">exit_to_app</i>Cerrar sesión</a></li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </nav>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"fixed-action-btn\">\r\n");
      out.write("            <a id=\"elementosAdmin\" class=\"btn-floating btn-large red lighten-1\">\r\n");
      out.write("                <i class=\"large material-icons\">add</i>\r\n");
      out.write("            </a>\r\n");
      out.write("            <ul>\r\n");
      out.write("                <li><a href=\"#actualizarDatosPersonales\" class=\"btn-floating pulse modal-trigger tooltipped teal lighten-2\" data-position=\"left\" data-delay=\"50\" data-tooltip=\"Actualizar datos administrador\"><i class=\"material-icons\">edit</i></a></li>\r\n");
      out.write("                <li><a href=\"registro-premio.jsp?admin=");
      out.print( administrador.getId());
      out.write("\" class=\"btn-floating pulse tooltipped yellow darken-1\" data-position=\"left\" data-delay=\"50\" data-tooltip=\"Agregar premio\"><i class=\"material-icons\">card_giftcard</i></a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <div class=\"col s12 m6\">\r\n");
      out.write("                <div class=\"card\">\r\n");
      out.write("                    <div class=\"card-image\">\r\n");
      out.write("                        <img src=\"images/sample-1.jpg\">\r\n");
      out.write("                        <span class=\"card-title\">Card Title</span>\r\n");
      out.write("                        <a class=\"btn-floating halfway-fab waves-effect waves-light red\"><i class=\"material-icons\">add</i></a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"card-content\">\r\n");
      out.write("                        <p>I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("            \r\n");
      out.write("<!--        <div id=\"contenedorAviso\" class=\"valign-wrapper\">\r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("                <div class=\"col s6 offset-s3 m6 offset-m3\">\r\n");
      out.write("                    <h4 class=\"center-align\">Aún no haz añadido ningún premio.</h4>\r\n");
      out.write("                </div>  \r\n");
      out.write("            </div> \r\n");
      out.write("        </div>-->\r\n");
      out.write("\r\n");
      out.write("        <div id=\"actualizarDatosPersonales\" class=\"modal modal-fixed-footer\">\r\n");
      out.write("            <div class=\"modal-content\">\r\n");
      out.write("                <h4>Actualización de datos administrador</h4>\r\n");
      out.write("                <form>\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <div class=\"col s12 input-field\">\r\n");
      out.write("                            <i class=\"material-icons prefix\">person</i>\r\n");
      out.write("                            <input id=\"nombre\" name=\"nombre\" type=\"text\" class=\"validate\">\r\n");
      out.write("                            <label for=\"nombre\">Nombre</label>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <div class=\"col s12 input-field\">\r\n");
      out.write("                            <i class=\"material-icons prefix\">person</i>\r\n");
      out.write("                            <input id=\"apellido\" name=\"apellido\" type=\"text\" class=\"validate\">\r\n");
      out.write("                            <label for=\"apellido\">Apellido</label>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <div class=\"col s4 input-field\">\r\n");
      out.write("                            <i class=\"material-icons prefix\">email</i>\r\n");
      out.write("                            <input id=\"correo\" name=\"correo\" type=\"email\" class=\"validate\">\r\n");
      out.write("                            <label for=\"correo\" data-error=\"No válido\">Correo</label>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"col s4 input-field\">\r\n");
      out.write("                            <i class=\"material-icons prefix\">phone</i>\r\n");
      out.write("                            <input id=\"telefono\" name=\"telefono\" type=\"number\" oninput=\"javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);\" maxlength=\"10\" class=\"validate\">\r\n");
      out.write("                            <label for=\"telefono\">Teléfono</label>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"col s4 input-field\">\r\n");
      out.write("                            <i class=\"material-icons prefix\">lock_outline</i>\r\n");
      out.write("                            <input id=\"contraseña\" name=\"password\" type=\"password\" class=\"validate\">\r\n");
      out.write("                            <label for=\"contraseña\">Contraseña</label>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </form>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"modal-footer\">\r\n");
      out.write("                <a href=\"#!\" class=\"modal-action modal-close waves-effect waves-green btn-flat\">Cancelar</a>\r\n");
      out.write("                <a href=\"#!\" class=\"modal-action modal-close waves-effect waves-green btn-flat\">Listo</a>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"tap-target\" data-activates=\"elementosAdmin\">\r\n");
      out.write("            <div class=\"tap-target-content\">\r\n");
      out.write("                ");
 if (administrador.getIdGenero()
                            == 1) {
      out.write("\r\n");
      out.write("                <h5>¡Bienvenido ");
      out.print( administrador.getNombre());
      out.write("!</h5>\r\n");
      out.write("                ");
} else {
      out.write("\r\n");
      out.write("                <h5>¡Bienvenida ");
      out.print( administrador.getNombre());
      out.write("!</h5>\r\n");
      out.write("                ");
 }
      out.write("\r\n");
      out.write("                <p>Si deseas agregar un nuevo premio a la plataforma, o cambiar tus datos personales haz click en este botón.</p>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <!--Import jQuery before materialize.js-->\r\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js\"></script>\r\n");
      out.write("        <script type=\"text/javascript\" src=\"js/materialize.min.js\"></script>\r\n");
      out.write("        <script src=\"js/script.js\"></script>\r\n");
      out.write("        <script src=\"js/script-administrador.js\"></script>\r\n");
      out.write("    </body>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
