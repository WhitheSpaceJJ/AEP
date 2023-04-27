
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entidades.Revista"%>
<%@page import="controlador.RevistaJpaController"%>
<%-- 
despliegaRevista.jsp 
Esta página JSP es la página del catalo de la aplicación Web Biblioteca Web.
--%>
<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<html>
    <%-- Incluye el titulo de la pagina --%>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/estilos.css" />
        <title>Despliega Revistas</title>
    </head>
    <body>
        <div class="contenedorGrid">
            <%-- Incluye el encabezado de la pagina --%>
            <%@include file="jspf/encabezado.jspf" %>

            <%-- Incluye el menu de revistas catalogo --%>
            <%@include file="jspf/menuRevistas.jspf" %>

            <main>
                <h1>Revista Existente</h1>
                <table class="centrada">

                    <tr>
                        <td class="derecha">ISBN</td>
                        <td class="gris"></td>
                    </tr>
                    <tr>
                        <td class="derecha">Titulo</td>
                        <td class="gris"></td>
                    </tr>
                    <tr>
                        <td class="derecha">Editorial</td>
                        <td class="gris"></td>
                    </tr>
                    <tr>
                        <td class="derecha">Clasificacion</td>
                        <td class="gris"></td>
                    </tr>
                    <tr>
                        <td class="derecha">Periocidad</td>
                        <td class="gris"></td>
                    </tr>
                    <tr>
                        <td class="derecha">Fecha</td>
                        <td class="gris"></td>
                    </tr>
                </table>
            </main>
            <%-- Incluye el pie de pagina --%>
            <%@include file="jspf/piePagina.jspf" %>
        </div>
    </body>
</html>
