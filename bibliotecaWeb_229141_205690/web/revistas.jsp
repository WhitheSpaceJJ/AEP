<%-- 
revistas.jsp 
Esta página JSP es la página del catalogo de revistas de la aplicación Web Biblioteca Web.
--%>
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

            <%-- Main Principal --%>
            <main> 
             
                <h1>Descripcion del catalgo</h1>
                <p>
                    En el catalogo que se encuentra a lado izquierdo 
                    podran observar las opciones que ponemos a su diposicion. 
                    Tales como agregar, consultar eliminar o actualizar.
                </p>
             
            </main>
            <%-- Incluye el pie de pagina --%>
            <%@include file="jspf/piePagina.jspf" %>
        </div>
    </body>
</html>