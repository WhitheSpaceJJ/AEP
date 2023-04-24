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
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ObtenRevistas", urlPatterns = {"/ObtenRevistas"})
public class ObtenRevistas extends HttpServlet {

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
        response.setContentType("application/json");
        Gson gson = new Gson();
        List<Revista> listaRevistas = null;
        RevistaJpaController revistaJPA = new RevistaJpaController();
        listaRevistas = revistaJPA.findRevistaEntities();
        List<JsonObject> lista = new ArrayList<>();
        JsonObject object = new JsonObject();
        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
        for (int i = 0; i < listaRevistas.size(); i++) {
            Revista get = listaRevistas.get(i);
            object.addProperty("isbn", String.valueOf(get.getIsbn()));
            object.addProperty("titulo", String.valueOf(get.getTitulo()));
            object.addProperty("editorial", String.valueOf(get.getEditorial()));
            object.addProperty("clasificacion", String.valueOf(get.getClasificacion()));
            String periocidad = get.getPeriocidad() != null ? get.getPeriocidad() : "";
            object.addProperty("periocidad", periocidad);
            String fecha = get.getFecha() != null ? formato.format(get.getFecha()) : "";
            object.addProperty("fecha", fecha);
            lista.add(object);
            object = new JsonObject();
        }
         String listaRevistasJson=lista.toString();
        try ( PrintWriter out = response.getWriter()) {
            out.println(listaRevistasJson);
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
