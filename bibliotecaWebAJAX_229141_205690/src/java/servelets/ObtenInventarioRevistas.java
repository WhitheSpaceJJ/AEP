package servelets;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import controlador.RevistaedJpaController;
import entidades.Revista;
import entidades.Revistaed;
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

@WebServlet(name = "ObtenInventarioRevistas", urlPatterns = {"/ObtenInventarioRevistas"})
public class ObtenInventarioRevistas extends HttpServlet {

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
        processRequest(request, response);
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
