<%-- index.jsp Esta página JSP es la página inicial de la aplicación Web Biblioteca Web. Despliega el menú de opciones.
--%>
<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<html>

    <%-- Incluye el titulo de la pagina --%>
    <%@include file="jspf/titulo.jspf" %>

    <body>
        <div class="contenedorGrid">
            <header>
                <img alt="logo2" src="imagenes/logo2.png" width="800" height="150">
            </header>
            <nav>
                <a href="despliegaRevistas2.jsp">Consultar</a></li>
            </nav>
            <main>
                <h1>Bienvenida</h1>
                <p>
                    Bienvenidos a la Biblioteca Web donde podras realizar acciones tales
                    como reserva de libros, busqueda ,etc.
                    Por lo tanto, espero que la aplicacion le sea de utilidad y el
                    diseño
                    sea completamente de su agrado, las opciones de la aplicacion se encuentran en su lado izquierdo.
                </p>
            </main>
            <%@include file="jspf/piePagina.jspf" %>
        </div>

    </body>

</html>

