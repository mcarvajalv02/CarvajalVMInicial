<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Cookie cookie = null;
    boolean existe = false; 
    int contVisitas = 0;
    boolean mostrarInfo = false; // Bandera para mostrar la información de la cookie

    // Obtener todas las cookies del request
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("CONTADOR")) {
                cookie = cookies[i];
                try {
                    String decodedValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
                    contVisitas = Integer.parseInt(decodedValue);
                    contVisitas++; // Incrementar el contador
                    existe = true;
                } catch (NumberFormatException e) {
                    // Si el valor de la cookie no es un número válido, reiniciar contVisitas
                    contVisitas = 1;
                }
                break;
            }
        }
    }

    // Manejar el botón de eliminar
    String accion = request.getParameter("accion");
    if ("Eliminar".equals(accion) && cookie != null) {
        // Eliminar la cookie estableciendo su tiempo de vida en 0
        cookie.setMaxAge(0);
        cookie.setPath("/");  // Asegurarse de que el path coincida
        response.addCookie(cookie);
        contVisitas = 0; // Reiniciar el contador
        mostrarInfo = true; // Mostrar la información de la cookie eliminada
    } else {
        // Si no se está eliminando, actualizar la cookie con el nuevo valor
        if (cookie == null) {
            contVisitas = 1; // Inicializar el contador si no existe la cookie
            cookie = new Cookie("CONTADOR", URLEncoder.encode(Integer.toString(contVisitas), "UTF-8"));
            cookie.setPath("/"); // Establecer el path para la cookie
        } else {
            cookie.setValue(URLEncoder.encode(Integer.toString(contVisitas), "UTF-8"));
        }
        cookie.setMaxAge(3600); // Vida de la cookie: 1 hora
        response.addCookie(cookie);
    }

    // Construir el mensaje para mostrar cuántas veces se ha visitado la página
    StringBuilder persona = new StringBuilder();
    if (existe && contVisitas > 1) {
        persona.append("Has visitado la página ").append(contVisitas).append(" veces");
    } else {
        persona.append("Has visitado la página ").append(contVisitas).append(" vez");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/contadorVisitas.css"/>
        <title>Contador de visitas</title>
    </head>
    <body>
        <div class="container">
            <h1><%=persona.toString()%></h1>

            <% if (mostrarInfo) { %>
                <div class="cookie-info">
                    <h2>Información de la cookie</h2>
                    <p><strong>Caducidad:</strong> 3600 segundos</p>
                    <p><strong>Nombre:</strong> CONTADOR</p>
                    <p><strong>Segura:</strong> false</p>
                    <p><strong>Versión:</strong> 0</p>
                </div>
            <% } %>

            <form method="post" class="buttons-form">
                <input type="submit" value="Recargar" name="accion" class="button" />
                <input type="submit" value="Eliminar" name="accion" class="button" />
                <a href="<%=request.getContextPath()%>" class="button link">Menú inicial</a>
            </form>
        </div>
    </body>
</html>
