/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servelets;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import controlador.RevistaJpaController;
import entidades.Revista;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "ObtenRevista", urlPatterns = {"/ObtenRevista"})
public class ObtenRevista extends HttpServlet {

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
        Gson gson = new Gson();
        String revistaJson = null;
        response.setContentType("application/json");
        String isbn = request.getParameter("isbn");
        RevistaJpaController revistaJPA = new RevistaJpaController();

        JsonObject object = new JsonObject();

        try {
            Revista get = revistaJPA.findRevista(Long.valueOf(isbn));
            if (get != null) {
                SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
                object.addProperty("isbn", String.valueOf(get.getIsbn()));
                object.addProperty("titulo", String.valueOf(get.getTitulo()));
                object.addProperty("editorial", String.valueOf(get.getEditorial()));
                object.addProperty("clasificacion", String.valueOf(get.getClasificacion()));
                String periocidad = get.getPeriocidad() != null ? get.getPeriocidad() : "";
                object.addProperty("periocidad", periocidad);
                String fecha = get.getFecha() != null ? formato.format(get.getFecha()) : "";
                object.addProperty("fecha", fecha);
                revistaJson=object.toString();
            } else {
                revistaJson = "{}";
            }
        } catch (NumberFormatException e) {
            revistaJson = "{}";
        }
        if (revistaJson == null) {
            revistaJson = "{}";
        }

        try ( PrintWriter out = response.getWriter()) {
            out.println(revistaJson);
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
        // processRequest(request, response);
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
