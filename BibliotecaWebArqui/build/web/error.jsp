<%-- 
error.jsp 
Esta página JSP es la página de error de la aplicación Web Biblioteca Web.
--%>
<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="true"%>

<html>
    <%-- Incluye el titulo de la pagina --%>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/estilos.css" />
        <title>Biblioteca Web Error</title>
    </head>
    <body>
        <div class="contenedorGrid">
            <%-- Incluye el encabezado de la pagina --%>
            <%@include file="jspf/encabezado.jspf" %>

            <%-- Incluye el menu de revistas catalogo --%>
            <%@include file="jspf/menuRevistas.jspf" %>

            <%-- Main Principal --%>
            <main>
                
                <h1>Página de Error</h1>
                <br />
                <table class="centrada">
                    <tr>
                        <th class="error">Error: No hay tabla creada</th>
                        <td class="msjError">
                            ${pageContext.exception.message}
                        </td>
                    </tr>
                    
                    <%-- 
                    <tr>
                        <th class="error">Causa:</th>
                        <td class="msjError">
                            ${pageContext.exception.cause.message}
                        </td>
                    </tr>
                    --%>
                    
                </table>
            </main>
                        
            <%-- Incluye el pie de pagina --%>
            <%@include file="jspf/piePagina.jspf" %>
        </div>
    </body>
</html>