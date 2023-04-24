
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
<%
    RevistaJpaController revistaJpaController = new RevistaJpaController();
    List<Revista> revistaList = revistaJpaController.findRevistaEntities();
    if (revistaList.isEmpty()) {
        response.sendRedirect("error.jsp");
    }
%>
<html>
    <%-- Incluye el titulo de la pagina --%>
    <head>
        <%

            String isbnE = (String) request.getAttribute("isbn");
        %>
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

                    <%
                        String isbn = request.getParameter("isbn");
                        RevistaJpaController revistaJPAC = new RevistaJpaController();
                        Revista revista = revistaJPAC.findRevista(Long.valueOf(isbn));
                    %>  

                    <tr>
                        <td class="derecha">ISBN</td>
                        <td class="gris"><%=revista.getIsbn()%></td>
                    </tr>
                    <tr>
                        <td class="derecha">Titulo</td>
                        <td class="gris"><%=revista.getTitulo()%></td>
                    </tr>
                    <tr>
                        <td class="derecha">Editorial</td>
                        <td class="gris"><%=revista.getEditorial()%></td>
                    </tr>
                    <tr>
                        <td class="derecha">Clasificacion</td>
                        <td class="gris"><%=revista.getClasificacion()%></td>
                    </tr>
                    <tr>
                        <td class="derecha">Periocidad</td>
                        <td class="gris"><%
                            out.print(revista.getPeriocidad() != null ? revista.getPeriocidad() : "----------");
                            %></td>
                    </tr>
                    <tr>
                        <td class="derecha">Fecha</td>
                        <td class="gris"><%
                            SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy"); 
                            out.print(revista.getFecha() != null ? formato.format(revista.getFecha()): "----------");
                            %></td>
                    </tr>
                </table>
            </main>
            <%-- Incluye el pie de pagina --%>
            <%@include file="jspf/piePagina.jspf" %>
        </div>
    </body>
</html>
