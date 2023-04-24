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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AgregaRevista", urlPatterns = {"/AgregaRevista"})
public class AgregaRevista extends HttpServlet {

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
        response.setContentType("application/json");
        RevistaJpaController revistaJPA = new RevistaJpaController();
        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
        String isbn = request.getParameter("isbn");
        String titulo = request.getParameter("titulo");
        String editorial = request.getParameter("editorial");
        String clasificacion = request.getParameter("clasificacion");
        String periocidad = request.getParameter("periocidad");
        String fecha = request.getParameter("fecha");
        if(titulo.length()>0 && editorial.length()>0 && clasificacion.length()>0){
        Revista revistaN = new Revista(Long.valueOf(isbn), titulo, editorial, clasificacion);
        revistaN.setFecha(null);
        revistaN.setPeriocidad(null);
            if (periocidad.length()>0) {
                revistaN.setPeriocidad(periocidad);
            }
            if (fecha.length() > 0) {
                Date fechaD = null;
                try {
                    fechaD = formato.parse(fecha);
                } catch (ParseException ex) {
                    Logger.getLogger(AgregaRevista.class.getName()).log(Level.SEVERE, null, ex);
                }
                revistaN.setFecha(fechaD);
            }
            try {
                revistaJPA.create(revistaN);
            } catch (Exception e) {
            }
        }
        
     
        List<Revista> listaRevistas = revistaJPA.findRevistaEntities();
        List<JsonObject> lista = new ArrayList<>();
        JsonObject object = new JsonObject();
        for (int i = 0; i < listaRevistas.size(); i++) {
            Revista get = listaRevistas.get(i);
            object.addProperty("isbn", String.valueOf(get.getIsbn()));
            object.addProperty("titulo", String.valueOf(get.getTitulo()));
            object.addProperty("editorial", String.valueOf(get.getEditorial()));
            object.addProperty("clasificacion", String.valueOf(get.getClasificacion()));
            periocidad = get.getPeriocidad() != null ? get.getPeriocidad() : "";
            object.addProperty("periocidad", periocidad);
            fecha = get.getFecha() != null ? formato.format(get.getFecha()) : "";
            object.addProperty("fecha", fecha);
            lista.add(object);
            object = new JsonObject();
        }
         String listaRevistasJson=lista.toString();
//        System.out.println(lista);
//        String listaRevistasJson = gson.toJson(listaRevistas);
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
