<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Resultado del Cambio</title>
        <link rel="stylesheet" href="../css/monedero.css"/>
    </head>
    <body>
        <div class="img-container">
            <%
                StringBuilder resultado = new StringBuilder();

                // Obtener los valores del formulario
                double precioProducto = Double.parseDouble(request.getParameter("precioProducto"));
                double dineroEntregado = Double.parseDouble(request.getParameter("dineroEntregado"));
                double cambio = dineroEntregado - precioProducto;

                if (cambio < 0) {
                    resultado.append("<p>Dinero entregado insuficiente.</p>");
                } else {
                    resultado.append("<h1>El cambio es: " + cambio + " €</h1>");

                    // Creo un contenedor para poder modificar las imágenes
                    resultado.append("<div class='img-container'>");

                    // Arrays para billetes y monedas
                    int[] billetesValores = {500, 200, 100, 50, 20, 10, 5};
                    String[] billetesImagenes = {"500euros.jpg", "200euros.jpg", "100euros.jpg", "50euros.png", "20euros.jpg", "10euros.png", "5euros.jpg"};
                    int[] monedasValores = {2, 1};
                    String[] monedasImagenes = {"2euros.jpg", "1euro.jpg"};
                    double[] centimosValores = {0.50, 0.20, 0.10, 0.05, 0.02, 0.01};
                    String[] centimosImagenes = {"50cts.jpg", "20cts.jpg", "10cts.jpg", "5cts.jpg", "2cts.jpg", "1cts.jpg"};

                    // Contar billetes
                    for (int i = 0; i < billetesValores.length; i++) {
                        int cantidad = (int) (cambio / billetesValores[i]);
                        cambio %= billetesValores[i];
                        if (cantidad > 0) {
                            resultado.append("<div class='img-item'>");
                            resultado.append("<p class='img-numero'>").append(cantidad).append("</p>");
                            resultado.append("<img src='../img/").append(billetesImagenes[i]).append("' alt='' class='img-monedas'>");
                            resultado.append("</div>");
                        }
                    }

                    // Contar monedas
                    for (int i = 0; i < monedasValores.length; i++) {
                        int cantidad = (int) (cambio / monedasValores[i]);
                        cambio %= monedasValores[i];
                        if (cantidad > 0) {
                            resultado.append("<div class='img-item'>");
                            resultado.append("<p class='img-numero'>").append(cantidad).append("</p>");
                            resultado.append("<img src='../img/").append(monedasImagenes[i]).append("' alt='' class='img-monedas'>");
                            resultado.append("</div>");
                        }
                    }

                    // Contar céntimos
                    for (int i = 0; i < centimosValores.length; i++) {
                        int cantidad = (int) (cambio / centimosValores[i]);
                        cambio %= centimosValores[i];
                        if (cantidad > 0) {
                            resultado.append("<div class='img-item'>");
                            resultado.append("<p class='img-numero'>").append(cantidad).append("</p>");
                            resultado.append("<img src='../img/").append(centimosImagenes[i]).append("' alt='").append((int) (centimosValores[i] * 100)).append(" cts' class='img-monedas'>");
                            resultado.append("</div>");
                        }

                    }

                    resultado.append("</div>");
                }

                // Escribir el resultado acumulado
                out.print(resultado.toString());
            %>
            <p><a href="../index.html">Volver</a></p>
        </div>
    </body>
</html>
