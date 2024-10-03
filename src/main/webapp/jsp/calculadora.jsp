<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculadora</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/calculadora.css"/>
    </head>
    <body>
        
        <%!
            public int sumar(int num1, int num2) {
                return num1 + num2;
            }
            public int restar(int num1, int num2) {
                return num1 - num2;
            }
            public int multiplicar(int num1, int num2) {
                return num1 * num2;
            }
            public int dividir(int num1, int num2) {
                return num1 / num2;
            }
        %>

        <div id="contenido">
            <!-- Título y fecha -->
            <h2>Calculadora</h2>
            

            <% 
                StringBuilder mensaje = new StringBuilder("");
                int resultado = 0;
                String operacion = request.getParameter("operacion");

                if (request.getParameter("num1") != null && request.getParameter("num2") != null && operacion != null) {
                    try {
                        int num1 = Integer.parseInt(request.getParameter("num1"));
                        int num2 = Integer.parseInt(request.getParameter("num2"));

                        switch (operacion) {
                            case "suma":
                                resultado = sumar(num1, num2);
                                mensaje.append("Resultado: " + resultado);
                                break;
                            case "restar":
                                resultado = restar(num1, num2);
                                mensaje.append("Resultado: " + resultado);
                                break;
                            case "multiplicar":
                                resultado = multiplicar(num1, num2);
                                mensaje.append("Resultado: " + resultado);
                                break;
                            case "dividir":
                                if (num2 != 0) {
                                    resultado = dividir(num1, num2);
                                    mensaje.append("Resultado: " + resultado);
                                } else {
                                    mensaje.append("No se puede dividir por cero.");
                                }
                                break;
                            default:
                                mensaje.append("Operación no válida.");
                        }
                    } catch (NumberFormatException e) {
                        mensaje.append("Por favor ingrese números válidos.");
                    }
                }
            %>

            <!-- Mostrar el resultado -->
            <p><%= mensaje.toString() %></p>

            <!-- Formulario de la calculadora -->
            <form action="calculadora.jsp" method="post">
                <table>
                    <tr>
                        <td><label>Primer número: </label></td>
                        <td><input type="text" name="num1"/></td>
                    </tr>
                    <tr>
                        <td><label>Segundo número: </label></td>
                        <td><input type="text" name="num2"/></td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="operacion" value="suma" checked/> Sumar</td>
                        <td><input type="radio" name="operacion" value="restar"/> Restar</td>
                        <td><input type="radio" name="operacion" value="multiplicar"/> Multiplicar</td>
                        <td><input type="radio" name="operacion" value="dividir"/> Dividir</td>
                    </tr>
                </table>

                <!-- Botones de operación -->
                <div class="botones">
                    <input type="submit" name="enviar" value="Enviar"/>
                    <input type="reset" name="restablecer" value="Restablecer"/>
                </div>
            </form>
        </div>
    </body>
</html>
