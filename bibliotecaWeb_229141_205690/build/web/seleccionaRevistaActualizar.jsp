<%-- 
seleccionaRevistaActualizar.jsp 
Esta página JSP es la página del catalogo de revistas opcion de actualiza de la aplicación Web Biblioteca Web.
--%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="controlador.RevistaJpaController"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Revista"%>
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

                <form action="" method="post">
                    <%-- Tabla donde se muestran los datos de todas las revistas --%>
                    <table class="bicolor">

                        <%-- Título de la tabla --%>
                        <caption>
                            Selecciona la revista a actualizar
                        </caption>

                        <%-- Títulos de las columnas --%>
                        <tr>
                            <th>&nbsp;</th>
                            <th>ISBN</th>
                            <th>Título</th>
                            <th>Editorial</th>
                            <th>Clasificación</th>
                            <th>Periocidad</th>
                            <th>Fecha</th>
                        </tr>

                        <%-- Las clases JPA ya funciona solo que como menciona la actividad esto es una simulacion --%>
                        <%
                            revistaList = revistaJpaController.findRevistaEntities();
                            SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
                        %>

                        <%                            for (int i = 0; i < revistaList.size(); i++) {
                        %>
                        <tr align="center">
                            <td><input type="radio" name="isbn"  value="<%=revistaList.get(i).getIsbn()%>" title="Es necesario seleccionar alguna opcion" required /></td>
                            <td><% out.print(revistaList.get(i).getIsbn()); %></td>
                            <td><% out.print(revistaList.get(i).getTitulo()); %></td>
                            <td><% out.print(revistaList.get(i).getEditorial()); %></td>
                            <td><% out.print(revistaList.get(i).getClasificacion()); %></td>
                            <td><% out.print(revistaList.get(i).getPeriocidad() != null ? revistaList.get(i).getPeriocidad() : "----------"); %></td>
                            <td><% out.print(revistaList.get(i).getFecha() != null ? formato.format(revistaList.get(i).getFecha()) : "----------"); %></td>
                        </tr>
                        <%	}%>


                    </table>
                    <br />
                    <input type="submit" name="boton" value="Continuar" class="botones"/>
                    <input type="reset" value="Limpiar" class="botones"/>
                </form>



                <%
                    if (request.getParameter("boton") != null) {
                        String isbnS = request.getParameter("isbn");
                        if (isbnS != null) {
                            request.setAttribute("isbn", isbnS);
                            request.getRequestDispatcher("editaRevista.jsp").forward(request, response);
                        }
                    }
                %>

            </main>

            <%-- Incluye el pie de pagina --%>
            <%@include file="jspf/piePagina.jspf" %>
        </div>
    </body>
</html>

