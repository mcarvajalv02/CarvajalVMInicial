<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.Cookie"%>

<%
    String usuario = request.getParameter("usuario");
    String valor = request.getParameter("valor");
    String mensaje = "";

    if (request.getParameter("Crear") != null) {
        // Crear la cookie
        if (usuario != null && valor != null ) {
            Cookie userCookie = new Cookie(usuario, valor);
            userCookie.setMaxAge(3600); // 1 hora de duración
            response.addCookie(userCookie);
            mensaje = "La cookie "+ usuario + " con valor " + valor + " creada con éxito.";
        } else {
            mensaje = "Usuario o valor no pueden estar vacíos.";
        }
    } else if (request.getParameter("Visualizar") != null) {
        // Visualizar la cookie
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(usuario)) {
                    mensaje = "La cookie " + usuario + " tiene un valor de " + cookie.getValue();
                    break;
                }
            }
            if (mensaje.isEmpty()) {
                mensaje = "No se encontró la cookie.";
            }
        } else {
            mensaje = "No hay cookies disponibles.";
        }
    } else if (request.getParameter("Modificar") != null) {
        // Modificar la cookie
        if (usuario != null && !usuario.isEmpty() && valor != null && !valor.isEmpty()) {
            Cookie userCookie = new Cookie(usuario, valor);
            userCookie.setMaxAge(3600); // 1 hora de duración
            response.addCookie(userCookie);
            mensaje = "Cookie modificada con éxito.";
        } else {
            mensaje = "Usuario o valor no pueden estar vacíos.";
        }
    } else if (request.getParameter("Eliminar") != null) {
        // Eliminar la cookie
        Cookie userCookie = new Cookie(usuario, "");
        userCookie.setMaxAge(0); // Expirar la cookie
        response.addCookie(userCookie);
        mensaje = "Cookie eliminada con éxito.";
    }

    // Redirigir a menuCookie.jsp con el mensaje
    response.sendRedirect("menuCookie.jsp?mensaje=" + java.net.URLEncoder.encode(mensaje, "UTF-8"));
%>
