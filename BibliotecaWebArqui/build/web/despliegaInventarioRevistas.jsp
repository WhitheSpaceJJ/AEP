<%-- 
despliegaInventarioRevistas.jsp 
Esta página JSP despliega el inventario de revistas de la aplicación Web Biblioteca Web.
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<html>
    <%-- Incluye el titulo de la pagina --%>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/estilos.css" />
        <title>Despliega Revistas Inventario</title>
    </head>
    <body>
        <div class="contenedorGrid">
            <%-- Incluye el encabezado de la pagina principal--%>
            <%@include file="jspf/encabezado.jspf" %>
            <%@include file="jspf/menuInventario.jspf" %>

            <main>
                <table class="bicolor" >

                    <%-- Título de la tabla 
                                        <caption>
                        ${listaRevistasED.tituloTabla}
                    </caption>
                    --%>
                    <caption>
                        Inventario de Revistas De Biblioteca WEB
                    </caption>

                    <tr>
                        <%-- Títulos de las columnas --%>
                        <th>ISBN</th>
                        <th>Existencia</th>
                        <th>Disponibilidad</th>
                    </tr>


                </table>

                
            </main>

            <%-- Incluye el pie de pagina --%>
            <%@include file="jspf/piePagina.jspf" %>
        </div>
    </body>
</html>