<%-- 
capturarRevistaDesinventariar.jsp 
Esta página JSP es abierta cuando se desea desinventariar revistas de la aplicación Web Biblioteca Web.
--%>
<%@page import="controlador.RevistaedJpaController"%>
<%@page import="entidades.Revistaed"%>
<%@page import="controlador.RevistaJpaController"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Revista"%>
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

            <%-- Incluye el menu de inventario --%>
            <%@include file="jspf/menuInventario.jspf" %>

            <%-- Main Principal --%>
            <main>
                <h1>Capturar Revista desinventariar</h1>
                <form action="" method="post" name="inventariarRevista" >
                    <div class="contenedorFormulario">
                        <div class="derecha">
                            Revista *
                        </div>
                        <div>

                            <select name="isbnRevista"  required>
                                <option value="select">Ninguno</option>
                                <%
                                    RevistaedJpaController revistaEDJPAC = new RevistaedJpaController();
                                    List<Revistaed> revistaList = revistaEDJPAC.findRevistaedEntities();
                                    for (int i = 0; i < revistaList.size(); i++) {
                                %><option name="select" value="<%=revistaList.get(i).getIsbnrevista()%>"  > <%out.print(revistaList.get(i).getRevista().getTitulo() + "  " + revistaList.get(i).getIsbnrevista()); %>
                                </option>
                                <%}%>          

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

<%
    if (request.getParameter("boton") != null) {
        String isbnS = request.getParameter("isbnRevista");
        String existenciaS = request.getParameter("cantidad");
        Integer existencia = Integer.valueOf(existenciaS);

        if (isbnS != null) {
            if (isbnS.equalsIgnoreCase("select")) {
            } else {
                String disponibilidadS = existenciaS;
                Long isbn = Long.valueOf(isbnS);
                Revista revista = new Revista(isbn);
                Integer disponibilidad = Integer.valueOf(disponibilidadS);
                Revistaed revistaED = new Revistaed(isbn, existencia, disponibilidad, revista);
                try {
                    Revistaed auxiliar = revistaEDJPAC.findRevistaed(isbn);
                    if (auxiliar != null) {
                        if (auxiliar.getExistencia() - revistaED.getExistencia() <= 0) {
                            revistaEDJPAC.destroy(auxiliar.getIsbnrevista());
                            request.getRequestDispatcher("despliegaInventarioRevistas.jsp").forward(request, response);

                        } else {
                            revistaED.setExistencia((auxiliar.getExistencia() - revistaED.getExistencia()));
                            revistaED.setDisponibilidad((auxiliar.getDisponibilidad() - revistaED.getDisponibilidad()));
                            revistaEDJPAC.edit(revistaED);
                            request.getRequestDispatcher("despliegaInventarioRevistas.jsp").forward(request, response);
                        }
                    }
                } catch (Exception e) {

                }
            }

        }
    }
%>
