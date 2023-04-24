<%-- 
capturarIsbn.jsp 
Esta página JSP es de la página del catalogo de revistas cuando se selecciona 
agregar revista estas es llamada para la captura del isbn de una revista a agregar para 
la aplicación Web Biblioteca Web.
--%>

<%@page import="entidades.Revista"%>
<%@page import="controlador.RevistaJpaController"%>
<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<html>
    <%-- Incluye el titulo de la pagina --%>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/estilos.css" />
        <title>Capturar ISBN</title>
    </head>
    <body>
        <div class="contenedorGrid">
            <%-- Incluye el encabezado de la pagina --%>
            <%@include file="jspf/encabezado.jspf" %>

            <%-- Incluye el menu de revistas catalogo --%>
            <%@include file="jspf/menuRevistas.jspf" %>

            <%-- Main Principal --%>
            <main>
                <h1>Agregar Revista</h1>
                <form action="" method="post" name="capturaISBN" >
                    <div class="contenedorFormulario">
                        <div class="derecha"><label for="isbnId" >ISBN*</label></div>
                        <div>
                            <input type="text" id="isbnId" name="isbn" 
                                   value="${param.isbn}" size="13" maxlength="13" value="1" min="1" id="number" name="number" pattern="^[1-9]\d*$"
                                   title="Entero positivo de 13 cifras maximo"
                                   placeholder="1234567891234" required />
                        </div>
                        <div id="msjClave" class="${mensajes.isbn.claseMensaje}">
                            ${mensajes.isbn.mensaje}
                        </div>
                        <div class="span centrada">
                        </div>
                        <div class="span centrada">
                            <input type="submit" name="boton" value="Continuar" class="botones"/>
                            <input type="reset" value="Limpiar" class="botones"/>
                        </div>
                    </div>

                </form>
                <%
                    if (request.getParameter("boton") != null) {
                        RevistaJpaController revistaJPAC = new RevistaJpaController();
                        String id = request.getParameter("isbn");
                        if (id != null) {
                            Revista revista = revistaJPAC.findRevista(Long.valueOf(id));
                            if (revista != null) {
                                request.setAttribute("isbn", id);
                                request.getRequestDispatcher("despliegaRevista.jsp").forward(request, response);
                            } else {
                                request.setAttribute("isbn", id);
                                request.getRequestDispatcher("capturaRevista.jsp").forward(request, response);
                            }
                        }
                    }
                %>
            </main>
            <%-- Incluye el pie de pagina --%>
            <%@include file="jspf/piePagina.jspf" %>
        </div>
    </body>
</html>
