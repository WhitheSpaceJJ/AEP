package com.controller.service;

import entidades.Peticion;
import entidades.Prioridad;
import entidades.Revista;
import entidades.TipoPeticion;
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
import org.springframework.web.bind.annotation.RestController;
import ws.Consumidor;

@RestController
@RequestMapping("/revista")
public class RevistaResource {

    @GetMapping("/{id}")
    public ResponseEntity<Revista> obtenerProductoPorID(@PathVariable("id") String id) {
        try {
            Consumidor consumidor = new Consumidor();
            Object[] objetos = new Object[1];
            objetos[0] = Long.valueOf(id);
            Peticion peticion
                    = consumidor.call(new Peticion(new Random().nextInt(1000),
                            TipoPeticion.CONSULTA_REVISTA, Calendar.getInstance().getTime(), Prioridad.ALTA, objetos));

            if (peticion == null) {
                return ResponseEntity.unprocessableEntity().build();
            } else if (peticion.getCuerpo() != null && peticion != null) {
                Revista revista = (Revista) peticion.getCuerpo()[0];
                return ResponseEntity.ok(revista);
            } else {
               return ResponseEntity.unprocessableEntity().build();
            }
        } catch (Exception e) {
            System.out.println("Error; " + e.getMessage());
            return ResponseEntity.unprocessableEntity().build();
        }
    }
    
    @GetMapping
    public ResponseEntity<List<Revista>> obtenerRevistas() {
        try {
            Consumidor consumidor = new Consumidor();
            Object[] objetos2 = new Object[1];
            Peticion peticion
                    = consumidor.call(new Peticion(new Random().nextInt(1000),
                            TipoPeticion.CONSULTA_REVISTAS, Calendar.getInstance().getTime(),
                            Prioridad.ALTA, objetos2));
            if (peticion == null) {
                return ResponseEntity.unprocessableEntity().build();
            } else if (peticion != null && peticion.getCuerpo() != null) {
                Object[] objetos = peticion.getCuerpo();
                List <Revista> lisita = new ArrayList<>();
                     for (Object revista : objetos) {
                             lisita.add((Revista) revista);
                }
                 return ResponseEntity.ok(lisita);
            } else {
                 return ResponseEntity.unprocessableEntity().build();
            }
        } catch (Exception e) {
            System.out.println("Error; " + e.getMessage());
             return ResponseEntity.unprocessableEntity().build();
        }
    }
    
    @PutMapping("/{id}")
    public ResponseEntity<Revista> actualizarRevista(@PathVariable("id") String id, @RequestBody Revista revistaActualizado) {
        try {
            Consumidor consumidor = new Consumidor();
            Object[] objetos = new Object[1];
            objetos[0] = revistaActualizado;
            Peticion peticion
                    = consumidor.call(new Peticion(new Random().nextInt(1000),
                            TipoPeticion.ACTUALIZAR_REVISTA, Calendar.getInstance().getTime(),
                            Prioridad.ALTA, objetos));
            if (peticion == null) {
                return ResponseEntity.unprocessableEntity().build();
            } else if (peticion.getCuerpo() != null && peticion.getCuerpo().length > 0 && peticion.getCuerpo()[0] instanceof Boolean && (boolean) peticion.getCuerpo()[0] == true ) {
                Revista revista = (Revista) peticion.getCuerpo()[1];
                return ResponseEntity.ok(revista);
            } else {
                return ResponseEntity.unprocessableEntity().build();
            }
        } catch (Exception e) {
            System.out.println("Error; " + e.getMessage());
            return ResponseEntity.unprocessableEntity().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Revista> eliminarRevista(@PathVariable ("id") String id) {
        try {
            Consumidor consumidor = new Consumidor();
            Object[] objetos = new Object[1];
            objetos[0] = Long.valueOf(id);
            Peticion peticion
                    = consumidor.call(new Peticion(new Random().nextInt(1000),
                            TipoPeticion.ELIMINAR_REVISTA, Calendar.getInstance().getTime(),
                            Prioridad.ALTA, objetos));
            if (peticion == null) {
                 return ResponseEntity.unprocessableEntity().build();
            } else if (peticion.getCuerpo() != null && peticion.getCuerpo().length > 0 && peticion.getCuerpo()[0] instanceof Boolean && (boolean) peticion.getCuerpo()[0] == true && peticion != null) {
                Revista revista = (Revista) peticion.getCuerpo()[1];
                return ResponseEntity.ok(revista);
            } else {
                 return ResponseEntity.unprocessableEntity().build();
            }
        } catch (Exception e) {
            System.out.println("Error; " + e.getMessage());
             return ResponseEntity.unprocessableEntity().build();
        }
    }
    
    @PostMapping
    public ResponseEntity<Revista> agregarRevista(@RequestBody Revista producto) {
        try {
            Consumidor consumidor = new Consumidor();
            Object[] objetos = new Object[1];
            objetos[0] = producto;
            Peticion peticion
                    = consumidor.call(new Peticion(new Random().nextInt(1000),
                            TipoPeticion.AGREGAR_REVISTA, Calendar.getInstance().getTime(),
                            Prioridad.ALTA, objetos));
            if (peticion == null) {
               return ResponseEntity.unprocessableEntity().build();
            } else if (peticion.getCuerpo() != null && peticion.getCuerpo().length > 0 && peticion.getCuerpo()[0] instanceof Boolean && (boolean) peticion.getCuerpo()[0] == true && peticion != null) {
                          
                Revista revista = (Revista) peticion.getCuerpo()[1];
                return ResponseEntity.ok(revista);
                
            } else {
                return ResponseEntity.unprocessableEntity().build();
            }
        } catch (Exception e) {
            System.out.println("Error; " + e.getMessage());
            return ResponseEntity.unprocessableEntity().build();
        }
    }
}
