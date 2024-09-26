# Primer Proyecto
### Cosas que hemos hecho
Voy a poner cosas que hemos hecho a lo largo de estos días:

1. Aprendimos a implementar el método get a través de un enlace, que cuando le demos se va directamente a la página del controlador.
2. Aprendimos a implementar el método get por parámetros.
3. Implementé el método posr a través de un enlace como hice con el método get.
4. Hice un pequeño formulario y lo vincule para que cuando le de al botón enviar vaya directamente al controlador y se vean todos los datos.
5. Hice mas grande el formulario y para que se vieran todos los datos tuve que implementar *Enumeration<String> parametros = request.getParameterNames()* y luego un while por si hay más de una opción que aparezcan todas y no solo una.
6. Hice lo mismo pero en vez de utilizar *Enumeration<String> parametros = request.getParameterNames()* utilicé *Map<String, String[]> parameterMap = request.getParameterMap()* y lo recorrí con un for.
7. He hecho un controlador nuevo donde según al botón que le des entre o por **Enumeration** o por **Map**.
8. Por último he creado otro controlador para que si que ponga todos los campos obligatorios.

## Conclusión

A lo largo del desarrollo, se han cubierto conceptos clave como el uso de los métodos **GET** y **POST**, la captura de parámetros en las solicitudes, y la manipulación de datos del formulario a través de estructuras como **Enumeration** y **Map**.
