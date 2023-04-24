<%-- index.jsp Esta página JSP es la página inicial de la aplicación Web Biblioteca Web. Despliega el menú de opciones.
--%>
<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<html>

    <%-- Incluye el titulo de la pagina --%>
    <%@include file="jspf/titulo.jspf" %>

    <body>
        <div class="contenedorGrid">
            <%-- Incluye el encabezado de la pagina --%>
            <%@include file="jspf/encabezado.jspf" %>

            <%-- Incluye el menu principal --%>
            <%@include file="jspf/menuPpal.jspf" %>
            
            <%-- Main o mensaje de bienvenida --%>
            <main>
                <h1>Bienvenida</h1>
                <p>
                    Bienvenidos a la Biblioteca Web donde podras realizar acciones tales
                    como
                    registro, edicion, eliminación de revistas.Ademas podras inventariar
                    y
                    desinventariar revistas.
                    Por lo tanto, espero que la aplicacion le sea de utilidad y el
                    diseño
                    sea completamente de su agrado, las opciones de la aplicacion se encuentran en su lado izquierdo.
                </p>
            </main>

            <%-- Incluye el pie de pagina --%>
            <%@include file="jspf/piePagina.jspf" %>
        </div>
    </body>

</html>



<%-- 
Se utilizo para validar la obtencion de revistas de las base de datos
<%@page import="entidades.Revista"%>
<%@page import="controlador.RevistaJpaController"%>
<%
    Long id = Long.valueOf(request.getParameter("isbn"));
    RevistaJpaController con = new RevistaJpaController();
    Revista r = con.findRevista(id);

    if (r != null) {
        //Establcer atributos de exepcion ya que existe una revista
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }%>     
--%>
