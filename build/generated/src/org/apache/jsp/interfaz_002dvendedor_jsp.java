package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.mallbit.vendedor.Vendedor;
import java.util.Date;
import java.util.List;

public final class interfaz_002dvendedor_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("\r\n");
      out.write("    <head>\r\n");
      out.write("        <!--Import Google Icon Font-->\r\n");
      out.write("        <link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">\r\n");
      out.write("        <!--Import materialize.css-->\r\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\" />\r\n");
      out.write("        <link type=\"text/css\" rel=\"stylesheet\" href=\"css/materialize.css\" />\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <meta charset=\"UTF-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\r\n");
      out.write("        <title>Usuario</title>\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <body id=\"cuerpov\">\r\n");
      out.write("        <!--# NOTE: Comienza parte mostrar barra navegación.-->\r\n");
      out.write("        <nav>\r\n");
      out.write("            <div class=\"nav-wrapper navV\" id=\"sombra\">\r\n");
      out.write("                <div class=\"col s12\">\r\n");
      out.write("                    <div id=\"principal-nav\">\r\n");
      out.write("                        <a href=\"index.jsp\" class=\"brand-logo\"><i class=\"material-icons\">shopping_basket</i>MallBIT</a>\r\n");
      out.write("                        <ul id=\"nav-mobile\" class=\"right hide-on-med-and-down\">\r\n");
      out.write("                            <li><a href=\"index.jsp\" onclick=\"");
 session.invalidate(); 
      out.write("\"><i class=\"material-icons left\">exit_to_app</i>Salir</a></li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </nav>\r\n");
      out.write("\r\n");
      out.write("        <div style=\"height: 64px;\"></div>\r\n");
      out.write("        ");

            Vendedor interfaz = (Vendedor)session.getAttribute("VENDEDOR_SESSION");
            String nombre = interfaz.getNombre() + " " + interfaz.getApellido();
        
      out.write("   \r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <div class=\"col s8\" >\r\n");
      out.write("                <div class=\"block\" id=\"bloque\">\r\n");
      out.write("                    <div class=\"card-panel\" id=\"cardp\">\r\n");
      out.write("                        <div class=\"center-align\" id=\"cardtop\">\r\n");
      out.write("                            <p id=\"titleis2\">");
      out.print( nombre);
      out.write("</p>\r\n");
      out.write("                            <p id=\"subtitleis2\">Vendedor</p><br>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div id=\"datos\">\r\n");
      out.write("                            <div id=\"datapair\">\r\n");
      out.write("                                <p id=\"datatitle\"><b>Usuario</b></p>\r\n");
      out.write("                                <div class=\"right-align\" id=\"data\">");
      out.print( interfaz.getUsuario());
      out.write("</div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div id=\"datapair\">\r\n");
      out.write("                                <p id=\"datatitle\"><b>Correo</b></p>\r\n");
      out.write("                                <div class=\"right-align\" id=\"data\">");
      out.print( interfaz.getCorreo());
      out.write("</div>\r\n");
      out.write("                            </div >\r\n");
      out.write("                            <div id=\"datapair\">\r\n");
      out.write("                                <p id=\"datatitle\"><b>Identificación</b></p>\r\n");
      out.write("                                <div class=\"right-align\" id=\"data\">");
      out.print( interfaz.getIdentificacion());
      out.write("</div>\r\n");
      out.write("                            </div >\r\n");
      out.write("                            <div id=\"datapair\">\r\n");
      out.write("                                <p id=\"datatitle\"><b>Teléfono</b></p>\r\n");
      out.write("                                <div class=\"right-align\" id=\"data\">");
      out.print( interfaz.getTelefono());
      out.write("</div>\r\n");
      out.write("                            </div >\r\n");
      out.write("                            <div id=\"datapair\">\r\n");
      out.write("                                <p id=\"datatitle\"><b>Fecha de Nacimiento</b></p>\r\n");
      out.write("                                <div class=\"right-align\" id=\"data\">");
      out.print( interfaz.getFechaNacimiento());
      out.write("</div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div id=\"datapair\">\r\n");
      out.write("                                <p id=\"datatitle\"><b>Género</b></p>\r\n");
      out.write("                                <div class=\"right-align\" id=\"data\">");
 if (interfaz.getIdGenero() == 1) {
      out.write("Masculino");
} else {
      out.write("Femenino");
}
      out.write("</div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"card-panel\" id=\"cardpa\">\r\n");
      out.write("                        <form action=\"ControladorVendedor\" method=\"post\">\r\n");
      out.write("                            <input type=\"hidden\" name=\"instruccion\" value=\"actualizarVendedor\"/>\r\n");
      out.write("                            <input type=\"hidden\" name=\"usuario\" value=\"");
      out.print( interfaz.getUsuario());
      out.write("\">\r\n");
      out.write("                            <div class=\"center-align\" id=\"cardtop\">\r\n");
      out.write("                                <p id=\"titleis2\" class=\"center-align\">Actualización de Datos</p>\r\n");
      out.write("                                <p id=\"subtitleis2\" class=\"center-align\">");
      out.print( interfaz.getUsuario());
      out.write("</p><br>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div id=\"datos2\">\r\n");
      out.write("                                <div class=\"input-field\">\r\n");
      out.write("                                    <label for=\"nombre\">Nombre</label>\r\n");
      out.write("                                    <input id=\"nombre\" name=\"nombre\" type=\"text\" class=\"validate\">\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"input-field\">\r\n");
      out.write("                                    <label for=\"apellido\">Apellido</label>\r\n");
      out.write("                                    <input id=\"apellido\" name=\"apellido\" type=\"text\" class=\"validate\">                          \r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"input-field\">\r\n");
      out.write("                                    <label for=\"correo\">Correo</label>\r\n");
      out.write("                                    <input id=\"correo\" name=\"correo\" type=\"text\" class=\"validate\">\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"input-field\">\r\n");
      out.write("                                    <label for=\"telefono\">Teléfono</label>\r\n");
      out.write("                                    <input id=\"telefono\" name=\"telefono\" type=\"tel\" maxlength=\"10\" class=\"validate\">\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"input-field\">\r\n");
      out.write("                                    <input id=\"contraseña\" name=\"password\" type=\"password\" class=\"validate\">\r\n");
      out.write("                                    <label for=\"contraseña\">Contraseña</label>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"center-align\">\r\n");
      out.write("                                <button class=\"btn waves-effect waves-light black-text\" type=\"submit\" name=\"action\" id=\"navV\">\r\n");
      out.write("                                    Actualizar\r\n");
      out.write("                                </button>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </form>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col s2\" id=\"opciones\">\r\n");
      out.write("                <div class=\"center-align\" id=\"btn1\">\r\n");
      out.write("                    <a class=\"btn-floating btn-large waves-effect waves-light\" id=\"compras\"><i id=\"comprastext2\">Mi Tienda</i><i class=\"material-icons\" id=\"comprastext\">store</i></a>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"center-align\" id=\"btn2\">\r\n");
      out.write("                    <a class=\"btn-floating btn-large waves-effect waves-light\" id=\"editar\" onclick=\"mostrarEditar()\"><i id=\"editartext2\">Editar</i><i class=\"material-icons\" id=\"editartext\">create</i></a>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"center-align\" id=\"btn22\">\r\n");
      out.write("                    <a class=\"btn-floating btn-large waves-effect waves-light\" id=\"editar2\" onclick=\"mostrarEditar2()\"><i id=\"editartext4\">Editar</i><i class=\"material-icons\" id=\"editartext3\">arrow_back</i></a>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>      \r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <!--Scripts de Interfaz-->\r\n");
      out.write("        <script>\r\n");
      out.write("            function mostrarEditar() {\r\n");
      out.write("                var x = document.getElementById(\"cardp\");\r\n");
      out.write("                var y = document.getElementById(\"cardpa\");\r\n");
      out.write("                var z = document.getElementById(\"btn2\");\r\n");
      out.write("                var w = document.getElementById(\"btn22\");\r\n");
      out.write("                var u = document.getElementById(\"btn1\");\r\n");
      out.write("                var v = document.getElementById(\"btn3\");\r\n");
      out.write("                x.style.display = \"none\";\r\n");
      out.write("                y.style.display = \"block\";\r\n");
      out.write("                z.style.display = \"none\";\r\n");
      out.write("                w.style.display = \"block\";\r\n");
      out.write("                u.style.display = \"none\";\r\n");
      out.write("                v.style.display = \"none\";\r\n");
      out.write("            }\r\n");
      out.write("            function mostrarEditar2() {\r\n");
      out.write("                var x = document.getElementById(\"cardp\");\r\n");
      out.write("                var y = document.getElementById(\"cardpa\");\r\n");
      out.write("                var z = document.getElementById(\"btn2\");\r\n");
      out.write("                var w = document.getElementById(\"btn22\");\r\n");
      out.write("                var u = document.getElementById(\"btn1\");\r\n");
      out.write("                var v = document.getElementById(\"btn3\");\r\n");
      out.write("                y.style.display = \"none\";\r\n");
      out.write("                x.style.display = \"block\";\r\n");
      out.write("                w.style.display = \"none\";\r\n");
      out.write("                z.style.display = \"block\";\r\n");
      out.write("                u.style.display = \"block\";\r\n");
      out.write("                v.style.display = \"block\";\r\n");
      out.write("            }\r\n");
      out.write("            function mostrarBorrar() {\r\n");
      out.write("                var x = document.getElementById(\"cardp\");\r\n");
      out.write("                var y = document.getElementById(\"cardpb\");\r\n");
      out.write("                var z = document.getElementById(\"btn3\");\r\n");
      out.write("                var w = document.getElementById(\"btn32\");\r\n");
      out.write("                var u = document.getElementById(\"btn1\");\r\n");
      out.write("                var v = document.getElementById(\"btn2\");\r\n");
      out.write("                x.style.display = \"none\";\r\n");
      out.write("                y.style.display = \"block\";\r\n");
      out.write("                z.style.display = \"none\";\r\n");
      out.write("                w.style.display = \"block\";\r\n");
      out.write("                u.style.display = \"none\";\r\n");
      out.write("                v.style.display = \"none\";\r\n");
      out.write("            }\r\n");
      out.write("            function mostrarBorrar2() {\r\n");
      out.write("                var x = document.getElementById(\"cardp\");\r\n");
      out.write("                var y = document.getElementById(\"cardpb\");\r\n");
      out.write("                var z = document.getElementById(\"btn3\");\r\n");
      out.write("                var w = document.getElementById(\"btn32\");\r\n");
      out.write("                var u = document.getElementById(\"btn1\");\r\n");
      out.write("                var v = document.getElementById(\"btn2\");\r\n");
      out.write("                y.style.display = \"none\";\r\n");
      out.write("                x.style.display = \"block\";\r\n");
      out.write("                w.style.display = \"none\";\r\n");
      out.write("                z.style.display = \"block\";\r\n");
      out.write("                u.style.display = \"block\";\r\n");
      out.write("                v.style.display = \"block\";\r\n");
      out.write("            }\r\n");
      out.write("        </script>                \r\n");
      out.write("\r\n");
      out.write("        <!--Import jQuery before materialize.js-->\r\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js\"></script>\r\n");
      out.write("        <script type=\"text/javascript\" src=\"js/materialize.min.js\"></script>\r\n");
      out.write("        <script src=\"js/script.js\"></script>\r\n");
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("\r\n");
      out.write("</html>");
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
