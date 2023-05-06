package com.controller.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import entidades.Peticion;
import entidades.Prioridad;
import entidades.Revista;
import entidades.TipoPeticion;
import entidades.Usuario;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;
import java.util.Random;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObjectBuilder;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeoutException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import ws.ConsumidorSesion;

@RestController
@RequestMapping("/sesion")
public class SesionResource {

    @GetMapping("/query")
    public ResponseEntity<String> sesion(@RequestParam("email") String email, @RequestParam("password") String password) {
    Object[] consultas = new String[4];
        consultas[0] = email != null ? email.replace("\\n", "") : null;
        consultas[1] = password != null ? password.replace("\\n", "") : null;

        try {
            ConsumidorSesion consumidor = new ConsumidorSesion();
            Peticion peticion
                    = consumidor.call(new Peticion(new Random().nextInt(1000),
                            TipoPeticion.SESSION_USUARIO, Calendar.getInstance().getTime(), Prioridad.ALTA, consultas));
            if (peticion == null) {
                 return ResponseEntity.unprocessableEntity().build();
            } else if (peticion.getCuerpo() != null && peticion != null) {
                Usuario user = (Usuario) peticion.getCuerpo()[0];
                ObjectMapper objeto=new ObjectMapper();
                return ResponseEntity.ok(objeto.writeValueAsString(user));
            } else {
                 return ResponseEntity.unprocessableEntity().build();
            }
        } catch (Exception e) {
            System.out.println("Error; " + e.getMessage());
             return ResponseEntity.unprocessableEntity().build();
        }
    }

     @PostMapping
    public ResponseEntity<Usuario> agregarUsuario(@RequestBody Usuario usuario) {
        try {
            ConsumidorSesion consumidor = new ConsumidorSesion();
            Object[] objetos = new Object[1];
            objetos[0] = usuario;
            Peticion peticion
                    = consumidor.call(new Peticion(new Random().nextInt(1000),
                            TipoPeticion.REGISTRAR_USUARIO, Calendar.getInstance().getTime(),
                            Prioridad.ALTA, objetos));
            
            if (peticion == null) {
                return ResponseEntity.unprocessableEntity().build();
            } else if (peticion.getCuerpo() != null && peticion.getCuerpo().length > 0 && peticion.getCuerpo()[0] instanceof Boolean && (boolean) peticion.getCuerpo()[0] == true && peticion != null) {
                Usuario user = (Usuario) peticion.getCuerpo()[0];
                 return ResponseEntity.ok(user);
            } else {
               return ResponseEntity.unprocessableEntity().build();
            }
        } catch (Exception e) {
            System.out.println("Error; " + e.getMessage());
            return ResponseEntity.unprocessableEntity().build();
        }
    }
}
