<%-- 
despliegaInventarioRevistas.jsp 
Esta página JSP despliega el inventario de revistas de la aplicación Web Biblioteca Web.
--%>
<%@page import="controlador.RevistaJpaController"%>
<%@page import="controlador.RevistaedJpaController"%>
<%@page import="entidades.Revistaed"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Revista"%>
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

            <%-- Incluye el menu de inventario --%>
            <%@include file="jspf/menuInventario.jspf" %>

            <%-- Principal --%>
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



                    <%-- Las clases JPA ya funciona solo que como menciona la actividad esto es una simulacion --%>
                    <%
                        RevistaedJpaController revistaED = new RevistaedJpaController();
                        List<Revistaed> revistaEDList = revistaED.findRevistaedEntities();
                    %>

                    <%                            for (int i = 0; i < revistaEDList.size(); i++) {
                    %>
                    <tr align="center">
                        <td><% out.print(revistaEDList.get(i).getRevista().getIsbn()); %></td>
                        <td><% out.print(revistaEDList.get(i).getExistencia()); %></td>
                        <td><% out.print(revistaEDList.get(i).getDisponibilidad()); %></td>
                    </tr>
                    <%	}%>                        



                </table>

                <%
                    RevistaJpaController revistaJpaController = new RevistaJpaController();
                    List<Revista> revistaList = revistaJpaController.findRevistaEntities();
                    if (revistaList.isEmpty()) {
                        response.sendRedirect("error.jsp");
                    }
                    if (revistaEDList.isEmpty()) {
                            response.sendRedirect("error.jsp");
                        }
                %>
            </main>

            <%-- Incluye el pie de pagina --%>
            <%@include file="jspf/piePagina.jspf" %>
        </div>
    </body>
</html>