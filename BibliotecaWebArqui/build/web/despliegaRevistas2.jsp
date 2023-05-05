<%-- 
despliegaRevistas.jsp 
Esta página JSP es la página que despliega todas las revistas del catalogo de revistas de la
aplicación Web Biblioteca Web.
--%>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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

            <nav>
                <a href="menuPrincipalUsuarios.jsp">Regresar</a></li>
            </nav>
            <main>
                <table id="tablaRevistas" class="bicolor" style="display:none">
                    <caption>
                        Lista de Revistas del Sistema
                    </caption>
                    <tr>
                        <th>ISBN</th>
                        <th>Título</th>
                        <th>Editorial</th>
                        <th>Clasificación</th>
                        <th>Periocidad</th>
                        <th>Fecha</th>
                    </tr>
                </table>
                <p id="mensajeRevistasNoDisponibles" style="display:none">Revistas no disponibles</p>
            </main>

            <%-- Incluye el pie de pagina --%>
            <%@include file="jspf/piePagina.jspf" %>
        </div>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                fetch('http://localhost:8080/ServidorRESTArqui/webresources/revista')
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('No se pudo obtener una respuesta del servidor.');
                            }
                            return response.json();
                        })
                        .then(revistas => {
                            if (revistas.length > 0) {
                                let tablaRevistas = document.getElementById('tablaRevistas');
                                tablaRevistas.style.display = 'block';
                                for (let revista of revistas) {
                                    let row = tablaRevistas.insertRow();
                                    let isbnCell = row.insertCell(0);
                                    let tituloCell = row.insertCell(1);
                                    let editorialCell = row.insertCell(2);
                                    let clasificacionCell = row.insertCell(3);
                                    let periocidadCell = row.insertCell(4);
                                    let fechaCell = row.insertCell(5);
                                    isbnCell.innerHTML = revista.isbn;
                                    tituloCell.innerHTML = revista.titulo;
                                    editorialCell.innerHTML = revista.editorial;
                                    clasificacionCell.innerHTML = revista.clasificacion;
                                    periocidadCell.innerHTML = '';
                                    fechaCell.innerHTML = '';
                                }
                            } else {
                                let mensajeRevistasNoDisponibles = document.getElementById('mensajeRevistasNoDisponibles');
                                mensajeRevistasNoDisponibles.style.display = 'block';
                            }
                        })
                        .catch(error => {
                            alert(`Se produjo un error al intentar consultar las revistas: ${error.message}`);
                        });
            });
        </script>
    </body>
</html>