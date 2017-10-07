package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class iniciar_002dsesion_002dcliente_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\" style=\"overflow-y: hidden\">\r\n");
      out.write("    <head>\r\n");
      out.write("        <!--Import Google Icon Font-->\r\n");
      out.write("        <link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">\r\n");
      out.write("        <!--Import materialize.css-->\r\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\" />\r\n");
      out.write("        <link type=\"text/css\" rel=\"stylesheet\" href=\"css/materialize.css\"/>\r\n");
      out.write("\r\n");
      out.write("        <meta charset=\"UTF-8\">\r\n");
      out.write("        <title>Iniciar Sesión</title>\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <body id=\"cuerpo\">\r\n");
      out.write("        <nav class=\"pushpin-nav\" data-target=\"primera\">\r\n");
      out.write("            <div class=\"nav-wrapper lime darken-1\">\r\n");
      out.write("                <div class=\"col s12\">\r\n");
      out.write("                    <div id=\"principal-nav\">\r\n");
      out.write("                        <a href=\"index.jsp\" class=\"brand-logo center\"><i class=\"material-icons\">shopping_basket</i>MallBIT</a>\r\n");
      out.write("                        <a href=\"#\" data-activates=\"mobile-demo\" class=\"button-collapse\"><i class=\"material-icons\">menu</i></a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </nav>\r\n");
      out.write("        <div class=\"block\" id=\"blockrc\">\r\n");
      out.write("            <div class=\"card-panel\">\r\n");
      out.write("                <form action=\"ControladorCliente\" method=\"post\">\r\n");
      out.write("                    <input type=\"hidden\" name=\"instruccion\" value=\"validarCliente\">\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <div class=\"col s10\">\r\n");
      out.write("                            <p style=\"font-size: 30px\" id=\"titleis\">Inicio de sesión</p>\r\n");
      out.write("                            <p style=\"font-size: 15px\" id=\"subtitleis\">Acceder como cliente a MallBIT</p><br>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"col s1\">\r\n");
      out.write("                            <i class=\"material-icons left\" id=\"personas\">people</i>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"input-field\">\r\n");
      out.write("                        <input id=\"usuario\" type=\"text\" name=\"usuario\" class=\"validate\">\r\n");
      out.write("                        <label for=\"usuario\">Usuario</label>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"input-field\">\r\n");
      out.write("                        <input id=\"contraseña\" type=\"password\" name=\"password\" class=\"validate\">\r\n");
      out.write("                        <label for=\"contraseña\">Contraseña</label>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"center-align\">\r\n");
      out.write("                        <button class=\"waves-effect waves-light btn lime lighten-2 black-text\" type=\"submit\">Iniciar sesión</button>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </form>\r\n");
      out.write("                <br>\r\n");
      out.write("                ");
 String estado = (String) request.getAttribute("RESULTADO"); 
      out.write("\r\n");
      out.write("                ");
 if (estado == "incorrecto") {
      out.write("\r\n");
      out.write("                <div class=\"center-align\">\r\n");
      out.write("                    <style>\r\n");
      out.write("                        #usuario,#contraseña{\r\n");
      out.write("                            border-color: red;\r\n");
      out.write("                        }\r\n");
      out.write("                    </style>\r\n");
      out.write("                    <p style=\"color: red\">Usuario o Contraseña Incorrectos</p>\r\n");
      out.write("                </div>\r\n");
      out.write("                ");
 } else {
      out.write("\r\n");
      out.write("                ");
 if (estado == "indefinido") {
      out.write("\r\n");
      out.write("                <style>\r\n");
      out.write("                    #register{\r\n");
      out.write("                        font-size: 18px;\r\n");
      out.write("                        text-decoration: underline;\r\n");
      out.write("                    }\r\n");
      out.write("                </style>\r\n");
      out.write("                ");
 }
      out.write("\r\n");
      out.write("                ");
 }
      out.write("\r\n");
      out.write("                <div class=\"center-align\" id=\"register\">\r\n");
      out.write("                    ¿No tienes una cuenta?\r\n");
      out.write("                    <a href=\"ControladorGenero?instruccion=generoCliente\">\r\n");
      out.write("                        Regístrate\r\n");
      out.write("                    </a>\r\n");
      out.write("                </div>\r\n");
      out.write("                <br>\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <!--Import jQuery before materialize.js-->\r\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js\"></script>\r\n");
      out.write("        <script type=\"text/javascript\" src=\"js/materialize.min.js\"></script>\r\n");
      out.write("        <script src=\"js/script.js\"></script>\r\n");
      out.write("    </body>\r\n");
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
