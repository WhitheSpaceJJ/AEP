<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/estilos.css" />
        <title>Capturar ISBN</title>
    </head>
    <body>
        <div class="contenedorGrid">
            <%@include file="jspf/encabezado.jspf" %>
            <nav>
                <a href="capturarIsbn.jsp">Agregar</a>
                <a href="seleccionaRevistaActualizar.jsp">Actualizar</a>
                <a href="seleccionaRevistasEliminar.jsp">Eliminar</a>
                <a href="despliegaRevistas.jsp">Consultar</a>
                <a href="menuPrincipalBibliotecario.jsp">Regresar</a>
            </nav>
            <main>
                <h1>Agregar Revista</h1>
                <form action="capturaRevista.jsp" method="post" name="capturaISBN">
                    <div class="contenedorFormulario">
                        <div class="derecha">
                            <label for="isbnId" >ISBN*</label>
                        </div>
                        <div>
                            <input type="text" id="isbnId" name="isbn" value="${param.isbn}"
                                   size="13" maxlength="13" min="1" pattern="^[1-9]\d*$" 
                                   title="Entero positivo de 13 cifras maximo" 
                                   placeholder="1234567891234" required />
                        </div>
                        <div id="msjClave" class="${mensajes.isbn.claseMensaje}">
                            ${mensajes.isbn.mensaje}
                        </div>
                        <div class="span centrada"></div>
                        <div class="span centrada">
                            <input type="submit" id="continuarButton" name="boton" 
                                   onclick="enviarFormulario()" value="Continuar" class="botones"/>
                            <input type="reset" value="Limpiar" class="botones"/>
                        </div>
                    </div>
                </form>
            </main>

            <script>
                function enviarFormulario() {
                    const isbn = document.getElementById('isbnId').value;
                    const url = 'http://localhost:8080/ServidorRESTArqui/webresources/revista/' + isbn;
                    fetch(url)
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('No se pudo obtener una respuesta del servidor.');
                                }
                                return response.json();
                            })
                            .then(data => {
                                alert("" + JSON.stringify(data));
                                const url = "despliegaRevista.jsp?data=" + encodeURIComponent(JSON.stringify(data));
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



            <%@include file="jspf/piePagina.jspf" %>
        </div>
    </body>
</html>
