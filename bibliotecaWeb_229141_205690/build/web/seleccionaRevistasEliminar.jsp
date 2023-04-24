<%-- 
seleccionaRevistasEliminar.jsp 
Esta página JSP es la página del catalogo de revistas opcion de eliminar de la aplicación Web Biblioteca Web.
--%>
<%@page import="java.util.Arrays"%>
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
        <title>Eliminar Revistas</title>
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
                        <caption>Selecciona las revistas a eliminar</caption>
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
                            RevistaJpaController revistaJpaController = new RevistaJpaController();
                            List<Revista> revistaList = revistaJpaController.findRevistaEntities();
                            SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
                        %>

                        
                        <%                            for (int i = 0; i < revistaList.size(); i++) {
                        %>
                        <tr align="center">
                            <td><input  type="checkbox"  name="selected"  value="<%=revistaList.get(i).getIsbn()%>" ></td>
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
                    String s[] = request.getParameterValues("selected");
                    if (s != null && s.length != 0) {
                        try {
                            for (int i = 0; i < s.length; i++) {
                                revistaJpaController.destroy(Long.valueOf(s[i]));
                            }
                            request.getRequestDispatcher("despliegaRevistas.jsp").forward(request, response);
                        } catch (Exception e) {
                        }
                    }
                %>
                
                <%

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

