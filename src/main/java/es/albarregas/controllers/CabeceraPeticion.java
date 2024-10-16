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
@WebServlet(name = "CabeceraPeticion", urlPatterns = {"/CabeceraPeticion"})
public class CabeceraPeticion extends HttpServlet {

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
            out.println("<title>Servlet CabeceraPeticion</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CabeceraPeticion at " + request.getContextPath() + "</h1>");
            out.println("<h2>Llamada realizada por el m&eacute;todo " + request.getMethod() + "</h2>");
            out.println("<ul><li>Para volver al men&uacute; <a href=\"index.html\">pulse</a></li></ul>");
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
            out.println("<title>Cabeceras de Petición</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h2>Cabeceras de la petición</h2>");
            out.println("<ul>");

            // Obtener todas las cabeceras y mostrarlas
            Enumeration<String> headerNames = request.getHeaderNames();
            while (headerNames.hasMoreElements()) {
                String headerName = headerNames.nextElement();
                String headerValue = request.getHeader(headerName);
                out.println("<li><b>" + headerName + ":</b> " + headerValue + "</li>");
            }

            out.println("</ul>");
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
        return "Servlet para mostrar las cabeceras de la petición HTTP";
    }
}
