/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servelets;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import controlador.RevistaedJpaController;
import entidades.Revista;
import entidades.Revistaed;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "InventariarRevista", urlPatterns = {"/InventariarRevista"})
public class InventariarRevista extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        response.setContentType("application/json");
        Gson gson = new Gson();
        RevistaedJpaController revistaEDJPAC = new RevistaedJpaController();
        try {
            String isbnS = request.getParameter("isbnRevista");
            String existenciaS = request.getParameter("cantidad");
            Integer existencia = Integer.valueOf(existenciaS);
            String disponibilidadS = existenciaS;
            Long isbn = Long.valueOf(isbnS);
            Revista revista = new Revista(isbn);
            Integer disponibilidad = Integer.valueOf(disponibilidadS);
            Revistaed revistaED = new Revistaed(isbn, existencia, disponibilidad, revista);
            try {
                Revistaed auxiliar = revistaEDJPAC.findRevistaed(isbn);
                if (auxiliar != null) {
                    revistaED.setExistencia((auxiliar.getExistencia() + revistaED.getExistencia()));
                    revistaED.setDisponibilidad((auxiliar.getDisponibilidad() + revistaED.getDisponibilidad()));
                    revistaEDJPAC.edit(revistaED);
                } else {
                    revistaEDJPAC.create(revistaED);
                }
            } catch (Exception e) {
                try {
                    revistaEDJPAC.create(revistaED);
                } catch (Exception es) {
                }
            }
        } catch (NumberFormatException e) {
        }

        RevistaedJpaController revistaEDJPA = new RevistaedJpaController();
        List<Revistaed> revistasED = revistaEDJPA.findRevistaedEntities();
        List<JsonObject> lista = new ArrayList<>();
        JsonObject object = new JsonObject();
        for (int i = 0; i < revistasED.size(); i++) {
            Revistaed get = revistasED.get(i);
            object.addProperty("isbnrevista", String.valueOf(get.getIsbnrevista()));
            object.addProperty("existencia", String.valueOf(get.getExistencia()));
            object.addProperty("disponibilidad", String.valueOf(get.getDisponibilidad()));
            lista.add(object);
            object = new JsonObject();
        }
//        String listaRevistasJson = lista.toString();
        try ( PrintWriter out = response.getWriter()) {
            out.println(lista);
            out.flush();
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
