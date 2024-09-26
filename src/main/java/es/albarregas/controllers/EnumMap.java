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
@WebServlet(name = "EnumMap", urlPatterns = {"/EnumMap"})
public class EnumMap extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EnumMap</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EnumMap at " + request.getContextPath() + "</h1>");
            out.println("<h2>Llamada realizada por el m&eacute;todo " + request.getMethod() + "</h2>");
            out.println("<ul><li>Para volver al men&uacute; <a href=\"index.html\">pulse</a></li></ul>");

            String enviar = request.getParameter("Enviar");
            
            if ("Enumeration".equals(enviar)) {
                Enumeration<String> parametros = request.getParameterNames();
                while (parametros.hasMoreElements()) {
                    String nombre = parametros.nextElement();
                    // Convertir la primera letra en mayúscula
                    String nombreCapitalizado = nombre.substring(0, 1).toUpperCase() + nombre.substring(1);

                    nombreCapitalizado = nombreCapitalizado.replace("_", " ");
                    String[] valores = request.getParameterValues(nombre); // Obtener todos los valores del parámetro
                    if (valores != null) {
                        // Si hay múltiples valores, unirlos con comas
                        String concatenados = String.join(", ", valores);
                        out.println(nombreCapitalizado + ": " + concatenados + "<br>" + "<br>");
                    } else {
                        // Mostrar el valor único
                        out.println(nombreCapitalizado + ": " + request.getParameter(nombre) + "<br>" + "<br>");
                    }
                }
                out.print("Se ha ejecutado con un Enumeration");
            } else if("Map".equals(enviar)){

                Map<String, String[]> parameterMap = request.getParameterMap();
                for (Map.Entry<String, String[]> entry : parameterMap.entrySet()) {
                    String nombre = entry.getKey();
                    // Convertir la primera letra en mayúscula y reemplazar guiones bajos con espacios
                    String nombreCapitalizado = nombre.substring(0, 1).toUpperCase() + nombre.substring(1).replace("_", " ");

                    // Obtener los valores del parámetro
                    String[] valores = entry.getValue();
                    String concatenados = String.join(", ", valores);

                    out.println(nombreCapitalizado + ": " + concatenados + "<br><br>");
                }
                out.print("Se ha ejecutado con un Map");
            }else{
                out.println("<h1>ERROR, tienes que pasar por el formulario</h1>");
            }
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        out.println("<title>Servlet EnumMap</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>ERROR, TIENES QUE PASAR POR EL FORMULARIO</h1>");
        out.println("<ul><li>Para volver al men&uacute; <a href=\"index.html\">pulse</a></li></ul>");
        out.println("</body>");
        out.println("</html>");
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
