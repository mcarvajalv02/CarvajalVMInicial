<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // Leer la cookie del usuario
    String usuarioRecordado = "";
    javax.servlet.http.Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (javax.servlet.http.Cookie cookie : cookies) {
            if (cookie.getName().equals("usuario")) {
                usuarioRecordado = cookie.getValue();
            }
        }
    }

    // Recoger los parámetros del formulario
    String usuario = request.getParameter("usuario");
    String contrasena = request.getParameter("contrasena");
    String recordar = request.getParameter("recordar");

    // Si el formulario ha sido enviado
    if (usuario != null && contrasena != null) {
        if ("recordar".equals(recordar)) {
            // Crear una cookie para el usuario
            javax.servlet.http.Cookie cookie = new javax.servlet.http.Cookie("usuario", usuario);
            cookie.setMaxAge(3600);
            response.addCookie(cookie);
        } else {
            // Si no se selecciona 'Recordar usuario', borrar la cookie
            javax.servlet.http.Cookie cookie = new javax.servlet.http.Cookie("usuario", "");
            cookie.setMaxAge(0); // Expira la cookie
            response.addCookie(cookie);
        }
        // Borrar el campo de la contraseña
        contrasena = "";
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Proceso de Identificación</title>
</head>
<body>
    <form method="post">
        <fieldset>
            <legend>Proceso de identificación</legend>
            <label for="usuario">Usuario:</label>
            <input type="text" id="usuario" name="usuario" value="<%= usuarioRecordado %>"><br><br>

            <label for="contrasena">Contraseña:</label>
            <input type="password" id="contrasena" name="contrasena" value=""><br><br>

            <input type="checkbox" id="recordar" name="recordar" <%= usuarioRecordado.isEmpty() ? "" : "checked" %>>
            <label for="recordar">Recordar usuario</label><br><br>

            <input type="submit" value="Enviar">
            <input type="reset" value="Reset">
        </fieldset>
    </form>
</body>
</html>
