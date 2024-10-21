<%@page import="es.albarregas.beans.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Control de Sesiones</title>
    <link rel="stylesheet" type="text/css" href="../css/menuSession.css">
</head>
<body>
    <h2>Control de Sesiones</h2>
    <div class="formulario">
        <% 
            String mensaje = (String) request.getAttribute("mensaje");
            String nombreAtributo = (String) request.getAttribute("nombreAtributo");
            Usuario usuario = (Usuario) request.getAttribute("usuario");
            String accionConfirmar = request.getParameter("accionConfirmar");
        %>
        <% if (mensaje != null) { %>
            <div class="mensaje">
                <p><%= mensaje %></p>
            </div>
        <% } %>
        <div class="busqueda">
            <form action="controlSession.jsp" method="post">
                <fieldset>
                    <legend>Atributo de sesión</legend>
                    <label for="nombreAtributo">Nombre </label>
                    <input type="text" name="nombreAtributo" id="nombreAtributo" placeholder="Ej. atributo" value="<%= nombreAtributo != null ? nombreAtributo : "" %>">
                    <input type="submit" name="accion" value="Buscar">
                </fieldset>
            </form>
        </div>
        <% if (usuario != null) { %>
            <!-- Formulario para modificar un atributo existente -->
            <div class="resultado">
                <form action="controlSession.jsp" method="post">
                    <fieldset>
                        <legend>Datos del atributo de sesión</legend>
                        <input type="hidden" name="nombreAtributo" value="<%= nombreAtributo %>">
                        <label for="nombreUsuario">Nombre: </label>
                        <input type="text" name="nombreUsuario" id="nombreUsuario" value="<%= usuario.getNombre() %>">
                        <label for="fechaNacimiento">Fecha de nacimiento: </label>
                        <input type="date" name="fechaNacimiento" id="fechaNacimiento" value="<%= usuario.getFechaNacimiento() %>">
                        <label for="numHijos">Número de hijos: </label>
                        <input type="number" name="numHijos" id="numHijos" value="<%= usuario.getNumhijos() %>">
                        <label for="salario">Salario: </label>
                        <input type="number" name="salario" id="salario" step="0.01" value="<%= usuario.getSalario() %>">
                        <div class="acciones">
                            <input type="submit" name="accion" value="Modificar">
                            <input type="submit" name="accionConfirmar" value="Eliminar">
                            <input type="reset" value="Cancelar">
                            <input type="button" name="accion" value="Inicio" onclick="window.location.href='<%=request.getContextPath()%>/index.html'">
                        </div>
                        <% 
                            if ("Eliminar".equals(accionConfirmar) && nombreAtributo != null) { 
                        %>
                            <!-- Confirmación de eliminación -->
                            <div class="confirmacion">
                                <p>¿Está seguro de que desea eliminar el atributo de sesión '<%= nombreAtributo %>'?</p>
                                <input type="hidden" name="nombreAtributo" value="<%= nombreAtributo %>">
                                <button type="submit" name="accionConfirmar" value="ConfirmarEliminacion">Confirmar</button>
                                <button type="submit" name="accion" value="Cancelar">Cancelar</button>
                            </div>
                        <% } %>
                    </fieldset>
                </form>
            </div>
        <% } else if (mensaje != null && mensaje.contains("Puede crear uno nuevo")) { %>
            <!-- Formulario para crear un nuevo atributo de sesión -->
            <div class="resultado">
                <fieldset>
                    <legend>Crear nuevo atributo de sesión</legend>
                    <form action="controlSession.jsp" method="post">
                        <input type="hidden" name="nombreAtributo" value="<%= nombreAtributo %>">
                        <label for="nombreUsuario">Nombre: </label>
                        <input type="text" name="nombreUsuario" id="nombreUsuario" placeholder="Ej. Juan Pérez">
                        <label for="fechaNacimiento">Fecha de nacimiento: </label>
                        <input type="date" name="fechaNacimiento" id="fechaNacimiento">
                        <label for="numHijos">Número de hijos: </label>
                        <input type="number" name="numHijos" id="numHijos" placeholder="Ej. 2">
                        <label for="salario">Salario: </label>
                        <input type="number" name="salario" id="salario" step="0.01" placeholder="Ej. 1500.00">
                        <div class="acciones">
                            <input type="submit" name="accion" value="Crear">
                            <input type="reset" name="accion" value="Cancelar">
                            <input type="button" name="accion" value="Inicio" >
                        </div>
                    </form>
                </fieldset>
            </div>
        <% } %>
    </div>
</body>
</html>
