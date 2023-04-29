
<%@page import="entidades.Revista"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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


            <nav>
                <a href="capturaIsbn.jsp">Agregar</a></li>
                <a href="seleccionaRevistaActualizar.jsp">Actualizar</a></li>
                <a href="seleccionaRevistasEliminar.jsp">Eliminar</a></li>
                <a href="despliegaRevistas.jsp">Consultar</a></li>
                <a href="menuPrincipalBibliotecario.jsp">Regresar</a></li>
            </nav>

            <main>
                <h1>Revista Existente</h1>
                <%
                    String data = request.getParameter("data");
                    if (data != null) {
                        Revista jsonObject = null;
                        try {
                            Revista[] revistas = new Gson().fromJson(data, Revista[].class);
                            jsonObject = revistas[0];
                        } catch (Exception e) {
                        }

                        if (jsonObject != null) {
                %>
                <table class="centrada">
                    <tr>
                        <td class="derecha">ISBN</td>
                        <td class="gris"><%=jsonObject.getIsbn()%></td>
                    </tr>
                    <tr>
                        <td class="derecha">Titulo</td>
                        <td class="gris"><%=jsonObject.getTitulo()%></td>
                    </tr>
                    <tr>
                        <td class="derecha">Editorial</td>
                        <td class="gris"><%=jsonObject.getEditorial()%></td>
                    </tr>
                    <tr>
                        <td class="derecha">Clasificacion</td>
                        <td class="gris"><%=jsonObject.getClasificacion()%></td>
                    </tr>
                    <tr>
                        <td class="derecha">Periodicidad</td>
                        <td class="gris"><%=jsonObject.getPeriocidad()%></td>
                    </tr>
                    <tr>
                        <td class="derecha">Fecha</td>
                        <td class="gris"><%=jsonObject.getFecha()%></td>
                    </tr>
                </table>
                <%
                    }
                } else {
                %>
                <h1>Revista Existente</h1>
                <%
                    }
                %>
            </main>
            <%-- Incluye el pie de pagina --%>
            <%@include file="jspf/piePagina.jspf" %>
        </div>
    </body>
</html>
