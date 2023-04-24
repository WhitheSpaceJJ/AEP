<%-- 
capturarRevista.jsp 
Esta página JSP de la página del catalogo de revistas 
es invocada cuando el isbn se ha capturado este captura los datos de una revista a agregar para 
la aplicación Web Biblioteca Web.
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="entidades.Revista"%>
<%@page import="controlador.RevistaJpaController"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<html>

    <%-- Incluye el titulo de la pagina --%>
    <head>

        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/estilos.css" />
        <title>Captura Revista</title>
    </head>
    <body>
        <div class="contenedorGrid">
            <%-- Incluye el encabezado de la pagina --%>
            <%@include file="jspf/encabezado.jspf" %>

            <%-- Incluye el menu de revistas catalogo --%>
            <%@include file="jspf/menuRevistas.jspf" %>

            <%-- Main principal--%>
            <main>

                <h1>Capturar Revista</h1>
                <form action="" method="post" name="capturaRevista" >
                    <div class="contenedorFormulario">

                        <div class="derecha">
                            <label for="isbnId" >ISBN</label>
                        </div>
                        <div>
                            <input type="text" id="isbnId" name="isbn"
                                   value="${param.isbn}" 
                                   size="20" pattern="[0-9]{13}" 
                                   readonly />
                        </div>
                        <div>&nbsp;</div>
                        <div class="derecha">
                            <label for="tituloId" >Titulo *</label>
                        </div>
                        <div>
                            <input type="text" id="tituloId" name="titulo" 
                                   value="${param.titulo}" size="20" maxlength="50" 
                                   placeholder="Titulo de la Revista" required/>
                        </div>
                        <div id="msjTitulo" class="${mensajes.titulo.claseMensaje}">
                            ${mensajes.titulo.mensaje}
                        </div>
                        <div class="derecha">
                            <label for="editorialId" >Editorial *</label>
                        </div>
                        <div>
                            <input type="text" id="editoralId" name="editorial" 
                                   value="${param.editorial}" size="20" maxlength="35" 
                                   placeholder="Editorial Revista" required/>
                        </div>
                        <div id="msjEditorial" class="${mensajes.editorial.claseMensaje}">
                            ${mensajes.editorial.mensaje}
                        </div>
                        <div class="derecha">
                            <label for="clasificacionId" >Clasificacion *</label>
                        </div>
                        <div>
                            <input type="text" id="clasificacionId" name="clasificacion" 
                                   value="${param.clasificacion}" size="20" maxlength="20" 
                                   placeholder="Clasificacion de Revista" required/>
                        </div>
                        <div id="msjClasificacion" class="${mensajes.clasificacion.claseMensaje}">
                            ${mensajes.clasificacion.mensaje}
                        </div>
                        <div class="derecha">
                            <label for="periocidadId" >Periocidad</label>
                        </div>
                        <div>
                            <input type="text" id="periocidadId" name="periocidad" 
                                   value="${param.clasificacion}" size="20" maxlength="20" 
                                   placeholder="Periocidad de revista" />
                        </div>
                        <div id="msjPeriocidad" class="${mensajes.periocidad.claseMensaje}">
                            ${mensajes.periocidad.mensaje}
                        </div>

                        <div class="derecha">
                            <label for="fechaId" >Fecha (dd/mm/aaa)</label>
                        </div>
                        <div>
                            <input type="text" id="fechaId" name="fecha" 
                                   value="${param.fecha}" size="20"
                                   pattern="^(([0-2]?[0-9])|([3][0-1]))\/(([0]?[0-9])|([1][0-2]))\/[0-9]{4}$"
                                   placeholder="dd/mm/aaaa" />
                        </div>
                        <div id="msjFecha" class="${mensajes.fecha.claseMensaje}">
                            ${mensajes.fecha.mensaje}
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
                <%
                    if (request.getParameter("boton") != null) {
                        RevistaJpaController revistaJPAC = new RevistaJpaController();
                        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
                        String isbn = request.getParameter("isbn");
                        String titulo = request.getParameter("titulo");
                        String editorial = request.getParameter("editorial");
                        String clasificacion = request.getParameter("clasificacion");
                        String periocidad = request.getParameter("periocidad");
                        String fecha = request.getParameter("fecha");
                        if (isbn != null && titulo != null) {
                            Revista revistaN = new Revista(Long.valueOf(isbn), titulo, editorial, clasificacion);
                            if (periocidad != null) {
                                revistaN.setPeriocidad(periocidad);
                            }
                            if (fecha != null && fecha.length() > 1) {
                                Date fechaD = formato.parse(fecha);
                                revistaN.setFecha(fechaD);
                            }
                            try {
                                revistaJPAC.create(revistaN);
                                request.getRequestDispatcher("despliegaRevistas.jsp").forward(request, response);
                            } catch (Exception e) {
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
