<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/menuCookie.css"/>
        <title>Cookie</title>
    </head>
    <body>
        <div>
            <h1>Menú Cookie</h1>
            <form action="menuCookieJava.jsp" method="post">

                <label for="usuario">Usuario:</label>
                <input type="text" id="usuario" name="usuario"><br><br>

                <label for="valor">Valor:</label>
                <input type="password" id="valor" name="valor" value=""><br><br> <!-- Cambiado a 'valor' -->

                <div class="button-container">
                    <input type="submit" name="Crear" value="Crear">
                    <input type="submit" name="Visualizar" value="Visualizar">
                    <input type="submit" name="Modificar" value="Modificar">
                    <input type="submit" name="Eliminar" value="Eliminar">
                    <input type="submit" name="Indice" value="Volver"
                </div>
                <p><a href="../index.html">Indice</a></p>

            </form>
            
            <p>
                <%= request.getParameter("mensaje") != null ? request.getParameter("mensaje") : "" %>
            </p>
            
        </div>
    </body>
</html>
