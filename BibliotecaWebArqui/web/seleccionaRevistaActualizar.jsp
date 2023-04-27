<%-- 
seleccionaRevistaActualizar.jsp 
Esta página JSP es la página del catalogo de revistas opcion de actualiza de la aplicación Web Biblioteca Web.
--%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<html>
    <%-- Incluye el titulo de la pagina --%>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/estilos.css" />
        <title>Actualizar Revista</title>
    </head>
    <body>
        <div class="contenedorGrid">
            <%-- Incluye el encabezado de la pagina --%>
            <%@include file="jspf/encabezado.jspf" %>

            <%-- Incluye el menu de revistas catalogo --%>
            <%@include file="jspf/menuRevistas.jspf" %>

            <%-- Main Principal --%>
            <main>

                <div id="msjTitulo" class=" centrada ${mensajes.revista.claseMensaje}">
                    ${mensajes.revista.mensaje}
                </div>

                    <%-- Tabla donde se muestran los datos de todas las revistas --%>
                    <table class="bicolor">

                        <%-- Título de la tabla --%>
                        <caption>
                            Selecciona la revista a actualizar
                        </caption>

                        <%-- Títulos de las columnas --%>
                        <tr>
                            <th></th>
                            <th>ISBN</th>
                            <th>Título</th>
                            <th>Editorial</th>
                            <th>Clasificación</th>
                            <th>Periocidad</th>
                            <th>Fecha</th>
                        </tr>

                    </table>
                    <br />
                    <input type="submit" name="boton" value="Continuar" class="botones"/>
                    <input type="reset" value="Limpiar" class="botones"/>

       

            </main>

            <%-- Incluye el pie de pagina --%>
            <%@include file="jspf/piePagina.jspf" %>
        </div>
    </body>
</html>

