<%-- 
capturarRevista.jsp 
Esta página JSP de la página del catalogo de revistas 
es invocada cuando el isbn se ha capturado este captura los datos de una revista a agregar para 
la aplicación Web Biblioteca Web.
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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


            <nav>
                <a href="capturaIsbn.jsp">Agregar</a></li>
                <a href="seleccionaRevistaActualizar.jsp">Actualizar</a></li>
                <a href="seleccionaRevistasEliminar.jsp">Eliminar</a></li>
                <a href="despliegaRevistas.jsp">Consultar</a></li>
                <a href="menuPrincipalBibliotecario.jsp">Regresar</a></li>
            </nav>

            <%-- Main principal--%>
            <main>

                <h1>Capturar Revista</h1>
                <div class="contenedorFormulario">
                    <%    String data = request.getParameter("isbn");
                        if (data != null) {
                    %>
                    <div class="derecha">
                        <label for="isbnId" >ISBN</label>
                    </div>
                    <div>

                        <input type="text" id="isbnId" name="isbn"
                               value="<%out.print(data);%>" 
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
                        <input type="submit" id="continuarBtn" name="boton"    onclick="enviarFormulario()"  value="Continuar" class="botones"/>
                        <input type="reset" value="Limpiar" class="botones"/>
                    </div>

                </div>


                <%
                } else {%>
                <h1>Error de captura, Retrocede</h1>    
                <%
                    }%>


            </main>
            <%-- Incluye el pie de pagina --%>
            <%@include file="jspf/piePagina.jspf" %>
        </div>

        <script>
            function enviarFormulario() {
                const isbn = document.getElementById('isbnId').value;
                const titulo = document.getElementById('tituloId').value;
                const editorial = document.getElementById('editoralId').value;
                const clasificacion = document.getElementById('clasificacionId').value;
                const fecha = document.getElementById('fechaId').value;
                const periocidad = document.getElementById('periocidadId').value;

                // Crear objeto JSON con los valores del formulario
                const revista = {
                    isbn: isbn,
                    titulo: titulo,
                    editorial: editorial,
                    clasificacion: clasificacion,
                    fecha: fecha,
                    periocidad: periocidad
                };
alert(revista);
                // Configurar opciones para la solicitud fetch()
                const options = {
                    method: 'POST',
                    body: JSON.stringify(revista),
                    headers: {
                        'Content-Type': 'application/json'
                    }
                };
                const url = 'http://localhost:8080/ServidorRESTArqui/webresources/revista';
                fetch(url, options)
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('No se pudo obtener una respuesta del servidor.');
                            }
                            return response.json();
                        })
                        .then(data => {
                            alert("" + JSON.stringify(data));
                            const url = "despliegaRevistas.jsp";
                            window.location.href = url;
                        })
                        .catch(error => {
                            alert("" + error);
                            console.error('Se produjo un error al intentar realizar la petición:', error.message);
                            const url = "capturaRevista.jsp?isbn=" + encodeURIComponent(isbn);
                            window.location.href = url;
                        });

            }
        </script>
    </body>
</html>
