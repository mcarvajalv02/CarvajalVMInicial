<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // Leer la cookie del usuario
    String usuarioRecordado = "";
    
    // Recoger los parámetros del formulario
    String usuario = request.getParameter("usuario");
    String contrasena = request.getParameter("contrasena");
    String recordar = request.getParameter("recordar");

    // Procesar la lógica solo si se ha enviado el formulario
    if (usuario != null && contrasena != null) {
        if ("recordar_usuario" != null) {
            // Si se selecciona 'Recordar usuario', crear o actualizar la cookie
            Cookie cookie = new Cookie("usuario", usuario);
            cookie.setMaxAge(3600); // 1 hora
            response.addCookie(cookie);
            usuarioRecordado = usuario; // Actualizamos el valor en la sesión actual
        } else {
            // Si no se selecciona 'Recordar usuario', eliminar la cookie
            Cookie cookie = new Cookie("usuario", "");
            cookie.setMaxAge(0); // Expira la cookie inmediatamente
            response.addCookie(cookie);
            usuarioRecordado = ""; // Limpiar el nombre de usuario recordado
        }
        // Limpiar la contraseña por seguridad
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
            <!-- Prellenar el campo usuario solo si hay un nombre recordado -->
            <input type="text" id="usuario" name="usuario" value="<%= usuarioRecordado %>"><br><br>

            <label for="contrasena">Contraseña:</label>
            <input type="password" id="contrasena" name="contrasena" value=""><br><br>

            <input type="checkbox" id="recordar" name="recordar" value="recordar_usuario" <%= !usuarioRecordado.isEmpty() ? "checked" : "" %>>
            <label for="recordar">Recordar usuario</label><br><br>

            <input type="submit" value="Enviar">
            <a href="<%=request.getContextPath()%>">Inicio</a>
        </fieldset>
    </form>
</body>
</html>
