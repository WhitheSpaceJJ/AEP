<%-- 
capturarRevistaInventariar.jsp 
Esta página JSP es abierta cuando se desea inventariar revistas de la aplicación Web Biblioteca Web.
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<html>
    <%-- Incluye el titulo de la pagina --%>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/estilos.css" />
        <title>Inventariar Revista</title>
    </head>
    <body>
        <div class="contenedorGrid">
            <%-- Incluye el encabezado de la pagina principal--%>
            <%@include file="jspf/encabezado.jspf" %>
            <%@include file="jspf/menuInventario.jspf" %>

            <%-- Main Principal --%>
            <main>
                <h1>Capturar Revista inventariar</h1>
                <form action="" method="post" name="inventariarRevista" >
                    <div class="contenedorFormulario">
                        <div class="derecha">
                            Revista *
                        </div>
                        <div>
                            <select name="isbnRevista"  required>
                                <option value="select">Ninguno</option>
                              <option name="select" value=""  > 
                                </option>
                            </select>
                        </div>
                        <div id="msjRevistaED" class="${mensajes.revistaED.claseMensaje}">
                            ${mensajes.revistaED.mensaje}
                        </div>
                        <div class="derecha">
                            <label for="cantidadId" >Cantidad *</label>
                        </div>
                        <div>
                            <input type="number" id="cantidadId" name="cantidad" 
                                   value="${param.cantidad}" size="16"  size="13" maxlength="9" value="1" min="1" id="number" name="number" pattern="^[1-9]\d*$"
                                   title="Entero positivo no mayor a 9 cifras "  min="1"
                                   placeholder="123456789" required
                                   />
                        </div>
                        <div id="msjDuracion" class="${mensajes.cantidad.claseMensaje}">
                            ${mensajes.cantidad.mensaje}
                        </div>
                        <div class="span centrada">
                            &nbsp;
                        </div>
                        <div class="span centrada">
                            <input type="submit" name="boton" value="Continuar" class="botones"/>
                            <input type="reset" value="Limpiar" class="botones"/>
                        </div>
                    </div>

                </form>   
               

            </main>

            <%-- Incluye el pie de pagina --%>
            <%@include file="jspf/piePagina.jspf" %>
        </div>
         </body>
</html>



