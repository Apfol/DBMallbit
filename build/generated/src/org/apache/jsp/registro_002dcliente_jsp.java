package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.mallbit.genero.Genero;
import java.util.*;

public final class registro_002dcliente_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\" style=\"overflow-y: auto\">\r\n");
      out.write("\r\n");
      out.write("    <head>\r\n");
      out.write("        <!--Import Google Icon Font-->\r\n");
      out.write("        <link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">\r\n");
      out.write("        <!--Import materialize.css-->\r\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\" />\r\n");
      out.write("        <link type=\"text/css\" rel=\"stylesheet\" href=\"css/materialize.css\"/>\r\n");
      out.write("\r\n");
      out.write("        <meta charset=\"UTF-8\">\r\n");
      out.write("        <title>Registro Cliente</title>\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <body id=\"cuerpo\" class=\"lime darken-1\">\r\n");
      out.write("        \r\n");
      out.write("        <nav>\r\n");
      out.write("            <div class=\"nav-wrapper lime darken-1\">\r\n");
      out.write("                <div class=\"col s12\">\r\n");
      out.write("                    <div id=\"principal-nav\">\r\n");
      out.write("                        <a href=\"index.jsp\" class=\"brand-logo\"><i class=\"material-icons\">shopping_basket</i>MallBIT</a>\r\n");
      out.write("                        <a href=\"#\" data-activates=\"mobile-demo\" class=\"button-collapse\"><i class=\"material-icons\">menu</i></a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </nav>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"block\" id=\"blockrc\">\r\n");
      out.write("            <div class=\"card-panel\">\r\n");
      out.write("                <div class=\"row\">\r\n");
      out.write("                    <div class=\"col s10\">\r\n");
      out.write("                        <p style=\"font-size: 30px\" id=\"titleis\">Registro vendedor</p>\r\n");
      out.write("                        <p style=\"font-size: 15px\" id=\"subtitleis\">Acceder como cliente a MallBIT</p><br>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col s1\">\r\n");
      out.write("                        <i class=\"material-icons left\" id=\"personas\">people</i>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                ");
String[] estado = (String[]) request.getAttribute("ESTADO"); 
      out.write("\r\n");
      out.write("                ");
if (request.getAttribute("ESTADO") == null) {
      out.write("\r\n");
      out.write("                <!--Formulario registro por primera vez--><form action=\"ControladorCliente\" method=\"post\" class=\"col s12\">\r\n");
      out.write("                    <input type=\"hidden\" name=\"instruccion\" value=\"insertarCliente\"/>\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <div class=\"col s6 input-field\">\r\n");
      out.write("                            <input id=\"nombre\" name=\"nombre\" type=\"text\" class=\"validate\">\r\n");
      out.write("                            <label for=\"nombre\">Nombre</label>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"col s6 input-field\">\r\n");
      out.write("                            <input id=\"apellido\" name=\"apellido\" type=\"text\" class=\"validate\">\r\n");
      out.write("                            <label for=\"apellido\">Apellido</label>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <div class=\"col s6 input-field\">\r\n");
      out.write("                            <input id=\"correo\" name=\"correo\" type=\"text\" class=\"validate\">\r\n");
      out.write("                            <label for=\"correo\">Correo</label>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"col s6 input-field\">\r\n");
      out.write("                            <input id=\"fecha\" name=\"fechaNacimiento\" type=\"text\" class=\"datepicker\">\r\n");
      out.write("                            <label for=\"fecha\">Fecha de nacimiento</label>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <div class=\"col s6 input-field\">\r\n");
      out.write("                            <input id=\"identificacion\" name=\"identificacion\" type=\"tel\" maxlength=\"11\" class=\"validate\">\r\n");
      out.write("                            <label for=\"identificacion\">N° identificación</label>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"col s6 input-field\">\r\n");
      out.write("                            <input id=\"telefono\" name=\"telefono\" type=\"tel\" maxlength=\"10\" class=\"validate\">\r\n");
      out.write("                            <label for=\"telefono\">Teléfono</label>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <div class=\"col s4 input-field\">\r\n");
      out.write("                            <input id=\"usuario\" name=\"usuario\" type=\"text\" class=\"validate\">\r\n");
      out.write("                            <label for=\"usuario\">Usuario</label>\r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("                        <div class=\"col s4 input-field\">\r\n");
      out.write("                            <input id=\"contraseña\" name=\"password\" type=\"password\" class=\"validate\">\r\n");
      out.write("                            <label for=\"contraseña\">Contraseña</label>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"input-field col s4\">\r\n");
      out.write("                            <select name=\"genero\">\r\n");
      out.write("                                <option value=\"\" disabled selected>Género</option>\r\n");
      out.write("                                ");
 List<Genero> generos = (List<Genero>) request.getAttribute("LISTAGENEROS"); 
      out.write("\r\n");
      out.write("                                ");
 for (Genero g : generos) {
      out.write("\r\n");
      out.write("                                <option value=\"");
      out.print( g.getIdGenero());
      out.write('"');
      out.write('>');
      out.print( g.getGenero());
      out.write("</option>\r\n");
      out.write("                                ");
 }
      out.write("\r\n");
      out.write("                            </select>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"center-align\">\r\n");
      out.write("                        <button class=\"btn waves-effect waves-light lime lighten-2 black-text\" type=\"submit\" name=\"action\">\r\n");
      out.write("                            Registrar\r\n");
      out.write("                        </button>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </form> \r\n");
      out.write("                ");
} else {
      out.write("\r\n");
      out.write("                <div class=\"center-align\">\r\n");
      out.write("                    <p style=\"color: red\">Ese usuario ya existe.</p>\r\n");
      out.write("                </div>\r\n");
      out.write("                <!--Formulario registro si usuario ya existe con datos previos--><form action=\"ControladorCliente\" method=\"post\" class=\"col s12\">\r\n");
      out.write("                    <input type=\"hidden\" name=\"instruccion\" value=\"insertarCliente\"/>\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <div class=\"col s6 input-field\">\r\n");
      out.write("                            <input id=\"nombre\" name=\"nombre\" type=\"text\" class=\"validate\" value=\"");
      out.print( estado[1]);
      out.write("\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"col s6 input-field\">\r\n");
      out.write("                            <input id=\"apellido\" name=\"apellido\" type=\"text\" class=\"validate\" value=\"");
      out.print( estado[2]);
      out.write("\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <div class=\"col s6 input-field\">\r\n");
      out.write("                            <input id=\"correo\" name=\"correo\" type=\"text\" class=\"validate\" value=\"");
      out.print( estado[3]);
      out.write("\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"col s6 input-field\">\r\n");
      out.write("                            <input id=\"fecha\" name=\"fechaNacimiento\" type=\"text\" class=\"datepicker\" value=\"");
      out.print( estado[5]);
      out.write("\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <div class=\"col s6 input-field\">\r\n");
      out.write("                            <input id=\"identificacion\" name=\"identificacion\" type=\"tel\" maxlength=\"11\" class=\"validate\">\r\n");
      out.write("                            <label for=\"identificacion\">N° identificación</label>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"col s6 input-field\">\r\n");
      out.write("                            <input id=\"telefono\" name=\"telefono\" maxlength=\"10\" type=\"tel\"  maxlength=\"10\"  class=\"validate\">\r\n");
      out.write("                            <label for=\"telefono\">Teléfono</label>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <div class=\"col s4 input-field\">\r\n");
      out.write("                            <input id=\"usuario\" name=\"usuario\" type=\"text\" class=\"validate\" >\r\n");
      out.write("                            <label for=\"usuario\">Usuario</label>\r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("                        <div class=\"col s4 input-field\">\r\n");
      out.write("                            <input id=\"contraseña\" name=\"password\" type=\"password\" class=\"validate\" value=\"");
      out.print( estado[4]);
      out.write("\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"input-field col s4\">\r\n");
      out.write("                            <select name=\"genero\">\r\n");
      out.write("                                <option value=\"\" disabled selected>Género</option>\r\n");
      out.write("                                ");
 List<Genero> generos = (List<Genero>) request.getAttribute("LISTAGENEROS"); 
      out.write("\r\n");
      out.write("                                ");
 for (Genero g : generos) {
      out.write("\r\n");
      out.write("                                <option value=\"");
      out.print( g.getIdGenero());
      out.write('"');
      out.write('>');
      out.print( g.getGenero());
      out.write("</option>\r\n");
      out.write("                                ");
 }
      out.write("\r\n");
      out.write("                            </select>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"center-align\">\r\n");
      out.write("                        <button class=\"btn waves-effect waves-light lime lighten-2 black-text\" type=\"submit\" name=\"action\">\r\n");
      out.write("                            Registrar\r\n");
      out.write("                        </button>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </form> \r\n");
      out.write("                ");
 }
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("        <!--Import jQuery before materialize.js-->\r\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js\"></script>\r\n");
      out.write("        <script type=\"text/javascript\" src=\"js/materialize.min.js\"></script>\r\n");
      out.write("        <script src=\"js/script.js\"></script>\r\n");
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
