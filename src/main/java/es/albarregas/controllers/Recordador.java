package es.albarregas.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PORTATIL
 */
@WebServlet(name = "Recordador", urlPatterns = {"/Recordador"})
public class Recordador extends HttpServlet {

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

        // Verificar si existe el parámetro "error" en la solicitud
        String error = request.getParameter("error");

        try (PrintWriter out = response.getWriter()) {
            StringBuilder htmlform = new StringBuilder();

            htmlform.append("<!DOCTYPE html>");
            htmlform.append("<html>");
            htmlform.append("<head>");
            htmlform.append("<title>Recordador</title>");
            htmlform.append("</head>");
            htmlform.append("<body>");

            // Mostrar el mensaje de error si el parámetro está presente
            if (error != null && error.equals("true")) {
                htmlform.append("<h3>¡Error! Faltan campos por rellenar correctamente.</h3>");
            }

            // Generar el formulario usando .append()
            htmlform.append("<form action='Recordador' method='POST'>");

            htmlform.append("<label>Nombre: </label>");
            htmlform.append("<input type='text' name='nombre' value=''/>");
            htmlform.append("<br><br>");

            htmlform.append("<label>Apellidos: </label>");
            htmlform.append("<input type='text' name='apellidos' value=''/>");
            htmlform.append("<br><br>");

            htmlform.append("<label>Fecha de nacimiento: </label>");
            htmlform.append("<input type='date' id='fecha' name='fecha_nacimiento' value=''/>");
            htmlform.append("<br><br>");

            htmlform.append("<label>Domicilio: </label>");
            htmlform.append("<input type='text' id='fecha' name='domicilio' value=''/>");
            htmlform.append("<br><br>");
            
            htmlform.append("<input type='submit' name='primera' value='Enviar'/>");
            htmlform.append("</form>");

            htmlform.append("</body>");
            htmlform.append("</html>");

            out.println(htmlform.toString());
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
        Boolean error = false;

        if (request.getParameter("primera") == null) {
            StringBuilder htmlform = new StringBuilder();
            PrintWriter out = response.getWriter();
            htmlform.append("<form action='Recordador' method='POST'>");

            htmlform.append("<label>Nombre: </label>");
            htmlform.append("<input type='text' name='nombre' value='")
                    .append(request.getParameter("nombre") + "'/>");

            htmlform.append("<label>Apellidos: </label>");
            htmlform.append("<input type='text' name='apellidos' value='")
                    .append(request.getParameter("apellidos") + "'/>");
            htmlform.append("<br><br>");

            htmlform.append("<label>Fecha de nacimiento: </label>");
            htmlform.append("<input type='text' name='fecha_nacimiento' value='")
                    .append(request.getParameter("fecha_nacimiento") + "'/>");
            htmlform.append("<br><br>");

            htmlform.append("<label>Domicilio: </label>");
            htmlform.append("<input type='text' name='domicilio' value='")
                    .append(request.getParameter("domicilio") + "'/>");
            htmlform.append("<br><br>");


            
            htmlform.append("<input type='submit' name='enviar' value='Enviar'/>");
            htmlform.append("</form>");

            htmlform.append("</body>");
            htmlform.append("</html>");

            out.println(htmlform.toString());

        } else {
            // Recorro todos los parámetros y valido si hay errores
            Enumeration<String> parametros = request.getParameterNames();
            while (parametros.hasMoreElements() && !error) {
                String nombre = parametros.nextElement();
                String[] valores = request.getParameterValues(nombre);

                // Verifico si algún campo obligatorio está vacío
                if ((nombre.equals("nombre") || nombre.equals("apellidos") || nombre.equals("fecha_nacimiento") || nombre.equals("sistema_operativo"))
                        && (valores == null || valores[0].isEmpty())) {
                    error = true;
                    break;
                }
            }

            // Si hay error, redirijo al método GET con el mensaje de error
            if (error) {
                PrintWriter out = response.getWriter();
                out.println("<h1>ERROR EN EL FORMULARIO, ESTÁ INCOMPLETO</h1>");
                out.println("<br><form action='Recordador' method='GET'>");
                out.println("<input type='submit' value='Enviar'/>");
                out.println("</form>");
            } else {
                try (PrintWriter out = response.getWriter()) {
                    // Si no hay error, continúo procesando y mostrando los valores del formulario
                    StringBuilder htmlResponse = new StringBuilder();

                    htmlResponse.append("<!DOCTYPE html>");
                    htmlResponse.append("<html>");
                    htmlResponse.append("<head>");
                    htmlResponse.append("<title>Formulario Correcto</title>");
                    htmlResponse.append("</head>");
                    htmlResponse.append("<body>");
                    htmlResponse.append("<ul>");

                    // Mostrar los valores del formulario
                    for (String nombre : request.getParameterMap().keySet()) {
                        String[] valores = request.getParameterValues(nombre);
                        String concatenados = String.join(", ", valores);
                        htmlResponse.append("<li>").append(nombre).append(": ").append(concatenados).append("</li>");
                    }

                    htmlResponse.append("</ul>");
                    htmlResponse.append("</body>");
                    htmlResponse.append("</html>");

                    out.println(htmlResponse.toString());
                }
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
