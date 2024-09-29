package es.albarregas.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PORTATIL
 */
@WebServlet(name = "Validador", urlPatterns = {"/Validador"})
public class Validador extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Validador</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>ERROR, TIENES QUE PASAR POR EL FORMULARIO</h1>");
            out.println("<ul><li>Para volver al men&uacute; <a href=\"index.html\">pulse</a></li></ul>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Inicio variable para controlar errores
            Boolean error = false;
            // Obtengo los parámetros del formulario
            Enumeration<String> parametros = request.getParameterNames();
            // Recorro todos los parámetros y valido si hay errores
            while (parametros.hasMoreElements() && !error) {
                String nombre = parametros.nextElement();

                // Convierto la primera letra en mayúscula
                String nombreCapitalizado = nombre.substring(0, 1).toUpperCase() + nombre.substring(1);

                // Obtengo todos los valores del parámetro
                String[] valores = request.getParameterValues(nombre);

                // Verifico si algún campo obligatorio está vacío
                if ((nombre.equals("nombre") || nombre.equals("apellidos") || nombre.equals("fecha_nacimiento") || nombre.equals("sistema_operativo"))
                        && (valores == null || valores[0].isEmpty())) {
                    error = true;
                    break;
                }

                if (valores != null) {
                    // Si el parámetro tiene múltiples valores (como checkboxes), los concatenamos y los mostramos
                    String concatenados = String.join(", ", valores);
                    out.println(nombreCapitalizado + ": " + concatenados + "<br><br>");
                } else {
                    // Si es un valor único, lo mostramos
                    out.println(nombreCapitalizado + ": " + request.getParameter(nombre) + "<br><br>");
                }
            }

            // Si se detecta un error, muestro el formulario con un mensaje de error y con el formulario de nuevo.
            if (error) {
                StringBuilder htmlResponse = new StringBuilder();
                htmlResponse.append("<!DOCTYPE html>");
                htmlResponse.append("<html>");
                htmlResponse.append("<head>");
                htmlResponse.append("<title>Servlet Validador</title>");
                htmlResponse.append("</head>");
                htmlResponse.append("<body>");
                htmlResponse.append("<form action='Validador' method='POST'>");

                htmlResponse.append("<label>Nombre: </label>");
                htmlResponse.append("<input type='text' name='nombre' value=''/>");
                htmlResponse.append("<br><br>");

                htmlResponse.append("<label>Apellidos: </label>");
                htmlResponse.append("<input type='text' name='apellidos' value=''/>");
                htmlResponse.append("<br><br>");

                htmlResponse.append("<label>Fecha de nacimiento: </label>");
                htmlResponse.append("<input type='date' id='fecha' name='fecha_nacimiento' value=''/>");
                htmlResponse.append("<br><br>");

                htmlResponse.append("<label>Sistema operativo: </label>");
                htmlResponse.append("<select name='sistema_operativo' id='lt1'>");
                htmlResponse.append("<option value='0' selected disabled>Elige uno...</option>");
                htmlResponse.append("<option value='Windows'>Windows</option>");
                htmlResponse.append("<option value='Linux'>Linux</option>");
                htmlResponse.append("<option value='Mac'>Mac</option>");
                htmlResponse.append("<option value='Ubuntu'>Ubuntu</option>");
                htmlResponse.append("</select>");
                htmlResponse.append("<br><br>");

                htmlResponse.append("<label>G&eacute;nero: </label><br>");
                htmlResponse.append("<input type='radio' value='Mujer' name='sexo'/>&nbsp;&nbsp; Mujer<br>");
                htmlResponse.append("<input type='radio' value='Hombre' name='sexo'/>&nbsp;&nbsp; Hombre<br>");
                htmlResponse.append("<input type='radio' value='Otro' name='sexo'/>&nbsp;&nbsp; Otro<br>");
                htmlResponse.append("<br>");

                htmlResponse.append("<input type='submit' name='enviar'/>");
                htmlResponse.append("</form>");

                htmlResponse.append("<h3>¡Error! Faltan campos por rellenar correctamente.</h3>");
                htmlResponse.append("</body>");
                htmlResponse.append("</html>");

                out.println(htmlResponse.toString());
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
