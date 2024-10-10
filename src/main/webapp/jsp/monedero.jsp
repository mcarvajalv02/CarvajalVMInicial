<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultado del Cambio</title>
    <link rel="stylesheet" href="css/monedero.css"/>
</head>
<body>
    <div>
        <h1>Resultado del Cambio en Euros</h1>
        <%
            // Obtener los valores del formulario
            double precioProducto = Double.parseDouble(request.getParameter("precioProducto"));
            double dineroEntregado = Double.parseDouble(request.getParameter("dineroEntregado"));
            double cambio = dineroEntregado - precioProducto;

            // Mostrar mensaje si el dinero entregado es insuficiente
            if (cambio < 0) {
                out.println("<p>Dinero entregado insuficiente.</p>");
            } else {
                // Variables para contar los billetes
                int billetes500 = 0, billetes200 = 0, billetes100 = 0, billetes50 = 0, billetes20 = 0, billetes10 = 0, billetes5 = 0;
                // Variables para contar las monedas
                int monedas2euro = 0, monedas1euro = 0, monedas50cts = 0, monedas20cts = 0, monedas10cts = 0, monedas5cts = 0, monedas2cts = 0, monedas1cts = 0;

                // Calcular la cantidad de billetes y monedas
                billetes500 = (int) (cambio / 500); cambio %= 500;
                billetes200 = (int) (cambio / 200); cambio %= 200;
                billetes100 = (int) (cambio / 100); cambio %= 100;
                billetes50 = (int) (cambio / 50); cambio %= 50;
                billetes20 = (int) (cambio / 20); cambio %= 20;
                billetes10 = (int) (cambio / 10); cambio %= 10;
                billetes5 = (int) (cambio / 5); cambio %= 5;

                monedas2euro = (int) (cambio / 2); cambio %= 2;
                monedas1euro = (int) (cambio / 1); cambio %= 1;
                monedas50cts = (int) (cambio / 0.50); cambio %= 0.50;
                monedas20cts = (int) (cambio / 0.20); cambio %= 0.20;
                monedas10cts = (int) (cambio / 0.10); cambio %= 0.10;
                monedas5cts = (int) (cambio / 0.05); cambio %= 0.05;
                monedas2cts = (int) (cambio / 0.02); cambio %= 0.02;
                monedas1cts = (int) (cambio / 0.01); cambio %= 0.01;

                // Mostrar las imágenes de los billetes
                if (billetes500 > 0) {
                    out.println("<p>" + billetes500 + "</p>");
                    out.println("<img src='../img/500euros.jpg' alt='500 €' class='img-monedas'>");
                }
                if (billetes200 > 0) {
                    out.println("<p>" + billetes200 + "</p>");
                    out.println("<img src='../img/200euros.jpg' alt='200 €' class='img-monedas'>");
                }
                if (billetes100 > 0) {
                    out.println("<p>" + billetes100 + "</p>");
                    out.println("<img src='../img/100euros.jpg' alt='100 €' class='img-monedas'>");
                }
                if (billetes50 > 0) {
                    out.println("<p>" + billetes50 + "</p>");
                    out.println("<img src='../img/50euros.jpg' alt='50 €' class='img-monedas'>");
                }
                if (billetes20 > 0) {
                    out.println("<p>" + billetes20 + "</p>");
                    out.println("<img src='../img/20euros.jpg' alt='20 €' class='img-monedas'>");
                }
                if (billetes10 > 0) {
                    out.println("<p>" + billetes10 + "</p>");
                    out.println("<img src='../img/10euros.jpg' alt='10 €' class='img-monedas'>");
                }
                if (billetes5 > 0) {
                    out.println("<p>" + billetes5 + "</p>");
                    out.println("<img src='../img/5euros.jpg' alt='5 €' class='img-monedas'>");
                }

                // Mostrar las imágenes de las monedas
                if (monedas2euro > 0) {
                    out.println("<p>" + monedas2euro + "</p>");
                    out.println("<img src='../img/2euros.jpg' alt='2 €' class='img-monedas'>");
                }
                if (monedas1euro > 0) {
                    out.println("<p>" + monedas1euro + "</p>");
                    out.println("<img src='../img/1euro.jpg' alt='1 €' class='img-monedas'>");
                }
                if (monedas50cts > 0) {
                    out.println("<p>" + monedas50cts + "</p>");
                    out.println("<img src='../img/50cts.jpg' alt='50 cts' class='img-monedas'>");
                }
                if (monedas20cts > 0) {
                    out.println("<p>" + monedas20cts + "</p>");
                    out.println("<img src='../img/20cts.jpg' alt='20 cts' class='img-monedas'>");
                }
                if (monedas10cts > 0) {
                    out.println("<p>" + monedas10cts + "</p>");
                    out.println("<img src='../img/10cts.jpg' alt='10 cts' class='img-monedas'>");
                }
                if (monedas5cts > 0) {
                    out.println("<p>" + monedas5cts + "</p>");
                    out.println("<img src='../img/5cts.jpg' alt='5 cts' class='img-monedas'>");
                }
                if (monedas2cts > 0) {
                    out.println("<p>" + monedas2cts + "</p>");
                    out.println("<img src='../img/2cts.jpg' alt='2 cts' class='img-monedas'>");
                }
                if (monedas1cts > 0) {
                    out.println("<p>" + monedas1cts + "</p>");
                    out.println("<img src='../img/1cts.jpg' alt='1 cts' class='img-monedas'>");
                }
            }
        %>
        <p><a href="../index.html">Volver</a></p>
    </div>
</body>
</html>
