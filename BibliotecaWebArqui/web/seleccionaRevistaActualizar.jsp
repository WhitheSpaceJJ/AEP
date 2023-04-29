<%-- 
seleccionaRevistasEliminar.jsp 
Esta página JSP es la página del catalogo de revistas opcion de eliminar de la aplicación Web Biblioteca Web.
--%>
<%@page import="java.util.Arrays"%>
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
        <title>Actualizar Revistas</title>
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

            <main>
                <table id="tablaRevistas" class="bicolor" style="display:none">
                    <caption>
                        Lista de Revistas del Sistema
                    </caption>
                    <tr>
                        <th>&nbsp;</th>
                        <th>ISBN</th>
                        <th>Título</th>
                        <th>Editorial</th>
                        <th>Clasificación</th>
                        <th>Periocidad</th>
                        <th>Fecha</th>
                    </tr>
                </table>
                <p id="mensajeRevistasNoDisponibles" style="display:none">Revistas no disponibles</p>
                <input type="submit" name="boton"  id="boton" value="Continuar" class="botones" style="display:none"/>
                <input type="reset" value="Limpiar" id="boton2" class="botones" style="display:none"/>
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
                                let boton = document.getElementById('boton');
                                boton.style.display = 'block';
                                let boton2 = document.getElementById('boton2');
                                boton2.style.display = 'block';
                                for (let revista of revistas) {
                                    let row = tablaRevistas.insertRow();
                                    let checkboxCell = row.insertCell(0); // Nueva celda para el checkbox
                                    let isbnCell = row.insertCell(1);
                                    let tituloCell = row.insertCell(2);
                                    let editorialCell = row.insertCell(3);
                                    let clasificacionCell = row.insertCell(4);
                                    let periocidadCell = row.insertCell(5);
                                    let fechaCell = row.insertCell(6);
                                    // Agregar el checkbox
                                    checkboxCell.innerHTML = '<input type="checkbox" name="revista" value="' + revista.isbn + '">';
                                    isbnCell.innerHTML = revista.isbn;
                                    tituloCell.innerHTML = revista.titulo;
                                    editorialCell.innerHTML = revista.editorial;
                                    clasificacionCell.innerHTML = revista.clasificacion;
                                    if (revista.periodicidad !== null) {
                                        periocidadCell.innerHTML = revista.periodicidad;
                                    } else {
                                        periocidadCell.innerHTML = "-";
                                    }
                                    if (revista.fechaPublicacion !== null) {
                                        fechaCell.innerHTML = revista.fechaPublicacion;
                                    } else {
                                        fechaCell.innerHTML = "-";
                                    }
                                }
                            } else {
                                let mensajeRevistasNoDisponibles = document.getElementById('mensajeRevistasNoDisponibles');
                                mensajeRevistasNoDisponibles.style.display = 'block';
                            }
                        })
                        .catch(error => {
                            alert(`Se produjo un error al intentar consultar las revistas: ${error.message}`);
                            window.location.href = "capturaIsbn.jsp";
                        });

            });
            let boton = document.getElementById('boton');
            boton.addEventListener('click', function () {
                let revistasSeleccionadas = document.querySelectorAll('input[name="revista"]:checked');
                if (revistasSeleccionadas.length > 0) {
                    let confirmacion = confirm('¿Está seguro de que querer proceder a actualizar la revista seleccionada?');
                    if (confirmacion) {
                        let urls = [];
                        for (let revistaSeleccionada of revistasSeleccionadas) {
                            let isbn = revistaSeleccionada.value;
                            urls.push('http://localhost:8080/ServidorRESTArqui/webresources/revista/' + isbn);
                        }
                        alert(urls);
                        fetch(urls)
                                .then(response => {
                                    if (!response.ok) {
                                        throw new Error('No se pudo obtener una respuesta del servidor.');
                                    }
                                    return response.json();
                                })
                                .then(data => {
                                    alert('Las revista se procedera a la seccion de actualizar.');
                                    const url = "editaRevista.jsp?data=" + encodeURIComponent(JSON.stringify(data));
                                    window.location.href = url;
                                })
                                .catch(error => {
                                    alert("" + error);
                                    console.error('Se produjo un error al intentar realizar la petición:', error.message);
                                    const url = "capturaRevista.jsp?isbn=" + encodeURIComponent(isbn);
                                    window.location.href = url;
                                });

                    }
                } else {
                    alert('Debe seleccionar al menos una revista para poder eliminarla.');
                }
            });
        </script>
    </body>
</html>

