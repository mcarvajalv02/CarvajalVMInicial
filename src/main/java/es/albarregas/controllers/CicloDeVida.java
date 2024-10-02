package es.albarregas.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CicloDeVida", urlPatterns = {"/CicloDeVida"})
public class CicloDeVida extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
        System.out.println("Servlet CicloDeVida inicializado"); // Mensaje al iniciar el servlet
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            doGet(request, response);
    }

    @Override
    public void destroy() {
        super.destroy();
        System.out.println("Servlet CicloDeVida destruido"); // Mensaje cuando el servlet es destruido
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
