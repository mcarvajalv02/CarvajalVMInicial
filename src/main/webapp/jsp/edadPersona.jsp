<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Resultado de la Edad</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/edadPersona.css"/>

    </head>
    <body>
        <%
            String nombre = request.getParameter("nombre");
            String fechaNacimientoStr = request.getParameter("fechaNacimiento");
            StringBuilder mensaje = new StringBuilder("");

            // Convertir la fecha de nacimiento a LocalDate
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate fechaNacimiento = LocalDate.parse(fechaNacimientoStr, formatter);

            // Obtener la fecha actual
            LocalDate hoy = LocalDate.now();

            // Inicializar los años, meses y días
            int años = hoy.getYear() - fechaNacimiento.getYear();
            int meses = hoy.getMonthValue() - fechaNacimiento.getMonthValue();
            int dias = hoy.getDayOfMonth() - fechaNacimiento.getDayOfMonth();

            if (fechaNacimiento.getYear() == hoy.getYear() && fechaNacimiento.getMonth() == hoy.getMonth() && fechaNacimiento.getDayOfMonth() == hoy.getDayOfMonth()) {
                mensaje.append("Hola " + nombre + ", " + " has nacido hoy.");
            } else if (fechaNacimiento.isAfter(hoy)) {
                mensaje.append("Hola " + nombre + ", " + " no has nacido todavía.");
            }
            if (meses <= 12 && meses > 1) {
                mensaje.append("Hola " + nombre + ", " + " tienes " + meses + " meses.");
            } else if (meses == 1) {
                mensaje.append("Hola " + nombre + ", " + " tienes " + meses + " mes.");
            }
            
            if (dias < 0) {
               meses --;     
            }else if (dias <= 30 || dias <= 31 && dias > 1) {
                mensaje.append("Hola " + nombre + ", " + " tienes " + dias + " dias.");
            } else if (dias == 1) {
                mensaje.append("Hola " + nombre + ", " + " tienes " + dias + " dia.");
            }
        %>
        <div id="contenido">
            <h1><%= mensaje.toString()%></h1>
            <p><a href="<%=request.getContextPath()%>">Volver al menú</a></p>
        </div>
    </body>
</html>
