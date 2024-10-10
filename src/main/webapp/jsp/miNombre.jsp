<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Cookie cookie = null;
    Boolean existe = false;

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("nombreConCookie")) {
                cookie = cookies[i];
                break;
            }
        }
    }
    if (cookie == null) {
        cookie = new Cookie("nombreConCookie", URLEncoder.encode("Miguel Carvajal Velázquez", "UTF-8"));
    } else {
        existe = Boolean.TRUE;
    }

    cookie.setMaxAge(3600);
    response.addCookie(cookie);

    StringBuilder persona = new StringBuilder();
    if (existe) {
        persona.append("Hola ").append(URLDecoder.decode(cookie.getValue(), "UTF-8"));
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nombre</title>
    </head>
    <body>
        <h1><%=persona.toString()%> </h1>
        <form action="niNombre.jsp" method="post">
            <span class="botones"><input type="submit" value="Recargar" name="recarga"/></span>
            <a href="<%=request.getContextPath()%>">Menú</a>>
            
        </form>
    </body>
</html>
