<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="es.albarregas.beans.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String accion = request.getParameter("accion");
    String nombreAtributo = request.getParameter("nombreAtributo"); // Obtenemos el nombre del atributo desde el formulario

    StringBuilder mensaje = new StringBuilder();
    Usuario usuario = null;

    if ("Buscar".equals(accion) && nombreAtributo != null && !nombreAtributo.isEmpty()) {
        usuario = (Usuario) session.getAttribute(nombreAtributo); // Buscar el usuario en la sesión
        if (usuario == null) {
            mensaje.append("El atributo de sesión no existe. Puede crear uno nuevo."); // Mensaje si no se encuentra
        } else {
            mensaje.append("Atributo de sesión encontrado.").append(" "); // Mensaje cuando se encuentra el atributo
        }
    } else if ("Modificar".equals(accion)) {
        String nombreUsuario = request.getParameter("nombreUsuario");
        String fechaNacimientoS = request.getParameter("fechaNacimiento");
        String numHijosS = request.getParameter("numHijos");
        String salarioS = request.getParameter("salario");

        // Verificar si algún campo está vacío
        if (nombreUsuario == null || nombreUsuario.isEmpty()
                || fechaNacimientoS == null || fechaNacimientoS.isEmpty()
                || numHijosS == null || numHijosS.isEmpty()
                || salarioS == null || salarioS.isEmpty()
                || nombreAtributo == null || nombreAtributo.isEmpty()) {
            mensaje.append("Todos los campos son obligatorios.");
        } else {
            // Modificar el usuario existente
            usuario = (Usuario) session.getAttribute(nombreAtributo);
            if (usuario != null) {
                usuario.setNombre(nombreUsuario);
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                LocalDate fechaNacimiento = LocalDate.parse(fechaNacimientoS, formatter);
                usuario.setFechaNacimiento(fechaNacimiento);
                usuario.setNumhijos(Integer.parseInt(numHijosS));
                usuario.setSalario(Double.parseDouble(salarioS));

                // Actualizar el atributo en la sesión
                session.setAttribute(nombreAtributo, usuario);
                // Establecer el mensaje de confirmación
                mensaje.append("Atributo de sesión con nombre ").append(nombreAtributo).append(" se ha modificado correctamente.");
            } else {
                mensaje.append("El atributo de sesión no existe.");
            }
        }
    } else if ("Crear".equals(accion)) {
        String nombreUsuario = request.getParameter("nombreUsuario");
        String fechaNacimientoS = request.getParameter("fechaNacimiento");
        String numHijosS = request.getParameter("numHijos");
        String salarioS = request.getParameter("salario");

        // Verificar si algún campo está vacío
        if (nombreUsuario == null || nombreUsuario.isEmpty()
                || fechaNacimientoS == null || fechaNacimientoS.isEmpty()
                || numHijosS == null || numHijosS.isEmpty()
                || salarioS == null || salarioS.isEmpty()
                || nombreAtributo == null || nombreAtributo.isEmpty()) {
            mensaje.append("Todos los campos son obligatorios.");
        } else {
            // Crear un nuevo usuario
            usuario = new Usuario();
            usuario.setNombre(nombreUsuario);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate fechaNacimiento = LocalDate.parse(fechaNacimientoS, formatter);
            usuario.setFechaNacimiento(fechaNacimiento);
            usuario.setNumhijos(Integer.parseInt(numHijosS));
            usuario.setSalario(Double.parseDouble(salarioS));

            // Guardar el nuevo atributo en la sesión
            session.setAttribute(nombreAtributo, usuario);
            // Establecer el mensaje de confirmación
            mensaje.append("El atributo con nombre: ").append(nombreAtributo)
                   .append(" con usuario: ").append(nombreUsuario)
                   .append(" se ha creado correctamente.");
        }
    } else if ("Eliminar".equals(accion)) {
        // Eliminar el atributo de sesión
        usuario = (Usuario) session.getAttribute(nombreAtributo);
        if (usuario != null) {
            session.removeAttribute(nombreAtributo);
            mensaje.append("El atributo de sesión con nombre ").append(nombreAtributo).append(" ha sido eliminado.");
        } else {
            mensaje.append("El atributo de sesión no existe.");
        }
    } else if ("Cancelar".equals(accion)) {
        session.removeAttribute("nombreAtributo");
        session.removeAttribute("nombreUsuario");
        session.removeAttribute("ConfirmarEliminacion");
        // Manejar la acción de cancelar
        mensaje.append("Operación cancelada por el usuario");
    }else if("Inicio".equals(accion)){
        session.invalidate(); // Invalido la sesión
        response.sendRedirect("../index.html");
    }

    // Pasar atributos a menuSession.jsp
    request.setAttribute("mensaje", mensaje.toString());
    request.setAttribute("usuario", usuario); // Puede ser null si no se encontró
    request.setAttribute("nombreAtributo", nombreAtributo); // Pasar nombreAtributo

    // Redirigir a menuSession.jsp para mostrar el resultado
    request.getRequestDispatcher("menuSession.jsp").forward(request, response);
%>
