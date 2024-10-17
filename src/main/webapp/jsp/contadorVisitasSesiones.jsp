<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    session = request.getSession();
    Integer contVisitas = (Integer) session.getAttribute("CONTADOR");
    
    if (contVisitas == null) {
        contVisitas = 1; 
    } else {
        contVisitas++; // Incrementar el contador
    }

    // Manejo el checkbox de eliminar
    String eliminarSesion = request.getParameter("eliminarSesion");
    if (eliminarSesion != null) {
        session.removeAttribute("CONTADOR");
        contVisitas = 0; // Reiniciar el contador
    } else {
        // Si no se está eliminando, actualizar el atributo "CONTADOR" en la sesión
        session.setAttribute("CONTADOR", contVisitas);
    }

    // Mensaje para decir cuantas veces has visitado la página
    String mensaje = "Has visitado la página " + contVisitas + (contVisitas > 1 ? " veces" : " vez");
%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/contadorVisitasSesiones.css"/>
    <title>Contador de visitas</title>
</head>
<body>
    <div class="container">
        <h1><%=mensaje%></h1>
        <form method="post" class="buttons-form">
            <input type="checkbox" name="eliminarSesion" id="eliminarSesion"/>
            <label for="eliminarSesion">Eliminar sesión</label><br><br>
            <input type="submit" value="Recargar" name="accion" class="button"/>
            <a href="<%=request.getContextPath()%>" class="button link">Menú inicial</a>
        </form>
    </div>
</body>
</html>
