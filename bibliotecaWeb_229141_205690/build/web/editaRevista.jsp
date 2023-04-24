<%-- 
editarRevista.jsp 
Esta página JSP es la página del catalogo de revistas para la edicion de los datos de una revista a agregar agregar para 
la aplicación Web Biblioteca Web.
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entidades.Revista"%>
<%@page import="controlador.RevistaJpaController"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<html>
    <%-- Incluye el titulo de la pagina --%>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/estilos.css" />
        <title>Edita Revista</title>
    </head>
    <body>
        <div class="contenedorGrid">
            <%-- Incluye el encabezado de la pagina --%>
            <%@include file="jspf/encabezado.jspf" %>

            <%-- Incluye el menu de revistas catalogo --%>
            <%@include file="jspf/menuRevistas.jspf" %>

            <%-- Principal --%>
            <main>
                <h1>Edita Revista</h1>

                <form action="" method="post" name="editaRevista" >
                    <%
                        String id = request.getParameter("isbn");
                        RevistaJpaController revistaJPAC = new RevistaJpaController();
                        Revista revista = revistaJPAC.findRevista(Long.valueOf(id));
                        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
                    %>
                    <div class="contenedorFormulario">
                        <div class="derecha">
                            <label for="claveId" >ISBN</label>
                        </div>
                        <div>
                            <input type="text" id="isbnId" name="isbn" 
                                   size="20" readonly value="<%=String.valueOf(revista.getIsbn())%>"  />
                        </div>
                        <div>&nbsp;</div>
                        <div class="derecha">
                            <label for="tituloId" >Titulo *</label>
                        </div>
                        <div>
                            <input type="text" id="tituloId" name="titulo" 
                                   value="<%=revista.getTitulo()%>"   size="20" 
                                   maxlength="50" required
                                   placeholder="Titulo de revista"/>
                        </div>
                        <div>&nbsp;</div>

                        <div class="derecha">
                            <label for="editorialId" >Editorial *</label>
                        </div>
                        <div>
                            <input type="text" id="editorialId" name="editorial" 
                                   value="<%=revista.getEditorial()%>"   size="20" 
                                   maxlength="35" required
                                   placeholder="Editorial de revista"/>
                        </div>
                        <div>&nbsp;</div>


                        <div class="derecha">
                            <label for="clasificaciónId" >Clasificación *</label>
                        </div>
                        <div>
                            <input type="text" id="clasificacionId" name="clasificacion" 
                                   value="<%=revista.getClasificacion()%>"  size="20" 
                                   maxlength="20" required
                                   placeholder="Clasificacion de revista"/>
                        </div>
                        <div>&nbsp;</div>


                        <div class="derecha">
                            <label for="periocidadId" >Periocidad</label>
                        </div>
                        <div>
                            <input type="text" id="periocidadId" name="periocidad" 
                                   value="<%=revista.getPeriocidad() != null ? revista.getPeriocidad() : ""%>"  size="20" 
                                   maxlength="20" 
                                   placeholder="Periocidad de revista"/>
                        </div>
                        <div>&nbsp;</div>

                        <div class="derecha">
                            <label for="fechaId" >Fecha (dd/mm/aaa)</label>
                        </div>
                        <div>
                            <input type="text" id="fechaId" name="fecha"
                                   value="<%=revista.getFecha() != null ? formato.format(revista.getFecha()) : ""%>"  size="20" 
                                   pattern="^(([0-2]?[0-9])|([3][0-1]))\/(([0]?[0-9])|([1][0-2]))\/[0-9]{4}$"
                                   placeholder="dd/mm/aaa" />
                        </div>
                        <div>&nbsp;</div>
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
                                revistaJPAC.edit(revistaN);
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
