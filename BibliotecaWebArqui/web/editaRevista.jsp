<%-- 
editarRevista.jsp 
Esta página JSP es la página del catalogo de revistas para la edicion de los datos de una revista a agregar agregar para 
la aplicación Web Biblioteca Web.
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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

         
            <main>
                <h1>Edita Revista</h1>

                    <div class="contenedorFormulario">
                        <div class="derecha">
                            <label for="claveId" >ISBN</label>
                        </div>
                        <div>
                            <input type="text" id="isbnId" name="isbn" 
                                   size="20" readonly value=""  />
                        </div>
                        <div>&nbsp;</div>
                        <div class="derecha">
                            <label for="tituloId" >Titulo *</label>
                        </div>
                        <div>
                            <input type="text" id="tituloId" name="titulo" 
                                   value=""   size="20" 
                                   maxlength="50" required
                                   placeholder="Titulo de revista"/>
                        </div>
                        <div>&nbsp;</div>

                        <div class="derecha">
                            <label for="editorialId" >Editorial *</label>
                        </div>
                        <div>
                            <input type="text" id="editorialId" name="editorial" 
                                   value=""   size="20" 
                                   maxlength="35" required
                                   placeholder="Editorial de revista"/>
                        </div>
                        <div>&nbsp;</div>


                        <div class="derecha">
                            <label for="clasificaciónId" >Clasificación *</label>
                        </div>
                        <div>
                            <input type="text" id="clasificacionId" name="clasificacion" 
                                   value=""  size="20" 
                                   maxlength="20" required
                                   placeholder="Clasificacion de revista"/>
                        </div>
                        <div>&nbsp;</div>


                        <div class="derecha">
                            <label for="periocidadId" >Periocidad</label>
                        </div>
                        <div>
                            <input type="text" id="periocidadId" name="periocidad" 
                                   value=""  size="20" 
                                   maxlength="20" 
                                   placeholder="Periocidad de revista"/>
                        </div>
                        <div>&nbsp;</div>

                        <div class="derecha">
                            <label for="fechaId" >Fecha (dd/mm/aaa)</label>
                        </div>
                        <div>
                            <input type="text" id="fechaId" name="fecha"
                                   value=""  size="20" 
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
       
              
            </main>  

            <%-- Incluye el pie de pagina --%>
            <%@include file="jspf/piePagina.jspf" %>
        </div>
    </body>
</html>
