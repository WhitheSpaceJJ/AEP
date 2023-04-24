<%-- 
despliegaRevistas.jsp 
Esta página JSP es la página que despliega todas las revistas del catalogo de revistas de la
aplicación Web Biblioteca Web.
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="controlador.RevistaJpaController"%>
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
        <title>Catalogo Revistas</title>
    </head>
    <body>
        <div class="contenedorGrid">
            <%-- Incluye el encabezado de la pagina --%>
            <%@include file="jspf/encabezado.jspf" %>

            <%-- Incluye el menu de revistas catalogo --%>
            <%@include file="jspf/menuRevistas.jspf" %>

            <
            %-- Principal --%>
            <main>
                <table class="bicolor" >

                    <%-- Título de la tabla
                    <caption>
                        ${listaRevistas.tituloTabla}
                    </caption>
                    --%>
                    <caption>
                        Lista de Revistas del Sistema
                    </caption>

                    <tr>
                        <%-- Títulos de las columnas --%>
                        <th>ISBN</th>
                        <th>Título</th>
                        <th>Editorial</th>
                        <th>Clasificación</th>
                        <th>Periocidad</th>
                        <th>Fecha</th>
                    </tr>

                    <%-- Las clases JPA ya funciona solo que como menciona la actividad esto es una simulacion --%>
                    <%
                        RevistaJpaController revistaJPAC = new RevistaJpaController();
                        List<Revista> revistaList = revistaJPAC.findRevistaEntities();
                        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");                        
                    %>

                    <%                            for (int i = 0; i < revistaList.size(); i++) {
                    %>
                    <tr align="center">
                        <td><% out.print(revistaList.get(i).getIsbn()); %></td>
                        <td><% out.print(revistaList.get(i).getTitulo()); %></td>
                        <td><% out.print(revistaList.get(i).getEditorial()); %></td>
                        <td><% out.print(revistaList.get(i).getClasificacion()); %></td>
                        <td><% out.print(revistaList.get(i).getPeriocidad() != null ? revistaList.get(i).getPeriocidad() : "---------"); %></td>
                        <td><% out.print(revistaList.get(i).getFecha() != null ? formato.format(revistaList.get(i).getFecha()) : "----------"); %></td>
                    </tr>
                    <%	}%>
                </table>
                <%
    RevistaJpaController revistaJpaController = new RevistaJpaController();
    if (revistaList.isEmpty()) {
        response.sendRedirect("error.jsp");
    }
%>
                
            </main>

            <%-- Incluye el pie de pagina --%>
            <%@include file="jspf/piePagina.jspf" %>
        </div>
    </body>
</html>