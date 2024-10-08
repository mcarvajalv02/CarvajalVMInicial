<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Resultado de la Conversión</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/calculadoraDeDivisas.css"/>
    </head>
    <body>
        <div id="resultado-contenido">
            <h1>Resultado de la Conversión</h1>

            <%
                // Obtiene los valores del formulario
                double cantidad = Double.parseDouble(request.getParameter("cantidad"));
                String divisaOrigen = request.getParameter("divisa");
                String divisaDestino = request.getParameter("cambio_divisa");

                double tasaEurosADolares = 1.10;
                double tasaEurosAYenes = 130.50;
                double tasaEurosALibras = 0.85;

                double tasaDolaresAEuros = 0.91;
                double tasaDolaresAYenes = 118.60;
                double tasaDolaresALibras = 0.77;

                double tasaYenesAEuros = 0.0077;
                double tasaYenesADolares = 0.0084;
                double tasaYenesALibras = 0.0065;

                double tasaLibrasAEuros = 1.18;
                double tasaLibrasADolares = 1.30;
                double tasaLibrasAYenes = 153.20;

                // Variable para el resultado final
                double resultado = 0.0;

                // Lógica para convertir divisas
                if (divisaOrigen.equals("Euros")) {
                    if (divisaDestino.equals("Dolares")) {
                        resultado = cantidad * tasaEurosADolares;
                    } else if (divisaDestino.equals("Yenes")) {
                        resultado = cantidad * tasaEurosAYenes;
                    } else if (divisaDestino.equals("LibrasEsterlinas")) {
                        resultado = cantidad * tasaEurosALibras;
                    }
                } else if (divisaOrigen.equals("Dolares")) {
                    if (divisaDestino.equals("Euros")) {
                        resultado = cantidad * tasaDolaresAEuros;
                    } else if (divisaDestino.equals("Yenes")) {
                        resultado = cantidad * tasaDolaresAYenes;
                    } else if (divisaDestino.equals("LibrasEsterlinas")) {
                        resultado = cantidad * tasaDolaresALibras;
                    }
                } else if (divisaOrigen.equals("Yenes")) {
                    if (divisaDestino.equals("Euros")) {
                        resultado = cantidad * tasaYenesAEuros;
                    } else if (divisaDestino.equals("Dolares")) {
                        resultado = cantidad * tasaYenesADolares;
                    } else if (divisaDestino.equals("LibrasEsterlinas")) {
                        resultado = cantidad * tasaYenesALibras;
                    }
                } else if (divisaOrigen.equals("LibrasEsterlinas")) {
                    if (divisaDestino.equals("Euros")) {
                        resultado = cantidad * tasaLibrasAEuros;
                    } else if (divisaDestino.equals("Dolares")) {
                        resultado = cantidad * tasaLibrasADolares;
                    } else if (divisaDestino.equals("Yenes")) {
                        resultado = cantidad * tasaLibrasAYenes;
                    }
                }

                // Formateo del resultado
                java.text.DecimalFormat df = new java.text.DecimalFormat("#,###.00");

                // Muestra el resultado
                if (resultado != 0.0) {
            %>
            <p><%= df.format(cantidad)%> <span><%= divisaOrigen%></span> son 
                <%= df.format(resultado)%> <span><%= divisaDestino%></span>.</p>
                <%
                } else {
                %>
            <p>No se pudo realizar la conversión. Por favor, revisa las divisas seleccionadas.</p>
            <%
                }
            %>
            <a href="../html/calculadoraDeDivisas.html">Volver a atrás</a>
            <a href="<%=request.getContextPath()%>">Menú</a>
        </div>
    </body>
</html>
