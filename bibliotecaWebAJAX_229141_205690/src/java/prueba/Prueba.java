/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package prueba;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import controlador.RevistaJpaController;
import entidades.Revista;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class Prueba {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

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
            String periocidad=get.getPeriocidad()!=null?get.getPeriocidad():"";
            object.addProperty("periocidad", periocidad);
            String fecha=get.getFecha()!=null?formato.format(get.getFecha()):"";
            object.addProperty("fecha", fecha);
            lista.add(object);
            object=new JsonObject();
        }
        System.out.println(lista.get(1).toString());

    }

}
