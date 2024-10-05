<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Random" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Juego del Número Secreto</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/numeroSecreto.css"/>
</head>
<body>
    <h1>Juego del Número Secreto</h1>
    <%
        // Generar un nuevo número secreto si no existe en la solicitud
        int numeroSecreto = request.getParameter("numeroSecreto") != null 
                            ? Integer.parseInt(request.getParameter("numeroSecreto"))
                            : new Random().nextInt(100) + 1;

        // Inicializar la lista de intentos
        List<String> intentos = new ArrayList<>();
        String mensaje = ""; 

        // Comprobar si se ha enviado un número
        if (request.getParameter("numero") != null) {
            int numeroUsuario = Integer.parseInt(request.getParameter("numero"));

            // Comparar el número ingresado con el secreto
            if (numeroUsuario == numeroSecreto) {
                mensaje = "¡Felicidades! Has adivinado el número secreto.";
                intentos.add(numeroUsuario + " - Acertado");
                // Generar un nuevo número secreto después de acertar
                numeroSecreto = new Random().nextInt(100) + 1; 
            } else if (numeroUsuario < numeroSecreto) {
                mensaje = "El número que he pensado es mayor.";
                intentos.add(numeroUsuario + " - " + mensaje);
            } else {
                mensaje = "El número que he pensado es menor.";
                intentos.add(numeroUsuario + " - " + mensaje);
            }
        }

        // Obtener intentos de la URL, si existen
        String intentosString = request.getParameter("intentos");
        if (intentosString != null && !intentosString.isEmpty()) {
            for (String intento : intentosString.split(";")) {
                intentos.add(intento);
            }
        }

        // Almacenar los intentos actualizados en la URL para la próxima carga
        String intentosActualizados = String.join(";", intentos);
    %>
    <form method="get">
        <input type="hidden" name="numeroSecreto" value="<%= numeroSecreto %>">
        <input type="hidden" name="intentos" value="<%= intentosActualizados %>">
        <label for="numero">Introduce un número de 1 a 100:</label>
        <input type="number" id="numero" name="numero" min="1" max="100" required>
        <button type="submit">Comprobar</button>
    </form>
    <p><%= mensaje %></p>

    <h2>Intentos</h2>
    <table>
        <thead>
            <tr>
                <th>Número</th>
                <th>Mensaje</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Mostrar los intentos anteriores en formato de tabla
                for (String intento : intentos) {
                    String[] partes = intento.split(" - ");
                    if (partes.length == 2) { // Verificar que se obtienen dos partes
            %>
            <tr>
                <td><%= partes[0] %></td>
                <td><%= partes[1] %></td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
</body>
</html>
